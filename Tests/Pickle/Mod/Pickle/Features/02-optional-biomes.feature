# No save needed. Each scenario is gated on the biome mod it checks: the biome defs it names
# (ZBiome_CloudForest, AB_*) only exist when that mod is loaded, so an ungated scenario would
# fail with "def does not exist" in the minimal pass rather than skip cleanly.

Feature: Sloth reaches the biomes two optional biome mods add

  @requires:zylle.MoreVanillaBiomes
  Scenario: cloud forest is patched when More Vanilla Biomes is present
    Then def "ZBiome_CloudForest" was patched by mod "A Sloth Mod Renew (unofficial)"

  @requires:sarg.alphabiomes
  Scenario: all three named Alpha Biomes jungles are patched
    Then def "AB_MiasmicMangrove" was patched by mod "A Sloth Mod Renew (unofficial)"
    And def "AB_MycoticJungle" was patched by mod "A Sloth Mod Renew (unofficial)"
    And def "AB_FeraliskInfestedJungle" was patched by mod "A Sloth Mod Renew (unofficial)"
