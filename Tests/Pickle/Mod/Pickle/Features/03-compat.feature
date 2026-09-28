# No save needed.

Feature: optional compatibility with two other mods

  # ADS_Cat1/2/3 are Abstract RecipeDefs: the second run (2ae1) showed Pickle cannot see them
  # ("no def named 'ADS_Cat1' in any database"), so the categories cannot be asserted directly.
  # What can be asserted is the two facts the patch depends on: this port loads before ADS 2,
  # and ADS 2's own copy really ran on a concrete recipe. That Sloth is then in the copied list
  # stays a manual check (TESTING.md scenario P).
  @requires:SamBucher.ADogSaidAnimalProsthetics2
  Scenario: this port loads before ADS 2, whose copy onto real recipes ran
    Then mod "nelim.aslothmod" loads before "SamBucher.ADogSaidAnimalProsthetics2"
    And def "InstallDentureAnimal" was patched by mod "A Dog Said... Animal Prosthetics 2"

  # Only Compat_NocturnalAnimals.xml ever touches the Sloth ThingDef itself - the biome patches
  # touch BiomeDefs - so the attribution is unambiguous. "was patched" accepts a name held by two
  # databases (ThingDef and PawnKindDef), unlike "raw stat"; it has no "of type" form.
  @requires:Mlie.XNDNocturnalAnimals
  Scenario: Sloth gets a nocturnal cycle from Nocturnal Animals (Continued)
    Then mod "nelim.aslothmod" loads after "Mlie.XNDNocturnalAnimals"
    And def "Sloth" was patched by mod "A Sloth Mod Renew (unofficial)"
