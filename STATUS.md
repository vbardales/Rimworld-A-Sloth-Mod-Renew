---
mod:          A Sloth Mod Renew
packageId:    nelim.aslothmodrenew
repo:         Rimworld-A-Sloth-Mod-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   four places, all searched for a refusal rather than a permission; source dead since 1.3
dependencies: none
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: the fifteen scenarios in TESTING.md, none played
  - unverified: F and G, whether the animal now reaches a colony at all, which nothing outside the game settles
  - defect: no incompatibleWith for the original mod, so both can be enabled at once and the last one loaded wins in silence
  - defect: the dessicated corpse has only its _east texture, the other faces are rotations of it
  - feature: no translations, so the animal stays "sloth" in every language
session:      local_eebc4d1e-c168-44da-939d-76f74f8b704f
updated:      2026-09-12, the mod's own session
---

# A Sloth Mod Renew — status

Status card, read by a sweep over every mod rather than by asking each thread one at a time. It
lives at the root, never inside `Mod/`, so Steam never receives it.

This card is in English, like the repository around it: README, changelog, testing notes,
attribution and every commit message.

The fields above were deduced from disk on 2026-09-12 by the sweep, which left two of them
corrupted — `licence` read `licence_ou:` and `licence_at` had swallowed a `vitrine:` key. They are
repaired here, along with the four the sweep could not know:

- **`stage`** — `done`. The port is whole: wildness moved from a `RaceProperties` field to a stat
  under `statBases`, which is the one line 1.6 required. Two pictures were made for it. `TESTING.md`
  says what has not been checked. What is left is not development, it is the game, and then the
  Workshop.
- **`tested_on`** — empty, and that is accurate rather than an omission. This sloth has never been
  seen running. No animal spawned, no information card read, no trader stock opened.
- **`licence`** — `silent`. The original states nothing in any of the four places `ATTRIBUTION.md`
  lists, and it stopped at 1.3 in July 2021. Published on the Workshop's custom for abandoned mods:
  named credit, takedown on request.
- **`remaining`** — the sweep's catch-all line is replaced by five real ones, now that `TESTING.md`
  exists. F and G stand apart: they are the two the design change below turns on, and neither can
  be settled outside the game.

## What this mod is no longer a straight port of

Recorded here because the rest of the repository insists on how little was touched, and because a
future reader will otherwise take this for a pure port.

**The original could not be obtained in a normal game.** It was in no biome's wild animal list, and
its only trade tag, `AnimalCommon`, is in no trader's sell or buy list anywhere in Core or the five
expansions. Vanilla's hare carries that tag alone and is caught in the wild, never bought. An
animal in neither place exists only in the files.

Two changes fix that and nothing else was touched:

- `AnimalUncommon` added to the trade tags, the tag of the monkey, the iguana, the tortoise and the
  megasloth, and the one exotic caravans and orbital ships actually sell.
- Six biome entries, by patch: tropical rainforest 0.5 and tropical swamp 0.4 from Core;
  cloud forest 0.5 from More Vanilla Biomes; miasmic mangrove 0.4, mycotic jungle 0.3 and feralisk
  infested jungle 0.05 from Alpha Biomes. The two mods are guarded by `PatchOperationFindMod` and
  are not dependencies, which is why `dependencies` still reads `none`.

This is design rather than porting, and `ATTRIBUTION.md` says so in those words.

## Decisions still open

- **`incompatibleWith`.** The original, `ThatRubishGamer.RubishMods.SlothMod`, defines the same two
  defs under the same `defName`. Dalmatians Renew declares the collision against its own source and
  this one does not. Either declare it before publishing or accept it knowingly.
- **The banner at thumbnail size.** `About/Preview.png` passes every test in `STYLE_RIMWORLD.md`
  except the first, which it passes only just: shrunk to the 268 px the Workshop grid draws, the
  claws stop reading and the animal is a pale shape on a post. Tightening the crop would push the
  title over the lit floor.

The `workshop` field is empty because the item does not exist yet. No `PublishedFileId.txt` was
carried over: the original's names their item, not ours.

The three categories `remaining` takes: `feature` for something missing from the first pass,
`defect` for a known fault not repaired, `unverified` for what could not be checked.

The `session` field was not touched: it names the sidebar session group, not this conversation.

Vocabulary for `licence`: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.
