# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it
in game.

## [1.0.0] — unreleased

The CI creates the `v1.0.0` tag and the matching GitHub release after a successful Workshop upload.

`Mod/About/ModIcon.png` and `Mod/About/Preview.png` were added on 11 September 2026. Both are new
art, made for this port; neither comes from the original. The full-resolution renders and the page
that engraves the banner text live in `Art/`, outside `Mod/`, because Steam publishes the mod
folder without filtering.

First release of the 1.6 update of **A Sloth Mod**, by ThatRubishGamer.

### Added

- French translations for the sloth's animal and pawn-kind labels, description and claw labels.
- Support for RimWorld 1.6.
- **The sloth can now be obtained.** It was in no biome and its only trade tag, `AnimalCommon`, is
  in no trader's sell or buy list in Core or the five expansions, so the original animal was
  reachable by nothing short of the debug menu.
  - `AnimalUncommon` added to `tradeTags`: the tag of the monkey, iguana, tortoise and megasloth,
    and the one exotic caravans and orbital ships sell. `AnimalExotic` was rejected: in vanilla it
    is the thrumbo alone, and traders only buy it, never sell it.
  - `Patches/Biomes_Vanilla.xml` adds the kind to tropical rainforest at 0.5 and tropical swamp at
    0.4, against the monkey at 1, the capybara and tortoise at 0.5 and the guinea pig at 0.25.
  - `Patches/Biomes_Mods.xml` does the same for **More Vanilla Biomes** (cloud forest 0.5) and
    **Alpha Biomes** (miasmic mangrove 0.4, mycotic jungle 0.3, feralisk infested jungle 0.05),
    each guarded by `PatchOperationFindMod`. Neither mod is a dependency.
  - This is design rather than porting, and `ATTRIBUTION.md` says so in those words.
- **Optional compatibility with three other mods**, checked against their actual installed files:
  - `Patches/Compat_ADogSaidAnimalProsthetics2.xml` adds Sloth to all three of ADS 2's surgery
    categories, which hand-list eligible animals and had none for it. `<loadBefore>` declared, the
    same fix Dalmatians Renew needed for the same mod.
  - `Patches/Compat_NocturnalAnimals.xml` gives the sloth a nocturnal cycle in [XND] Nocturnal
    Animals (Continued), which also hand-lists vanilla defNames only. `<loadAfter>` declared.
  - Better Crossbreeding needed no patch: it only extends vanilla 1.6's opt-in
    `canCrossBreedWith`, empty by default, and this port invents no crossbreeding partners.
- **A Pickle suite** (`Tests/Pickle/`) covering Wildness, biome availability, optional
  compatibility, trading and English/French labels, with separate gallery scenarios. See
  `Tests/Pickle/README.md` for coverage and verification status.

### Changed

- **`wildness` moved to `<Wildness>` under `statBases`.** It stopped being a field of
  `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is simply never
  read, and the stat's default is `-1` — outside the range the game uses, so the sloth tamed for
  almost nothing instead of sitting at 0.50.

### Notes

The original stats, textures and sounds are preserved, apart from restoring the intended Wildness value. Biome and trader availability are deliberate additions to this port. The sloth retains the original boomrat calls.

## [0.1.0] — 2026-10-01

Creation of a `PublishedFileId.txt`. A first upload whose only purpose was to create the Workshop
item (private, as Steam creates every item) and obtain `Mod/About/PublishedFileId.txt`. It contained
`Mod/` as of commit `32466c5`, with nothing changed in `Mod/` since the upload apart from this file.
It states neither that the mod is public nor that it is tested.
