# Test scenarios

Two defs, four textures, two patch operations, no assembly. There is almost nothing here to break,
and the one thing that *was* broken broke **silently**. That is the whole reason this mod needs the
game rather than a file checker.

**An empty log is not a pass.** The original fault was a `<wildness>` element that matched no field
in 1.6. It does log a line, but that line is one warning among hundreds at startup, and the animal
loaded anyway and looked perfectly normal. Only the information card settles it.

The port itself changed exactly one line, and the textures are byte-identical to the original's. So
most of what follows asks one question: *did ThatRubishGamer's animal survive the move intact?* The
exceptions are B and C, which test the repair, and F and G, which test the two changes this port
made on purpose so that the animal can be met at all.

## Load order

```
nelim.aslothmodrenew    this mod    after Core and all official expansions
```

`<loadAfter>` names Core and the five expansions, which is all this mod needs: it inherits
`AnimalThingBase` and `AnimalKindBase` from Core and touches nothing else.

**The original must stay off.** `ThatRubishGamer.RubishMods.SlothMod`
([2253087891](https://steamcommunity.com/sharedfiles/filedetails/?id=2253087891)) defines the same
two defs under the same `defName`, `Sloth`. `About.xml` now declares the original in
`incompatibleWith`. Scenario L checks the resulting warning in the game.

No other mod in the local collection defines `Sloth`. Vanilla's **megasloth** is a different def
and a different animal, and is only a nuisance in the debug search box.

## What to search the log for

`Player.log` sits in
`%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.

| String in the log | Written by | What it would mean for this mod |
|---|---|---|
| `doesn't correspond to any field` | `DirectXmlToObject.ObjectFromXml` | The fault this port exists to fix. Expected count naming `wildness` or `RaceProperties`: **zero**. One line naming `wildness` means the old form came back. |
| `Could not load UnityEngine.Texture2D` | `ContentFinder<Texture2D>.Get` | A `texPath` with nothing behind it. The line names the path, so it says whether it is `Sloth/Sloth` or `Sloth/Dessicated_Sloth`. |
| `Failed to find any textures at` | `Graphic_Multi.Init` | The same fault one level up: no rotation found at all. |
| `Could not find parent node named` | `XmlInheritance.ResolveParents` | One of the two Core templates is gone: `AnimalThingBase` or `AnimalKindBase`. This mod declares no abstract def of its own. |
| `Adding duplicate` | `DefDatabase.Add` | The original mod is enabled alongside this port. |
| `Could not find type named` | `DirectXmlToObject.ClassTypeOf` | Check the named type and file; patches use explicit `Class` attributes, and defs also inherit Core types. |

Lines naming other mods are not ours to fix, and are worth leaving in whatever gets pasted back.

---

## A — the animal exists, and draws

The baseline. Everything else assumes this one passed.

- Dev mode on, spawn `Sloth` with the debug spawn-pawn action. Searching "sloth" also returns
  vanilla's **megasloth**; the one wanted is the small one, labelled just *sloth*.
- It draws as a small brown animal, walks, and is listed in the Wildlife tab. Finding it there
  proves nothing about natural spawning, since you put it there; scenario F is the one that settles
  that.
- Body size is 0.15, a fifth of an ordinary animal, so it is drawn very small. A sloth the size of
  a husky means the `<race>` block did not load and scenario B will confirm it.

## B — wildness reads on the information card

The one repair, and the only place it shows.

- Open a sloth's information card, Stats.
- **Wildness is listed, at 50%.** Listed is the point: `Wildness` declares `showIfUndefined` false,
  so the broken form did not print a wrong number, it printed **no line at all**.
- Compare with a hare, which is 75%, and a cat, which is 0%. A sloth showing no wildness line, or a
  number that is not 50%, is the fault back.
- Start a taming attempt and read the chance offered. At 0.50 it sits between the two, nowhere near
  certain.
- Search the log for `doesn't correspond to any field`. No line may name `wildness`.

## C — the negative control

Skip it and the mod looks correct without anyone having shown *why*.

- On a **copy** of `Mod/Defs/ThingDefs_Animals.xml`, move the line back: delete
  `<Wildness>0.50</Wildness>` from `statBases` and put `<wildness>0.50</wildness>` back inside
  `<race>`.
- Reload. The animal still loads, still draws, still walks. **Nothing looks wrong.**
- The information card now shows **no wildness line**, the taming chance jumps to near-certain, and
  the log has one line naming `wildness`.
- Restore the file. This scenario exists to be run once and written down, not kept.

## D — taming, training, and bonding

- Tame a sloth. It keeps the name *sloth*: `nameOnTameChance` is not set, so it is named only if a
  colonist bonds with it.
- Open the Training tab. **Nothing is trainable, not even Obedience.** `trainability` is `None`,
  which is rarer than it sounds: it means the animal can never haul, never rescue, never follow into
  combat. A sloth offering Obedience means the `<race>` block did not load.
- Petness is 0.15, low but not zero, so a colonist can still bond with one over time. Nothing to
  force here; note it if it happens.

## E — it never turns manhunter

Both chances are 0, which is unusual enough to be worth proving.

- Fail a taming attempt on a wild-spawned sloth, several times. It must never turn on the tamer.
- Shoot a tamed one, or set a colonist to hunt it and let it be wounded. It must never go manhunter.
- A sloth that turns means the `<race>` block half-loaded, and scenarios A and B should have caught
  that first.
- Separate question, worth one pass: the manhunter-pack **incident** is not governed by these two
  fields. Force it from the debug incident list a dozen times and note whether a sloth pack is ever
  offered. Nothing in the mod forbids it, and a pack of animals that cannot fight would be odd
  rather than broken.

## F — the biome patch

**The scenario that matters most.** Without it the animal is reachable by nothing but the debug
menu, which is the state the original shipped in.

- Start or reveal a **tropical rainforest** map. Watch for sloths in the Wildlife tab over several
  days or map rerolls. Absence alone is inconclusive because selection is random; at 0.5 against the monkey's 1 they should be a little rarer than monkeys.
- Same in **tropical swamp**, at 0.4.
- Check a temperate forest, a boreal forest and a desert: **no sloths**. A sloth in an unpatched
  biome means an xpath matched something it should not have.
- The patches are `PatchOperationAdd` on `Defs/BiomeDef[defName=…]/wildAnimals`. A failed operation
  writes `Patch operation … failed` to the log naming the xpath; a *successful* operation writes
  nothing, so the Wildlife tab is the real evidence.

**With the biome mods**, in `Patches/Biomes_Mods.xml`, each guarded by `PatchOperationFindMod`:

| Biome | Mod | Commonality |
|---|---|---|
| Cloud forest | More Vanilla Biomes | 0.5 |
| Miasmic mangrove | Alpha Biomes | 0.4 |
| Mycotic jungle | Alpha Biomes | 0.3 |
| Feralisk infested jungle | Alpha Biomes | 0.05 |

- Run once with **both mods off**: the log must stay silent. A guarded block that fires with its
  mod absent is the failure this guard exists to prevent, and it would log a failed patch operation
  naming a biome that does not exist.
- Run once with each mod on, and check its biomes. The feralisk jungle at 0.05 needs patience or
  several map rerolls; it is deliberately at the bottom of that biome's own scale.
- `PatchOperationFindMod` matches the mod's **name**, not its packageId. If a future version of
  either mod renames itself in `About.xml`, these blocks stop firing and **nothing is logged**.
  That is the silent failure mode of this file, and the only way to catch it is this scenario.
- Expect predation. The sloth moves at 0.7 c/s and cannot fight, so a good share of what spawns is
  eaten before a colonist walks past. A rainforest that seems short of sloths after a season is not
  a fault on its own; count what appears in the Wildlife tab, not what survives.

## G — trade

Its tags are `AnimalCommon`, which is what the original shipped and which no trader anywhere reads,
and `AnimalUncommon`, which this port added.

- Force an **exotic goods caravan** or an **exotic orbital ship** in the debug incident list, a few
  times. Only those two sell `AnimalUncommon` animals: bulk goods and regular settlements do not.
- A sloth in stock is the pass. Expect around **75 silver**.
- Sell one back at a settlement or to a pirate merchant, both of which buy that tag.
- Negative control worth running once: with `AnimalUncommon` removed, no trader on the map will
  handle a sloth in either direction. That was the original's state and it is what the tag fixes.

## H — food, hunger and cold

- `foodType` is `VegetarianRoughAnimal`: it grazes, and eats hay and raw plant food. Put kibble and
  meat in front of a hungry one and it must refuse both.
- `baseHungerRate` is 0.20, a fifth of normal. A tamed sloth left alone for a quadrum should not
  starve in a colony that feeds anything else.
- `ComfyTemperatureMin` is -30 on the information card. It is a tropical animal in name only; the
  number is the author's and was not touched.
- Move speed is 0.7 c/s on the card, against a colonist's 4.6. Watch one cross a room: the slowness
  is the mod's whole personality and it is visible without measuring.

## I — the four textures

Four files, byte-identical to the original's: three rotations of the living animal, one of the
dessicated corpse.

- Watch a sloth walk in each direction. **West is not shipped**; RimWorld mirrors `_east` when no
  `_west` exists, so a west-facing sloth showing its far side reversed is correct.
- The three life stages use the same texture at `drawSize` 1.0, 1.1 and 1.25. Spawn a baby and an
  adult side by side: the difference is small and deliberate.
- The body graphic declares `CutoutComplex` with a colour of `(110,95,82)` and **ships no mask
  file**. That shader reads a `_m` mask for its second colour; with none, the second colour simply
  goes unused and the tint still applies. Warm grey-brown is correct. A garish or untinted sloth
  means the colour did not load.
- **The dessicated corpse ships `_east` only.** A long-dead sloth is drawn from the side whichever
  way it lies. That is an upstream gap, left alone deliberately, and **not** a fault to report. Only
  check that it neither crashes nor logs.

## J — butchering and leather

- `leatherDef` is `Leather_Light`, which is vanilla's plain light leather, not a new material.
- Butcher one. The yield is tiny: body size 0.15 and health scale 0.5 make it a rounding error next
  to a muffalo. A sloth that butchers into a pile of leather means `baseBodySize` did not load.
- Sell value on the information card is 75 silver.

## K — breeding

Twelve in-game days of gestation, so this needs a long save or dev-mode ageing.

- Two tamed adults, opposite sexes, left together: `mateMtbHours` is 12, so mating is frequent.
- Gestation is 12 days and the litter curve peaks hard at **one**. Two at a time should be rare and
  three impossible.
- Life expectancy is 13 years. Age one up with dev tools and confirm it dies of old age rather than
  of something logged.

## L — the collision with the original

- On a disposable test configuration, enable the original alongside this port.
- Confirm the mod list warns about the incompatibility declared in `About.xml`.
  This declaration is a warning, not a guarantee that the user cannot proceed.
- Disable the original before loading a colony and confirm the warning disappears.
- Load with this port alone: no duplicate `Sloth` definitions should be reported.

## M — saves

- Add the mod to a running colony. Nothing already in the save changes, and nothing new appears on
  its own — see scenario F.
- Swap the original for this port in a save with tamed sloths. The `defName` is unchanged, so
  **every sloth already tamed survives the swap**, keeping its name and its bonds. The `packageId`
  did change, so the mod list will report the old mod as missing; that warning is expected and
  harmless.
- Remove the mod from a save with a sloth in it. The animal is destroyed, as with any content mod.
  Expected, and stated in the description.

## N — the mod list entry and the Workshop page

- The name reads `A Sloth Mod Renew (unofficial)`, the author line credits ThatRubishGamer first.
- `About/ModIcon.png` is drawn at about 32 px in the mod list. It is 128 × 128 and 24 Ko.
- `About/Preview.png` is 896 × 504 and about 520 Ko, under Steam's hard megabyte.
- Both images are new art made for this port and are named as such in `ATTRIBUTION.md`.

## O — other languages

- The mod ships **no translation files**, so in French the animal stays *sloth* and the description
  stays in English. That is the upstream state and is not a fault.
- Worth one look only to confirm nothing logs about a missing `Languages` folder, because nothing
  should: the folder's absence is normal.

## What cannot be tested offline

Scenarios F and G are the ones that matter and the ones no file can settle. Whether a sloth reaches
a colony depends on runtime selection: map generation reading the biome's animal list, and trader
stock generation reading the trade tags. Reading the defs shows only that both doors are now
unlocked, never that anyone walks through them. Everything else in this file is a reading of the
information card, which is exactly where the silent fault hid.

## Automated checks

Run from the repository root with PowerShell:

```powershell
./Tests/Test-Mod.ps1
```

The script checks XML parsing, metadata (including the unofficial suffix, GitHub description
link and original-mod incompatibility), the Wildness migration, race linkage, trader tag,
training/manhunter settings, life-stage alignment and referenced directional textures.
It applies the shipped XPath expressions and patch operations to synthetic biome fixtures in
four configurations: neither optional mod, each separately, and both together. It checks exact
commonalities, untouched wildlife and unpatched biomes. Missing patch targets fail the run.

These fixtures do not validate installed third-party biome names, Core inheritance, or the
actual RimWorld patch engine. Scenarios A–O remain necessary for runtime validation.

Latest offline run: 2026-09-12 — **PASS, 93 checks**.
Manual execution: **not run**. For each scenario record game version, active mods, steps,
observed result, PASS/FAIL/INCONCLUSIVE and any relevant log excerpt. Random non-occurrence
(spawning, stock, bonding) is inconclusive, not proof of a broken feature.
