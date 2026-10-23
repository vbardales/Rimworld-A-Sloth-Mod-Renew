# Workshop gallery of A Sloth Mod Renew (PUBLICATION.md, "Screenshots"): one story, in one place, staged photographs
# (GALLERY.md: the session is the director and decides everything). Played in the Sanctuaire de Nelim of SanctuaryBacklot:
# the save "Nelims-tribe", the pass "galerie" (wsl-deps.galerie.map). Rewritten 2026-10-15, recomposed 2026-10-20, rewritten
# again 2026-10-23 after run 9f78 (1 green; 2 and 3 failed on the sky glow, 0.49 at 18h and 0.14 at 19h) and a rating of 3 for
# the old plan (three medium shots, an outfit change per scene, no instant, no gesture). Director pass by an Opus sub-agent kept.
#
# THE STORY, "the sloth hour". One summer afternoon in the flower garden. Nelim crosses it with hay, finds the sloth asleep,
# sets hay down for it, walks on with it and its young trailing behind her, and leaves them at dusk by a torch lamp. Axis: she walks
# West to East in 1 to 3, and turns back West in 4. Hours: 15h, 15h and a quarter, 17h, 18h. Nelim keeps ONE outfit all day
# (deep blue shirt rgb (32, 64, 128), brown trousers rgb (90, 64, 44), Ponytails, near-black hair, Body_Heart): no change, the
# afternoon is one afternoon (GALLERY.md, criterion d). No hat. The map is 20 degrees and Clear, so no jacket either.
# Hay: she carries 12 in 1, sets 4 down in 2, and carries the remaining 8 in 3 and 4.
#
# SHOTLIST (write-shotlist, 2026-10-23; estimate 1 to 5 before playing, every scene must reach 4). Framing is a camera zoom
# (root size N: 2N cells tall, 3.56N wide); the Sanctuary floors N at 2 (ticket 3219).
#   1 | 15h   | wide, (154, 105) zoom 3.0   | Nelim mid-stride East with 12 hay, just after she spotted it. Forced walk (152,105) to (156,105), 18 ticks, then paused | Mossy asleep at (154, 104), daylily (156, 106) | a sloth is small and asleep, she noticed it | est 4
#   2 | 15h13 | medium, (154, 105) zoom 2.4 | Nelim bends to set 4 hay down, just before it touches the ground. Forced haul to (154, 104), 8 ticks, then paused | Mossy awake, facing South (the one front view) | a kindness, not a leash | est 4
#   3 | 17h   | close, (154, 105) zoom 2.0  | Nelim mid-stride East with 8 hay, just after the hay was eaten; Mossy then Pip follow in file. Forced walk (154,105) to (156,105), follows within 1 cell, 20 ticks | Mossy and Pip (life stage 0) trailing in profile | it follows whoever brought the hay | est 4
#   4 | 18h   | closing, (154, 106) zoom 2.4 | Nelim half turned, leaving West with 8 hay; just after the baby fell asleep. Animals lie down (40 ticks), then forced walk (153,106) to (152,106), 8 ticks | Mossy and Pip asleep by a lit torch lamp (156, 104), glow asserted 0.4 | they stay, one young at a time, no hurry | est 4
# Faces: 1 her own face (smirk); 2 a small smile; 3 and 4 a small peaceful smile. Wide 3.0, medium 2.4, close 2.0, pull back 2.4:
# variety of shots, an opening image that sets the garden, a closing one that leaves. At 3.0 the sloth is about 25 px in a 268 px
# thumbnail (criterion j): Mossy lies at the bottom edge, near the camera, to be the biggest thing of the shot after Nelim.
# Subtitles (PUBLICATION.md): 1 Nelim crosses the flower garden and notices the sloth. 2 A pile of hay, left within reach.
# 3 It follows the one who brought the hay. 4 A mother, her baby, and no hurry.
# Risks, written once: (a) the gesture steps (forced walk, forced haul, follows, lies down) were never played with a pause
# right after "I let N ticks pass": if the walk does not show, 1 to 3 lose criterion e together; (b) a haul may end before the
# pause, the hay is then on the ground and still reads; (c) only row z = 105, x 152 to 156 is known free, so every path stays
# in that block; (d) the sloth faces the camera in 2 only because it is placed so, the one posed element of the series, on
# purpose (criterion c).
# Real verdicts go next to the estimates in STATUS.md after the run.
#
# THE PLACE. "flower-garden" (SANCTUAIRE-LIEUX.md): the garden of lilies and roses north of the statue field, centre (154, 105).
# The softest, greenest corner that is not a building, with no roof and no furniture. A bed corner sits at about (158, 102):
# frames centred on (154, 105) at zoom 2 or more stay clear of it. Nelim is drawn from her canon (SanctuaryBacklot/docs/NELIM-PROFIL.md):
# a high ponytail (the Core "Ponytails"), near-black brown hair, the Body_Heart tattoo. The first "wears" step undresses her, so
# every garment is dressed explicitly. The face is set last, after every wait, because Facial Animation recomputes it at every
# tick (SanctuaryBacklot, run 56b0). Every scenario reloads the save, removes the animals of the save, cleans the filth, sets
# the hour and the weather, places the set, photographs it. Nothing asserts about the image but the sky glow of 4: a person opens
# each one (@review). The information card (Wildness 50 %) and the trader's stock are menus and screens, taken by hand.
#
# Pass "galerie": -DepMap wsl-deps.galerie.map.

@review @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.clearscreen @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.stagedecor
Feature: Gallery pictures of the sloth, the sloth hour

  Scenario: 1. the meeting, Nelim notices a sloth asleep in the flower garden
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
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (32, 64, 128)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (90, 64, 44)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (62, 48, 40)
    And Nelim's Pickle Tools: "Nelim" body tattoo is "Body_Heart"
    And Nelim's Pickle Tools: "Nelim" stands at (152, 105) facing East
    And Nelim's Pickle Tools: "Nelim" carries 12 of the item "Hay"
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (156, 106) fully grown
    And Nelim's Pickle Tools: an adult animal of kind "Sloth" named "Mossy" is spawned at (154, 104)
    And Nelim's Pickle Tools: "Mossy" lies down
    And Nelim's Pickle Tools: "Nelim" is forced to walk to (156, 105)
    When Nelim's Pickle Tools: I let 18 ticks pass
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (154, 105) at zoom 3
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    And Nelim's Pickle Tools: the light of the map is logged
    Then I take a screenshot "gallery 1 - the meeting, Nelim notices a sloth asleep in the flower garden"

  Scenario: 2. the hay, Nelim sets hay down in front of the sloth
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
    And Nelim's Pickle Tools: I let 208 ticks pass
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (32, 64, 128)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (90, 64, 44)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (62, 48, 40)
    And Nelim's Pickle Tools: "Nelim" body tattoo is "Body_Heart"
    And Nelim's Pickle Tools: "Nelim" stands at (153, 104) facing East
    And Nelim's Pickle Tools: an adult animal of kind "Sloth" named "Mossy" is spawned at (154, 105)
    And Nelim's Pickle Tools: the animal "Mossy" stands at (154, 105) facing South
    And Nelim's Pickle Tools: "Nelim" is forced to haul 4 of the item "Hay" to (154, 104)
    When Nelim's Pickle Tools: I let 8 ticks pass
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (154, 105) at zoom 2.4
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    And Nelim's Pickle Tools: the light of the map is logged
    Then I take a screenshot "gallery 2 - the hay, Nelim sets hay down in front of the sloth"

  Scenario: 3. the young one follows, a sloth and its baby trail behind Nelim
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
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (32, 64, 128)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (90, 64, 44)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Ponytails"
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (62, 48, 40)
    And Nelim's Pickle Tools: "Nelim" body tattoo is "Body_Heart"
    And Nelim's Pickle Tools: "Nelim" stands at (154, 105) facing East
    And Nelim's Pickle Tools: "Nelim" carries 8 of the item "Hay"
    And Nelim's Pickle Tools: an adult animal of kind "Sloth" named "Mossy" is spawned at (153, 105)
    And Nelim's Pickle Tools: an animal of kind "Sloth" named "Pip" is spawned at (152, 105) at life stage 0
    And Nelim's Pickle Tools: "Mossy" follows "Nelim" within 1 cells
    And Nelim's Pickle Tools: "Pip" follows "Mossy" within 1 cells
    And Nelim's Pickle Tools: "Nelim" is forced to walk to (156, 105)
    When Nelim's Pickle Tools: I let 20 ticks pass
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (154, 105) at zoom 2
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthLipsSmallSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    And Nelim's Pickle Tools: the light of the map is logged
    Then I take a screenshot "gallery 3 - the young one follows, a sloth and its baby trail behind Nelim"

  Scenario: 4. the sloth hour ends, mother and baby asleep by the lamp as Nelim leaves
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
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (156, 104)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (156, 104) is lit
    And Nelim's Pickle Tools: "Nelim" stands at (153, 106) facing West
    And Nelim's Pickle Tools: "Nelim" carries 8 of the item "Hay"
    And Nelim's Pickle Tools: an adult animal of kind "Sloth" named "Mossy" is spawned at (154, 105)
    And Nelim's Pickle Tools: an animal of kind "Sloth" named "Pip" is spawned at (155, 106) at life stage 0
    And Nelim's Pickle Tools: "Mossy" lies down
    And Nelim's Pickle Tools: "Pip" lies down
    And Nelim's Pickle Tools: I let 40 ticks pass
    And Nelim's Pickle Tools: "Nelim" is forced to walk to (152, 106)
    When Nelim's Pickle Tools: I let 8 ticks pass
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (154, 106) at zoom 2.4
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
    And I take a screenshot "gallery 4 - the sloth hour ends, mother and baby asleep by the lamp"
