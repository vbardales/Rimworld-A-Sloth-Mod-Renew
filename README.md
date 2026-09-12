# A Sloth Mod Renew (unofficial)

UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

The sloth, brought forward to RimWorld 1.6.

**I am not the author of this mod.** The sloth is ThatRubishGamer's; what I did is the work needed
to make it run on 1.6, plus the two changes needed to make it reachable in a game at all. Credit
goes to them, mistakes in the update are mine.

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

**It lives in tropical rainforest and tropical swamp, and exotic traders sell it.** See
[what this port changed on purpose](#what-this-port-changed-on-purpose): the original could be
reached by neither route, and that was not a choice its author made so much as one nobody noticed.

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

## What this port changed on purpose

The 1.6 fix above is repair work. This part is not, and it is stated plainly rather than buried:
**the original sloth could not be obtained in a normal game at all.**

- It was in **no biome's** wild animal list, so it never spawned on a map.
- Its only trade tag was `AnimalCommon`, and **no vanilla trader sells or buys that tag**. Across
  Core and all five expansions, traders' sell lists name only `AnimalFarm`, `AnimalPet`,
  `AnimalFighter`, `AnimalUncommon` and `AnimalExotic`. Vanilla's hare carries `AnimalCommon` alone
  and is caught in the wild, never bought.

Together those two facts left an animal that existed in the files and nowhere else. Two changes fix
that, and nothing else was touched:

- **`AnimalUncommon` added to its trade tags.** That is the tag of the monkey, the iguana, the
  tortoise and the megasloth, and it is what exotic-goods caravans and exotic orbital ships
  actually sell. `AnimalExotic` would have been wrong twice over: in vanilla only the thrumbo
  carries it, and no trader sells it either, they only buy it.
- **Added to the biomes that can hold one**, by patch, at a commonality read against the
  neighbours already in each list rather than copied across.

| Biome | From | Commonality |
|---|---|---|
| Tropical rainforest | Core | 0.5 |
| Tropical swamp | Core | 0.4 |
| Cloud forest | More Vanilla Biomes | 0.5 |
| Miasmic mangrove | Alpha Biomes | 0.4 |
| Mycotic jungle | Alpha Biomes | 0.3 |
| Feralisk infested jungle | Alpha Biomes | 0.05 |

Those two mods are **not** dependencies: each block is guarded by `PatchOperationFindMod` and does
nothing when the mod is absent. The feralisk jungle gets a tenth of the usual value because every
commonality in that biome is a tenth of the rainforest's, the spiders having eaten the difference.

A purist port would have left both alone. This one does not, because "left alone" here means an
animal nobody can ever meet.

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
