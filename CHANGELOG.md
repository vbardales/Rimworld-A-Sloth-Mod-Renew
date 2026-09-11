# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it
in game.

## [1.0.0] — unreleased

On release: add `Mod/About/ModIcon.png` and `Mod/About/Preview.png`, create the `v1.0.0` tag and
the matching GitHub release, then publish to the Workshop.

First release of the 1.6 update of **A Sloth Mod**, by ThatRubishGamer.

### Added

- Support for RimWorld 1.6.

### Changed

- **`wildness` moved to `<Wildness>` under `statBases`.** It stopped being a field of
  `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is simply never
  read, and the stat's default is `-1` — outside the range the game uses, so the sloth tamed for
  almost nothing instead of sitting at 0.50.

### Notes

That one line is the entire difference from the original file, byte for byte. No balance value was
changed, and no defect was found to fix.

Two traits are inherited on purpose rather than corrected. The sloth belongs to no biome's wild
animal list, so it reaches a colony through animal traders alone — the mod tags it `AnimalCommon`
and stops there. And its calls are the boomrat's, borrowed from the base game, as its author left
them. Deciding where sloths live, or giving one a voice of its own, would be design rather than a
port.
