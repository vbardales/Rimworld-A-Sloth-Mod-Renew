# Pass "-Language English" (TESTING.md scenario O). Run on its own: -Filter '07-labels-english'.
# A mixed English/French run would fail one of the two label features, so they are never played
# together: 07-labels-french takes the French pass.

@review
Feature: the sloth is named in English

  Scenario: the inspect pane names the sloth
    Given the save "test-colony" is loaded
    When I spawn a "Sloth" pawn at (100, 100)
    And I select "sloth"
    Then the inspect pane shows "sloth"
    When I take a screenshot "sloth-inspect-english"
    Then no errors were logged
