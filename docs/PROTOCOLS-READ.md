# Protocol documents: what was read, in which version

Kept so a session does not reread what has not moved. Versions are the last commit touching the
file in the collection repository (`git log -1 --format=%h -- <file>`); a different hash there
means reread. Updated 2026-09-28.

| Document | Version | Read | Useful for this mod |
|---|---|---|---|
| `AGENTS.md` | 90d51374 | fully | yes: gates, evidence policy, CI publication rules |
| `AUDIT.md` | 90d51374 | fully | yes: the chain, session title, Pickle ticket rules |
| `PUBLISHING.md` | 90d51374 | description, licence, `PUBLICATION.md`, file list, "À chaque mise à jour", "Publier par la CI" (first half); headings of the rest | yes |
| `MOD_SETTINGS.md` | 90d51374 | criteria only | yes: settings `not_applicable` |
| `TRANSLATIONS.md` | 90d51374 | criteria only | yes: DefInjected coverage |
| `STYLE_RIMWORLD.md` | 90d51374 | fully | yes: banner and icon |
| `WORKSHOP_COMMENTS.md` | d438141c | fully, incl. register | yes: see below |
| `scripts/SEARCHING.md` | 90d51374 | no | not needed: no search step in this mod's work |
| `PickleTools/README.md`, `Authoring/README.md`, `docs/steps.md` | current checkout | catalogue lines and authoring sections 1 to 4 | yes |
| Pickle's own `Docs/steps.md` (GitHub, main) | fetched 2026-09-28 | Defs, Mods, Stats, World setup, Debug | yes |
| `PickleTools/Headless/README.md` | - | no | later, if a run misbehaves |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | 112 lines, read 2026-09-28 | fully | yes: no item yet, so first publication is in-game upload of a private item; CI needs a numeric `PublishedFileId.txt` first; `
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md`, `SUBMIT.md` | - | no; the dispatcher's reply summarised them | not needed so far |

## What the register says about this mod's neighbours

`WORKSHOP_COMMENTS.md` already has `posted` rows for A Dog Said... Animal Prosthetics 2 (3238353862)
and Nocturnal Animals (Continued) (2269731409, crediting Mlie and XeoNovaDan together). This mod
adds itself to `Covers` on both and posts **nothing** there. Not in the register yet: Alpha Biomes
(1841354677) and More Vanilla Biomes (1931453053), both named in the description as optional
patches, so each needs a `drafted` row and a personalised draft in `PUBLICATION.md`. Better
Crossbreeding is named in the documents but nothing depends on it: no row needed unless it is
claimed as a compatibility.
