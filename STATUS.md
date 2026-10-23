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
workflow_stage: shootGallery[1.1.1]
licence:      silent
licence_port: MIT, limited to the port's own contributions (LICENSE at the root 2026-10-11; Mod/LICENSE added, with the About.xml comment fix)
licence_at:   original files and Workshop checked 2026-09-12; no terms found; original mod last updated 2021-07-23 (1.3); original mod has no git repository of its own (checked 2026-09-27, GitHub search for the author turns up nothing)
upstream_mod_remotes: N/A (checked 2026-10-01: no repository of the author on GitHub; emipa606/ModRequests only mirrors the original About.xml, it is not a source repository)
dependencies: none
showcase:     complete
tested_on:    RimWorld 1.6.4871 (Pickle runs 2026-10-10 to 2026-10-13, Linux WSL) and RimWorld 1.7 unstable English (2026-10-13)
tested_1_7:   yes
dry_run: 1.1.0 on 414de05ec9c97501aeb26c2c184dcac0a5391e48, run 38414526235 (2026-10-13, green). Earlier: 1.0.0 on 5ac3a96, run 38400219841
publish: 1.1.0 uploaded 2026-10-13, run 38422420800 (tag v1.1.0 and release by the CI on 414de05); the 1.7 Steam tag was set by the owner with Release-Admin scripts/steam-apply-tags.mjs, the Steam API reports Mod, 1.6, 1.7. 1.0.0 uploaded 2026-10-13, run 38409430019 (tag v1.0.0 on 5ac3a96), public since 2026-10-13. Item 3811289805, visibility 0
code_review_sha: bc13c11d8059e8ffb3bad07e44c1feac7c8953da
publication_changelog_review_sha: a49a3f068397eccca9b5b6fa1c85abc6ec92f9c4
social_preview_sha256: c270d74fa978e876e9e89b9a8956ff80cf4c6184428546d33143d9293c2ea01f
echo_review_sha: 6e077cb6b7865ac2df6e0628bd04177711a79102
workshop:      3811289805 (0.1.0 prepublication by the owner on 2026-10-01 created the item and its PublishedFileId.txt; an act, not a stage)
remaining:
  - unverified: tested_1_7 yes is English only (1.7 ships no French pack, AUDIT.md "Langues"); <li>1.7</li> in supportedVersions since 892e498
  - unverified: non-regression on the published build (AUDIT 14.a) not played and the commerce scenario [no-stock] never replayed green (flaky, the colony sloth is tradeable): owner decision 2026-10-13 to go dormant without them
  - unverified: Preview contrast (AUDIT 10.d) not re-measured on the 1.1.0 render; only the echo changed, the text colours did not
  - todo: the Steam header image (item preview) is still the old Preview (sha256 4aadb9ed); the new echo (Preview sha256 ce26a415) goes out with the next publish using --preview (owner decision 2026-10-13); gallery image 0 on Steam already carries it
  - todo: the next version that changes tags needs the CI/CD session to move the publish template to semantic-release-steam 2.2.0 (applyWorkshopTags, STEAM_REFRESH_TOKEN in steam-production): the 2.1.3 template ignores update_tags
  - feature: gallery picture 3 (trader stock) not taken; the shot series is being redone (see the shotlist line)
  - ticket: 20261023-192430-474-4f76 (05-gallery, 0d80e84, hours 17 and 18 for scenes 2 and 3) queued 2026-10-23 19:24; TM wakes the session by RUN_DONE. Result goes to Tests/Pickle/Inbox/galerie-hours. Run 9f78 (7adc27e): 1 green (accepted look: blue shirt, hay in hands, sloth facing camera), 2 failed glow 0.49 at 18h (floor 0.6), 3 failed glow 0.14 at 19h (floor 0.4); report deleted
  - note: 2.e, Art/Preview-source.png measures a mean value of 0.272 (Measure-Palette.sh), under the 0.30 floor; Virginie decided to keep it on 2026-10-11, the criterion is waived for this source
  - shotlist 2026-10-20 (criteria a to k of GALLERY.md met in the feature header): 1 meeting 14h zoom 2.4, deep blue shirt, 12 hay in hands, daylily; 2 hay 18h zoom 2, beige shirt and green trousers, 4 hay, a hay pile in front of the sloth (glow asserted 0.6); 3 young one 19h zoom 2.5 centred (154, 106) to drop the bed corner, emerald shirt and brown jacket, 2 hay, lit torch lamp, mother facing camera and baby facing West (glow asserted 0.4). Nelim canon: Ponytails, near-black hair, Body_Heart. Estimates 4, 4, 4. Risks: baby only 20 percent smaller, light possibly flat or dark. Old line: shotlist 2026-10-18 (estimate before play, risk): 1 meeting 4 (garden edge in frame); 2 hay 4 (hay not visible, handover look); 3 family 4 (juvenile looks adult). Frames now `I frame the cell (x, z) at zoom N` (2.4, 2, 2.5), not "filling percent". Ticket 3219 failed 3/3 on the old frames (evidence deleted 2026-10-19); the zoom-frame run galerie-5fab5d8 is green 3/3. Real verdicts 2026-10-19 (estimate then verdict): 1 meeting 4 then accepted candidate; 2 hay 4 then refused (hay unreadable, light not golden, same frame as 1); 3 family 4 then refused (bed corner in frame, young same size as adults, so the estimates were too high). Next: recompose 2 and 3, re-score each at 4 or more, new ticket. Earlier note: CameraZoomSteps.FrameCells asserts exact root size; CameraDriver clamps RootSize at a floor of 2 on this save, and all three "filling 60 percent" cells compute a target below that (1.875/0.9375/1.667). Per GALLERY.md not fixed in the mod (no percent/rect edit); relayed to NPT (PickleTools) via Ticket Manager, 2026-10-16, NPT not live. Redeposit only after NPT answers. 2026-10-17: TM registered aSM (code aSM, session local_12d0dac6), NPT still unreachable (holiday), TM cannot wake on its answer; TM does not block a redeposit but GALLERY.md says wait for NPT. Owner decision 2026-10-17: wait for NPT (no replan). Session title carries (NPT) next to the pastille. 2026-10-18 (Audit rule via TM): gallery scenarios polished against the NPT catalogues (trousers dressed explicitly, hour and litter wording in the comments fixed); weapon and tattoo of Nelim not controlled (no unequip step known), image 2 still reads as a handover; 9a gameplay steps and 9b GALLERY-PROPS: the mod adds no prop, apparel or hairstyle, nothing to register.
session:      local_12d0dac6-1de2-4cb2-8698-e6cfe53c1fdc
updated:      2026-10-18, gallery reopened by the owner (stage shootGallery[1.1.1]); frames widened above the camera floor of 2 (5, 5 and 4 cells at 60 percent), ticket to be filed. Before: 2026-10-16, gallery run 3219 failed on a shared-tool camera floor, relayed to NPT via Ticket Manager, not redeposited yet. Before: 2026-10-15, dormant confirmed by an AUDIT replay (section "Audit 2026-10-15"). Before: 2026-10-13, dormant. AUDIT replay 1 to 13 and the followUp cleanup (14.c) done: STATUS, PUBLICATION and TESTING reduced to current state, older text in docs/runs/, evidence pruned (minimal-4 and avec-facultatifs-6 deleted; the English 1.6 run kept in Evidence/ (its RELEASE.md says when it goes) as the only 1.6 English proof), WSL cache: the original A Sloth Mod (2253087891) removed, Nocturnal Animals (2269731409) and ADS 2 (3238353862) kept because other mods name them. 1.1.0 and 1.0.0 published and public, comments and Use This Instead posted, translation_fr complete
protocols_read_sha: 86a8eb5aaf483fd95321f7c516d432ad44bd3fe7
---

# A Sloth Mod Renew — status

State: followUp cleanup done, 1.1.0 and 1.0.0 published and public. The older dated sections (re-audit of 2026-10-10, translation audits, replay of states 1 to 7) are in `docs/runs/status-journal-2026-10-11.md` and `docs/runs/status-journal-2026-10-13.md`.

## Audit 2026-10-15

Audited revision bc2ec56, working tree clean, 0 commits ahead or behind origin. `workflow_stage: dormant` kept. Rechecked: `Check-Status.ps1` 0 error 0 warning; `Tests/Test-Mod.ps1` PASS 147 checks (replayed today); `Check-DefInjected.ps1 -TransMod` 5 keys, 0 errors; About.xml description identical to PUBLICATION.md (`sync-about-description.mjs`); ModIcon 128x128 29.7 KB; Preview 896x504, byte copy as gallery 0, sha256 equals `social_preview_sha256`; gallery 0-2 contiguous; tags v1.0.0 and v1.1.0; the `code_review_sha` diff to HEAD under `Mod/` is `Preview.png` only (8.m exception, no reopening). Protocols changed since the last read: GALLERY.md only (series protagonist, front-facing animals, per-image hour); it binds future galleries, the accepted gallery 1 and 2 stand. Not verified (no game launched): non-regression 14.a, contrast 10.d on the 1.1.0 render, French on 1.7; all already in `remaining`.

Second pass 2026-10-15 on revision a07a1c3 (working tree clean, 0 ahead or behind): `Test-Mod.ps1` PASS 147 checks replayed; `Check-Status.ps1` (pwsh; Windows PowerShell 5 lacks `Get-FileHash` here) 0 error 0 warning; `git diff bc13c11..HEAD -- Mod Source` is `Preview.png` only, review not reopened. Protocols changed since the last read: AGENTS.md and README.md (session markers, no effect on this mod); `Mark-ProtocolsRead.ps1` rerun, `protocols_read_sha` 365bc5e7. No game launched. `workflow_stage: dormant` confirmed.

## Gallery and description ending (AUDIT 9.e, 11.b), 2026-10-13

| Index | File | Shows | Accepted | On the Steam page |
|---|---|---|---|---|
| 0 | `0-preview.png` | the Preview, byte copy of `Mod/About/Preview.png` (sha256 ce26a415) | Virginie, 2026-10-13 | uploaded by hand 2026-10-13 (sha256 ce26a415 checked on Steam) |
| 1 | `1-portrait.png` | one sloth in a flower garden, 25 percent of the frame (the weak one) | Virginie, 2026-10-13 | uploaded by hand, confirmed by Virginie 2026-10-13 |
| 2 | `2-family.png` | three sloths | Virginie, 2026-10-13 | uploaded by hand, confirmed by Virginie 2026-10-13 |

Description ending checked on About.xml and PUBLICATION.md: `Source code on GitHub (https://github.com/vbardales/Rimworld-A-Sloth-Mod-Renew)` is the last line, after THANKS and the ATTRIBUTION line; the link is the exact repository of the mod (`<url>` of About.xml too). THANKS names ThatRubishGamer, Mlie and XeoNovaDan, Zylleon, Sarg, SamBucher and the authors of Pickle (development only).

Full replay of states 1 to 7 on 2026-10-10, against the current protocols (AUDIT.md 16): 1 setupRepo, remote and repository, README title and status mention, ATTRIBUTION identical in Mod/: OK except LICENSE (defect above). 2 makeSources, sources and Art/ minimal set present, no PROMPT file, ModIcon derived, palette of Preview-source: defect above. 3 code, no C#, CHANGELOG [1.0.0] unreleased: OK. 4 declareDependencies, modDependencies empty, incompatibleWith original, loadAfter/loadBefore declared, patches guarded; four animal integrations: ADS 2 (patched, loadBefore), Nocturnal Animals (patched), Better Crossbreeding (nothing to patch: opt-in field, empty by default), **Dogs mate (Mlie.DogsMate, 2441132298) not applicable**: its 1.6 groups (Canidae, Felidae, Mammalia, Rodentia files) hold no sloth group, the Armadillo group names sloths only in its description with an empty pawnKinds, and the sloth is a lone species with no crossbreeding partner here; read on 2026-10-10 from the Workshop copy. 5 auditSettings, no settings, no MainButtons, no C# found in Mod/ (settings_audit not_applicable stands). 6 localize, Check-DefInjected 5 keys, 0 errors; FRENCH_REVIEW.md regenerated (above). 7 writeTests, Test-Mod.ps1 147 checks green, scenarios in TESTING.md, Pickle suite written, translations complete.

## Translation audit

French lives in `Mod/Languages/French/DefInjected` (five texts: `Sloth.label` twice, `Sloth.description`, both claw labels), listed in `FRENCH_REVIEW.md`. English is the native text of the Defs, so no English DefInjected exists. No text agrees with a pawn, so no gender switch is needed. `Check-DefInjected.ps1` checks the five keys without error; Virginie reviewed the French on 2026-10-01 and recorded it in `FRENCH_REVIEW.md` on 2026-10-13 (`translation_fr` complete). Older audit text: `docs/runs/status-journal-2026-10-13.md`.

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
