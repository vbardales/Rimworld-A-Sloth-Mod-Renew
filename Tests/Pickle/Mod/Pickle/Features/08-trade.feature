# Pass "commerce" (-DepMap wsl-deps.commerce.map, which also stages CoatSteps): scenario G of TESTING.md. Needs a save for a map.
# Uses PickleTools' TradeSteps, compiled and never played: the first run may only teach us the steps.
# Sloth tradeTags AnimalCommon + AnimalUncommon (the tag the port added) are pinned offline.

@requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.tradesteps
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
  # colony is a tradeable it accepts. A sloth of the colony (CoatSteps spawns the kind with the player's
  # faction, named coat-1) has to be on the map before the window opens. NPT's reserve: whether its
  # tradeable shows up for an animal spawned this way (reception zone, tradeable by the colony) is to be
  # confirmed at the first run; if "would buy" fails for that reason, tell NPT.
  Scenario: a merchant that buys uncommon animals takes the colony's sloth
    Given the save "test-colony" is loaded
    And Nelim's Pickle Tools: 1 adult animals of kind "Sloth" are spawned
    And Nelim's Pickle Tools: a trader of kind "Caravan_Outlander_PirateMerchant" has arrived
    When Nelim's Pickle Tools: the trade window is open
    Then Nelim's Pickle Tools: the trader would buy "Sloth"
