# A Sloth Mod — where the content comes from, and what had to be changed

Everything in this mod is **ThatRubishGamer's** work: the sloth, its stats, its textures. This
repository holds the port to RimWorld 1.6, and two images that are its own — see
[What is not theirs](#what-is-not-theirs).

## The source

| | |
|---|---|
| Mod | A Sloth Mod |
| Author | ThatRubishGamer |
| Workshop | [2253087891](https://steamcommunity.com/sharedfiles/filedetails/?id=2253087891) |
| Last version supported | 1.3 |
| Last updated | 23 July 2021 |
| Licence | none stated |

**Abandoned, not withdrawn.** The item is still on the Workshop and still downloadable; it stopped
at 1.3, which means it missed 1.4, 1.5 and 1.6. Nobody else has picked it up: Mlie has no
continuation of it, and a Workshop search filtered on the 1.6 tag returns nothing related.

## The licence, looked for in four places

"None stated" is a verdict, not an absence of checking. A refusal never presents itself as a
licence, so each place was searched for the refusal rather than for the permission — `prohibit`,
`forbid`, `do not redistribute`, `no reupload`, `all rights reserved`, `without permission`, and
the Japanese and Chinese forms 禁止, 転載, 無断, 二次配布, 不得.

| Where | What it says |
|---|---|
| A `LICENSE` or `COPYING` file in the mod | there is none |
| The `<description>` of its `About.xml` | nothing about reuse |
| A linked repository | there is none |
| The Workshop page description | nothing about reuse |

Silence grants nothing and forbids nothing. This port rests on the Workshop's own custom for
abandoned mods: named credit, and a takedown on request.

## What the port changed

One line. The two later changes, listed further down, are not part of the port and are kept apart
from it on purpose.

- **`<wildness>0.50</wildness>` inside `<race>` became `<Wildness>0.50</Wildness>` under
  `<statBases>`.** Wildness stopped being a field of `RaceProperties` in 1.6 and became a StatDef.
  The old form does not error: it is read by nothing, and the stat's own default is `-1`, which
  Core's comment describes as deliberately out of range "so we can catch missing wildness stats on
  animals". The practical effect was a sloth that tamed for almost nothing.

A diff against the original file shows that change, the `AnimalUncommon` tag below, and nothing
else. The textures are byte-identical to theirs.

## What is not theirs

Two files in `Mod/About/` were made for this port and contain none of the original mod:

| File | What it is |
|---|---|
| `Preview.png` | the Workshop banner: a sloth clinging to a post in a lit colony corner |
| `ModIcon.png` | the mod list icon: a sloth mascot head |

Both are AI-generated images, made here rather than inherited. The original shipped a `Preview.png`
of its own and it was not reused: a banner carried over from upstream makes the author of the
source answer for the identity of the port, and the identity is exactly what a port has to carry
itself.

The sprites under `Mod/Textures/` are untouched and remain ThatRubishGamer's.

## What was left alone, and why

- **Its voice is the boomrat's.** The adult life stage borrows `Pawn_Boomrat_Wounded`,
  `_Death`, `_Call` and `_Angry` from the base game. The author shipped no audio, and inventing
  some is not porting either.
- **No balance value was touched.** Nothing in `statBases`, `race` or `tools` was retuned: the
  sloth is as slow, as fragile and as harmless as it was written.

## What this port changed beyond the port

One thing, in two files, and it is not repair work. It is stated here because the rest of this
document insists on how little was touched.

**The original could not be obtained in a normal game.** No biome lists the kind, so it never
spawned on a map; and its one trade tag, `AnimalCommon`, is in no trader's sell or buy list
anywhere in Core or the five expansions. Vanilla's hare carries that tag alone and is caught in the
wild, never bought. An animal in neither place exists only in the files.

| Change | Where | Why this value |
|---|---|---|
| `AnimalUncommon` added to `tradeTags` | `Defs/ThingDefs_Animals.xml` | the tag of the monkey, iguana, tortoise and megasloth, and the one exotic caravans and orbital ships actually sell. `AnimalExotic` in vanilla is the thrumbo and nothing else, and no trader sells it either |
| `Sloth` added to two vanilla biomes | `Patches/Biomes_Vanilla.xml` | tropical rainforest 0.5, tropical swamp 0.4, read against the monkey at 1, the capybara and tortoise at 0.5, the guinea pig at 0.25 |
| `Sloth` added to four modded biomes | `Patches/Biomes_Mods.xml` | cloud forest 0.5, miasmic mangrove 0.4, mycotic jungle 0.3, feralisk infested jungle 0.05, each read against that biome's own list. Guarded by `PatchOperationFindMod`, so neither More Vanilla Biomes nor Alpha Biomes is a dependency |

This is design, not porting, and calling it anything else would be dishonest. The defence is narrow:
the alternative was to republish an animal that no player could ever meet. Nothing else about the
sloth was decided here.

## Where this came from

The port was done inside a private pack that had gathered two dozen abandoned animal mods, where
this sloth was one source among them. It leaves the pack to stand on its own, because the rule that
pack follows is that a mod which is dead **and** states nothing gets republished with credit rather
than kept back. The pack keeps only what cannot be published: sources that are alive in 1.6, and
the one whose author refuses redistribution.
