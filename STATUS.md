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
workflow_stage: startWatch[1.2.0]
licence:      silent
licence_port: MIT, limited to the port's own contributions (LICENSE at the root 2026-10-11; Mod/LICENSE added, with the About.xml comment fix)
licence_at:   original files and Workshop checked 2026-09-12; no terms found; original mod last updated 2021-07-23 (1.3); original mod has no git repository of its own (checked 2026-09-27, GitHub search for the author turns up nothing)
upstream_mod_remotes: N/A (checked 2026-10-01: no repository of the author on GitHub; emipa606/ModRequests only mirrors the original About.xml, it is not a source repository)
dependencies: none
workshop_required_items: n/a, no modDependencies in About.xml (checked 2026-11-12)
showcase:     complete
tested_on:    RimWorld 1.6.4871 (Pickle runs 2026-10-10 to 2026-10-13, Linux WSL) and RimWorld 1.7 unstable English (2026-10-13)
tested_1_7:   yes
dry_run: 1.2.0 on ba2ba1b768e6b5c3132c428a38a968f0978c700e, run 44218448468 (2026-11-18, green, no options: nothing but Mod/ and the change note; note read in the log: [b]1.2.0[/b], [list] of two items, CHANGELOG link; tags Mod, 1.6, 1.7 equal to the page; 18 files 0.74 MB; template d20db370c66b). Earlier: 1.1.1 on ee46d1ac847c1c02ff642707991e6b5a1ffc81a8, run 43959368322 (2026-11-16, green, update_preview and update_description on, read: change note with [list] and CHANGELOG link, preview fb59bebb to send against 4aadb9ed on the page, description 5380 characters with the DALL-E sentence). Earlier: 1.1.0 on 414de05, run 38414526235; 1.0.0 on 5ac3a96, run 38400219841
publish: 1.2.0 uploaded 2026-11-18 on ba2ba1b, run 44219582145 (approved by Virginie, publish and tag-and-release green, tag v1.2.0 and release by the CI, no preview, no description; tags Mod, 1.6, 1.7 unchanged; Steam page not yet re-read). Subscribe test OK 2026-11-18 (PiI): re-subscribed to force refresh, About.xml 2026-11-18 03:03, diff against git archive ba2ba1b (v1.2.0) Mod empty, 18 files both sides. First attempt FAILED, run 44218730069 on ba2ba1b: steam-publish.mjs "STEAM_REFRESH_TOKEN is required" (secret empty in steam-production), failed before any upload, no tag, no release, page untouched; waits for the secret (owner copies it, Release-Admin scripts/steam-refresh-token.mjs and set-steam-secrets.sh), then rerun the failed jobs or dispatch again on ba2ba1b. Earlier: 1.1.1 uploaded 2026-11-16 on ee46d1a with --preview --description, run 43959600883 (approved by Virginie, publish and tag-and-release green, tag v1.1.1 and release by the CI); item 3811289805 unchanged, PublishedFileId.txt already committed; subscribe test OK 2026-11-16 (PiI): re-downloaded item 3811289805, About.xml and Preview.png byte-identical to Mod/, 18 files identical, no version tag in About.xml so identity by cmp. startWatch done 2026-11-16 (Virginie: GitHub watch, Steam comment notifications, collection 3815982565). Gallery 0 to 4 (Art/Gallery) uploaded by Virginie 2026-11-16 ("fait"), old 1-portrait and 2-family replaced. Earlier: 1.1.0 uploaded 2026-10-13, run 38422420800 (tag v1.1.0 and release by the CI on 414de05); the 1.7 Steam tag was set by the owner with Release-Admin scripts/steam-apply-tags.mjs, the Steam API reports Mod, 1.6, 1.7. 1.0.0 uploaded 2026-10-13, run 38409430019 (tag v1.0.0 on 5ac3a96), public since 2026-10-13. Item 3811289805, visibility 0
code_review_sha: 9fcd3e0d2221e3e04899b2574c9adf3f88dd2b8a
publication_changelog_review_sha: e2d618ebe2c62c01af360a10ffb1c1ec2f706b11
social_preview_sha256: fb59bebbe3d2f6ca884b53f7fd33019c5a1da248947bacf3e539df8509d0ab2c
echo_review_sha: 6e9b76c2180aa93af46016856f3a6657897b1edb
thanks_drafted_line: none
workshop:      3811289805 (0.1.0 prepublication by the owner on 2026-10-01 created the item and its PublishedFileId.txt; an act, not a stage)
remaining:
$N30
  - cleanUp 2026-11-17 done: STATUS.md trimmed (journal Docs/runs/status-journal-2026-11-17.md), posted thank-you texts in Docs/runs/posted-comments-2026-11-16.md, gallery evidence deleted, noreg-* kept in Evidence with RELEASE.md, 14.d nothing (main only), WSL (Virginie go, Use-Wsl.ps1 under the machine lock, exit 0): removed 2253087891 (A Sloth Mod original) from ~/workshop-cache; kept every other id of this mod's maps (named by another mod's wsl-deps); Alpha Biomes 1841354677 and More Vanilla Biomes 1931453053 were not in the cache. Nothing to unsubscribe (nothing subscribed, ecosystem note).
  - 14.a non-regression on 1.1.1 done 2026-11-17 (b842f68): minimal, optionals, incompat, English, French green; commerce 1 passed, 1 `[no-stock]` (known, @flaky-stock, read as skip). Verdict green. Details Docs/runs/history.md.
  - 11.i 1.2.0 change note written in PUBLICATION.md 2026-11-18; 11.h none; closing pass step 6 done 2026-11-18 (/review-translation page 1 of 1: no proper name to decide, no correction on the 4 French keys, PUBLICATION.md and CHANGELOG.md untouched, 0 applied, round recorded, page clean; Check-Translations PASS, TRANSLATION_REVIEW.md unchanged); 11.j done 2026-11-18 (Virginie: "je valide", 1.2 line, publication_changelog_review_sha e2d618e); 12.a code_review_sha 9fcd3e0 current (no Mod/Source commit since); 12.b dependencies unchanged since 353e8c7 (About.xml diff is description text only); 12.c lint -Strict 0 error 0 warn; 12.c bis docs minified at 1.1.1 (ee46d1a) and unchanged since, nothing to redo
  - todo: the next version that changes tags needs the CI/CD session to move the publish template to semantic-release-steam 2.2.0 (applyWorkshopTags, STEAM_REFRESH_TOKEN in steam-production): the 2.1.3 template ignores update_tags
  - unverified: tested_1_7 yes is English only (1.7 ships no French pack, AUDIT.md "Langues"); <li>1.7</li> in supportedVersions since 892e498
  - note: 2.e, Art/Preview-source.png measures a mean value of 0.272 (Measure-Palette.sh), under the 0.30 floor; Virginie decided to keep it on 2026-10-11, the criterion is waived for this source
  - owner rules 2026-10-25: outfits and expressions are suggestions, default expression is smiling; colonists other than NSB's need a special authorization; special requests go to NPT first, owner arbitrates if NPT refuses
session:      local_73adad52-26b7-43b9-aad0-9a27801f4e1f
updated:      2026-11-18, stage startWatch[1.2.0] (1.2.0 uploaded, tag v1.2.0, subscribe test asked of PiI)
protocols_read_sha: ba5bc2537242b9d2c7d46e7dd6db6046f7c1387b
---

# A Sloth Mod Renew — status

State: followUp cleanup done, 1.1.0 and 1.0.0 published and public. The older dated sections (re-audit of 2026-10-10, translation audits, replay of states 1 to 7) are in `Docs/runs/status-journal-2026-10-11.md` and `Docs/runs/status-journal-2026-10-13.md`.

Ecosystem: none found, scans 2026-11-12 and 2026-11-13 (candidate mode for this mod alone, pattern nelim.aslothmod, A Sloth Mod Renew and the original id ThatRubishGamer.RubishMods.SlothMod, 5285 of 5289 folders read, 7 hits: the original 2253087891, our own Workshop copy 3811289805 and our local mount; no patch, retexture, link, translation or fork of ours or of the original). Table not written to docs/inventory/ecosystem.tsv (shared, Audit refreshes it). Same-thing pass (AUDIT 1.a, 2026-11-13, same-pattern on defName Sloth and label sloth, 5302 of 5306 folders read, 8 hits): one mod shares the Defs, the original A Sloth Mod 2253087891 (fork-or-rewrite = the original itself); no other mod with a Sloth def or label, no fork, no replacement, no same-theme mod.
ECOSYSTEM answered by PiI 2026-11-13 (docs/inventory/ecosystem-steam/ASlothModRenew.md, Steam search by Chrome plus our two corpus scans): no duplicate, no fork; Steam "Sloth" returns only the original 2253087891 (dead, 1.5 and before) and our copy; nothing subscribed, nothing to unsubscribe. The WebFetch read below is extra, from the same date and not in the PiI file: it also lists same-subject mods that are not duplicates. Steam pass (AUDIT 1.a rewritten, 2026-11-13; Chrome failed three times, tab reset to New Tab, so read by WebFetch of the public pages, searches "sloth", "A Sloth Mod", "megasloth", 4 item pages; registry mods-registre.tsv read first, local corpus passes above). Verdict: no duplicate, fork or replacement of the sloth animal. Same subject, different thing, none hangs on our Defs: Verbosemoth's Slothkins (Continued) 3137378088 (Zaljerem, humanoid sloth race, needs Humanoid Alien Races, 1.4 to 1.6, updated 2025-08-07, Steam); Megatherium 1.1+ 2132074958 (Holgast, renames the vanilla megasloth, 1.1 to 1.6, updated 2025-06-24, Steam); Freehand Animals Retexture 3791927678 (Cat No.10, retextures donkey, muffalo and vanilla megasloth, 1.6, Steam); The Return of the Megatherium 904663723 (Mehni, 0.18, dead). Slothborne - Nocturne and its patches (FlyingSloth) are unrelated (name only). No subscription made: nothing retained to study (no patch, retexture, fork or replacement of ours). The Steam banner "removed from the community" on fetched pages is bot protection, ignored.
ECOSYSTEM refreshed 2026-11-16 (PiI): nothing changed, no new search; ecosystem-links block added to the report (one row: parent 2253087891 A Sloth Mod, 1.2 1.3). No translation, retexture, patch or link: nothing to integrate or judge.

## Dependencies and optional integrations

Recorded 2026-11-12 at revision 353e8c7 (AUDIT 4.g). Required: none (`modDependencies` empty, no DLC needed; `loadAfter` names the DLC ids only for ordering). Incompatible: ThatRubishGamer.RubishMods.SlothMod (the original). Optional, declared in `Mod/About/OptionalCompat.xml`: sarg.alphabiomes (Workshop 1841354677, patch), zylle.MoreVanillaBiomes (Workshop 1931453053, patch). Optional by ordering, not in that file by design: Mlie.XNDNocturnalAnimals (`loadAfter`, Compat_NocturnalAnimals.xml), SamBucher.ADogSaidAnimalProsthetics2 (`loadBefore`, Compat_ADogSaidAnimalProsthetics2.xml). Dogs mate and Better Crossbreeding: nothing to patch (read 2026-10-10, see the replay paragraph below). `Check-OptionalCompat.ps1`: OK, 2 patched targets, 2 declared.

## NSB


Sync of 2026-11-16 (sync-nsb-npt, rules of the owner 2026-11-05 unchanged): NSB docs: no commit since 2026-11-14, nothing changed for Nelim, the flower-garden or the animals. NPT since 2026-11-14: e647e9f (StageDecor filth step), c6deb77 (StageDecor blueprint FinishFrame, hover), b6dec3e (ColonistRace Beauty2 mouth vertical offset), plus catalogues of other mods (Yukiyuki creatures, style packs); none serves these scenes. Protocols read 2026-11-16 (GALLERY.md): captures kept go to Art/Gallery-clean under their FINAL name (no `candidate` prefix, owner 2026-11-15), no reindex pass after acceptance; varied orientations when one subject appears several times (2026-11-15). The four `N-candidate-*` files are renamed to final names when Virginie accepts. Nothing updated in the scenes. Sloth shown in all four shots (rule 5). Steps read on 2026-11-16.

Sync of 2026-11-17 (sync-nsb-npt, NPT part only: mod at code[1.2.0], no gallery work; rules of the owner 2026-11-05 unchanged: NSB free, colonist or domestic animal outside NSB and colonist properties need her words, outfits free, every included animal shown). NPT since 2026-11-16: two catalogue commits on `face-parts.md` (vanilla face photographed without Facial Animation, no vanilla mouth), no step added, renamed or removed. NSB docs since 2026-11-16: VALIDE (Miel, Quo, Quaren), Iori and BiB test notes, Pawn.gender note; nothing for Nelim, the flower-garden or animals. Nothing updated in the scenes. Sloth shown in all four shots (rule 5). Steps read on 2026-11-17.

Sync of 2026-11-18 (sync-nsb-npt, NPT part only: mod at writeReleaseDocs[1.2.0], no gallery work; rules of the owner 2026-11-05 unchanged). NPT since 2026-11-17: ColonistRace steps added or extended in `docs/steps.md` (head type assertion, ScreenTextSteps, attack and haul orders, game component field and float menu option, def metadata log); no catalogue entry, nothing renamed or removed, none serves these scenes. NSB docs since 2026-11-17 (log only, not opened): Iori, BiB gene renames, VALIDE rows; nothing for Nelim or the animals. Nothing updated in the scenes. Sloth shown in all four shots (rule 5).

Places read: 2026-11-13 (flower-garden row unchanged). Tribe read: 2026-11-17 (git log of NSB docs since 2026-11-16: VALIDE rows of Miel, Quo and Quaren, Iori and BiB test notes, Pawn.gender note; nothing for Nelim or the animals, profiles not reopened). Steps read: 2026-11-18 (NPT steps.md and catalogues log since 2026-11-17: five steps.md commits, no catalogue, none used by this mod).

| Place | Shots | Changes made for the gallery | Last read |
|---|---|---|---|
| `flower-garden` (154, 110), radius 10.5 (NSB commit 8795927, 2026-11-06 22:12; the mod wrote (154, 105); scenes use explicit cells x 152-156, z 105-107, inside the garden) | 1, 2, 3, 4 | hour 15, 15, 17, 18, Clear, 20 degrees; daylily (156, 106) in 1; torch lamp near (156, 106) lit in 4; bed corner hidden (hide-buildings, radius 2 at (158, 102)) in 1 and 4 | 2026-11-07 |

| Colonist | Shots | Outfit per shot | Last read | Exceptions |
|---|---|---|---|---|
| Nelim (NSB) | 1, 2, 3, 4 | one outfit all afternoon: `Apparel_BasicShirt` deep blue (32, 64, 128) and `Apparel_Pants` brown (90, 64, 44), the NSB palette (deep blue, brown), practical at 20 degrees; mouth `MouthSmile` or `MouthLipsSmallSmile` (smile by default, owner rule) | 2026-11-06 (NELIM-PROFIL.md, NSB-ROSTER.md hair rows) | played as canon from 2026-11-05 (owner: "Play canon"): Roo_HD_Hair_Highpony, colour from her genes; none pending |

| Animal | Shots | Outfit | Last read | Exceptions |
|---|---|---|---|---|
| Mossy, Pip (the mod's own sloths, created by the scenario) | 1 to 4 | none | not in CATALOGUE-ANIMAUX.md (read 2026-11-06) | outside NSB, named by the gallery: they are the creature of the mod under test, not a pet or livestock of the save; flagged to the owner with the hair question |

| Included animal (rule 5) | Shots |
|---|---|
| Sloth (Mossy, Pip) | 1, 2, 3, 4 |


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
