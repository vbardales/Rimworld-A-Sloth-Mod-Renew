# STATUS journal 2026-11-18 (moved out of STATUS.md, AUDIT 14.c)

Full earlier text stays in git (STATUS.md at 46c12e2).

## 1.2.0 publication

- Dry run 44218448468 on ba2ba1b, green, no options: Mod/ and the change note only. Note read in the log: `[b]1.2.0[/b]`, `[list]` of two items, CHANGELOG link. Tags Mod, 1.6, 1.7 equal to the page. 18 files 0.74 MB. Template d20db370c66b.
- First publish attempt FAILED, run 44218730069 on ba2ba1b: `STEAM_REFRESH_TOKEN is required` (secret empty in steam-production), before any upload, no tag, no release, page untouched. Owner copied the secret, then dispatched again.
- Publish run 44219582145 on ba2ba1b: approved by Virginie, publish and tag-and-release green, tag v1.2.0 and release by the CI, no preview, no description, tags unchanged.
- Subscribe test OK 2026-11-18 (PiI): re-subscribed to force refresh, About.xml 2026-11-18 03:03, diff against `git archive ba2ba1b` Mod empty, 18 files both sides.
- Earlier runs: 1.1.1 dry run 43959368322 (ee46d1a), publish 43959600883 (2026-11-16, preview and description sent); 1.1.0 dry run 38414526235 (414de05), publish 38422420800 (2026-10-13); 1.0.0 dry run 38400219841 (5ac3a96), publish 38409430019 (2026-10-13).
- Gallery 0 to 4 (Art/Gallery) uploaded by Virginie 2026-11-16. startWatch done 2026-11-16 (GitHub watch, Steam comment notifications, collection 3815982565).

## 1.2.0 closing pass (writeReleaseDocs)

- 11.i 1.2.0 change note written in PUBLICATION.md 2026-11-18, moved to `steam-change-notes-sent.md` at cleanUp. 11.h none.
- Closing pass step 6: /review-translation page 1 of 1, no proper name to decide, no correction on the 4 French keys, 0 applied, page clean. Check-Translations PASS, TRANSLATION_REVIEW.md unchanged.
- 11.j done 2026-11-18 (Virginie: "je valide", 1.2 line, publication_changelog_review_sha e2d618e).
- 12.a code_review_sha 9fcd3e0 current (no Mod/Source commit since). 12.b dependencies unchanged since 353e8c7. 12.c lint -Strict 0 error 0 warn. 12.c bis docs minified at 1.1.1 (ee46d1a), nothing to redo.

## 14.a non-regression 1.2.0 on ba2ba1b (Mod/ identical to 1.1.1 but one ATTRIBUTION line)

Six 1.6 tickets filed 2026-11-18. Verdict green. Details `history.md`.

- minimal (b25c): 4 passed, 0 failed, 14 skipped (sans-facultatifs, exitReason passed) = expected 4/4.
- optionals (c77d): 11 passed, 0 failed, 7 skipped (avec-facultatifs, exitReason passed) = expected 7/7.
- incompat (e54c, incompat-slothmod): 1 passed = expected 1/1.
- English (c645, run 20261118-112129-072-c645): 1 passed = 1/1.
- French (78a4, run 20261118-112130-701-78a4): 1 passed = 1/1.
- commerce (2b33, run 20261118-112132-032-2b33): 1 passed (merchant takes the sloth), 1 `[no-stock]` (exotic trader, known, @flaky-stock, read as skip, same as 1.1.1; TESTING.md G trade). exitReason failed is that skip.
- Inbox triaged 2026-11-18: five minified into `Tests/Pickle/Evidence/noreg-*` with RELEASE.md (condition: Mod/ change after ba2ba1b or next non-regression); commerce deleted (known skip); 1.1.1 noreg-incompat and noreg-optionals removed (superseded); `p17-2026-11-17-sans-facultatifs` kept (1.7 proof). 14.j done, then cleanUp.

## cleanUp 2026-11-17 (1.1.1)

STATUS.md trimmed (journal `status-journal-2026-11-17.md`), thank-you texts in `posted-comments-2026-11-16.md`, gallery evidence deleted, noreg-* kept in Evidence with RELEASE.md, 14.d nothing (main only). WSL (Virginie go, Use-Wsl.ps1 under the machine lock, exit 0): removed 2253087891 (A Sloth Mod original) from ~/workshop-cache; kept every other id of this mod's maps (named by another mod's wsl-deps); Alpha Biomes 1841354677 and More Vanilla Biomes 1931453053 were not in the cache. Nothing to unsubscribe. 14.a on 1.1.1 done 2026-11-17 (b842f68): minimal, optionals, incompat, English, French green; commerce 1 passed, 1 `[no-stock]` (known skip).

## updated line before cleanUp

2026-11-18, stage runNoRegression[1.2.0]: 14.h nothing to post (no thanks recipient, gallery unchanged since the 1.1.1 upload, no Use This Instead comment, rule dropped 2026-11-18); 14.i.
