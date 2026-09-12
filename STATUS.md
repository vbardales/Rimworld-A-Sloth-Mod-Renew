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
  - unverified: prioritize F and G (natural spawning and trade), and L (original-mod incompatibility warning)
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

The fields above reflect the repository audit and completed preview work on 2026-09-12.
Offline checks and visual QA are complete; runtime validation remains outstanding:

- **`stage`** — `done`. The port is whole: wildness moved from a `RaceProperties` field to a stat
  under `statBases`, which is the one line 1.6 required. Two pictures were made for it. `TESTING.md`
  says what has not been checked. What is left is not development, it is the game, and then the
  Workshop.
- **`tested_on`** — empty, and that is accurate rather than an omission. This sloth has never been
  seen running. No animal spawned, no information card read, no trader stock opened.
- **`licence`** — `silent`. No explicit terms found; the original mod has not been
  updated since 23 July 2021. The author's unrelated Steam activity does not change this category.
- **`remaining`** — the 15 manual scenarios remain unplayed. Prioritize F and G for natural
  spawning and trade, and L for the in-game incompatibility warning. The declaration itself
  is present in `Mod/About/About.xml` and covered by the automated checks. Missing translations
  and the single dessicated-corpse texture remain known upstream limitations.

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

## Ready for in-game validation

- **Preview complete.** The final composition was inspected at 896 x 504 and 268 px wide.
  The previous thumbnail review is closed; source, palette, typography and contrast evidence
  are documented below.
- **Next step:** execute scenarios A–O in `TESTING.md` and record the game version, active
  mods, observed results and relevant logs. Keep `tested_on` empty until a game run is recorded.

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

## Preview overlay recomposition — 2026-09-12

- Source: `Art/Preview.png`, copied byte-for-byte from the existing text-free
  `Art/Preview-source.png`. The illustration was retained, not replaced; the original
  full-resolution file remains available at its existing path. The crop remains at 50% 86%.
- Composition: `Art/preview.html`; sole colour reference: `Art/preview-palette.json`.
  Rebuild and checks: `Art/render-preview.cjs` (Node with playwright and sharp, installed
  Chrome). The HTML loads the palette and reads the highest stable supported version from
  the shipped `Mod/About/About.xml`; this currently produces the 1.6 badge.
- Palette rationale: the veil comes from the broad cool, shadowed plank-floor surface.
  The vivid accent follows the olive-green food in the sloth bowl, with saturation and
  lightness increased for the rule and badge. This significant feeding detail supplies a
  yellow-green family distinct from the dominant ochre of the wood and fur. The secondary ink follows the dominant
  ochre wood-and-fur family, brightened for contrast; it is not an average pixel colour.
- The title retains its wording; the summary now reads "One slow, harmless animal, brought forward."
  The version appears only in the badge. Strong title words, the reduced article and the summary share the primary ink; Renew
  uses the secondary ink. The
  unofficial tag is on its own line. Position, spacing, shadow and badge geometry follow
  `../STYLE_RIMWORLD.md`; title size is 46 px.
- Actual fonts verified through Chrome platform-font data: Segoe UI (including its Semibold
  title and Bold badge faces). Capture waits for `document.fonts.ready` and image decoding.
- Output: `Mod/About/Preview.png`, 896 x 504, 539157 bytes (below 900 kB).
  Thumbnail: `Art/preview-268.png`. Both were visually inspected: no overlap or clipped text,
  title and version identifiable, rule visible. The summary is intended for full-size viewing.
- Contrast evidence: `Art/preview-background.png` and `Art/preview-qa.json`. Every background
  pixel within each text rectangle was checked, without relying on text shadows. Minimum
  ratios: title 9.11:1, summary 6.02:1, tag 5.61:1; badge digits 9.73:1 on its opaque fill.
- No publication was performed.

- Updated title hierarchy: A and Renew are direct spans at 65% (29.9 px), weight 600;
  Renew uses secondary ink, A primary ink. Sloth Mod remains 46 px. Verified visually
  at both sizes, including reduced words and accent separation. Additional minimum contrast:
  A 11.47:1, Renew 7.23:1. No illustration replacement or publication.
