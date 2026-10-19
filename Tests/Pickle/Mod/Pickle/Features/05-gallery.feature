# Workshop gallery of A Sloth Mod Renew (PUBLICATION.md, "Screenshots"): one story, in one place, staged photographs
# (GALLERY.md: the session is the director and decides everything). Played in the Sanctuaire de Nelim of SanctuaryBacklot:
# the save "Nelims-tribe", the pass "galerie" (wsl-deps.galerie.map). Rewritten 2026-10-15, recomposed 2026-10-20 after the
# run galerie-5fab5d8 (image 1 accepted; 2 refused: hay unreadable and the same light as 1; 3 refused: a bed corner in the
# frame and a juvenile only 12 percent smaller than an adult).
#
# SHOTLIST (write-shotlist, 2026-10-20; estimate 1 to 5 before playing, every scene must reach 4). Framing is a camera zoom (root
# size N: 2N cells tall, 3.56N wide), never "filling N percent": the Sanctuary floors N at 2 (ticket 3219 failed 3/3 on it).
#   | # | hour | zoom (centre)   | says                                    | est | main risk                                             |
#   | 1 | 14h  | 2.4 (153, 105)  | a sloth is small, Nelim noticed it      | 4   | accepted on the run 5fab5d8 (only the hour moves)     |
#   | 2 | 18h  | 2   (154, 105)  | hay left within reach, light going down | 4   | hay pile small; the glow at 18h may still read as day |
#   | 3 | 19h  | 2.5 (154, 106)  | a mother and her baby, Nelim behind     | 4   | baby 1.0 against 1.25 is a 20 percent difference; 19h may be dark |
# The sky glow is logged and asserted before each capture (at least 0.6 at 18h, 0.4 at 19h), so a flat light shows as a red step.
# Real verdicts go next to the estimates in STATUS.md after the run.
#
# THE PLACE. "flower-garden" (SANCTUAIRE-LIEUX.md): the garden of lilies and roses north of the statue field, centre (154, 105).
# A sloth is a leafy, quiet animal; this is the softest, greenest corner that is not a building, with no roof and no furniture.
# The row z = 105, x 152 to 156, is known free (run 0e09424). A bed corner sits at about (158, 102), bottom right of a frame
# centred on (154, 105) at zoom 2.5: image 3 is centred one cell north, (154, 106), to keep it out.
#
# THE STORY, "the sloth hour". Sloths sleep most of the day and eat the rest (their own description). Nelim, the protagonist,
# comes into the flower garden on a summer afternoon to find the one who lives there awake, and stays until dusk.
#   1. 14:00  The meeting. Nelim stands in the garden, turned East, with a smirk; a sloth hangs about two cells from her, turned
#             to the camera (South): the animal is seen from the front. The picture says: a sloth is small and slow, and
#             she has noticed it. Wide enough to show the flowers, with the sloth off centre to the right.
#   2. 18:00  The hay. The light is going down. A pile of hay lies on the ground right in front of the sloth, which faces the
#             camera; Nelim stands beside it with a small smile, hands empty. The picture says: what it eats
#             (VegetarianRoughAnimal) and that it is won by a kindness, not a leash. Tighter than 1.
#   3. 19:00  The young one. Dusk. A mother sloth (adult) and her baby (life stage 0) side by side, both turned to the camera;
#             Nelim stands behind them, peaceful. The picture says: they have one young at a time (the Def: one young per
#             birth) and the family is in no hurry.
# Nelim is drawn from her canon (SanctuaryBacklot/docs/NELIM-PROFIL.md): a high ponytail (the Core "Ponytails", the canon
# Roo_HD_Hair_Highpony is not in the pass map), near-black brown hair, a deep blue shirt (the palette's "bleu profond": the one
# cool note against the orange of the flowers and the green leaves), brown trousers, the Body_Heart tattoo. The first "wears"
# step undresses her, so the shirt and the trousers are dressed explicitly. Her face follows the story: a calm smirk (her
# own face), a small smile, a peaceful one. The only animals are the sloths; they are awake because the game is paused and
# nothing gives them a job. No mod is added.
# The map is set to 20 degrees so that the face shows no sweat; the face is set last, after every wait, because Facial
# Animation recomputes it at every tick (SanctuaryBacklot, run 56b0). Every scenario reloads the save, removes the animals of the
# save, cleans the filth, sets the hour and the weather, places the set, photographs it. Nothing asserts about the image: a
# person opens each one (@review), and a passing scenario says only that the route ran. The information card (Wildness 50 %)
# and the trader's stock are menus and screens, taken by hand, not staged.
#
# Pass "galerie": -DepMap wsl-deps.galerie.map.

@review @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.clearscreen @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.stagedecor
Feature: Gallery pictures of the sloth, the sloth hour

  Scenario: 1. the meeting, Nelim notices a sloth in the flower garden
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: the screen is clear
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 14
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Sanctuary: I am at the sanctuary "flower-garden"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (32, 64, 128)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (90, 64, 44)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (62, 48, 40)
    And Nelim's Pickle Tools: "Nelim" body tattoo is "Body_Heart"
    And Nelim's Pickle Tools: "Nelim" stands at (152, 105) facing East
    And Nelim's Pickle Tools: an adult animal of kind "Sloth" named "Mossy" is spawned at (154, 105)
    And Nelim's Pickle Tools: the animal "Mossy" stands at (154, 105) facing South
    When I wait 20 ticks
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (153, 105) at zoom 2.4
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    And Nelim's Pickle Tools: the light of the map is logged
    Then I take a screenshot "gallery 1 - the meeting, Nelim and a sloth in the flower garden"

  Scenario: 2. the hay, a pile of hay within reach of the sloth as the light goes down
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
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (32, 64, 128)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (90, 64, 44)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (62, 48, 40)
    And Nelim's Pickle Tools: "Nelim" body tattoo is "Body_Heart"
    And Nelim's Pickle Tools: "Nelim" stands at (153, 105) facing East
    And Nelim's Pickle Tools: an adult animal of kind "Sloth" named "Mossy" is spawned at (154, 105)
    And Nelim's Pickle Tools: the animal "Mossy" stands at (154, 105) facing South
    And Nelim's Pickle Tools: I place the decor "Hay" at (154, 104)
    When I wait 20 ticks
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (154, 105) at zoom 2
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    And Nelim's Pickle Tools: the light of the map is logged
    Then Nelim's Pickle Tools: the sun glow of the map is at least 0.6
    And I take a screenshot "gallery 2 - the hay, a pile within reach of the sloth at dusk"

  Scenario: 3. the young one, a mother sloth and her baby with Nelim behind them
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: the screen is clear
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 19
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Sanctuary: I am at the sanctuary "flower-garden"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (32, 64, 128)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (90, 64, 44)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (62, 48, 40)
    And Nelim's Pickle Tools: "Nelim" body tattoo is "Body_Heart"
    And Nelim's Pickle Tools: "Nelim" stands at (154, 107) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Sloth" named "Mossy" is spawned at (153, 105)
    And Nelim's Pickle Tools: an animal of kind "Sloth" named "Pip" is spawned at (154, 105) at life stage 0
    And Nelim's Pickle Tools: the animal "Mossy" stands at (153, 105) facing South
    And Nelim's Pickle Tools: the animal "Pip" stands at (154, 105) facing South
    When I wait 20 ticks
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (154, 106) at zoom 2.5
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthLipsSmallSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    And Nelim's Pickle Tools: the light of the map is logged
    Then Nelim's Pickle Tools: the sun glow of the map is at least 0.4
    And I take a screenshot "gallery 3 - the young one, a mother sloth and her baby"
