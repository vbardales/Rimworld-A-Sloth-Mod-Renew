# No save needed.

Feature: optional compatibility with two other mods

  # ADS_Cat1/2/3 are Abstract RecipeDefs: the second run (2ae1) showed Pickle cannot see them
  # ("no def named 'ADS_Cat1' in any database"), so the categories cannot be asserted directly.
  # What can be asserted is the two facts the patch depends on: this port loads before ADS 2,
  # and ADS 2's own copy really ran on a concrete recipe. That Sloth is then in the copied list
  # is ADS 2's own behaviour, recorded as not applicable (TESTING.md, disposition table, scenario P).
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

  # Scenario P (TESTING.md), automated 2026-10-10 on Virginie's decision. Read at def level: what the
  # Health tab's operation list rests on (ThingDef.AllRecipes, AvailableNow), not the tab itself.
  # "match" compares the surgery recipes of the two races by defName, so no ADS 2 recipe name is
  # hardcoded; InstallDentureAnimal is the one concrete recipe known to be copied (see above).
  # ADS_Cat1/2/3 are abstract, invisible to Pickle: concrete recipes only.
  @requires:SamBucher.ADogSaidAnimalProsthetics2 @requires:nelim.pickletools.deffields
  Scenario: ADS 2's surgeries are offered to the sloth like to a husky
    Then Nelim's Pickle Tools: the recipe "InstallDentureAnimal" is offered for the race "Sloth"
    And Nelim's Pickle Tools: the surgery recipes of the race "Sloth" match those of the race "Husky"
