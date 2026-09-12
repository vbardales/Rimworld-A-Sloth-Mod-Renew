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
Assert ($meta.packageId -eq 'nelim.aslothmodrenew') 'Package identity changed'
Assert ($meta.supportedVersions.li -contains '1.6') '1.6 support missing'
Assert ($meta.incompatibleWith.li -contains 'ThatRubishGamer.RubishMods.SlothMod') 'Original collision not declared'
Assert ($meta.description.Contains('https://github.com/vbardales/Rimworld-A-Sloth-Mod-Renew')) 'GitHub missing from description'
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
Write-Output "PASS: $checks checks; all XML parsed; four optional-mod configurations verified on synthetic fixtures."
