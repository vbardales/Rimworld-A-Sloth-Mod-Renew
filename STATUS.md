---
mod:          A Sloth Mod Renew (unofficial)
packageId:    nelim.aslothmodrenew
repo:         Rimworld-A-Sloth-Mod-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   original files and Workshop checked 2026-09-12; no terms found; original mod last updated 2021-07-23 (1.3)
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
- **`licence`** — `silent`. No explicit terms found; the original mod has not been
  updated since 23 July 2021. The author's unrelated Steam activity does not change this category.
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

- **The banner at thumbnail size.** `About/Preview.png` passes every test in `STYLE_RIMWORLD.md`
  except the first, which it passes only just: shrunk to the 268 px the Workshop grid draws, the
  claws stop reading and the animal is a pale shape on a post. Tightening the crop would push the
  title over the lit floor.

The `workshop` field is empty because the item does not exist yet. No `PublishedFileId.txt` was
carried over: the original's names their item, not ours.

The three categories `remaining` takes: `feature` for something missing from the first pass,
`defect` for a known fault not repaired, `unverified` for what could not be checked.

The `session` field was not touched: it names the sidebar session group, not this conversation.

Vocabulary for `licence`: `open` an explicit licence, `silent` no licence and an unmaintained source mod,
`alive` no licence but a maintained source mod, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

## Repository audit — 2026-09-12

- **Title:** `A Sloth Mod Renew (unofficial)` already appears in About.xml and README.
  Keep the existing unofficial suffix to identify this unauthorised continuation clearly.
  No additional suffix is needed for that purpose.
- **Description:** the GitHub URL is present inside the About.xml description as well as
  its URL field, and matches the configured Git remote.
- **Manual functional tests:** TESTING.md contains 15 scenarios (A–O). The original-mod
  warning and title expectations were updated. None has been executed in-game in this audit.
- **Automated/XML tests:** `Tests/Test-Mod.ps1` passes 93 checks, including all shipped XML,
  the Wildness regression, texture references and patch application on synthetic fixtures
  for all four combinations of the optional biome mods. This is offline coverage, not an
  execution of RimWorld or validation against installed third-party definitions.
- **Original-mod collision:** `incompatibleWith` is already present in About.xml. The older
  missing-declaration defect is resolved; the in-game warning still needs scenario L.

### Licence restated

`licence: silent` is the repository classification, not a licence name.
No standard licence file is present. A fresh check on 2026-09-12 found:

- The original local source at `../_mods-sources/SlothMod` contains no LICENSE/COPYING file,
  no reuse conditions in its XML and no repository URL. Its About.xml supports 1.2 and 1.3.
- The [original Workshop page](https://steamcommunity.com/sharedfiles/filedetails/?id=2253087891)
  contains no licence, permission or redistribution prohibition in the description or its
  five comments. Its only external description link is the author's Twitch channel.
- The [two change notes](https://steamcommunity.com/sharedfiles/filedetails/changelog/2253087891)
  are autogenerated; the latest is dated 23 July 2021 and adds no reuse terms.
- The [author's Steam profile](https://steamcommunity.com/id/ThatRubishGamer) contains no
  general reuse permission, but displays recent activity (3 hours in the past two weeks,
  games last played on 31 August). This demonstrates account activity, not resumed mod
  maintenance or willingness to answer requests.

The classification concerns maintenance of the source mod, not activity of its author on
Steam. As clarified by the maintainer, the absence of updates since 2021 and of explicit
licence terms places this mod in `silent`. The author's recent account activity does not
establish resumed mod maintenance. No explicit permission or refusal was found in the
inspected sources; this is not an exhaustive claim about every statement the author has made.

The continuation statement in README and About.xml permits updating and publishing a
continuation if the maintainer does not respond within a reasonable time, with all credit
preserved. This is the maintainer's stated condition, not a newly granted licence for the
original author's assets. This audit does not assign MIT, CC or another licence to them.
