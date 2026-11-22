# In-game scenarios, run by Pickle

Run inside live RimWorld by [Pickle](https://github.com/RimWorks/Rimworld-Pickle)
(`rimworks.pickle`, Workshop 3791648678). `Mod/` = companion mod **A Sloth Mod Renew -
Pickle tests**, never published, holds feature files. Only Pickle built-in vocabulary: no PickleTools step, no local C#. Port ships only XML (two Defs, four guarded patches), so no custom step needed.

| Feature | Checks | Needs a save |
| --- | --- | --- |
| 01-repair | Both defs load; two vanilla biome patches applied | No |
| 02-optional-biomes | Cloud forest patched when More Vanilla Biomes present; three Alpha Biomes jungles patched when present | No |
| 03-compat | ADS 2: port loads before it, own copy ran on concrete recipe. Nocturnal Animals (Continued): port loads after it, Sloth def patched | No |
| 04-sloth-stat | `Wildness` = 0.5 on live spawned sloth, the core fact port repairs | Yes (`test-colony`) |
| 05-gallery | Two `@review` captures for Workshop gallery (one sloth, then three, in Sanctuary's `flower-garden`); `galerie` pass only | Yes (`Nelims-tribe`) |
| 08-trade | Exotic trader offers sloth (`@flaky-stock`, may fail `[no-stock]`); pirate merchant takes colony sloth | Yes (`test-colony`) |
| 06-incompat | `incompat-slothmod` pass only: original A Sloth Mod mounted beside port, both stay loaded, in order (scenario L) | No |
| 07-labels-english, 07-labels-french | Sloth named `sloth` / `paresseux` in inspect pane, with `@review` capture; one language per pass (scenario O) | Yes (`test-colony`) |

Only 04 loads save: animal must exist to read. Rest reads def database at main menu.

**Not covered here, on purpose**, still only checkable by playing (`../../TESTING.md` explains each): sloth actually spawning on generated rainforest/swamp map (scenario F), trader actually offering one (scenario G), ADS 2 Health tab actually listing copied operations in play (scenario P). "Was patched" pass proves mechanism fired against real installed file, not what colonist sees.

**What first three runs taught, 2026-09-28** (`fa14`, `f197`, `2ae1`; all suite's own mistakes, none mod's, invisible to `Tests/Test-Mod.ps1` synthetic fixtures):

- `was patched by mod` matches mod **display name**, not packageId, unlike `mod {string}
  is loaded`.
- `Sloth` names both `ThingDef` and `PawnKindDef`. `raw stat` refuses ambiguity; `of type` qualifier its message suggests exists only on `exists`: `raw stat ... of type` and
  `was patched ... of type` are undefined steps. `was patched` accepts shared name as-is; for stat, 04 reads spawned animal instead, stronger anyway.
- **Pickle cannot see Abstract def.** `ADS_Cat1/2/3` = abstract RecipeDefs, kept only as XPath targets; lookup reports "no def named 'ADS_Cat1' in any database". 03 asserts the two facts patch depends on instead: load order, and ADS 2 own copy on `InstallDentureAnimal`.
- Staging script no recursive dependency resolution: Alpha Biomes needs Vanilla Expanded Framework; without it first with-optionals run stalled (`98ce`).

## Setup, once

1. Enable Pickle.
2. Stage `ASlothModRenew` via shared launcher (below); enables `A Sloth Mod Renew` then this companion.

## Passes

- **Minimal** (`wsl-deps.sans-facultatifs.map`, stages DefFieldSteps only; `01` and `04` apply; `02`, `03`, `06` skip on `@requires`).
- **With optionals** (`wsl-deps.avec-facultatifs.map`, also names this mod between Nocturnal Animals and ADS 2 to set declared load order): all four mods port has guarded patch for, together. None conflict, so one pass covers all four, not one per mod.
- **Incompat-slothmod** (`wsl-deps.incompat-slothmod.map`): mounts original A Sloth Mod (2253087891), declared in `About.xml` `incompatibleWith`; only `06` applies. Answers one question: incompatibility still true?
- **Languages**: one pass per language, `-Language English` with `-Filter '07-labels-english'` and
  `-Language French` with `-Filter '07-labels-french'`. Whole-suite run must exclude both
  (`-Filter 'A Sloth Mod Renew - Pickle tests,!07-labels-english,!07-labels-french'`), since one fails in any given language by design.
- **Galerie** (`wsl-deps.galerie.map`, Sanctuary minimum mod list plus port): `05` only.
- **Commerce** (`wsl-deps.commerce.map`, TradeSteps): `08` only; `[no-stock]` failures of `@flaky-stock` scenario = skips to study.

## Run

- **In game**: dev mode on, debug actions menu, *Pickle*, tick suite, *Run selected*.
- **Unattended, minimal pass**:
  `powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod ASlothModRenew`.
- **Unattended, with optionals**:
  `powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod ASlothModRenew -DepMap wsl-deps.avec-facultatifs.map`.
  `-DepMap` takes bare filename, looked up in `Tests/Pickle/`; path separator makes it full path, so relative one fails to resolve.
- No session launches either directly: deposit both as tickets with `Submit-PickleRun.ps1` instead. See `AUDIT.md`, "Déposer un run au lieu de le lancer".

No OS input clicks, no window opened.