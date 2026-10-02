# Publication

What the Workshop page needs and the rest of the repository does not hold. It serves twice: for the
first release, and for whoever takes the mod over.

**Status: drafted, 2026-09-28; item created 2026-10-01 (0.1.0 prepublication, `PublishedFileId.txt` 3811289805, private).** Earlier text below saying no item exists is superseded. Formerly: there was no
`Mod/About/PublishedFileId.txt`, no `0.1.0` prepublication, no Git tag and no GitHub release (the
CI creates the last two after a successful upload). Nothing below has been posted or pasted
anywhere. The stage is `done`, not `tested` (see `STATUS.md`).

## What blocks the publication

Only what is specific to this mod; the gates themselves are in `AUDIT.md`.

- Nothing has been played in game. The nineteen manual scenarios of `TESTING.md` are unrun, and the
  Pickle suite (`Tests/Pickle/`, four features) has run three times without ever being green end to
  end; its last corrections are queued. Its verdict is in `STATUS.md` and `docs/runs/`.
- Item exists since 2026-10-01 (0.1.0 prepublication; CI can now update it). Before: `OPERATIONS.md`: the CI cannot create an item, so the first publication is an
  in-game upload of a private item, then `Mod/About/PublishedFileId.txt` committed and pushed at once,
  then the CI for every update.
- The gallery is not made (see "Screenshots").
- The rollback target cannot exist before the first publish (see "Fail fast").
- The owner's manual validations (see below).

## Description

The one-source standard of 2026-09-25 applies from the start, since no page exists yet to stay
compatible with: the description is written once, in Markdown, in the block below. The CI converts it
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

One animal: the sloth. A small, slow, harmless animal that sleeps most of the day and eats the rest. It reaches a colony through tropical rainforest and swamp, and through exotic traders.

No DLC, no dependency, no assembly. Two defs, four textures and guarded XML patches.

I am not the author of this mod. The sloth, its artwork and its stats are ThatRubishGamer's. All I did was bring it forward to 1.6, make it obtainable, and write the French. Credit goes to them; mistakes in the update are mine.

Original mod: [A Sloth Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=2253087891), last updated in July 2021 for 1.3. Abandoned, not withdrawn.

## What's in it

- The sloth. Body size 0.15, a fifth of an ordinary animal's hunger, half its health, market value 75, comfortable down to -30 C, thirteen years of life. It moves at 0.7 cells per second, slower than a colonist walks. It eats rough vegetation and yields light leather. It cannot be trained at all and never turns manhunter, not when a taming attempt fails and not when it is hurt. It breeds slowly: twelve days of gestation, one young at a time.
- Wildness 50 %, so taming is neither trivial nor hopeless.

## What changed

**The repair.** Wildness stopped being a field of the animal in 1.6 and became a stat. The old form is not an error, it is simply never read, and the stat defaults to -1, outside the range the game uses, so the sloth would have tamed for almost nothing. It is now a stat under `statBases`, written the way vanilla's own animals write it.

**On purpose, and not a repair.** The original sloth could not be obtained in a normal game. It was in no biome's wild animal list, and its only trade tag, `AnimalCommon`, is in no trader's sell or buy list in Core or the five expansions. This mod adds the tag `AnimalUncommon`, the one the monkey and the tortoise carry and the one exotic caravans and orbital ships sell, and adds the sloth to tropical rainforest (0.5) and tropical swamp (0.4). That is design, not porting, and it is said here rather than buried.

No stat, tool, sound or texture was rebalanced. The defName is unchanged, so a save moves between the original and this mod without losing a sloth.

## Optional compatibility

None of these is required, and each patch does nothing when its mod is absent.

- [More Vanilla Biomes](https://steamcommunity.com/sharedfiles/filedetails/?id=1931453053): the sloth joins the cloud forest (0.5).
- [Alpha Biomes](https://steamcommunity.com/sharedfiles/filedetails/?id=1841354677): it joins the miasmic mangrove (0.4), the mycotic jungle (0.3) and the feralisk infested jungle (0.05, low because every animal there is).
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

- **Preview** (`Mod/About/Preview.png`, 896 x 504, about 0.73 MB): a sloth clinging to a post in
  lamplight, the title, an "(unofficial)" line and a `1.6` corner banner. Inspected 2026-09-13 and
  2026-09-27. No text about anything that is not in the mod. **2026-09-29, new house standard:**
  `ModIcon.png` badged into the bottom-right corner, rotated -15°, scaled to 160 px, via
  `Art/Add-PreviewBadge.ps1`. The unbadged illustration is kept at `Art/Preview.png` (the STYLE_RIMWORLD.md
  source-without-overlay convention); `Mod/About/Preview.png` is the badged, shipped file.
- **ModIcon** (`Mod/About/ModIcon.png`, 128 x 128, 23 KB): a sleeping sloth head with a ponytail and a
  sparkle, replaced by the owner on 2026-09-27 and shrunk on her instruction; readable at 32 px. This
  file is hers to change; sessions do not generate icons. Only read to badge the Preview, never edited.

## Screenshots, in this order

Steam shows the first image large under the Preview, and the gallery is uploaded by hand
(`OPERATIONS.md`: SteamCMD sends the header image only), from `Art/WorkshopScreenshots/`, which
would also be the workflow's `--gallery-dir`. It holds only the images to upload, in page order.
**2026-09-29, new house standard:** image 0 is a copy of the badged `Preview.png` itself, numbered
`00-`; the in-game shots that follow keep `01-`, `02-`...

| Order | File | What it shows | Source |
|---|---|---|---|
| 0 | `00-preview.png` | Copy of `Mod/About/Preview.png` (badged) | Done, 2026-09-29 |
| 1 | `01-…` | Three sloths in the meadow studio, framed close | Pickle `05-gallery`, pass `galerie` (written 2026-10-02, not yet run) |
| 2 | `02-…` | A single sloth alone in the frame (from `05-gallery`); the information card with Wildness 50 % stays a manual capture | Pickle for the sloth, manual for the card |
| 3 | `03-…` | A trader's stock offering a sloth | Needs a forced exotic trader; the sloth being obtainable that way is scenario G, not yet played |

The shots are `@review` evidence, not proof: a green capture scenario shows the journey ran, not that
the image shows anything. The game's camera has a minimum zoom, at which a 0.15-size animal is small;
that is the reason for the "half the frame" rule of the Dalmatians ruling, and it applies here more.

## Dependencies and DLCs

**No DLC and no mod is required.** `supportedVersions` declares 1.6 only. `modDependencies` is empty
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

`AUDIT.md` lists them among the things a `publish` does not skip without saying which. A proposal
drawn from `TESTING.md`; it is hers to change.

| # | What to look at | Why a test cannot |
|---|---|---|
| 1 | Subscribe to the item once it exists, start a game with the installed copy, tame a sloth: the information card reads Wildness 50 % | The installed copy is what players get; the suite plays the working tree |
| 2 | Scenario F: a sloth appears in a tropical rainforest or swamp map | Map generation is a runtime outcome no def check stands in for |
| 3 | Scenario G: an exotic trader offers one | Same, for trade-stock generation |
| 4 | Scenario P, with ADS 2: the Health tab offers the surgeries a husky is offered | The look of the tab is vanilla's; the patch mechanism is asserted |
| 5 | A real save with a sloth, then the mod removed: the animal is destroyed | A changed mod list is the game's handling |
| 6 | The gallery: which captures, in which order | A composition is a choice |
| 7 | The description pasted on the page, read once more | The page is edited by hand after creation |
| 8 | Then, and only then, the visibility, the comments subscription and "Watch all activity" (`PUBLISHING.md`) | Steam, by hand, by the owner |

## Mature content checkboxes

**None of them.** The mod adds one animal. The two pictures it ships were opened: a sloth on a post,
and a sleeping mascot head. The gallery is not produced; each image must be opened before this answer
is final.

## Steam change notes

Written at upload time. Unlike the description, they go out again on every update. The version stands
alone on the first line, in BBCode, or the CI refuses the note.

### 1.0.0

```
[b]1.0.0[/b]

First release. Port of ThatRubishGamer's A Sloth Mod to RimWorld 1.6.

[list]
[*]Wildness is a stat now, as in 1.6, so it reads 50% instead of defaulting to -1.
[*]The sloth can be obtained: exotic traders sell it and it lives in tropical rainforest and swamp.
[*]Optional patches for More Vanilla Biomes, Alpha Biomes, A Dog Said... Animal Prosthetics 2 and Nocturnal Animals (Continued).
[*]English and French.
[/list]

No stat, tool or sound was rebalanced.
```

## Fail fast: the rollback target

A rollback is a **new publication**: the workflow is dispatched with `ref` = the full SHA of the last
good commit and the next patch number, and the note reads "Rolls back to <what>, because <what
failed>". Version numbers only go up and an existing tag is refused. Visibility is not touched by the
CI.

**The rollback target is not chosen and cannot be yet**: no upload exists. The first real target is the
SHA of the 1.0.0 that passes its dry-run; write it here at that moment. Before the `publish`, every
scenario that failed has a green replay, the gallery is done and the owner's manual validations are
made; only the regression pass may follow it.

## Comments on other mods' pages

`WORKSHOP_COMMENTS.md` decides; it is keyed by Workshop id. To post **only once the item is public**,
under 1000 characters each, BBCode link hidden behind the mod's name, in the owner's own voice (short
lines, one honest detail, no stock phrase). The drafts below are starting points to rewrite, not text
to paste.

| Recipient | Id | State | What to do |
|---|---|---|---|
| A Dog Said... Animal Prosthetics 2 | 3238353862 | already `posted` | Only `Covers` changes: add `A Sloth Mod Renew`. Post nothing |
| Nocturnal Animals (Continued) | 2269731409 | already `posted`, crediting Mlie and XeoNovaDan in one message | Same: add to `Covers`, post nothing |
| Nocturnal Animals (original) | 2004368312 | `not_applicable` | No second message on the original's page |
| Pickle | 3791648678 | already `posted` | Add `A Sloth Mod Renew` to `Covers` |
| Alpha Biomes | 1841354677 | to add as `drafted` | Draft below. Author on the page to be confirmed |
| More Vanilla Biomes | 1931453053 | to add as `drafted` | Draft below. Author on the page to be confirmed |
| A Sloth Mod (original) | 2253087891 | to add as `drafted` | Draft below. Also the way ThatRubishGamer can reach the owner |
| Better Crossbreeding | 3520675842 | no row | Nothing depends on it and no compatibility is claimed |
| PickleTools | 3806142401 | `not_applicable` | Same author; not used by this suite |

### Alpha Biomes, 1841354677

Not seen working in game: the guard was checked against its real def names and run by Pickle only.

```
Made a sloth port and it drops into your mangrove, mycotic and feralisk jungles. The feralisk one gets 0.05, since everything there is a tenth of normal :) Optional, does nothing without Alpha Biomes. Thanks for the biomes! [url=https://steamcommunity.com/sharedfiles/filedetails/?id=<ID of this mod>]A Sloth Mod Renew[/url]
```

### More Vanilla Biomes, 1931453053

```
The cloud forest was the obvious home for a sloth, so my port adds one there (0.5, same as the vanilla rainforest). Optional patch, silent without your mod. Thanks! [url=https://steamcommunity.com/sharedfiles/filedetails/?id=<ID of this mod>]A Sloth Mod Renew[/url]
```

### A Sloth Mod (original), 2253087891

```
Hi ThatRubishGamer! I ported your sloth to 1.6 (unofficially, credit and a link to your page are in the description). One line was broken, wildness, and the sloth was in no biome and no trader's stock, so I fixed both. Nothing else was touched, the textures are byte for byte yours. If you'd rather I take it down, just tell me and it's gone. [url=https://steamcommunity.com/sharedfiles/filedetails/?id=<ID of this mod>]A Sloth Mod Renew[/url]
```

Check the last comments of each page first, and whether it takes comments, as `WORKSHOP_COMMENTS.md`
asks. The `<ID of this mod>` placeholder is filled once the item exists.

Note on the "AI-generated" section: the mention of Codex (OpenAI) rests on the owner's word of 2026-09-28,
not on the Git history. No commit carries a Codex trailer; four commits of 2026-09-12 and 2026-09-13
(`2b9bbc4`, `43f2850`, `53ce7ea`, `b3ffdb8`) carry no trailer at all and are not from a Claude session
of this repository.
