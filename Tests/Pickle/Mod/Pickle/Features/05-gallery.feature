# Workshop gallery of A Sloth Mod Renew (PUBLICATION.md, "Screenshots"): one story, in one place, staged photographs
# (GALLERY.md: the session is the director and decides everything). Played in the Sanctuaire de Nelim of SanctuaryBacklot:
# the save "Nelims-tribe", the pass "galerie" (wsl-deps.galerie.map). Rewritten 2026-10-15 (the first series of 2026-10-13 had
# no pawn: two portraits of sloths in a row, a flat light, green outlines on the grass, a bed corner in the frame).
#
# THE PLACE. "flower-garden" (SANCTUAIRE-LIEUX.md): the garden of lilies and roses north of the statue field, centre (154, 105).
# A sloth is a leafy, quiet animal; this is the softest, greenest corner that is not a building, with no roof and no furniture.
# The row z = 105, x 152 to 156, is known free (run 0e09424). The camera is centred on x = 153 so that the right edge of the
# garden, where the first series showed green outlines and the corner of a bed, stays out of the frame.
#
# THE STORY, "the sloth hour". Sloths sleep most of the day and eat the rest (their own description). Nelim, the protagonist,
# comes into the flower garden on a summer afternoon with an armful of hay, to find the one who lives there awake.
#   1. 15:00  The meeting. Nelim stands in the garden, turned East, with a smirk; a sloth hangs about two cells from her, turned
#             to the camera (South): the animal is seen from the front. The picture says: a sloth is small and slow, and
#             she has noticed it. Wide enough to show the flowers, with the sloth off centre to the right.
#   2. 17:00  The hay. The light turns golden. Nelim carries an armful of hay (drawn in her hands) towards the sloth, with a
#             small smile; the sloth faces the camera. The picture says: what it eats (VegetarianRoughAnimal) and that it is
#             tamed by a kindness, not a leash. Tighter than 1.
#   3. 18:00  The family. Low gold light. Nelim stands behind three sloths, two adults and a juvenile of the life stage
#             Juvenile, all three turned to the camera, in a row; she looks at them, peaceful. The picture says: they come
#             one young at a time and it follows the adults (the Def: one young per birth).
# Nelim wears a light teal shirt (28, 98, 104) and dark trousers (51, 51, 51, the DarkBlack of the hair dyes; the first
# "wears" step undresses her, so the trousers are dressed explicitly): teal against the orange of the flowers and the
# brown fur is the one cool note of the series. Her hair is a Bob, her own colour. Her face follows the story: a calm smirk (her
# own face), a small smile, a peaceful one. The only animals are the sloths; they are awake at 15, 17 and 18:30 because the
# game is paused and nothing gives them a job. No mod is added: the story is carried by the pawn, the hay and the light,
# which the pass map already stages (the hay and the clothes are the game's).
# The map is set to 20 degrees so that the face shows no sweat; the face is set last, after every wait, because Facial
# Animation recomputes it at every tick (SanctuaryBacklot, run 56b0). Every scenario reloads the save, removes the animals of the
# save, cleans the filth, sets the hour and the weather, places the set, photographs it. Nothing asserts about the image: a
# person opens each one (@review), and a passing scenario says only that the route ran. The information card (Wildness 50 %)
# and the trader's stock are menus and screens, taken by hand, not staged.
#
# Pass "galerie": -DepMap wsl-deps.galerie.map.

@review @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.clearscreen @requires:nelim.pickletools.colonistrace
Feature: Gallery pictures of the sloth, the sloth hour

  Scenario: 1. the meeting, Nelim notices a sloth in the flower garden
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: the screen is clear
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 15
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Sanctuary: I am at the sanctuary "flower-garden"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (51, 51, 51)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Bob"
    And Nelim's Pickle Tools: "Nelim" stands at (152, 105) facing East
    And Nelim's Pickle Tools: an adult animal of kind "Sloth" named "Mossy" is spawned at (154, 105)
    And Nelim's Pickle Tools: the animal "Mossy" stands at (154, 105) facing South
    When I wait 20 ticks
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cells (152, 105) to (155, 105) filling 60 percent of the screen
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    Then I take a screenshot "gallery 1 - the meeting, Nelim and a sloth in the flower garden"

  Scenario: 2. the hay, Nelim brings an armful to the sloth in the golden light
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: the screen is clear
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 17
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Sanctuary: I am at the sanctuary "flower-garden"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (51, 51, 51)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Bob"
    And Nelim's Pickle Tools: "Nelim" stands at (153, 105) facing East
    And Nelim's Pickle Tools: "Nelim" carries 12 of the item "Hay"
    And Nelim's Pickle Tools: an adult animal of kind "Sloth" named "Mossy" is spawned at (154, 105)
    And Nelim's Pickle Tools: the animal "Mossy" stands at (154, 105) facing South
    When I wait 20 ticks
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cells (153, 105) to (154, 105) filling 60 percent of the screen
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    Then I take a screenshot "gallery 2 - the hay, Nelim offers an armful to the sloth"

  Scenario: 3. the family, three sloths turned to the camera and Nelim behind them
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: the screen is clear
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 18
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Sanctuary: I am at the sanctuary "flower-garden"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (51, 51, 51)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Bob"
    And Nelim's Pickle Tools: "Nelim" stands at (154, 106) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Sloth" named "Mossy" is spawned at (153, 105)
    And Nelim's Pickle Tools: an adult animal of kind "Sloth" named "Fern" is spawned at (155, 105)
    And Nelim's Pickle Tools: an animal of kind "Sloth" named "Pip" is spawned at (154, 105) at life stage 1
    And Nelim's Pickle Tools: the animal "Mossy" stands at (153, 105) facing South
    And Nelim's Pickle Tools: the animal "Fern" stands at (155, 105) facing South
    And Nelim's Pickle Tools: the animal "Pip" stands at (154, 105) facing South
    When I wait 20 ticks
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cells (153, 105) to (155, 106) filling 60 percent of the screen
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthLipsSmallSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    Then I take a screenshot "gallery 3 - the family, three sloths and Nelim"
