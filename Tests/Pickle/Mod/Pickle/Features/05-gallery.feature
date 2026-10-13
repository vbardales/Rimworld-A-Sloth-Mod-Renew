# Workshop gallery pictures 1 and 2 (PUBLICATION.md, "Screenshots"), staged photographs (rule of
# 2026-10-02), played in the Sanctuaire de Nelim of SanctuaryBacklot, the shared place of every gallery
# (GALLERY.md): the save "Nelims-tribe", the pass "galerie" (wsl-deps.galerie.map, the Sanctuary's own
# minimum list plus this port). The old studio fixture "nelim-zen-meadow-studio" was deleted on
# 2026-10-08 and is not used any more.
# THE PLACE. "flower-garden" (SANCTUAIRE-LIEUX.md): the garden of lilies and roses north of the statue
# field, centre (154, 105), zoom 5. Chosen after reading every place: sloths are a leafy, quiet animal and
# this is the softest, greenest corner that is not a building, with no roof and no furniture to clear.
# Its framing is an estimate in the Sanctuary's own table: the first run tells whether the cells are free,
# a blocked cell fails naming it.
# THE STORY. A lazy late afternoon in the flower garden, golden light (hour 17, clear weather). Picture 1
# is the portrait, one sloth in a quarter of the frame (the game bounds the zoom: a single cell cannot fill 50 percent, run 0e09424); picture 2 is the family, three sloths in a row. The
# animals of the save are sent away first, the set is placed, photographed, removed.
# Pass "galerie": -DepMap wsl-deps.galerie.map. @review: a green run shows the journey ran, not that
# the image is good; each picture is opened before it is uploaded. The information card (Wildness
# 50 %) and the trader's stock are menus and screens, taken by hand, not staged.

@review @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.clearscreen @requires:nelim.pickletools.colonistrace
Feature: Gallery pictures of the sloth

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: the screen is clear
    And I set the hour to 17
    And I set the weather to "Clear"
    And Nelim's Sanctuary: I am at the sanctuary "flower-garden"

  Scenario: the portrait, a single sloth in a quarter of the frame
    Given Nelim's Pickle Tools: 1 adult animals of kind "Sloth" are spawned in a row from (154, 105), spacing 1
    And Nelim's Pickle Tools: the animals of kind "Sloth" have food at 100 percent
    And Nelim's Pickle Tools: the animal "coat-1" stands at (154, 105) facing South
    When Nelim's Pickle Tools: I frame the cells (154, 105) to (154, 105) filling 25 percent of the screen
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery sloth portrait"
    Then no errors were logged

  Scenario: the family, three sloths in a row in the garden
    Given Nelim's Pickle Tools: 3 adult animals of kind "Sloth" are spawned in a row from (152, 105), spacing 2
    And Nelim's Pickle Tools: the animals of kind "Sloth" have food at 100 percent
    When Nelim's Pickle Tools: I frame the cells (152, 105) to (156, 105) filling 60 percent of the screen
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery sloth family"
    Then no errors were logged
