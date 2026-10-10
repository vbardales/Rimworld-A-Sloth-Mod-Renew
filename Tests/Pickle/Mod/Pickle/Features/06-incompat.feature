# Pass "incompat-slothmod" only (-DepMap wsl-deps.incompat-slothmod.map). Both mods define the same
# defName, Sloth: the game logs duplicate-def errors while loading. The load-time lines come before any
# scenario starts, so what is asserted here is what the player is left with: both mods are really in the
# load order, and the port still comes after the original. Green means the incompatibility behaves as
# declared (TESTING.md scenario L). The exact log symptom is read from the first report and then pinned
# with an "an error matching ..." step if Pickle sees it; nothing here expects a red.

@requires:ThatRubishGamer.RubishMods.SlothMod @allow-errors
Feature: the original A Sloth Mod stays incompatible with this port

  Scenario: both mods are loaded together and the Sloth defs are still defined
    Then mod "ThatRubishGamer.RubishMods.SlothMod" is loaded
    And mod "nelim.aslothmod" is loaded
    And def "Sloth" of type "ThingDef" exists
    And def "Sloth" of type "PawnKindDef" exists
