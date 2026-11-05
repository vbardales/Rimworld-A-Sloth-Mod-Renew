param([Parameter(Mandatory)][string]$ModRoot, [string]$SharedDir)

# Own values and facts of this port's content: About identity, load order and incompatibility, the Sloth ThingDef and PawnKindDef
# values inherited from the original (TESTING.md scenarios A, H, J, K), the six biome entries and the two compat patches (ADS 2,
# Nocturnal Animals) run on synthetic fixtures through the shared lib/PatchEngine. One consumer, nothing shareable; run by the
# generated Tests/Test-Mod.ps1 after the shared checks. Prints findings, exit 1 on any.
# The generic checks live in the shared scripts: Check-ModBasics (XML parse, About shape), Check-Textures, Check-AnimalDefs
# (life stage count), Check-XmlFields (legacy wildness field), Check-PatchTargets.
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ModRoot).Path
$mod = Join-Path $root 'Mod'
$script:findings = @()

function It([string]$name, [scriptblock]$body) {
    try { $problems = @(& $body | Where-Object { $_ }) } catch { $problems = @("threw: $($_.Exception.GetBaseException().Message)") }
    foreach ($p in $problems) { $script:findings += "[$name] $p" }
}
function Read-Xml([string]$Path) {
    $doc = [System.Xml.XmlDocument]::new()
    $doc.XmlResolver = $null
    $doc.Load($Path)
    return ,$doc
}

$engine = @($SharedDir, (Join-Path $root '../scripts')) | Where-Object { $_ } | ForEach-Object { Join-Path $_ 'lib/PatchEngine.ps1' } | Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
if (-not $engine) { Write-Warning 'lib/PatchEngine.ps1 not found (needs the protocols checkout): the patch rules are SKIPPED here, not passed (every local run has it).' } else { . $engine }

It 'About identity, load order, incompatibility' {
    $meta = (Read-Xml (Join-Path $mod 'About/About.xml')).ModMetaData
    if ($meta.name -ne 'A Sloth Mod Renew (unofficial)') { 'Unofficial title missing' }
    if ($meta.packageId -ne 'nelim.aslothmod') { 'Package identity changed' }
    if ($meta.supportedVersions.li -notcontains '1.6') { '1.6 support missing' }
    if ($meta.incompatibleWith.li -notcontains 'ThatRubishGamer.RubishMods.SlothMod') { 'Original collision not declared' }
    # ADS 2 copies its category lists at its own load time, so this port must load before it.
    if ($meta.loadBefore.li -notcontains 'SamBucher.ADogSaidAnimalProsthetics2') { 'loadBefore ADS 2 missing' }
    if ($meta.loadAfter.li -notcontains 'Mlie.XNDNocturnalAnimals') { 'loadAfter Nocturnal Animals missing' }
    if ($meta.loadAfter.li -contains 'SamBucher.ADogSaidAnimalProsthetics2') { 'ADS 2 must not be in loadAfter' }
    if ($meta.modDependencies) { 'Optional mods must not become hard dependencies' }
    if (-not $meta.description.TrimEnd().EndsWith('Source code on GitHub (https://github.com/vbardales/Rimworld-A-Sloth-Mod-Renew)')) { 'Description must end with the Source code on GitHub link (plain text, synced from PUBLICATION.md)' }
}

It 'Sloth definition values stay those of the original' {
    $defs = Read-Xml (Join-Path $mod 'Defs/ThingDefs_Animals.xml')
    $thing = $defs.SelectSingleNode('/Defs/ThingDef[defName="Sloth"]')
    $kind = $defs.SelectSingleNode('/Defs/PawnKindDef[defName="Sloth"]')
    if ($null -eq $thing -or $null -eq $kind) { throw 'Sloth definitions missing' }
    if ($kind.race -ne $thing.defName) { 'Pawn kind race reference broken' }
    if ($thing.statBases.Wildness -ne '0.50') { 'Wildness regression' }
    if ($thing.tradeTags.li -notcontains 'AnimalUncommon') { 'Trader availability tag missing' }
    if ($thing.race.trainability -ne 'None') { 'Training regression' }
    if ($thing.race.manhunterOnDamageChance -ne '0' -or $thing.race.manhunterOnTameFailChance -ne '0') { 'Manhunter regression' }
    if ($thing.race.baseBodySize -ne '0.15') { 'Body size regression' }
    if ($thing.race.foodType -ne 'VegetarianRoughAnimal') { 'Food type regression' }
    if ($thing.race.baseHungerRate -ne '0.20') { 'Hunger rate regression' }
    if ($thing.race.leatherDef -ne 'Leather_Light') { 'Leather regression' }
    if ($thing.race.petness -ne '0.15') { 'Petness regression' }
    if ($thing.race.mateMtbHours -ne '12' -or $thing.race.gestationPeriodDays -ne '12') { 'Breeding regression' }
    if ($thing.race.lifeExpectancy -ne '13') { 'Life expectancy regression' }
    if ($thing.statBases.MoveSpeed -ne '0.7' -or $thing.statBases.MarketValue -ne '75' -or $thing.statBases.ComfyTemperatureMin -ne '-30') { 'Stat bases regression' }
}

if ($engine) {
    $patches = Join-Path $mod 'Patches'
    It 'Biome patches: six entries, no other biome touched, wildlife kept' {
        $expected = @{
            TropicalRainforest = '0.5'; TropicalSwamp = '0.4'
            ZBiome_CloudForest = '0.5'; AB_MiasmicMangrove = '0.4'
            AB_MycoticJungle = '0.3'; AB_FeraliskInfestedJungle = '0.05'
        }
        foreach ($mask in 0..3) {
            $active = @()
            $names = @('TropicalRainforest', 'TropicalSwamp', 'TemperateForest', 'Desert')
            if ($mask -band 1) { $active += 'More Vanilla Biomes'; $names += 'ZBiome_CloudForest' }
            if ($mask -band 2) { $active += 'Alpha Biomes'; $names += @('AB_MiasmicMangrove', 'AB_MycoticJungle', 'AB_FeraliskInfestedJungle') }
            $fixture = [xml]('<Defs>' + (($names | ForEach-Object { "<BiomeDef><defName>$_</defName><wildAnimals><Monkey>1</Monkey></wildAnimals></BiomeDef>" }) -join '') + '</Defs>')
            foreach ($file in Get-ChildItem $patches -Filter *.xml) { Invoke-PatchFile $file.FullName $fixture -ActiveMods $active -RequireMatch }
            foreach ($biome in $fixture.Defs.BiomeDef) {
                $sloths = $biome.SelectNodes('wildAnimals/Sloth')
                if ($expected.ContainsKey($biome.defName)) {
                    if ($sloths.Count -ne 1 -or $sloths[0].InnerText -ne $expected[$biome.defName]) { "Wrong biome entry: $($biome.defName), configuration $mask" }
                } elseif ($sloths.Count -ne 0) { "Unexpected sloth in $($biome.defName), configuration $mask" }
                if ($biome.wildAnimals.Monkey -ne '1') { "Patch altered existing wildlife in $($biome.defName)" }
            }
        }
    }
    It 'Compat patches: ADS 2 recipes and Nocturnal Animals extension' {
        $ads = 'A Dog Said... Animal Prosthetics 2'; $noct = '[XND] Nocturnal Animals (Continued)'
        foreach ($mask in 0..3) {
            $active = @()
            if ($mask -band 1) { $active += $ads }
            if ($mask -band 2) { $active += $noct }
            $fixture = [xml]('<Defs><ThingDef><defName>Sloth</defName></ThingDef>' +
                (('ADS_Cat1', 'ADS_Cat2', 'ADS_Cat3' | ForEach-Object { "<RecipeDef Name=`"$_`" Abstract=`"True`"><recipeUsers><li>Cat</li></recipeUsers></RecipeDef>" }) -join '') + '</Defs>')
            foreach ($file in Get-ChildItem $patches -Filter 'Compat_*.xml') { Invoke-PatchFile $file.FullName $fixture -ActiveMods $active -RequireMatch }
            foreach ($cat in 'ADS_Cat1', 'ADS_Cat2', 'ADS_Cat3') {
                $users = @($fixture.SelectNodes("Defs/RecipeDef[@Name='$cat']/recipeUsers/li") | ForEach-Object { $_.InnerText })
                if ($users -notcontains 'Cat') { "Patch altered existing recipeUsers: $cat" }
                if (@($users | Where-Object { $_ -eq 'Sloth' }).Count -ne [int](($mask -band 1) -ne 0)) { "Wrong Sloth entry in $cat, configuration $mask" }
            }
            $ext = $fixture.SelectNodes("Defs/ThingDef[defName='Sloth']/modExtensions/li[@Class='NocturnalAnimals.ExtendedRaceProperties']")
            if ($ext.Count -ne [int](($mask -band 2) -ne 0)) { "Wrong nocturnal extension count, configuration $mask" }
            elseif ($ext.Count -and $ext[0].bodyClock -ne 'Nocturnal') { 'bodyClock must be Nocturnal' }
        }
    }
}

if ($script:findings.Count) { $script:findings | ForEach-Object { Write-Output $_ }; exit 1 }
Write-Output 'OK: own values of A Sloth Mod Renew verified.'
