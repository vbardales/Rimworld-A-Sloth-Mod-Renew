# Workshop gallery pictures 01 and 02 (PUBLICATION.md, "Screenshots"). Pass "galerie":
# -DepMap wsl-deps.galerie.map. @review: a green run shows the journey ran, not that the image is
# good; each picture is opened before it is uploaded. Pictures 02 (information card, Wildness 50 %)
# and 03 (trader stock) need a step this suite does not have and stay manual.

@review @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.coatsteps
Feature: Gallery pictures of the sloth

  Scenario: three sloths in the meadow studio, framed close
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: 3 adult animals of kind "Sloth" are spawned close together
    When Nelim's Pickle Tools: I frame the animals of kind "Sloth"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery sloths in the meadow"
    Then no errors were logged

  Scenario: a single sloth, alone in the frame
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: 1 adult animals of kind "Sloth" are spawned close together
    When Nelim's Pickle Tools: I frame the animals of kind "Sloth"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery single sloth"
    Then no errors were logged
