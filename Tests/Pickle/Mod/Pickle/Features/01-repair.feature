# No save needed: everything here reads the def database at the main menu, where it already
# stands built - was-patched and mod-order steps do not require a running colony.
# The Wildness value itself is read off a spawned animal in 04-sloth-stat.feature: Pickle's
# "raw stat" step cannot tell the Sloth ThingDef from the Sloth PawnKindDef, and its "of type"
# qualifier exists only on "exists" (found by the first two runs, 2026-09-28).

Feature: the sloth exists and the biome patches applied

  Scenario: both defs load
    Then def "Sloth" of type "ThingDef" exists
    And def "Sloth" of type "PawnKindDef" exists

  # The two vanilla biome entries always apply: no optional mod guards them. "was patched by mod"
  # matches the display name, not the packageId - unlike "mod {string} is loaded" and friends.
  Scenario: the two vanilla biomes are patched
    Then def "TropicalRainforest" was patched by mod "A Sloth Mod Renew (unofficial)"
    And def "TropicalSwamp" was patched by mod "A Sloth Mod Renew (unofficial)"

  # The patches are asserted above ("was patched"); this asserts what they were for: the real biome
  # defs now list the sloth among their wild animals. Pass "sans-facultatifs" (DefFieldSteps staged).
  @requires:nelim.pickletools.deffields
  Scenario: the rainforest and the swamp list the sloth as a wild animal
    Then Nelim's Pickle Tools: the biome "TropicalRainforest" lists the wild animal "Sloth"
    And Nelim's Pickle Tools: the biome "TropicalSwamp" lists the wild animal "Sloth"
