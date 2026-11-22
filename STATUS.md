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
workflow_stage: cleanUp[1.2.0]
licence:      silent
licence_port: MIT, limited to the port's own contributions (LICENSE at the root 2026-10-11; Mod/LICENSE added, with the About.xml comment fix)
licence_at:   original files and Workshop checked 2026-09-12; no terms found; original mod last updated 2021-07-23 (1.3); original mod has no git repository of its own (checked 2026-09-27, GitHub search for the author turns up nothing)
upstream_mod_remotes: N/A (checked 2026-10-01: no repository of the author on GitHub; emipa606/ModRequests only mirrors the original About.xml, it is not a source repository)
dependencies: none
workshop_required_items: n/a, no modDependencies in About.xml (checked 2026-11-12)
showcase:     complete
tested_on:    RimWorld 1.6.4871 (Pickle runs 2026-10-10 to 2026-10-13, Linux WSL) and RimWorld 1.7 unstable English (2026-10-13)
tested_1_7:   yes
dry_run: 1.2.0 on ba2ba1b768e6b5c3132c428a38a968f0978c700e, run 44218448468 (2026-11-18, green); earlier runs in Docs/runs/pickle.md
publish: 1.2.0 uploaded 2026-11-18 on ba2ba1b, run 44219582145 (approved by Virginie, publish and tag-and-release green, tag v1.2.0 and release by the CI, no preview, no description, tags Mod, 1.6, 1.7 unchanged; Steam page not yet re-read). Subscribe test OK 2026-11-18 (PiI), Mod/ identical to ba2ba1b. Item 3811289805, visibility 0, public since 2026-10-13. Detail: Docs/runs/pickle.md
code_review_sha: 9fcd3e0d2221e3e04899b2574c9adf3f88dd2b8a
publication_changelog_review_sha: e2d618ebe2c62c01af360a10ffb1c1ec2f706b11
social_preview_sha256: 0f58b74e4b90a64723fe1c308a8082393904c61a537a3cdd4728a20f24cc0dad
echo_review_sha: 56b77a9cec7e17aa18b99481c36f63fd35e0de00  # 2026-11-22 echo kept, oui de Virginie
gallery_validated_sha: 8812b1ae2d4f7df9063ce68938008d258714f68e  # 2026-11-22 oui de Virginie
preview_source_decision: keep, 2026-11-22
thanks_drafted_line: none
workshop:      3811289805 (0.1.0 prepublication by the owner on 2026-10-01 created the item and its PublishedFileId.txt; an act, not a stage)
remaining:
  - 14.c AGENTS migration done 2026-11-22: PROTOCOLS-READ.md and the status journals deleted, history.md renamed pickle.md (earlier run lines merged), posted-comments-* and steam-change-notes-sent.md kept because WORKSHOP_COMMENTS.md and PUBLICATION.md cite them; next: 14.e dormant. Mod/About/Preview.png (a04d151) and Mod/ATTRIBUTION.md (4a6e103) are newer than the published ba2ba1b, so the next publish needs a new dry-run and --preview
  - cleanUp[1.2.0] 2026-11-18: 14.c done (STATUS.md, PUBLICATION.md, journal Docs/runs/pickle.md; TESTING.md already current only); 14.d nothing (main only); WSL 2026-11-18 (Virginie go, Use-Wsl.ps1 under the machine lock, list only): nothing removed, Alpha Biomes 1841354677 and More Vanilla Biomes 1931453053 not in ~/workshop-cache; Nocturnal Animals 2269731409 and A Dog Said 3238353862 kept (named by other mods wsl-deps); 14.e done
  - 14.a non-regression 1.2.0 green on ba2ba1b (minimal 4/4, optionals 7/7, incompat 1/1, English 1/1, French 1/1, commerce 1 passed plus known [no-stock] skip); evidence Tests/Pickle/Evidence/noreg-*, details Docs/runs/pickle.md
  - Preview 2026-11-18 (Virginie generated a new Art/Preview-source.png from Docs/PROMPT_ASlothModRenew.md; image model: DALL-E, stated by Virginie 2026-11-18; the AI-generated line of PUBLICATION.md and About.xml already names DALL-E (OpenAI) from in-game screenshots, no text change): Measure-Palette 95.14% vivid, family 0 (hue 0-30) 76.2%, so the old 0.272 waiver lapses; floor mean #643215 (crop 55% x 75%), veil #744323 to #663B24 (OKLCH L 0.40, C 0.8 x floor, same hue), inks unchanged: ink on floor 8.9:1, secondary 7.0:1, accent 9.2:1; panelBare kept (floor >= 5:1); ModIcon under the text panel: bottom-left, now the renderer default with panelBare (no icon.corner written; one written then removed, render byte-identical); render checked, echo and title clear
  - todo: the next version that changes tags needs the CI/CD session to move the publish template to semantic-release-steam 2.2.0 (applyWorkshopTags, STEAM_REFRESH_TOKEN in steam-production): the 2.1.3 template ignores update_tags
  - unverified: tested_1_7 yes is English only (1.7 ships no French pack, AUDIT.md "Langues"); <li>1.7</li> in supportedVersions since 892e498
  - owner rules 2026-10-25: outfits and expressions are suggestions, default expression is smiling; colonists other than NSB's need a special authorization; special requests go to NPT first, owner arbitrates if NPT refuses
ecosystem_line: 1.2
session:      local_73adad52-26b7-43b9-aad0-9a27801f4e1f
updated:      2026-11-22, stage cleanUp[1.2.0] (replay-audit writeReleaseDocs.., owner typed, 14.c open)
protocols_read_sha: 659329ea9fe0d90c31a8fed2f607a7c6ed58756a
---

# A Sloth Mod Renew — status

State: cleanUp[1.2.0], 1.2.0, 1.1.1, 1.1.0 and 1.0.0 published and public. The older dated sections (re-audit of 2026-10-10, translation audits, replay of states 1 to 7) are in git history (the journals were deleted at the 14.c migration of 2026-11-22).md`.

Ecosystem: none found, scans 2026-11-12 and 2026-11-13 (candidate mode for this mod alone, pattern nelim.aslothmod, A Sloth Mod Renew and the original id ThatRubishGamer.RubishMods.SlothMod, 5285 of 5289 folders read, 7 hits: the original 2253087891, our own Workshop copy 3811289805 and our local mount; no patch, retexture, link, translation or fork of ours or of the original). Table not written to docs/inventory/ecosystem.tsv (shared, Audit refreshes it). Same-thing pass (AUDIT 1.a, 2026-11-13, same-pattern on defName Sloth and label sloth, 5302 of 5306 folders read, 8 hits): one mod shares the Defs, the original A Sloth Mod 2253087891 (fork-or-rewrite = the original itself); no other mod with a Sloth def or label, no fork, no replacement, no same-theme mod.
ECOSYSTEM answered by PiI 2026-11-13 (docs/inventory/ecosystem-steam/ASlothModRenew.md, Steam search by Chrome plus our two corpus scans): no duplicate, no fork; Steam "Sloth" returns only the original 2253087891 (dead, 1.5 and before) and our copy; nothing subscribed, nothing to unsubscribe. The WebFetch read below is extra, from the same date and not in the PiI file: it also lists same-subject mods that are not duplicates. Steam pass (AUDIT 1.a rewritten, 2026-11-13; Chrome failed three times, tab reset to New Tab, so read by WebFetch of the public pages, searches "sloth", "A Sloth Mod", "megasloth", 4 item pages; registry mods-registre.tsv read first, local corpus passes above). Verdict: no duplicate, fork or replacement of the sloth animal. Same subject, different thing, none hangs on our Defs: Verbosemoth's Slothkins (Continued) 3137378088 (Zaljerem, humanoid sloth race, needs Humanoid Alien Races, 1.4 to 1.6, updated 2025-08-07, Steam); Megatherium 1.1+ 2132074958 (Holgast, renames the vanilla megasloth, 1.1 to 1.6, updated 2025-06-24, Steam); Freehand Animals Retexture 3791927678 (Cat No.10, retextures donkey, muffalo and vanilla megasloth, 1.6, Steam); The Return of the Megatherium 904663723 (Mehni, 0.18, dead). Slothborne - Nocturne and its patches (FlyingSloth) are unrelated (name only). No subscription made: nothing retained to study (no patch, retexture, fork or replacement of ours). The Steam banner "removed from the community" on fetched pages is bot protection, ignored.
ECOSYSTEM delta 2026-11-22 (PiI, report section "Delta 2026-11-22"): nothing new since 2026-11-16; parent A Sloth Mod 2253087891 and our Renew only; no fork, patch, retexture or translation; ecosystem-links block unchanged (parent only); no subscription.
ECOSYSTEM refreshed 2026-11-16 (PiI): nothing changed, no new search; ecosystem-links block added to the report (one row: parent 2253087891 A Sloth Mod, 1.2 1.3). No translation, retexture, patch or link: nothing to integrate or judge.

## Dependencies and optional integrations

Recorded 2026-11-12 at revision 353e8c7 (AUDIT 4.g). Required: none (`modDependencies` empty, no DLC needed; `loadAfter` names the DLC ids only for ordering). Incompatible: ThatRubishGamer.RubishMods.SlothMod (the original). Optional, declared in `Mod/About/OptionalCompat.xml`: sarg.alphabiomes (Workshop 1841354677, patch), zylle.MoreVanillaBiomes (Workshop 1931453053, patch). Optional by ordering, not in that file by design: Mlie.XNDNocturnalAnimals (`loadAfter`, Compat_NocturnalAnimals.xml), SamBucher.ADogSaidAnimalProsthetics2 (`loadBefore`, Compat_ADogSaidAnimalProsthetics2.xml). Dogs mate and Better Crossbreeding: nothing to patch (read 2026-10-10, see the replay paragraph below). `Check-OptionalCompat.ps1`: OK, 2 patched targets, 2 declared.

## NSB


Sync of 2026-11-16 (sync-nsb-npt, rules of the owner 2026-11-05 unchanged): NSB docs: no commit since 2026-11-14, nothing changed for Nelim, the flower-garden or the animals. NPT since 2026-11-14: e647e9f (StageDecor filth step), c6deb77 (StageDecor blueprint FinishFrame, hover), b6dec3e (ColonistRace Beauty2 mouth vertical offset), plus catalogues of other mods (Yukiyuki creatures, style packs); none serves these scenes. Protocols read 2026-11-16 (GALLERY.md): captures kept go to Art/Gallery-clean under their FINAL name (no `candidate` prefix, owner 2026-11-15), no reindex pass after acceptance; varied orientations when one subject appears several times (2026-11-15). The four `N-candidate-*` files are renamed to final names when Virginie accepts. Nothing updated in the scenes. Sloth shown in all four shots (rule 5). Steps read on 2026-11-16.

Sync of 2026-11-17 (sync-nsb-npt, NPT part only: mod at code[1.2.0], no gallery work; rules of the owner 2026-11-05 unchanged: NSB free, colonist or domestic animal outside NSB and colonist properties need her words, outfits free, every included animal shown). NPT since 2026-11-16: two catalogue commits on `face-parts.md` (vanilla face photographed without Facial Animation, no vanilla mouth), no step added, renamed or removed. NSB docs since 2026-11-16: VALIDE (Miel, Quo, Quaren), Iori and BiB test notes, Pawn.gender note; nothing for Nelim, the flower-garden or animals. Nothing updated in the scenes. Sloth shown in all four shots (rule 5). Steps read on 2026-11-17.

Sync of 2026-11-18 (sync-nsb-npt, NPT part only: mod at writeReleaseDocs[1.2.0], no gallery work; rules of the owner 2026-11-05 unchanged). NPT since 2026-11-17: ColonistRace steps added or extended in `docs/steps.md` (head type assertion, ScreenTextSteps, attack and haul orders, game component field and float menu option, def metadata log); no catalogue entry, nothing renamed or removed, none serves these scenes. NSB docs since 2026-11-17 (log only, not opened): Iori, BiB gene renames, VALIDE rows; nothing for Nelim or the animals. Nothing updated in the scenes. Sloth shown in all four shots (rule 5).

Sync of 2026-11-22 (sync-nsb-npt, NPT part only: mod at ecosystem[1.2.0], no shotlist or gallery work; rules of the owner 2026-11-05 unchanged). NPT since 2026-11-18: step commits only (ColonistRace 'X faces Y' renamed 'X turns toward Y', ScreenshotStudio animal made wild and designated for taming, StageDecor things on the area, ClickDiagnostics open windows logged), plus Cat capture batches; no catalogue entry of ours. The gallery feature files call none of the renamed or new steps (grep of Tests/Pickle/Mod/Pickle/Features). NSB docs since 2026-11-18: no commit. Nothing updated in the scenes. Sloth shown in all four shots (rule 5).

Places read: 2026-11-13 (flower-garden row unchanged). Tribe read: 2026-11-17 (git log of NSB docs since 2026-11-16: VALIDE rows of Miel, Quo and Quaren, Iori and BiB test notes, Pawn.gender note; nothing for Nelim or the animals, profiles not reopened). Steps read: 2026-11-22 (NPT steps.md and catalogues log since 2026-11-18: step commits only, none used by this mod).

| Gallery image | File | Hour | Framing (root size) | Subtitle |
|---|---|---|---|---|
| 0 | `0-preview.png` | n/a | copy of `Mod/About/Preview.png` | none |
| 1 | `1-meeting.jpg` | 15h | opening, 1.15 | Nelim crosses the flower garden and notices the sloth. |
| 2 | `2-hay.jpg` | 15h13 | close, 1.0 | A pile of hay, left within reach. |
| 3 | `3-follows.jpg` | 17h | medium, 1.1 | It follows the one who brought the hay. |
| 4 | `4-closing.jpg` | 18h | closing, 1.15 | A mother, her baby, and no hurry. |

Gallery table recorded 2026-11-22 (9.e), aligned with PUBLICATION.md "Screenshots" and `Tests/Pickle/Mod/Pickle/Features/05-gallery.feature`; originals without subtitle in `Art/Gallery-clean/`.

| Place | Shots | Changes made for the gallery | Last read |
|---|---|---|---|
| `flower-garden` (154, 110), radius 10.5 (NSB commit 8795927, 2026-11-06 22:12; the mod wrote (154, 105); scenes use explicit cells x 152-156, z 105-107, inside the garden) | 1, 2, 3, 4 | hour 15, 15, 17, 18, Clear, 20 degrees; daylily (156, 106) in 1; torch lamp near (156, 106) lit in 4; bed corner hidden (hide-buildings, radius 2 at (158, 102)) in 1 and 4 | 2026-11-07 |

| Colonist | Shots | Outfit per shot | Last read | Exceptions |
|---|---|---|---|---|
| Nelim (NSB) | 1, 2, 3, 4 | one outfit all afternoon (feature 05-gallery, 2026-11-09): `LTS_Tunika` emerald (31, 122, 92) and `LTS_Skirt` brown (90, 64, 44), the vanilla `Apparel_Pants` not showing on this stack (NPT ticket dd05), `Roo_HD_Hair_Highpony`, `Body_Heart`; mouth `MouthSmile` in 1 and 2, `MouthLipsSmallSmile` in 3 and 4 (smile by default, owner rule) | 2026-11-06 (NELIM-PROFIL.md, NSB-ROSTER.md hair rows) | played as canon from 2026-11-05 (owner: "Play canon"): Roo_HD_Hair_Highpony, colour from her genes; none pending |

| Animal | Shots | Outfit | Last read | Exceptions |
|---|---|---|---|---|
| Mossy, Pip (the mod's own sloths, created by the scenario) | 1 to 4 | none | not in CATALOGUE-ANIMAUX.md (read 2026-11-06) | outside NSB, named by the gallery: they are the creature of the mod under test, not a pet or livestock of the save; flagged to the owner with the hair question |

| Included animal (rule 5) | Shots |
|---|---|
| Sloth (Mossy, Pip) | 1, 2, 3, 4 |


## Settings audit

Redone 2026-11-22 at settings[1.2.0], revision f9b0ae6 (MOD_SETTINGS.md sections 1, 2 and 5). Files read: Mod/Defs/ThingDefs_Animals.xml (the Sloth ThingDef and PawnKindDef), Mod/Patches/Biomes_Vanilla.xml, Biomes_Mods.xml, Compat_ADogSaidAnimalProsthetics2.xml, Compat_NocturnalAnimals.xml, Mod/About/About.xml, Mod/About/OptionalCompat.xml. Counts now: 0 .cs or .dll files under Mod/ (git ls-files), 2 defs, 0 files naming ModSettings, MainButtonDef or SettingsCategory.

Inventory: this is a fixed-content animal. Movement, hunger, taming, breeding, combat, trade tags and biome weights are authored balance values, not a promised player configuration. The two optional biome patches and the two compat patches switch on when their mods are present and add no control, no persistence and no input. No concrete player need justifies exposing these constants as options. No inherited custom settings exist in the original either.

Decision: no settings. Neither an empty page nor a MainButtons shortcut exists, checked in the sources above. `Check-SettingsContract.ps1` run 2026-11-22: PASS, no code, no settings API, no MainButtonDef (MOD_SETTINGS.md section 1). `settings_audit: not_applicable` stands on that inventory. Input bounds, reset, defaults and migration, change timing, save and reload, and shortcut sharing tests are not applicable (5.c to 5.f). Nothing unverified.

## Translation audit

French lives in `Mod/Languages/French/DefInjected` (five texts: `Sloth.label` twice, `Sloth.description`, both claw labels), listed in `FRENCH_REVIEW.md`. English is the native text of the Defs, so no English DefInjected exists. No text agrees with a pawn, so no gender switch is needed. `Check-DefInjected.ps1` checks the five keys without error; Virginie reviewed the French on 2026-10-01 and recorded it in `FRENCH_REVIEW.md` on 2026-10-13 (`translation_fr` complete). Older audit text: `Docs/runs/status-journal-2026-10-13.md`.

Review 2026-11-13 (6.g): ChatGPT review (12 answers on the one page of TRANSLATION_REVIEW.md, revision f3658fb, texts of revision c38fa61 for the last) read, remarks applied or refused as listed in `remaining`. Virginie validated the French on 2026-11-13 in chat (four keys unchanged: paresseux, the description, both claws) and decided every proper name (Docs/review-names.md; titles recorded by Audit; the Steam title and About name stay English). Reviewer Virginie, date 2026-11-13, revision c38fa61, corrections requested: none on the French; names decided as in Docs/review-names.md. Keep a Changelog: question open with Audit (keep as is proposed).

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
