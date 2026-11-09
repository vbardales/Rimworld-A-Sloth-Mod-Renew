# Protocol documents: what was read, in which version

Kept so a session does not reread what has not moved. Versions are the last commit touching the
file in its own repository (`git -C <dir> log -1 --format=%h -- <file>`); a different hash there
means reread. Updated 2026-10-01.

| Document | Version | Read | Useful for this mod |
|---|---|---|---|
| `AGENTS.md` | 90d51374 | fully (loaded as project instructions) | yes: gates, evidence policy, CI publication rules |
| `AUDIT.md` | 90d51374 | fully, 2026-10-01 | yes: the chain, session title, Pickle ticket rules, `tested` gate |
| `PUBLISHING.md` | 5e760904 | 2026-09-28 first half; 2026-10-01 only the opening (upstream-first rule: a PR to any origin repository is systematic, tracked in `BACKLOG.md`, public so needs the owner's word) | yes; reread the rest when a publication is prepared |
| `MOD_SETTINGS.md` | 90d51374 | criteria only | yes: settings `not_applicable` |
| `TRANSLATIONS.md` | 90d51374 | criteria only | yes: DefInjected coverage |
| `STYLE_RIMWORLD.md` | bd7e99fb | read 2026-09-28 at an older version; changed 2026-10-01 (camera/saturation rules, "gouache" retired); not reread | only if the Preview is redone |
| `WORKSHOP_COMMENTS.md` | 08878789 | read 2026-09-28 at d438141c; 2026-10-01 diff skimmed: "Continued" mods get one message crediting both authors; no row for this mod's neighbours changed | yes, when posting |
| `scripts/SEARCHING.md` | 90d51374 | no | not needed: no search step in this mod's work |
| `PickleTools/README.md` | ff20d89 | catalogue lines, 2026-09-28 | yes |
| `PickleTools/docs/steps.md` | da7c3b0 | 2026-09-28 | yes |
| `PickleTools/Headless/README.md` | ed4e73a | no | later, if a run misbehaves |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | 3c03f51 | fully, 2026-09-28 (112 lines); item now exists, so the CI can update it once `PublishedFileId.txt` is pushed | yes |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md`, `SUBMIT.md` | 77ca9d7, d07b2b8 | no; AUDIT.md's own summary suffices | not needed so far |

Not applicable here: `./BACKLOG.md` does not exist (no upstream repository to send a PR to, see
`upstream_mod_remotes` in `STATUS.md`).

## What the register says about this mod's neighbours

`WORKSHOP_COMMENTS.md` has `posted` rows for A Dog Said... Animal Prosthetics 2 (3238353862) and
Nocturnal Animals (Continued) (2269731409, crediting Mlie and XeoNovaDan together). This mod adds
itself to `Covers` on both and posts **nothing** there. Not in the register yet: Alpha Biomes
(1841354677) and More Vanilla Biomes (1931453053), both named in the description as optional patches,
so each needs a `drafted` row and a personalised draft in `PUBLICATION.md`. Better Crossbreeding is
named in the documents but nothing depends on it: no row needed unless claimed as a compatibility.
