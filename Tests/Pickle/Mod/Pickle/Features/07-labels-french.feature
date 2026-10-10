# Pass "-Language French" (TESTING.md scenario O). Run on its own: -Filter '07-labels-french'.
# The French label comes from Languages/French/DefInjected; a missing key shows the accented
# fallback text instead (PICKLE.md, "Lecture d'une interface traduite").

@review
Feature: the sloth is named in French

  Scenario: the inspect pane names the sloth
    Given the save "test-colony" is loaded
    When I spawn a "Sloth" pawn at (100, 100)
    And I select "paresseux"
    Then the inspect pane shows "paresseux"
    When I take a screenshot "sloth-inspect-french"
    Then no errors were logged
