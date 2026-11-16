# Test scenarios

Two defs, four textures, two patch operations, no assembly. Almost nothing here to break,
and the one thing that *was* broken broke **silently**. That is the whole reason this mod needs the
game rather than a file checker.

**An empty log is not a pass.** Original fault was a `<wildness>` element matching no field
in 1.6. It does log a line, but that line is one warning among hundreds at startup, and animal
loaded anyway and looked perfectly normal. Only information card settles it.

Port changed exactly one line; textures byte-identical to original's. So
most of what follows asks one question: *did ThatRubishGamer's animal survive the move intact?*
Exceptions: B and C, which test the repair, and F and G, which test the two changes this port
made on purpose so the animal can be met at all.

## Pickle scope

This mod ships no assembly, no `MainButtonDef`, no window, no button, so nothing
of its own making for Pickle to click through — no dialog it opens, no field it validates. That part
of the original reasoning stands. What was wrong: concluding from it that Pickle had
nothing to offer at all: `raw stat` and `was patched by mod`, both built into Pickle itself,
answer exactly the two facts that matter here without needing UI or even a save — see
`Tests/Pickle/README.md` for what they check and why def database alone is enough.

What a running game would show and Pickle's suite does not assert: whether sloth actually **spawns** on a generated map (scenario F), whether a trader actually **stocks** one (scenario G), whether ADS 2's Health tab actually **lists** the copied operations (scenario P). Those are outcomes of game's own map generation, trade-stock generation and another mod's list copy: mod's part (patch, tag, load order) is asserted, and disposition table below says what each of the nineteen scenarios became. Green Pickle run proves mechanism fired against real installed file; does not prove what a colonist sees.

**Evidence to keep, if a run is played and archived**: only `summary.md`, `summary.json`, `junit.xml` and the `evidence-complete.txt` marker of latest run per pass (minified 2026-10-01: `report.html`, `messages.ndjson` and `Player.log` deleted unless a failure needs the log). Every scenario is a def-database
assertion with no capture step and no `@review` tag, so a run's only useful output is its
pass/fail verdict and, on failure, attached stat/patch breakdown Pickle prints for that
scenario. One-line result per pass belongs in `Docs/runs/`, per `AGENTS.md`; full report
under `Tests/Pickle/Evidence/` is disposable once that line is written, per `AUDIT.md`'s Pickle
section on archived reports.

## Disposition of the nineteen scenarios (AUDIT.md 8.g and 8.k)

No manual scenario left to tick by hand: each automated, covered offline, or justified not applicable. Rule applied: test what mod ships (two Defs, four patches, load-order declarations), not what game does with them (`AUDIT.md`, "On ne teste pas le jeu"). `Tests/Test-Mod.ps1` (147 checks) pins every value of Defs; Pickle plays only what needs a running game.

| Scenario | Disposition |
|---|---|
| A exists and draws | Pickle: `04` spawns a live sloth; `07-labels-*` select it and assert `no errors were logged` |
| B wildness | Pickle `04` (stat read off a live animal) plus offline. The card line itself is the game's drawing: not applicable |
| C negative control | A one-time demonstration of the engine's handling of a broken def: not applicable |
| D, E taming, manhunter | Values pinned offline. Consequences are the engine's: not applicable |
| F natural spawn | **Automated, XML unit test**: `Test-Mod.ps1` applies shipped XPath and patch operations to synthetic biome fixtures (neither optional mod, each alone, both) and checks exact commonalities and untouched biomes. Pickle `01` and `02` assert against real installed defs that each patched biome lists the sloth among its wild animals (`the biome ... lists the wild animal`, DefFieldSteps). Which animals a generated map then picks is the engine's random selection: not tested |
| G trade | **Automated** (`08-trade`, pass `commerce`, TradeSteps; played 2026-10-10: the pirate-merchant scenario passed, the exotic-trader one hit `[no-stock]`, never replayed green, `Docs/runs/history.md`): (1) an exotic trader offers a sloth, tagged `@flaky-stock`: Pickle has no runtime skip, so a stockless trader fails with the prefix `[no-stock]`, read as a skip to study, not a defect; (2) a pirate merchant, which buys `AnimalUncommon`, takes the colony's sloth (deterministic). The tag is also pinned offline |
| H, J, K food, leather, breeding | Values of the original, pinned offline since 2026-10-10. Behaviour is the engine's: not applicable |
| I textures | Four files byte-identical to original's (checked offline). East-only dessicated corpse is original's gap: not applicable |
| L collision with the original | Pickle `06-incompat`, pass `incompat-slothmod` (green, 1 of 1 on 0e09424) |
| M saves | Add, swap, removal are engine's; `defName` unchanged (stated in README): not applicable |
| N mod list entry, images | Offline (`Check-Status.ps1`, file sizes). Numbers in N refreshed |
| O English and French | Pickle `07-labels-english` / `07-labels-french`, one pass per language (each 1 of 1 green on f156f38), `@review` captures read by Virginie |
| P ADS 2 load order and copy | Pickle `03` (green in with-optionals pass): load order, ADS 2's own copy ran, `InstallDentureAnimal` offered for race Sloth, and surgery recipes of Sloth match those of Husky (def-level read, DefFieldSteps; not the Health tab itself) |
| Q, R ADS 2 wrong order, absent | Q tests engine's load order; R is minimal pass (guarded patch silent): not applicable / covered by minimal pass |
| S Nocturnal Animals | Pickle `03` (loads after it, Sloth patched by this port). Schedule is that mod's behaviour: not applicable |

### Passes this mod needs

1. **Minimal** (`wsl-deps.sans-facultatifs.map`, which only stages DefFieldSteps): `01` and `04`; `02`, `03` and `06` skip on `@requires`. Exclude the two language features and `08`.
2. **With optionals** (`wsl-deps.avec-facultatifs.map`): `02` and `03` as well. Four optional mods do not conflict, one pass covers them.
3. **Declared incompatibility** (`wsl-deps.incompat-slothmod.map`): `06`, original A Sloth Mod mounted beside this port.
4. **Languages**: `07-labels-english` with `-Language English`, `07-labels-french` with `-Language French`.
5. **Gallery** (`wsl-deps.galerie.map`): `05`; captures opened by Virginie.
6. **Commerce** (`wsl-deps.commerce.map`): `08`.

## Translation checks — English and French

Run scenario A in each language. Inspect Wildlife, selected sloth, its information card,
trader stock, combat tool labels. English must show `sloth`, original description,
`left claw` and `right claw`; French must show `paresseux`, French description,
`griffe gauche` and `griffe droite`. Check baby, juvenile, adult sloths and a corpse
for generated labels, raw keys, English fallback, formatting errors, clipping.
Both language passes ran green (see disposition table); results in `Docs/runs/history.md`.

## Load order

```
nelim.aslothmod         this mod    after Core and all official expansions
```

`<loadAfter>` names Core and five expansions, all this mod strictly needs: inherits
`AnimalThingBase` and `AnimalKindBase` from Core, touches nothing else. Also names
`Mlie.XNDNocturnalAnimals`, optional, so that mod's `ExtendedRaceProperties` class is available
when `Compat_NocturnalAnimals.xml` attaches it. `<loadBefore>` separately names
`SamBucher.ADogSaidAnimalProsthetics2`, optional in other direction: see scenarios P through R.

**The original must stay off.** `ThatRubishGamer.RubishMods.SlothMod`
([2253087891](https://steamcommunity.com/sharedfiles/filedetails/?id=2253087891)) defines same
two defs under same `defName`, `Sloth`. `About.xml` now declares original in
`incompatibleWith`. Scenario L checks resulting warning in game.

No other mod in local collection defines `Sloth`. Vanilla's **megasloth** is a different def
and different animal, only a nuisance in debug search box.

## What to search the log for

`Player.log` sits in
`%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.

| String in the log | Written by | What it would mean for this mod |
|---|---|---|
| `doesn't correspond to any field` | `DirectXmlToObject.ObjectFromXml` | The fault this port exists to fix. Expected count naming `wildness` or `RaceProperties`: **zero**. One line naming `wildness` means old form came back. |
| `Could not load UnityEngine.Texture2D` | `ContentFinder<Texture2D>.Get` | A `texPath` with nothing behind it. Line names path, so says whether `Sloth/Sloth` or `Sloth/Dessicated_Sloth`. |
| `Failed to find any textures at` | `Graphic_Multi.Init` | Same fault one level up: no rotation found at all. |
| `Could not find parent node named` | `XmlInheritance.ResolveParents` | One of two Core templates gone: `AnimalThingBase` or `AnimalKindBase`. This mod declares no abstract def of its own. |
| `Adding duplicate` | `DefDatabase.Add` | Original mod enabled alongside this port. |
| `Could not find type named` | `DirectXmlToObject.ClassTypeOf` | Check named type and file; patches use explicit `Class` attributes, defs also inherit Core types. |

Lines naming other mods not ours to fix, worth leaving in whatever gets pasted back.

---

## A — the animal exists, and draws

Baseline. Everything else assumes this one passed.

- Dev mode on, spawn `Sloth` with debug spawn-pawn action. Searching "sloth" also returns
  vanilla's **megasloth**; wanted one is small one, labelled just *sloth*.
- Draws as small brown animal, walks, listed in Wildlife tab. Finding it there
  proves nothing about natural spawning, since you put it there; scenario F settles
  that.
- Body size 0.15, a fifth of ordinary animal, so drawn very small. Sloth size of
  a husky means `<race>` block did not load; scenario B will confirm.

## B — wildness reads on the information card

The one repair, only place it shows.

- Open sloth's information card, Stats.
- **Wildness listed, at 50%.** Listed is the point: `Wildness` declares `showIfUndefined` false,
  so broken form did not print wrong number, it printed **no line at all**.
- Compare with hare, 75%, and cat, 0%. Sloth showing no wildness line, or number not 50%, is
  the fault back.
- Start taming attempt, read chance offered. At 0.50 sits between the two, nowhere near
  certain.
- Search log for `doesn't correspond to any field`. No line may name `wildness`.

## C — the negative control

Skip it and mod looks correct without anyone having shown *why*.

- On a **copy** of `Mod/Defs/ThingDefs_Animals.xml`, move line back: delete
  `<Wildness>0.50</Wildness>` from `statBases` and put `<wildness>0.50</wildness>` back inside
  `<race>`.
- Reload. Animal still loads, draws, walks. **Nothing looks wrong.**
- Information card now shows **no wildness line**, taming chance jumps to near-certain, and
  log has one line naming `wildness`.
- Restore file. Scenario exists to be run once and written down, not kept.

## D — taming, training, and bonding

- Tame a sloth. Keeps name *sloth*: `nameOnTameChance` not set, so named only if a
  colonist bonds with it.
- Open Training tab. **Nothing trainable, not even Obedience.** `trainability` is `None`,
  rarer than it sounds: animal can never haul, never rescue, never follow into
  combat. Sloth offering Obedience means `<race>` block did not load.
- Petness 0.15, low but not zero, so colonist can still bond with one over time. Nothing to
  force here; note it if it happens.

## E — it never turns manhunter

Both chances 0, unusual enough to be worth proving.

- Fail taming attempt on wild-spawned sloth, several times. Must never turn on tamer.
- Shoot tamed one, or set colonist to hunt it and let it be wounded. Must never go manhunter.
- Sloth that turns means `<race>` block half-loaded; scenarios A and B should have caught
  that first.
- Separate question, worth one pass: manhunter-pack **incident** not governed by these two
  fields. Force it from debug incident list a dozen times and note whether sloth pack ever
  offered. Nothing in mod forbids it; pack of animals that cannot fight would be odd
  rather than broken.

## F — the biome patch

**Scenario that matters most.** Without it animal reachable by nothing but debug
menu, state original shipped in.

- Start or reveal **tropical rainforest** map. Watch for sloths in Wildlife tab over several
  days or map rerolls. Absence alone inconclusive because selection random; at 0.5 against monkey's 1 they should be a little rarer than monkeys.
- Same in **tropical swamp**, at 0.4.
- Check temperate forest, boreal forest, desert: **no sloths**. Sloth in unpatched
  biome means xpath matched something it should not have.
- Patches are `PatchOperationAdd` on `Defs/BiomeDef[defName=…]/wildAnimals`. Failed operation
  writes `Patch operation … failed` to log naming xpath; *successful* operation writes
  nothing, so Wildlife tab is real evidence.

**With the biome mods**, in `Patches/Biomes_Mods.xml`, each guarded by `PatchOperationFindMod`:

| Biome | Mod | Commonality |
|---|---|---|
| Cloud forest | More Vanilla Biomes | 0.5 |
| Miasmic mangrove | Alpha Biomes | 0.4 |
| Mycotic jungle | Alpha Biomes | 0.3 |
| Feralisk infested jungle | Alpha Biomes | 0.05 |

- Run once with **both mods off**: log must stay silent. Guarded block firing with its
  mod absent is the failure this guard exists to prevent, would log failed patch operation
  naming nonexistent biome.
- Run once with each mod on, check its biomes. Feralisk jungle at 0.05 needs patience or
  several map rerolls; deliberately at bottom of that biome's own scale.
- `PatchOperationFindMod` matches mod's **name**, not packageId. If future version of
  either mod renames itself in `About.xml`, these blocks stop firing and **nothing is logged**.
  That is silent failure mode of this file, only way to catch it is this scenario.
- Expect predation. Sloth moves at 0.7 c/s and cannot fight, so good share of what spawns is
  eaten before colonist walks past. Rainforest seeming short of sloths after a season is not
  a fault on its own; count what appears in Wildlife tab, not what survives.

## G — trade

Tags are `AnimalCommon`, what original shipped and which no trader anywhere reads,
and `AnimalUncommon`, which this port added.

- Force **exotic goods caravan** or **exotic orbital ship** in debug incident list, a few
  times. Only those two sell `AnimalUncommon` animals: bulk goods and regular settlements do not.
- Sloth in stock is the pass. Expect around **75 silver**.
- Sell one back at settlement or to pirate merchant, both buy that tag.
- Negative control worth running once: with `AnimalUncommon` removed, no trader on map will
  handle sloth in either direction. Original's state, what tag fixes.

## H — food, hunger and cold

- `foodType` is `VegetarianRoughAnimal`: grazes, eats hay and raw plant food. Put kibble and
  meat in front of hungry one and it must refuse both.
- `baseHungerRate` 0.20, a fifth of normal. Tamed sloth left alone for a quadrum should not
  starve in colony that feeds anything else.
- `ComfyTemperatureMin` is -30 on information card. Tropical animal in name only; number is
  author's and was not touched.
- Move speed 0.7 c/s on card, against colonist's 4.6. Watch one cross a room: slowness
  is mod's whole personality, visible without measuring.

## I — the four textures

Four files, byte-identical to original's: three rotations of living animal, one of
dessicated corpse.

- Watch sloth walk in each direction. **West not shipped**; RimWorld mirrors `_east` when no
  `_west` exists, so west-facing sloth showing far side reversed is correct.
- Three life stages use same texture at `drawSize` 1.0, 1.1 and 1.25. Spawn baby and
  adult side by side: difference small and deliberate.
- Body graphic declares `CutoutComplex` with colour `(110,95,82)` and **ships no mask
  file**. That shader reads `_m` mask for second colour; with none, second colour simply
  goes unused and tint still applies. Warm grey-brown correct. Garish or untinted sloth
  means colour did not load.
- **Dessicated corpse ships `_east` only.** Long-dead sloth drawn from side whichever
  way it lies. Upstream gap, left alone deliberately, **not** a fault to report. Only
  check it neither crashes nor logs.

## J — butchering and leather

- `leatherDef` is `Leather_Light`, vanilla's plain light leather, not new material.
- Butcher one. Yield tiny: body size 0.15 and health scale 0.5 make it rounding error next
  to muffalo. Sloth butchering into pile of leather means `baseBodySize` did not load.
- Sell value on information card is 75 silver.

## K — breeding

Twelve in-game days of gestation, so needs long save or dev-mode ageing.

- Two tamed adults, opposite sexes, left together: `mateMtbHours` is 12, so mating frequent.
- Gestation 12 days and litter curve peaks hard at **one**. Two at a time should be rare and
  three impossible.
- Life expectancy 13 years. Age one up with dev tools and confirm it dies of old age rather
  than of something logged.

## L — the collision with the original

- On disposable test configuration, enable original alongside this port.
- Confirm mod list warns about incompatibility declared in `About.xml`.
  Declaration is a warning, not guarantee user cannot proceed.
- Disable original before loading colony and confirm warning disappears.
- Load with this port alone: no duplicate `Sloth` definitions should be reported.

## M — saves

- Add mod to running colony. Nothing already in save changes, nothing new appears on
  its own — see scenario F.
- Swap original for this port in save with tamed sloths. `defName` unchanged, so
  **every sloth already tamed survives the swap**, keeping name and bonds. `packageId`
  did change, so mod list will report old mod as missing; warning expected and
  harmless.
- Remove mod from save with sloth in it. Animal destroyed, as with any content mod.
  Expected, stated in description.

## N — the mod list entry and the Workshop page

- Name reads `A Sloth Mod Renew (unofficial)`, author line credits ThatRubishGamer first.
- `About/ModIcon.png` drawn at about 32 px in mod list. It is 128 × 128 and about 30 Ko (29,693 bytes at the 2026-10-10 render).
- `About/Preview.png` is 896 × 504 and about 550 Ko, under Steam's hard megabyte.
- Both images new art made for this port, named as such in `ATTRIBUTION.md`.

## O — English and French localization

Preconditions: RimWorld 1.6, this port enabled and original disabled; dev mode available.
Use disposable new colony and copy of existing save containing sloths. English text
comes from original Def values; French uses two shipped DefInjected files.

- Select English, restart as prompted, run scenario A. Inspect Wildlife, selected sloth,
  its information card, trader stock (scenario G) and both claw tool labels. Expect `sloth`,
  English description from ThingDefs_Animals.xml, `left claw` and `right claw`.
- Select French, restart as prompted, repeat. Expect `paresseux`, complete description
  from Languages/French/DefInjected/ThingDef/Sloth.xml, `griffe gauche` and `griffe droite`.
  PawnKind label must also be `paresseux`; English fallback for these owned texts fails.
- Inspect baby, juvenile, adult sloths and a corpse in each language. Generated labels
  must use selected language and translated animal name, without raw keys, broken
  formatting or clipped text. Core-owned life-stage and corpse wording uses Core translations.
- Save and reload existing test colony in each language; repeat label and information
  card checks. Switch back to English and verify English texts return.
- Review Player.log after each language run: expect no translation/injection errors naming
  this mod or its Sloth fields. Record game version, active mods, language, save type,
  observed results, relevant log excerpts in STATUS.md. Missing trader stock is
  inconclusive for that surface, not translation failure.

Execution: **not run**. Expected results, not runtime validation claim.

## P — A Dog Said... Animal Prosthetics 2, load order correct

Same shape as Dalmatians Renew's scenario C, same mechanism: ADS 2 keeps its own
`recipeUsers` lists and copies them onto real surgery recipes at its own load time, so
addition made after that copy goes into list nothing reads again.

- Enable ADS 2, this mod **before** it in list, as `<loadBefore>` asks.
- Tame sloth and husky. Open Health tab of each, then operations list.
- **Two lists must match**: prosthetic and bionic limb installs, and old-wound treatment, on
  both. Sloth offering only amputation means addition did not reach ADS 2's copy in time.

## Q — A Dog Said... Animal Prosthetics 2, load order wrong

Negative control. Skip it and `<loadBefore>` is a claim nobody checked.

- Same as P, but move this mod **after** ADS 2 in list.
- Expect sloth's operations **gone**, husky's unaffected, nothing in log to
  say why. If still there in this configuration, load-order claim above is wrong and
  needs correcting, not celebrating.

## R — A Dog Said... Animal Prosthetics 2 absent

- Enable this mod with ADS 2 switched off entirely.
- Must load, sloth must be whole, and `Compat_ADogSaidAnimalProsthetics2.xml` must say
  nothing: `PatchOperationFindMod` finding no match silent by design.
- Health tab then offers vanilla amputation and euthanasia only.

## S — Nocturnal Animals (Continued)

- Enable `Mlie.XNDNocturnalAnimals` alongside this mod, either load order: this patch only adds
  ModExtension to sloth's own def, does not depend on that mod's own patches running
  first or last.
- Watch tamed sloth's schedule over full day. Should sleep through most daylight hours
  and be active mostly at night, matching animal's own description.
- With mod absent, confirm sloth keeps vanilla animal behavior and nothing logs.

## What cannot be tested offline

Map draw of F, trader draw of G, Health tab of P depend on runtime selection: map generation reading biome's animal list, trader stock generation reading trade tags, one mod's patch reading list another mod's patch just changed. Reading defs shows only these doors unlocked, never that anyone walks through them. Mod's own part asserted for F and G (XML unit tests); G's stock and P's Health-tab list recorded as not applicable above, pending Virginie's confirmation.

## Automated checks

Run from repository root with PowerShell:

```powershell
./Tests/Test-Mod.ps1
```

Script checks XML parsing, metadata (including unofficial suffix, GitHub description
link and original-mod incompatibility), Wildness migration, race linkage, trader tag,
training/manhunter settings, life-stage alignment and referenced directional textures.
Applies shipped XPath expressions and patch operations to synthetic biome fixtures in
four configurations: neither optional mod, each separately, both together. Checks exact
commonalities, untouched wildlife, unpatched biomes. Missing patch targets fail run.

Fixtures do not validate installed third-party biome names, Core inheritance, or
actual RimWorld patch engine. Disposition table above says which scenarios Pickle plays and which not applicable.

Latest offline run: 2026-10-13, **PASS, 147 checks** (history of earlier runs: `Docs/runs/`).
Manual execution: none by hand; nineteen scenarios automated, covered offline or not applicable (disposition table). For each scenario record game version, active mods, steps,
observed result, PASS/FAIL/INCONCLUSIVE, any relevant log excerpt. Random non-occurrence
(spawning, stock, bonding) inconclusive, not proof of broken feature.