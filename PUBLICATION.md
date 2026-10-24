# Publication

What the Workshop page needs and the rest of the repository does not hold. It serves twice: for the
first release, and for whoever takes the mod over.

**Status: `1.0.0` and `1.1.0` are published and public** (item 3811289805, `PublishedFileId.txt`; the CI created `v1.0.0` and `v1.1.0`). The current stage is in `STATUS.md`.

## Current state

Only what is specific to this mod; the gates themselves are in `AUDIT.md`.

- `1.1.0` and `1.0.0` are published and public. Nothing blocks the next version. Rollback target: `414de05`, the commit of 1.1.0 (see "Fail fast").
- Sent by the CI: `Mod/` and, with `--preview`, the header image; with `update_tags`, the tags (the 2.1.3 template cannot apply them: the 1.7 tag was set by the owner with `steam-apply-tags.mjs`). The Steam header image is still the 1.0.0 Preview; the next publish uses `--preview` to send the new echo.
- Gallery: `0-preview.png`, `1-portrait.png` and `2-family.png` are on the page, uploaded by hand (the CI never sends them). A trader's-stock picture 3 is optional (see "Screenshots").
- Comments on other mods' pages and the Use This Instead comment are posted (`WORKSHOP_COMMENTS.md`, `USE_THIS_INSTEAD.md`; drafts in `docs/runs/posted-comments-2026-10-13.md`).
- In-game verification: see `STATUS.md` and `docs/runs/`.

## Description

The one-source standard of 2026-09-25 applies: the page was written from this source by the CI on 2026-10-13, and
any later change goes through `update_description`. The description is written once, in Markdown, in the block below. The CI converts it
to Steam BBCode and generates the plain-text `<description>` of `About.xml` from it
(`--about-from-description`), and a dry-run or publish stops if they differ. **The hand-written
`About.xml` description therefore changes at the first `--write`: read the diff, commit, redo the
dry-run.** The block holds no code fence and ends with `[Source code on GitHub](URL)`.

Numbers below were read from `Mod/Defs/ThingDefs_Animals.xml` on 2026-09-28. Refresh the sentence
about what the automated runs cover to whatever `docs/runs/` shows that day, and read the whole
block once more before pasting.

## Steam description

```markdown
**UNOFFICIAL.** This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

One animal: the sloth. A small, slow, harmless animal that sleeps most of the day and eats the rest. It can be found in tropical rainforests and swamps, and bought from exotic traders.

No DLC, no dependency, no assembly. Two defs, four textures and guarded XML patches.

I am not the author of this mod. The sloth, its artwork and its stats are ThatRubishGamer's. All I did was bring it forward to the latest RimWorld version, make it obtainable, and write the French. Credit goes to them; mistakes in the update are mine.

Original mod: [A Sloth Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=2253087891), last updated in July 2021 for 1.3. Abandoned, not withdrawn.

## What's in it

- The sloth. Body size 0.15, a fifth of an ordinary animal's hunger, half its health, market value 75, comfortable down to -30 C, thirteen years of life. It moves at 0.7 cells per second, slower than a colonist walks. It eats rough vegetation and yields light leather. It cannot be trained at all and never turns manhunter, not when a taming attempt fails and not when it is hurt. It breeds slowly: twelve days of gestation, one young at a time.
- Wildness 50 %, so taming is neither trivial nor hopeless.

## What changed

**The repair.** Wildness stopped being a field of the animal in a recent version and became a stat. The old form is not an error, it is simply never read, and the stat defaults to -1, outside the range the game uses, so the sloth would have tamed for almost nothing. It is now a stat under `statBases`, written the way vanilla's own animals write it.

**On purpose, and not a repair.** The original sloth could not be obtained in a normal game. It was in no biome's wild animal list, and its only trade tag, `AnimalCommon`, is in no trader's sell or buy list in Core or the five expansions. This mod adds the tag `AnimalUncommon`, the one the monkey and the tortoise carry and the one exotic caravans and orbital ships sell, and adds the sloth to tropical rainforest (0.5) and tropical swamp (0.4). That is design, not porting, and it is said here rather than buried.

No stat, tool, sound or texture was rebalanced. The sloth's defName is unchanged. Switching an existing save between the original mod and this continuation has not yet been validated in game.

## Optional compatibility

None of these is required, and each patch does nothing when its mod is absent.

- [More Vanilla Biomes](https://steamcommunity.com/sharedfiles/filedetails/?id=1931453053): the sloth joins the cloud forest (0.5).
- [Alpha Biomes](https://steamcommunity.com/sharedfiles/filedetails/?id=1841354677): it joins the miasmic mangrove (0.4), the mycotic jungle (0.3) and the feralisk infested jungle (0.05, a low spawn weight, consistent with the other animals there).
- [A Dog Said... Animal Prosthetics 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3238353862): it is offered the same animal surgeries as vanilla's huskies. This mod must load before it, which its metadata declares.
- [Nocturnal Animals (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=2269731409): the sloth gets a nocturnal cycle, matching its own description.

Better Crossbreeding needed nothing: the sloth declares no crossbreeding partners.

## Credit and removal

ThatRubishGamer declared no licence: no file in the mod, nothing in its About.xml, no linked repository, and nothing on its Steam page. It is republished here under the usual convention for abandoned mods: full credit, a link to the original, and removal on request. If they would rather this port did not exist, say so and it comes down, no argument, no delay.

The original is declared incompatible: run one or the other.

Content mod: removing it mid-save destroys any sloth already in the colony.

## If I go quiet

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

## AI-generated

The port work (the XML, the patches, the tests, the documentation and the two pictures) was done with the help of AI assistants, Claude (Anthropic) and Codex (OpenAI), under human direction.

## Thanks

- ThatRubishGamer, for the sloth, its artwork and its stats.
- Mlie, who maintains Nocturnal Animals (Continued), and XeoNovaDan, its original author.
- Zylleon, for More Vanilla Biomes.
- Sarg, for Alpha Biomes.
- SamBucher, for A Dog Said... Animal Prosthetics 2.
- The authors of [Pickle](https://steamcommunity.com/sharedfiles/filedetails/?id=3791648678), used to test the port in game. It is for development only and never a dependency of this mod.

Licence and what was carried over: see ATTRIBUTION.md in the source repository.

[Source code on GitHub](https://github.com/vbardales/Rimworld-A-Sloth-Mod-Renew)
```

To verify before pasting, none of it done yet: the author credit for More Vanilla Biomes (read its page;
its `packageId` is `zylle.MoreVanillaBiomes`), the four Workshop links opened, and the sentence
saying what the automated runs cover, which is left out until a run is green.

## Images

- **Preview** (`Mod/About/Preview.png`, 896 x 504, about 0.55 MB): a sloth clinging to a post in lamplight, the title, an "(unofficial)" line and a `1.7` corner banner, with the ModIcon badge cropped by the bottom-left corner. Rendered by `node ../scripts/Render-Preview.cjs` from `Art/Preview-source.png` (illustration without overlay), `Art/echo.png` and `Art/Preview.config.json` (palette, title parts, `iconBadge` with `translate`); regenerated on 2026-10-10 and the crop validated by the owner the same day. Its mean value (0.272) is under the 0.30 floor of the source rule: the owner kept it on 2026-10-11.
- **ModIcon** (`Mod/About/ModIcon.png`, 128 x 128, about 29 KB): a sleeping sloth head with a ponytail and a sparkle, from the owner's `Art/ModIcon-source.png` (changed 2026-10-04). Derived by `Render-Preview.cjs` (`modIconSource` key) and confirmed by the owner on 2026-10-10, readable at 32 px. The source is hers; sessions never edit it.

## Screenshots, in this order

Steam shows the first image large under the Preview, and the gallery is uploaded by hand
(`OPERATIONS.md`: SteamCMD sends the header image only), from `Art/Gallery/`, which
would also be the workflow's `--gallery-dir`. It holds only the images to upload, in page order.
Image 0 is a copy of the badged `Preview.png` itself, numbered one digit (`0-`, then `1-`, `2-`, per PUBLISHING.md, 2026-09-29):
`0-`.

| Order | File | What it shows | Source |
|---|---|---|---|
| 0 | `0-preview.png` | Copy of `Mod/About/Preview.png` (badged), byte for byte | Done, regenerated 2026-10-13 with the new echo; uploaded by hand |
| 1 | `1-wide-garden.png` | Wide, 15h: Nelim mid-stride with hay crosses the flower garden, Mossy asleep (frame moved to 153, 106) | Series of 2026-10-23 ("the sloth hour", one outfit all afternoon); scene 1 recomposed in ticket 20261024-141550-091-7ec6, queued. Replaces `1-portrait.png` (the weak one) |
| 2 | `2-hay.jpg` | Medium, 15h13: Nelim bends and sets hay down, Mossy awake and facing the camera | Candidate kept from run 0ddc (`Art/Gallery/2-candidate-hay.jpg`), accepted by the session 2026-10-24. Replaces `2-family.png` |
| 3 | `3-follows.jpg` | Close, 17h: Nelim walks East with hay, Mossy and Pip follow in file | Candidate kept from run 0ddc (`Art/Gallery/3-candidate-follows.jpg`), accepted by the session 2026-10-24 |
| 4 | `4-closing.png` | Closing, 18h: Nelim leaves West, Mossy and Pip asleep by a lit torch lamp | Scene 4 recomposed in ticket 7ec6 (Nelim kept on row z = 105, Mossy standing fixed); queued |
| 5 | `5-…` | A trader's stock offering a sloth | Needs a forced exotic trader whose stock is random; scenario G (`08-trade`, `@flaky-stock`) played once with a `[no-stock]` flake. A manual capture, or none. The information card with Wildness 50 % is also a manual capture, not taken |

**Subtitles (owner, 2026-10-15).** Each story image without an interface window carries an English movie-style subtitle drawn at the bottom (white text, black outline). `0-preview.png` has none, and a menu or window capture (the information card, a trader's stock) has none. The texts, with no hour:

| Page # | File | Subtitle |
| --- | --- | --- |
| 1 | `1-wide-garden.png` | Nelim crosses the flower garden and notices the sloth. |
| 2 | `2-hay.jpg` | A pile of hay, left within reach. |
| 3 | `3-follows.jpg` | It follows the one who brought the hay. |
| 4 | `4-closing.png` | A mother, her baby, and no hurry. |

Draw each subtitle on a copy of the accepted image and keep the original without text (git history, or the run's evidence) for any redraw: never redraw on the captioned file. The wording is a proposal until the owner reads it.

The shots are `@review` evidence, not proof: a green capture scenario shows the journey ran, not that
the image shows anything. The game's camera has a minimum zoom, at which a 0.15-size animal is small;
that is the reason for the "half the frame" rule of the Dalmatians ruling, and it applies here more.

## Dependencies and DLCs

**No DLC and no mod is required.** `supportedVersions` declares 1.6 and 1.7. `modDependencies` is empty
and `Tests/Test-Mod.ps1` asserts it.

| Declared | packageId | Actually required |
|---|---|---|
| `loadAfter` | the five official expansions | No. Ordering only |
| `loadAfter` | `Mlie.XNDNocturnalAnimals` | **No.** Optional; its `ExtendedRaceProperties` class must exist when `Compat_NocturnalAnimals.xml` attaches it |
| `loadBefore` | `SamBucher.ADogSaidAnimalProsthetics2` | **No.** Optional; the order matters, ADS 2 copies its category lists at its own load time |
| `incompatibleWith` | `ThatRubishGamer.RubishMods.SlothMod` | Same defNames as the original; run one or the other |

Alpha Biomes and More Vanilla Biomes are named only by `PatchOperationFindMod` on their display name,
which is why nothing is logged if either is renamed (`TESTING.md`, scenario F). Alpha Biomes itself
needs Vanilla Expanded Framework; that is its dependency, not this mod's.

## Manual validations of the owner

Done on 2026-10-13: subscription to the item, gallery uploaded, description read on the page, visibility set to public, comments posted. Scenarios F, G and P are automated (`TESTING.md`); a real save with the mod removed (the game's handling) and the Health tab look were not played by hand.

## Mature content checkboxes

**None of them.** The mod adds one animal. The two pictures it ships were opened: a sloth on a post,
and a sleeping mascot head. The gallery images (`1-portrait.png`, a sloth in a flower garden, and `2-family.png`, three sloths) were opened and
contain nothing mature.

## Steam change notes

Written at upload time. Unlike the description, they go out again on every update. The version stands
alone on the first line, in BBCode, or the CI refuses the note. The CI reads the section of the version it publishes (`### x.y.z`); the notes of 1.0.0 and 1.1.0 are in `docs/runs/steam-change-notes-sent.md`.

### x.y.z

```
[b]x.y.z[/b]

What changed, in one or two lines.
```

## Fail fast: the rollback target

A rollback is a **new publication**: the workflow is dispatched with `ref` = the full SHA of the last
good commit and the next patch number, and the note reads "Rolls back to <what>, because <what
failed>". Version numbers only go up and an existing tag is refused. Visibility is not touched by the
CI.

**The rollback target is `414de05`**, the commit of 1.1.0 (published 2026-10-13, dry-run run 38414526235 green, publish run 38422420800; `5ac3a96` is 1.0.0). A rollback is a new publication with `ref` = that SHA and a version above every existing tag (`1.1.1` or higher, or the next minor). Before the `publish`, every scenario that failed has a green replay, the gallery is done and the owner's manual validations are made; only the regression pass may follow it.

