param([string]$ModRoot = (Join-Path $PSScriptRoot '../Mod'))
$ErrorActionPreference = 'Stop'
$checks = 0
function Assert($Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
    $script:checks++
}
function Read-Xml([string]$Path) {
    $doc = [System.Xml.XmlDocument]::new()
    $doc.XmlResolver = $null
    $doc.Load($Path)
    return ,$doc
}
foreach ($file in Get-ChildItem $ModRoot -Recurse -Filter *.xml) {
    $null = Read-Xml $file.FullName
    Assert $true "Parse $($file.Name)"
}
$about = Read-Xml (Join-Path $ModRoot 'About/About.xml')
$meta = $about.ModMetaData
Assert ($meta.name -eq 'A Sloth Mod Renew (unofficial)') 'Unofficial title missing'
Assert ($meta.packageId -eq 'nelim.aslothmod') 'Package identity changed'
Assert ($meta.supportedVersions.li -contains '1.6') '1.6 support missing'
Assert ($meta.incompatibleWith.li -contains 'ThatRubishGamer.RubishMods.SlothMod') 'Original collision not declared'
# ADS 2 copies its category lists at its own load time, so this port must load before it.
Assert ($meta.loadBefore.li -contains 'SamBucher.ADogSaidAnimalProsthetics2') 'loadBefore ADS 2 missing'
Assert ($meta.loadAfter.li -contains 'Mlie.XNDNocturnalAnimals') 'loadAfter Nocturnal Animals missing'
Assert (-not ($meta.loadAfter.li -contains 'SamBucher.ADogSaidAnimalProsthetics2')) 'ADS 2 must not be in loadAfter'
Assert (-not $meta.modDependencies) 'Optional mods must not become hard dependencies'
Assert ($meta.description.TrimEnd().EndsWith('[url=https://github.com/vbardales/Rimworld-A-Sloth-Mod-Renew]Source code on GitHub[/url]')) 'Description must end with the Source code on GitHub link'
$defs = Read-Xml (Join-Path $ModRoot 'Defs/ThingDefs_Animals.xml')
$thing = $defs.SelectSingleNode('/Defs/ThingDef[defName="Sloth"]')
$kind = $defs.SelectSingleNode('/Defs/PawnKindDef[defName="Sloth"]')
Assert ($null -ne $thing -and $null -ne $kind) 'Sloth definitions missing'
Assert ($kind.race -eq $thing.defName) 'Pawn kind race reference broken'
Assert ($thing.statBases.Wildness -eq '0.50') 'Wildness regression'
Assert ($null -eq $thing.SelectSingleNode('race/wildness')) 'Legacy wildness field returned'
Assert ($thing.tradeTags.li -contains 'AnimalUncommon') 'Trader availability tag missing'
Assert ($thing.race.trainability -eq 'None') 'Training regression'
Assert ($thing.race.manhunterOnDamageChance -eq '0' -and $thing.race.manhunterOnTameFailChance -eq '0') 'Manhunter regression'
Assert ($thing.race.lifeStageAges.li.Count -eq $kind.lifeStages.li.Count) 'Life stage graphics mismatch'
foreach ($node in $kind.SelectNodes('.//texPath')) {
    $directions = if ($node.ParentNode.Name -eq 'bodyGraphicData') { @('north','south','east') } else { @('east') }
    foreach ($direction in $directions) {
        Assert (Test-Path (Join-Path $ModRoot "Textures/$($node.InnerText)_$direction.png")) "Missing texture: $($node.InnerText)_$direction"
    }
}
# Model only the three operation types used here; this is not the RimWorld loader.
function Invoke-Patch($Operation, $Document, [string[]]$ActiveMods) {
    switch ($Operation.GetAttribute('Class')) {
        'PatchOperationFindMod' {
            if (@($Operation.mods.li | Where-Object { $_ -in $ActiveMods }).Count) {
                Invoke-Patch $Operation.match $Document $ActiveMods
            }
        }
        'PatchOperationSequence' {
            foreach ($child in $Operation.operations.li) { Invoke-Patch $child $Document $ActiveMods }
        }
        'PatchOperationAdd' {
            $targets = $Document.SelectNodes($Operation.xpath)
            Assert ($targets.Count -eq 1) "Patch target missing or ambiguous: $($Operation.xpath)"
            foreach ($child in $Operation.value.ChildNodes) {
                $null = $targets[0].AppendChild($Document.ImportNode($child, $true))
            }
        }
        'PatchOperationAddModExtension' {
            $targets = $Document.SelectNodes($Operation.xpath)
            Assert ($targets.Count -eq 1) "Patch target missing or ambiguous: $($Operation.xpath)"
            $ext = $targets[0].SelectSingleNode('modExtensions')
            if ($null -eq $ext) { $ext = $targets[0].AppendChild($Document.CreateElement('modExtensions')) }
            foreach ($child in $Operation.value.ChildNodes) {
                $null = $ext.AppendChild($Document.ImportNode($child, $true))
            }
        }
        default { throw "Unsupported patch operation: $($Operation.GetAttribute('Class'))" }
    }
}
$expected = @{
    TropicalRainforest = '0.5'; TropicalSwamp = '0.4'
    ZBiome_CloudForest = '0.5'; AB_MiasmicMangrove = '0.4'
    AB_MycoticJungle = '0.3'; AB_FeraliskInfestedJungle = '0.05'
}
foreach ($mask in 0..3) {
    $active = @()
    $names = @('TropicalRainforest','TropicalSwamp','TemperateForest','Desert')
    if ($mask -band 1) { $active += 'More Vanilla Biomes'; $names += 'ZBiome_CloudForest' }
    if ($mask -band 2) { $active += 'Alpha Biomes'; $names += @('AB_MiasmicMangrove','AB_MycoticJungle','AB_FeraliskInfestedJungle') }
    $fixture = [xml]('<Defs>' + (($names | ForEach-Object { "<BiomeDef><defName>$_</defName><wildAnimals><Monkey>1</Monkey></wildAnimals></BiomeDef>" }) -join '') + '</Defs>')
    foreach ($file in Get-ChildItem (Join-Path $ModRoot 'Patches') -Filter *.xml) {
        $patch = Read-Xml $file.FullName
        foreach ($operation in $patch.Patch.Operation) { Invoke-Patch $operation $fixture $active }
    }
    foreach ($biome in $fixture.Defs.BiomeDef) {
        $sloths = $biome.SelectNodes('wildAnimals/Sloth')
        if ($expected.ContainsKey($biome.defName)) {
            Assert ($sloths.Count -eq 1 -and $sloths[0].InnerText -eq $expected[$biome.defName]) "Wrong biome entry: $($biome.defName), configuration $mask"
        } else {
            Assert ($sloths.Count -eq 0) "Unexpected sloth in $($biome.defName)"
        }
        Assert ($biome.wildAnimals.Monkey -eq '1') 'Patch altered existing wildlife'
    }
}
# Compat patches: A Dog Said 2 (three category recipes) and Nocturnal Animals (mod extension).
$ads = 'A Dog Said... Animal Prosthetics 2'; $noct = '[XND] Nocturnal Animals (Continued)'
foreach ($mask in 0..3) {
    $active = @()
    if ($mask -band 1) { $active += $ads }
    if ($mask -band 2) { $active += $noct }
    $fixture = [xml]('<Defs><ThingDef><defName>Sloth</defName></ThingDef>' +
        (('ADS_Cat1','ADS_Cat2','ADS_Cat3' | ForEach-Object { "<RecipeDef Name=`"$_`" Abstract=`"True`"><recipeUsers><li>Cat</li></recipeUsers></RecipeDef>" }) -join '') + '</Defs>')
    foreach ($file in Get-ChildItem (Join-Path $ModRoot 'Patches') -Filter 'Compat_*.xml') {
        $patch = Read-Xml $file.FullName
        foreach ($operation in $patch.Patch.Operation) { Invoke-Patch $operation $fixture $active }
    }
    foreach ($cat in 'ADS_Cat1','ADS_Cat2','ADS_Cat3') {
        $users = @($fixture.SelectNodes("Defs/RecipeDef[@Name='$cat']/recipeUsers/li").InnerText)
        Assert ($users -contains 'Cat') "Patch altered existing recipeUsers: $cat"
        Assert ((@($users | Where-Object { $_ -eq 'Sloth' }).Count) -eq [int](($mask -band 1) -ne 0)) "Wrong Sloth entry in $cat, configuration $mask"
    }
    $ext = $fixture.SelectNodes("Defs/ThingDef[defName='Sloth']/modExtensions/li[@Class='NocturnalAnimals.ExtendedRaceProperties']")
    Assert ($ext.Count -eq [int](($mask -band 2) -ne 0)) "Wrong nocturnal extension count, configuration $mask"
    if ($ext.Count) { Assert ($ext[0].bodyClock -eq 'Nocturnal') 'bodyClock must be Nocturnal' }
}
Write-Output "PASS: $checks checks; all XML parsed; biome and compat configurations verified on synthetic fixtures."
