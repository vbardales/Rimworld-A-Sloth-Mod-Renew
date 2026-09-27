# No save needed: everything here reads the def database at the main menu, where it already
# stands built - raw stat and was-patched steps do not require a running colony.

Feature: the sloth exists and the 1.6 repair holds

  Scenario: both defs load
    Then def "Sloth" of type "ThingDef" exists
    And def "Sloth" of type "PawnKindDef" exists

  # The whole reason this port exists: <wildness> inside <race> stopped being read in 1.6 and
  # silently defaulted to -1. raw stat proves the XML statBases entry itself, which is exactly
  # what went missing before the fix - see TESTING.md scenarios B and C for the same fact read
  # off the in-game information card instead.
  Scenario: wildness reads from statBases, not from the legacy race field
    Then def "Sloth" raw stat "Wildness" is 0.5

  # The two vanilla biome entries always apply: no optional mod guards them.
  Scenario: the two vanilla biomes are patched
    Then def "TropicalRainforest" was patched by mod "nelim.aslothmod"
    And def "TropicalSwamp" was patched by mod "nelim.aslothmod"
