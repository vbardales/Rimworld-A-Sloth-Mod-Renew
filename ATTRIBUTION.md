# A Sloth Mod — where the content comes from, and what had to be changed

Everything in this mod is **ThatRubishGamer's** work: the sloth, its stats, its textures. This
repository holds the port to RimWorld 1.6 and nothing else.

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

One line.

- **`<wildness>0.50</wildness>` inside `<race>` became `<Wildness>0.50</Wildness>` under
  `<statBases>`.** Wildness stopped being a field of `RaceProperties` in 1.6 and became a StatDef.
  The old form does not error: it is read by nothing, and the stat's own default is `-1`, which
  Core's comment describes as deliberately out of range "so we can catch missing wildness stats on
  animals". The practical effect was a sloth that tamed for almost nothing.

A diff against the original file shows that change and nothing else.

## What was left alone, and why

- **The sloth belongs to no biome.** Its `PawnKindDef` carries an `ecoSystemWeight` of 0.20, but
  nothing adds it to any biome's wild animal list, in the original or here. It reaches a colony
  through animal traders, which is what its `AnimalCommon` trade tag is for. Choosing biomes for it
  would be design, not a port.
- **Its voice is the boomrat's.** The adult life stage borrows `Pawn_Boomrat_Wounded`,
  `_Death`, `_Call` and `_Angry` from the base game. The author shipped no audio, and inventing
  some is not porting either.
- **No balance value was touched.**

## Where this came from

The port was done inside a private pack that had gathered two dozen abandoned animal mods, where
this sloth was one source among them. It leaves the pack to stand on its own, because the rule that
pack follows is that a mod which is dead **and** states nothing gets republished with credit rather
than kept back. The pack keeps only what cannot be published: sources that are alive in 1.6, and
the one whose author refuses redistribution.
