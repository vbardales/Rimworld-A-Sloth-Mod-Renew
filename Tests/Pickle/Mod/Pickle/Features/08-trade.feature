# Pass "commerce" (-DepMap wsl-deps.commerce.map): scenario G of TESTING.md. Needs a save for a map.
# Uses PickleTools' TradeSteps, compiled and never played: the first run may only teach us the steps.
# Sloth tradeTags AnimalCommon + AnimalUncommon (the tag the port added) are pinned offline.

Feature: traders and the sloth

  # RANDOM: whether an exotic trader's stock holds a sloth is the game's draw. Pickle has no runtime skip,
  # so the failure begins with "[no-stock] " and the scenario carries @flaky-stock: read its failures by that
  # prefix (report, summary.md, junit.xml); a [no-stock] failure is a skip to study, not a defect of the mod.
  # Optionally replay with -Extra '-pickle-retry=N' (a green on a retry is counted flaky).
  @flaky-stock
  Scenario: an exotic trader may stock a sloth
    Given the save "test-colony" is loaded
    And Nelim's Pickle Tools: a trader of kind "Caravan_Outlander_Exotic" has arrived
    When Nelim's Pickle Tools: the trade window is open
    Then Nelim's Pickle Tools: the trader offers "Sloth"

  # DETERMINISTIC: buy-side tags are not drawn. A pirate merchant buys AnimalUncommon, so a sloth of the
  # colony is a tradeable it accepts. A tamed sloth has to be in the colony before the window opens; the
  # step that spawns one is not known yet ("I spawn a pawn" may leave it wild): calibrate at the first run.
  Scenario: a merchant that buys uncommon animals takes the colony's sloth
    Given the save "test-colony" is loaded
    And I spawn a "Sloth" pawn at (100, 100)
    And Nelim's Pickle Tools: a trader of kind "Caravan_Outlander_PirateMerchant" has arrived
    When Nelim's Pickle Tools: the trade window is open
    Then Nelim's Pickle Tools: the trader would buy "Sloth"
