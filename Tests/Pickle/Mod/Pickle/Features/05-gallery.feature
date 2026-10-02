# Workshop gallery pictures 1 and 2 (PUBLICATION.md, "Screenshots"), staged photographs (rule of
# 2026-10-02). The story: a lazy late afternoon in the flower glade of the zen meadow studio, golden
# light, one torch lit for the evening. Common set for both pictures: the "flowers" glade, hour 17,
# clear weather, a torch lamp at (156, 100). Picture 1 is the portrait, one sloth filling half the
# frame; picture 2 is the family, three sloths in a row. The set is placed, photographed, removed.
# Pass "galerie": -DepMap wsl-deps.galerie.map. @review: a green run shows the journey ran, not that
# the image is good; each picture is opened before it is uploaded. The information card (Wildness
# 50 %) and the trader's stock are menus and screens, taken by hand, not staged.
# The cells around (154, 98) of the studio were not checked free: a blocked cell fails naming it.

@review @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.stagedecor
Feature: Gallery pictures of the sloth

  Background:
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 17
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (156, 100)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (156, 100) is lit

  Scenario: the portrait, a single sloth filling half the frame
    Given Nelim's Pickle Tools: 1 adult animals of kind "Sloth" are spawned in a row from (154, 98), spacing 1
    And Nelim's Pickle Tools: the animals of kind "Sloth" have food at 100 percent
    And Nelim's Pickle Tools: the animal "coat-1" stands at (154, 98) facing South
    When Nelim's Pickle Tools: I frame the cells (154, 98) to (154, 98) filling 50 percent of the screen
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery sloth portrait"
    Then no errors were logged

  Scenario: the family, three sloths in a row in the glade
    Given Nelim's Pickle Tools: 3 adult animals of kind "Sloth" are spawned in a row from (152, 98), spacing 2
    And Nelim's Pickle Tools: the animals of kind "Sloth" have food at 100 percent
    When Nelim's Pickle Tools: I frame the cells (152, 98) to (156, 98) filling 60 percent of the screen
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery sloth family"
    Then no errors were logged
