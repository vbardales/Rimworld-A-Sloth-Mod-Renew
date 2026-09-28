# Needs a save: an animal has to exist to be read. This is the fact the whole port repairs -
# <wildness> inside <race> stopped being read in 1.6 and silently defaulted to -1 - read off
# a live sloth as the game computes it, which is stronger than reading the XML entry.
# The cell is a guess at a free spot of Pickle's test-colony fixture: if the first run reports the
# spawn failing, move it, the assertion itself does not change.

Feature: a spawned sloth carries the repaired wildness

  Scenario: wildness is 0.5 on a live sloth
    Given the save "test-colony" is loaded
    When I spawn a "Sloth" pawn at (100, 100)
    Then the "Sloth" at (100, 100) stat "Wildness" is 0.5
