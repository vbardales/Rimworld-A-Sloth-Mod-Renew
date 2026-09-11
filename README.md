# A Sloth Mod Renew

The sloth, brought forward to RimWorld 1.6.

**I am not the author of this mod.** The sloth is ThatRubishGamer's; all I did was the work needed
to make it run on 1.6. Credit goes to them, mistakes in the update are mine.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=2253087891 — last supporting
1.3, last updated in July 2021. Abandoned, not withdrawn.

## What the mod does

It adds one animal.

- **Sloth** — body size 0.15, a fifth of an ordinary animal's hunger rate, half its health scale,
  thirteen years of life. Market value 75. Comfortable down to -30 °C.
- It moves at **0.7** cells per second, slower than a colonist walking, which is the whole joke.
- It eats rough vegetation, yields light leather, and breeds slowly: one young at a time after
  twelve days of gestation.
- **It cannot be trained at all** (`trainability: None`) and it will never go manhunter — not when
  a taming attempt fails, not when it is hurt. Both chances are zero in the file.
- Two claws at 8 power and a bite at 6, all on long cooldowns. It is not a threat to anything.

**It arrives by trader, not by biome.** The mod tags the sloth `AnimalCommon`, which puts it in
animal traders' stock, and adds it to no biome's wild animal list. No colony will find one in the
wild. That is how its author wrote it, and this port leaves it alone rather than quietly deciding
where sloths ought to live.

No DLC required. No Harmony, no framework, no dependency of any kind.

Content mod: removing it mid-save will lose any sloth already in play.

## What changed in the 1.6 update

One line, and it is the line that mattered.

- **`wildness` moved to `<Wildness>` under `statBases`.** It stopped being a field of
  `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is simply never
  read, and the stat's default is `-1` — outside the range the game uses, so the sloth tamed for
  almost nothing instead of sitting at 0.50.

Nothing else needed touching: the rest of the file is valid 1.6 as it stands. No balance value was
changed.

## Terms

The original **states no licence anywhere** — no file in the mod, nothing in its `About.xml`, no
linked repository, and nothing on its Workshop page, which was read for a refusal rather than for a
permission. Silence grants nothing and forbids nothing.

This port therefore rests on the Workshop's own custom for abandoned mods: named credit to the
author, and a takedown on request. If ThatRubishGamer comes back to the sloth, or asks for this to
be taken down, it comes down.

If I do not answer within a reasonable time after being contacted, anyone may freely update this or
any other of my mods, including publishing a continuation of it. All credit must be preserved.

## Credits

- **ThatRubishGamer** — the mod, the sloth, and its textures.
- 1.6 update by nelim. Written with the help of Claude (Anthropic).

## Where this came from

The port was done inside a private pack that had gathered two dozen abandoned animal mods. The
sloth leaves it to stand on its own, which is what the pack's rule asks for a source that is dead
and states nothing. See [ATTRIBUTION.md](ATTRIBUTION.md).
