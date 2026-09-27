# No save needed.

Feature: optional compatibility with two other mods

  # ADS_Cat1/2/3 are Abstract RecipeDefs, kept only as XPath patch targets (that is how ADS's own
  # z_Category_Patches.xml reads them, via <fromxpath>). Untested assumption: that Pickle's
  # "was patched" lookup can still name an Abstract def, since patch tracking reads the XML
  # document rather than the final DefDatabase. If a run reports "no such def" here instead of a
  # pass or a fail, that assumption was wrong, not the mod: repoint this scenario at a concrete
  # surgery recipe and a field check on its recipeUsers instead.
  @requires:SamBucher.ADogSaidAnimalProsthetics2
  Scenario: Sloth is added to all three ADS 2 surgery categories
    Then def "ADS_Cat1" was patched by mod "nelim.aslothmod"
    And def "ADS_Cat2" was patched by mod "nelim.aslothmod"
    And def "ADS_Cat3" was patched by mod "nelim.aslothmod"

  # Only Compat_NocturnalAnimals.xml ever touches the Sloth ThingDef itself - the biome and trade
  # patches touch BiomeDefs and RecipeDefs, never this one - so this attribution is unambiguous.
  @requires:Mlie.XNDNocturnalAnimals
  Scenario: Sloth gets a nocturnal cycle from Nocturnal Animals (Continued)
    Then def "Sloth" was patched by mod "nelim.aslothmod"
