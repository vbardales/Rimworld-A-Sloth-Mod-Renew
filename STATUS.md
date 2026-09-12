---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
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
  - defect: About.xml description lacks the final formatted Source code on GitHub link required before publication
  - unverified: the fifteen scenarios in TESTING.md, none played
  - unverified: prioritize F and G (natural spawning and trade), and L (original-mod incompatibility warning)
  - unverified: scenario I must check the inherited east-only dessicated corpse in game; the limited artwork alone is not an established runtime defect
  - unverified: English and French in-game translation checks in TESTING.md, including generated labels and clipping
session:      local_eebc4d1e-c168-44da-939d-76f74f8b704f
updated:      2026-09-13, workflow audit
---

# A Sloth Mod Renew — status

## Current workflow audit — 2026-09-13

This section and the front matter supersede the historical status conclusions below;
older results are preserved, not silently certified again. **Previous stage: done.
Initial audit stage: horsMonoRepo; after the explicit icon-style override: preTest; after correcting scenario O: done.** Stage values here are literal workflow states, not numeric
codes: dansMonoRepo -> horsMonoRepo -> ModIcon generated ("ModIcon générée") -> Preview
generated ("Preview générée") -> preOptions -> options -> l10n -> preTest -> done -> tested.
The user explicitly accepted the existing icon style on 2026-09-13. This scoped override closes the icon gate; the later independent validations remain valid. The original audit decision is preserved here as history.

### Scope and revision

- Audited at approximately 01:31 CEST on 2026-09-13 against
  `53ce7ea64515e064a1a968311d2de34eb312d6fa` plus the current working tree.
- Standalone Git root: `C:/Users/nelim/Documents/rimworld/ASlothModRenew`;
  actual distributed root: its `Mod/` subdirectory. Art, tests and development documentation
  remain outside that directory. No assembly or build project is shipped or present.
- Pre-existing changes: modified CHANGELOG.md, STATUS.md and TESTING.md; untracked
  `Mod/Languages/` containing the two French XML files. Those files were included in the audit.
  This audit changes only STATUS.md and adds `Tests/Audit-2026-09-13.sha256`, a SHA-256
  inventory of every distributed file. It does not commit, publish, develop or regenerate art.
- Read `../AGENTS.md`, `../PUBLISHING.md`, `../STYLE_RIMWORLD.md`,
  `../MOD_SETTINGS.md` and `../TRANSLATIONS.md`; the supplied audit prompt overrides
  conflicting historical rules, particularly settings runtime requirements.

### Ordered gate findings

| Transition | Current evidence and result |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | **Validated.** Independent .git and Git root; origin points to the exact GitHub repository. Live `gh repo view vbardales/Rimworld-A-Sloth-Mod-Renew --json name,isPrivate,url,defaultBranchRef` returned public, main. `git ls-remote origin HEAD` returned the audited commit. Initial sandbox access failed; the read-only checks succeeded with elevated access. STATUS and English README, ATTRIBUTION and CHANGELOG exist. Package `nelim.aslothmodrenew`, display name, repository and folder consistently identify the same continuation without requiring literal equality. |
| horsMonoRepo -> ModIcon generated | **Validated with explicit user style override, 2026-09-13.** The initial audit blocked this gate; the user subsequently accepted the existing style. Directly viewed the shipped PNG: the mascot has two open eyes and no top-right ponytail, contrary to the explicit ModIcon style. Its round sloth head, branch, dark background and outlined treatment are recognizable, and its PNG format, 128 x 128 dimensions and 24,497-byte size pass. The development/build part is otherwise established for this XML-only port; compilation and compiled-artifact freshness are **not applicable**. |
| ModIcon generated -> Preview generated | **Validated independently.** Directly inspected the delivered 896 x 504 PNG (539,157 bytes) and the 268-pixel thumbnail. High oblique view, floor-dominated composition, restrained ochre/cool-shadow palette, lit sloth, empty title area, no readable face or clipping. No concrete camera defect or remaining visual doubt was observed. No historical generation report or recorded comparison with a game screenshot is required. |
| Preview generated -> preOptions | **Validated independently for the stated gate.** English description and title; Renew/unofficial naming is consistent. Preview article A is reduced in primary ink; Renew is reduced in secondary ink; unofficial occupies its own line. Green accent #B5C52C is visibly distinct from ochre secondary #E8BE85 at both inspected sizes. HTML and palette agree with the rendered image. The separate publication-description formatting defect is recorded below. |
| preOptions -> options | **Not applicable justified / gate passes.** See settings inventory below. |
| options -> l10n | **Validated independently.** Five owned texts, five nonempty French injections, native English Def fallback; handles checked against installed game types. Current checker completed with 11,587 defs indexed, five keys checked, zero errors and no unresolved targets reported. |
| l10n -> preTest | **Validated independently offline.** Uses Core animal parents, race/body/life-stage/stat/sound/material references and no third-party code. Core references were inspected in installed Core Defs. No mandatory external dependency, assembly, mod extension or LoadFolders exists in this mod. More Vanilla Biomes and Alpha Biomes are optional and guarded by their actual installed names. Installed package IDs and all four 1.6 biome targets with wildAnimals were checked in Workshop folders 1931453053 and 1841354677 and their LoadFolders. No extra loadAfter for these Def-only targets is needed to make the guarded XPath additions coherent. No optional integration was tested in game. |
| preTest -> done | **Validated after correction, 2026-09-13.** The initial audit found scenario O inconsistent with the shipped French resources. It now specifies preconditions, actions and expected EN/FR labels, descriptions, generated text, save/reload behavior and log checks. Scenarios A–O are ready for execution. The previously executed 95 automated/XML checks and five successful injection-path checks remain applicable: only documentation changed. |
| done -> tested | **Not verified.** No game scenarios executed, no attributable current game logs reviewed, no FR/EN runtime UI check, and no new-game or existing-save validation. Installed game data supports offline checks only. No settings or RIMMSQOL interaction is claimed. |

### Settings audit

Inventory covers both Sloth Defs, both biome patches, all distributed files and the complete
source inventory. This is a fixed-content animal: movement, hunger, taming, breeding, combat,
trade tags and biome weights are authored balance values, not a promised player configuration
contract. Optional biome additions activate when those biome mods are present; they introduce
no controls, persistence model or player input. No concrete player need justifies exposing
these internal constants as new options for this port. There are no inherited custom settings,
settings-only XML instructions, C# sources, assemblies, ModSettings, MainButtonDef or custom
settings-page mechanism. Thus neither an empty page nor a shortcut is defined.

`settings_audit: not_applicable` is justified by that inventory. Input bounds, reset, stored
defaults/migration, change application, save/reload and shortcut sharing tests are not applicable.
No RIMMSQOL or other customization integration was executed or certified. Per the audit prompt,
absence verification in these sources suffices for this gate; it does not claim in-game testing.

### Executed checks and limits

- `pwsh -NoProfile -File Tests/Test-Mod.ps1`: **PASS, 95 checks**, current local French files
  included. XML parsing, metadata, Wildness, texture references and all four optional-mod
  combinations passed on synthetic fixtures. This is not the RimWorld patch engine.
- `powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Check-DefInjected.ps1
  -TransMod ./Mod`: **PASS**, five paths, zero errors, no unresolved targets reported.
  Reviewed all five source/French pairs and both patches: no extra owned text, parameters,
  grammar tokens, duplicate per-type keys, empty entries or hardcoded UI. Game-generated
  labels and Core-owned resources still need the documented FR/EN runtime checks.
- PNG files decoded and dimensions/lengths read with System.Drawing; direct visual inspection
  performed using the actual Mod/About files and Art/preview-268.png. Existing contrast/font
  measurements are historical supporting evidence, not newly executed measurements.
- Root and distributed ATTRIBUTION.md have identical SHA-256 hashes. Local original source
  inventory and About.xml contain no licence or reuse permission. The detailed external
  rights review dated 2026-09-12 below remains the documented basis for `licence: silent`;
  those external Steam pages were not re-fetched in this audit. No new permission is inferred.
  Absence of LICENSE is justified for this unlicensed third-party content; do not invent one.
  Public/unofficial designation and notice match the project's recorded silent-source policy.
- `git diff --check`: passed before the audit edit; repeated after it. The manifest fixes the
  exact local payload covered by these checks, including uncommitted language resources.

### Scenario O correction — 2026-09-13

The user requested the fix after accepting the icon style. Updated only TESTING.md and
STATUS.md; preserved prior changes and test history. Reviewed the scenario against both
French XML files and the existing English/French checklist. The distributed payload remains
identical to Tests/Audit-2026-09-13.sha256, so prior offline results are retained without
claiming a new test run. No game test was performed; tested_on remains empty.

### Required follow-up and separate publication issues

The user explicitly overrode the icon-style validation on 2026-09-13: the existing icon is accepted without alteration. This applies only to its style; previously checked format, size and installation remain valid. The resulting stage advances from horsMonoRepo to preTest. The subsequent user-requested fix reconciled TESTING.md scenario O with the shipped French resources and the newer translation checks, advancing preTest -> done. No image was changed and no runtime test is implied by this override.

For the next transition, done -> tested, execute
the functional scenarios and record versions, results and logs before tested. These missing
game checks are unverified work, not evidence of a broken animal.

Before publication, replace the raw GitHub-description ending with the required final
`[url=https://github.com/vbardales/Rimworld-A-Sloth-Mod-Renew]Source code on GitHub[/url]`.
The URL already exists and is correct; the defect is its format and placement, not a missing
repository. This publication-specific requirement does not retroactively negate separation.

Optional limitation: the upstream east-only dessicated texture is deliberately retained in
scenario I. The file inventory establishes that limitation, not a rendering crash or missing
texture error; its runtime behavior remains unverified. No extra corpse artwork is required
solely to improve the workflow status. There is no additional Preview reservation.

## Historical status and evidence (superseded where noted above)

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
  is present in `Mod/About/About.xml` and covered by the automated checks. Translation runtime
  checks and the single dessicated-corpse texture remain outstanding.

## Translation audit — 2026-09-13

Applied the shared `../PUBLISHING.md` and `../TRANSLATIONS.md` gate to the current
`Mod/` files. The historical `stage: done` is preserved; translation completeness
certifies offline readiness only. No in-game test or publication was performed.

- Inventory: `Defs/ThingDefs_Animals.xml` owns five texts: ThingDef `Sloth.label`,
  `Sloth.description`, `Sloth.tools.left_claw.label`, `Sloth.tools.right_claw.label`,
  and PawnKindDef `Sloth.label`. Both claw handles come from the original English
  tool labels, with spaces normalized to underscores, rather than numeric indices.
- English: all five original Def values are nonempty English and remain the native
  fallback; no redundant English DefInjected files are required.
- French: five entries in `Languages/French/DefInjected/ThingDef/Sloth.xml` and
  `Languages/French/DefInjected/PawnKindDef/Sloth.xml`. Meaning and terminology reviewed;
  no parameters, grammar tokens or rich-text tags occur in these owned strings.
- Scope: no assembly, C# source, settings UI, Keyed calls, custom text fields,
  LoadFolders or version-specific content. Both biome patch files only add numeric
  wild-animal weights, including their optional integrations; they add no text.
  Referenced Core life stages, body parts, leather, stats and generated corpse labels
  remain game-owned resources. No dependency translation keys are introduced or reused.
  About metadata, attribution, technical IDs, paths and documentation are outside this gate.
- Validation: `powershell -NoProfile -ExecutionPolicy Bypass -File
  ../scripts/Check-DefInjected.ps1 -TransMod ./Mod` indexed 11,587 defs and checked
  all five injection keys: zero errors, no unresolved targets reported.
  `pwsh -NoProfile -File Tests/Test-Mod.ps1` passed 95 checks, including parsing both
  language files. An inventory comparison verified exactly five unique, nonempty
  French entries across the two Def types; English source values were reviewed separately.
- Runtime: English and French checks are documented in TESTING.md and remain
  `unverified` above, including life stages, corpses, trader labels and clipping.
  Revalidate these three fields after changes to Defs, patches or language resources.

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
