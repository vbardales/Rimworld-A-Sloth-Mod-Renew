---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:          A Sloth Mod Renew (unofficial)
packageId:    nelim.aslothmod
repo:         Rimworld-A-Sloth-Mod-Renew
remote:       https://github.com/vbardales/Rimworld-A-Sloth-Mod-Renew.git
visibility:   public
detached:     yes
workflow_stage: playTests[1.0.0]
licence:      silent
licence_port: MIT, limited to the port's own contributions (LICENSE at the root 2026-10-11; Mod/LICENSE to be added once the seven f156f38 tickets are done, with the About.xml comment fix)
licence_at:   original files and Workshop checked 2026-09-12; no terms found; original mod last updated 2021-07-23 (1.3); original mod has no git repository of its own (checked 2026-09-27, GitHub search for the author turns up nothing)
upstream_mod_remotes: N/A (checked 2026-10-01: no repository of the author on GitHub; emipa606/ModRequests only mirrors the original About.xml, it is not a source repository)
dependencies: none
showcase:     complete
tested_on:
tested_1_7:   yes (English only, AUDIT.md "Passe 1.7"; 2026-10-13, pass sans-facultatifs 3/3, Tests/Pickle/Evidence/p17-slothmod-01-repair; <li>1.7</li> only after Virginie confirms)
workshop:      3811289805; 0.1.0 prepublication by the owner on 2026-10-01: an upload that only creates the item (private, as Steam creates them) and its PublishedFileId.txt. An act, not the `prepublished` stage; visibility and the live page were not queried
remaining:
  - todo: Art/Preview.config.json now uses Art/echo-preview.png (flipX true, 2026-10-12). Regenerating the Preview (`node ../scripts/Render-Preview.cjs`, writes Mod/About/Preview.png and Art/Gallery/0-preview.png) is deferred: Mod/ is frozen until the two 0e09424 tickets finish. Then inspect at full size and at 268 px, set `echo_review_sha` and `social_preview_sha256`, send the GitHub social preview (PUBLISHING.md)
  - unverified: the nineteen scenarios of TESTING.md now have a disposition (table in TESTING.md, 2026-10-10): automated, pinned offline (Test-Mod.ps1, 147 checks green), or not applicable. F (biome patch) is an XML unit test, automated; G (trade, `08-trade`, pass commerce) and P (ADS 2 recipes, in `03`) are automated with PickleTools steps (NPT, 72570e9, compiled, never played), F biome lists asserted in `01` and `02`; first runs will calibrate step wording and the spawn of a tamed sloth; nothing is played in game yet
  - unverified: new Pickle features never played: 06-incompat (pass incompat-slothmod, map ids to re-check on the original's Workshop page), 07-labels-english and 07-labels-french (one pass per language, @review captures to read)
  - unverified: Pickle clean-tree passes minimal (19b0, 3/3) and with-optionals (b69a, 7/7) are green on 3682682, before the Pickle suite changes and the icon chain regeneration; both are rerun on the frozen tree
  - unverified: gallery pictures 1 and 2: the feature was rewritten (8959996, b6dd6f0: framing steps, golden hour) after the unusable captures of pass 2d40 (sloth ~40 px); the rewritten pass has not run and its captures are not opened
  - feature: PUBLICATION.md drafted 2026-09-28; screenshots and Workshop-comments rows pending (item now exists, private)
  - unverified: seven initial Pickle tickets played 2026-10-10 on f156f38 (evidence Tests/Pickle/Evidence/<pass>-f156f38): minimal, avec-facultatifs, english, french passed; commerce 1 pass + 1 [no-stock] flaky (the colony sloth is tradeable); galerie failed (fixture nelim-zen-meadow-studio deleted 2026-10-08) and incompat failed (exit 1, original 2253087891 not in the WSL cache). Fixed 2026-10-12: gallery moved to the Sanctuary (Nelims-tribe, flower-garden, 0e09424), original downloaded. Two tickets filed on 0e09424 (tree frozen on Mod/ and Tests/ until RUN_DONE): `20261012-042722-487-9b2f` galerie, `20261012-042723-091-b903` incompat; evidence under Tests/Pickle/Evidence/<pass>-0e09424. Still to read: galerie captures (@review, Virginie accepts), the 06 incompat result, the [no-stock] commerce replay if wanted
  - 2.e: Art/Preview-source.png measures a mean value of 0.272 (Measure-Palette.sh), under the 0.30 floor; hue families 2 (OK). Virginie decided in chat on 2026-10-11 to keep it ("on conserve preview"): override recorded, the criterion is waived for this source and the retained state stays playTests[1.0.0]
  - defect: Mod/LICENSE missing (PUBLISHING.md wants it in the published folder); the root LICENSE exists since 2026-10-11. Add Mod/LICENSE with the About.xml comment fix once the seven tickets are done (a Mod/ commit now changes what they stage)
  - unverified: FRENCH_REVIEW.md regenerated 2026-10-10 with scripts/Make-FrenchReview.ps1 (the mod's own generator was deleted 2026-10-11: the shared script does the job); texts are unchanged since Virginie's review of 2026-10-01 but the new file's review line is empty: a session never fills it, Virginie records it
  - feature: writeDocs gaps seen early (11.b, 11.d): the About.xml description has no THANKS section (ADS 2, Nocturnal Animals, Alpha Biomes, More Vanilla Biomes, Pickle and RimLogging as development only) and no Workshop links on cited mod names; the description source is PUBLICATION.md, not yet synced
  - defect: Mod/About/About.xml carries a comment saying RimWorld resolves a duplicate defName by load order and logs nothing; TESTING.md (log table, `Adding duplicate`) and the new 06-incompat feature say the game does log it. Found by the 2026-10-10 read of Mod/ (first half of the 8.m review: Defs, the four patches, About.xml; no other defect). Fix after the seven tickets finish: a Mod/ commit while they are queued would change what they stage
  - unverified: playTests exit (AUDIT.md 8): tree frozen, Pickle passes minimal, with-optionals, incompat-slothmod, English, French and gallery run green on it, @review captures opened, code review of Mod/ (no code_review_sha yet), tested_on and docs/runs/ lines written
session:      local_eebc4d1e-c168-44da-939d-76f74f8b704f
updated:      2026-10-10, re-audit against AUDIT.md (workflow_stage playTests[1.0.0]); root cleaned; ModIcon.png and Preview chain regenerated
protocols_read_sha: 8ca1edc7ab50f4a7d9ecf725bcfa2641baa8fc8c
---

# A Sloth Mod Renew — status

## Re-audit — 2026-10-10 (`workflow_stage: playTests[1.0.0]`, replaces `stage: done`)

Old `done` maps to `playTests`. Out-of-game criteria of `writeTests` re-checked today: `Tests/Test-Mod.ps1` 139 checks green; French reviewed by Virginie (2026-10-01); Pickle suite written (`Tests/Pickle/`; minimal and with-optionals passes green on 3682682). Not established, hence `playTests`: the nineteen manual scenarios (TESTING.md) unplayed, gallery captures 1 and 2 unusable, no `code_review_sha`, no `tested_on`. Mod root cleaned: `.editorconfig` removed, `_tools/` became `scripts/`. `Mod/About/ModIcon.png` (older than `Art/ModIcon-source.png`) and the Preview chain (`Preview.png`, `Art/Gallery/0-preview.png`, both `.ico`) regenerated; the uncommitted changes to `Art/ModIcon-source.png` are the owner's. `Art/Preview.config.json` now carries `modIconSource` (STYLE_RIMWORLD.md), so `Render-Preview.cjs` writes `ModIcon.png` itself: 128 x 128, 29,693 bytes, inside the 20 to 30 KB window. Preview badge cropped by the frame again at Virginie's request ("le avant est mieux rognée", 2026-10-10), validated by her ("je valide") on the rendered Preview: `iconBadge.translate` `-12%,14%` in `Art/Preview.config.json`, since the new source is tightly trimmed and would otherwise sit whole in the corner. ModIcon.png (128 x 128, 29,693 bytes) confirmed by Virginie in chat on 2026-10-10, readability at 32 px included.

Older dated sections moved to docs/runs/status-journal-2026-10-11.md.

Full replay of states 1 to 7 on 2026-10-10, against the current protocols (AUDIT.md 16): 1 setupRepo, remote and repository, README title and status mention, ATTRIBUTION identical in Mod/: OK except LICENSE (defect above). 2 makeSources, sources and Art/ minimal set present, no PROMPT file, ModIcon derived, palette of Preview-source: defect above. 3 code, no C#, CHANGELOG [1.0.0] unreleased: OK. 4 declareDependencies, modDependencies empty, incompatibleWith original, loadAfter/loadBefore declared, patches guarded; four animal integrations: ADS 2 (patched, loadBefore), Nocturnal Animals (patched), Better Crossbreeding (nothing to patch: opt-in field, empty by default), **Dogs mate (Mlie.DogsMate, 2441132298) not applicable**: its 1.6 groups (Canidae, Felidae, Mammalia, Rodentia files) hold no sloth group, the Armadillo group names sloths only in its description with an empty pawnKinds, and the sloth is a lone species with no crossbreeding partner here; read on 2026-10-10 from the Workshop copy. 5 auditSettings, no settings, no MainButtons, no C# found in Mod/ (settings_audit not_applicable stands). 6 localize, Check-DefInjected 5 keys, 0 errors; FRENCH_REVIEW.md regenerated (above). 7 writeTests, Test-Mod.ps1 147 checks green, scenarios in TESTING.md, Pickle suite written, translations complete.

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

## Gender agreement and systematic French review — 2026-09-30

`../TRANSLATIONS.md` added the three-segment `{PAWN_gender ? ...}` rule and the systematic
French review by Virginie; every mod with a `Languages/French` folder had `translation_fr`
reset to `unchecked`.

- Gender agreement: neither French text agrees with a pawn. `Sloth.label` is an invariant
  noun ("paresseux"); `Sloth.description` and both `tools.*.label` entries are impersonal or
  fixed nouns, none an adjective or participle referring to the animal. No switch needed,
  no defect.
- `FRENCH_REVIEW.md` generated at the mod root by `scripts/Make-FrenchReview.ps1 -ModRoot Mod` (shared)
  (adapted from `FoodCourt/_tools/`, no `Mod/Languages/Keyed` or `Mod/Languages/English`
  folder here — Original and English both resolve to the shipped Def's native fallback
  text). Revision: working tree at `e280013`. All four rows resolved cleanly, no `?` flags.
- `translation_fr` set to `partial`, not `complete`: only Virginie's own reading closes it,
  per TRANSLATIONS.md section "Systematic French review by Virginie".

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

The `workshop` field names the item since 2026-10-01 (0.1.0 prepublication, commit 880c9d2).
carried over: the original's names their item, not ours.

The three categories `remaining` takes: `feature` for something missing from the first pass,
`defect` for a known fault not repaired, `unverified` for what could not be checked.

The `session` field was not touched: it names the sidebar session group, not this conversation.

Vocabulary for `licence`: `open` an explicit licence, `silent` no licence and an unmaintained source mod,
`alive` no licence but a maintained source mod, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

