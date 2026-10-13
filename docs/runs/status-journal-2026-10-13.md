# STATUS journal archive, 2026-10-13

Moved out of STATUS.md at the followUp cleanup (AUDIT 14.c). Nothing here is current state.

## Front matter remaining, as it stood before the cleanup

remaining:
  - unverified: tested_1_7 yes is English only (1.7 ships no French pack, AUDIT.md "Langues"); 2026-10-13 pass 3/3 in docs/runs/history.md. <li>1.7</li> is in supportedVersions since 892e498 (Virginie confirmed 2026-10-13)
  - unverified: the 1.7 Steam tag came from a local run of Release-Admin scripts/steam-apply-tags.mjs (owner, 2026-10-13), not from the CI: update_tags in the template has no effect with semantic-release-steam 2.1.3 (steamcmd ignores the VDF tags key). The next version that changes tags needs the CI/CD session to move the template to 2.2.0 (applyWorkshopTags, STEAM_REFRESH_TOKEN in steam-production)
  - note: gallery images 1 and 2 uploaded by hand and her subscription to the item confirmed by Virginie (2026-10-13). The 1.1.0 Preview (echo-source.png, derived from the accepted portrait capture, chosen by Virginie 2026-10-13 over echo-preview.png, removed) is on Steam (sha256 4aadb9ed checked) and as GitHub social preview (hash checked). code_review_sha moved to bc13c11: the only Mod/ change since the review at 1b4aa0a is Preview.png (an image). French review of FRENCH_REVIEW.md recorded by Virginie in chat 2026-10-13, translation_fr complete
  - unverified: commerce scenario [no-stock] never replayed green (flaky in the f156f38 run: the colony sloth is tradeable); AUDIT 12.f asks every red test to be seen green in a targeted replay: waived or replay it at the next ticket
  - unverified: Preview contrast (AUDIT 10.d) not re-measured on the 1.1.0 render; only the echo and the badge digits changed, the text colours did not
  - unverified: the nineteen scenarios of TESTING.md now have a disposition (table in TESTING.md, 2026-10-10): automated, pinned offline (Test-Mod.ps1, 147 checks green), or not applicable. F (biome patch) is an XML unit test, automated; G (trade, `08-trade`, pass commerce) and P (ADS 2 recipes, in `03`) are automated with PickleTools steps (NPT, 72570e9, compiled, never played), F biome lists asserted in `01` and `02`; first runs will calibrate step wording and the spawn of a tamed sloth; nothing is played in game yet
  - unverified: new Pickle features never played: 06-incompat (pass incompat-slothmod, map ids to re-check on the original's Workshop page), 07-labels-english and 07-labels-french (one pass per language, @review captures to read)
  - unverified: Pickle clean-tree passes minimal (19b0, 3/3) and with-optionals (b69a, 7/7) are green on 3682682, before the Pickle suite changes and the icon chain regeneration; both are rerun on the frozen tree
  - unverified: gallery 1 (portrait, 25 percent frame: the game bounds the zoom) and 2 (family) accepted by Virginie 2026-10-13 (runs 2ded753 and 0e09424, both green); the portrait is the weak one, to recompose later without blocking publication; picture 3 (trader stock) not taken
  - feature: PUBLICATION.md drafted 2026-09-28; screenshots and Workshop-comments rows pending (item now exists, private)
  - unverified: seven initial Pickle tickets played 2026-10-10 on f156f38 (evidence Tests/Pickle/Evidence/<pass>-f156f38): minimal, avec-facultatifs, english, french passed; commerce 1 pass + 1 [no-stock] flaky (the colony sloth is tradeable); galerie failed (fixture nelim-zen-meadow-studio deleted 2026-10-08) and incompat failed (exit 1, original 2253087891 not in the WSL cache). Fixed 2026-10-12: gallery moved to the Sanctuary (Nelims-tribe, flower-garden, 0e09424), original downloaded. Two tickets filed on 0e09424 (tree frozen on Mod/ and Tests/ until RUN_DONE): `20261012-042722-487-9b2f` galerie, `20261012-042723-091-b903` incompat; evidence under Tests/Pickle/Evidence/<pass>-0e09424. Read 2026-10-13: galerie accepted, 06 incompat green (1/1 on 0e09424); the [no-stock] commerce replay is optional
  - 2.e: Art/Preview-source.png measures a mean value of 0.272 (Measure-Palette.sh), under the 0.30 floor; hue families 2 (OK). Virginie decided in chat on 2026-10-11 to keep it ("on conserve preview"): override recorded, the criterion is waived for this source and the retained state stays playTests[1.0.0]
  - unverified: playTests exit (AUDIT.md 8): tree frozen, Pickle passes minimal, with-optionals, incompat-slothmod, English, French and gallery run green on it, @review captures opened, code review of Mod/ done 2026-10-13 (code_review_sha), tested_on and docs/runs/ lines written

## Re-audit — 2026-10-10 (`workflow_stage: playTests[1.0.0]`, replaces `stage: done`)

Old `done` maps to `playTests`. Out-of-game criteria of `writeTests` re-checked today: `Tests/Test-Mod.ps1` 139 checks green; French reviewed by Virginie (2026-10-01); Pickle suite written (`Tests/Pickle/`; minimal and with-optionals passes green on 3682682). Not established, hence `playTests`: the nineteen manual scenarios (TESTING.md) unplayed, gallery captures 1 and 2 unusable, no `code_review_sha`, no `tested_on`. Mod root cleaned: `.editorconfig` removed, `_tools/` became `scripts/`. `Mod/About/ModIcon.png` (older than `Art/ModIcon-source.png`) and the Preview chain (`Preview.png`, `Art/Gallery/0-preview.png`, both `.ico`) regenerated; the uncommitted changes to `Art/ModIcon-source.png` are the owner's. `Art/Preview.config.json` now carries `modIconSource` (STYLE_RIMWORLD.md), so `Render-Preview.cjs` writes `ModIcon.png` itself: 128 x 128, 29,693 bytes, inside the 20 to 30 KB window. Preview badge cropped by the frame again at Virginie's request ("le avant est mieux rognée", 2026-10-10), validated by her ("je valide") on the rendered Preview: `iconBadge.translate` `-12%,14%` in `Art/Preview.config.json`, since the new source is tightly trimmed and would otherwise sit whole in the corner. ModIcon.png (128 x 128, 29,693 bytes) confirmed by Virginie in chat on 2026-10-10, readability at 32 px included.

Older dated sections moved to docs/runs/status-journal-2026-10-11.md.

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

## Fields and vocabulary notes dropped

The `workshop` field names the item since 2026-10-01 (0.1.0 prepublication, commit 880c9d2). The three categories `remaining` takes: `feature`, `defect`, `unverified`. The `session` field names the sidebar session group, not a conversation. Vocabulary for `licence`: `open`, `silent`, `alive`, `forbidden`, `original`.
