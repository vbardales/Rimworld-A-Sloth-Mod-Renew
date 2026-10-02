# In-game scenarios, run by Pickle

Played inside a running RimWorld by [Pickle](https://github.com/RimWorks/Rimworld-Pickle)
(`rimworks.pickle`, Workshop 3791648678). `Mod/` is a companion mod, **A Sloth Mod Renew -
Pickle tests**, never published: it holds the feature files. It uses only Pickle's own built-in
vocabulary - no PickleTools step, no local C# - because everything this port ships is XML: two
Defs and four guarded patches, nothing a custom step would be needed to reach.

| Feature | Checks | Needs a save |
| --- | --- | --- |
| 01-repair | Both defs load; the two vanilla biome patches applied | No |
| 02-optional-biomes | Cloud forest patched when More Vanilla Biomes is present; the three Alpha Biomes jungles patched when it is present | No |
| 03-compat | With ADS 2: this port loads before it and its own copy ran on a concrete recipe. With Nocturnal Animals (Continued): this port loads after it and the Sloth def was patched | No |
| 04-sloth-stat | `Wildness` reads 0.5 on a live spawned sloth, the fact this whole port repairs | Yes (`test-colony`) |
| 05-gallery | Two `@review` captures for the Workshop gallery (three sloths, then one, in the zen meadow studio); pass `galerie` only | Yes (`nelim-zen-meadow-studio`) |

Only 04 loads a save, because an animal has to exist to be read. Everything else reads the def
database at the main menu.

**Not covered here, on purpose**, and still only checkable by playing (`../../TESTING.md`
explains why for each): whether the sloth actually spawns on a generated rainforest or swamp map
(scenario F), whether a trader actually offers one for sale (scenario G), and whether ADS 2's
Health tab actually lists the copied operations in play (scenario P). A "was patched" pass proves
the mechanism fired against the real installed file; it does not prove what a colonist sees.

**What the first three runs taught, 2026-09-28** (`fa14`, `f197`, `2ae1`; all the suite's own
mistakes, none the mod's, and invisible to `Tests/Test-Mod.ps1`'s synthetic fixtures):

- `was patched by mod` matches the mod's **display name**, not its packageId, unlike `mod {string}
  is loaded`.
- `Sloth` names both a `ThingDef` and a `PawnKindDef`. `raw stat` refuses the ambiguity, and the
  `of type` qualifier its message suggests exists only on `exists`: `raw stat ... of type` and
  `was patched ... of type` are undefined steps. `was patched` accepts the shared name as it is;
  for the stat, 04 reads a spawned animal instead, which is stronger anyway.
- **Pickle cannot see an Abstract def.** `ADS_Cat1/2/3` are abstract RecipeDefs, kept only as
  XPath targets, and the lookup reports "no def named 'ADS_Cat1' in any database". 03 asserts the
  two facts the patch depends on instead: load order, and ADS 2's own copy on `InstallDentureAnimal`.
- The staging script does not resolve a mod's dependencies recursively: Alpha Biomes needs
  Vanilla Expanded Framework, and without it the first with-optionals run stalled (`98ce`).

## Setup, once

1. Enable Pickle.
2. Stage `ASlothModRenew` through the shared launcher (below); it enables `A Sloth Mod Renew`
   then this companion.

## Passes

- **Minimal** (`01` and `04` apply; `02` and `03` skip every scenario on `@requires`): no
  `-DepMap` needed.
- **With optionals** (`wsl-deps.avec-facultatifs.map`, which also names this mod itself between Nocturnal Animals and ADS 2 to set its declared load order): all four mods this port has a guarded
  patch for, together - none conflicts with another, so one pass covers all four rather than one
  per mod.

## Run

- **In game**: dev mode on, debug actions menu, *Pickle*, tick the suite, *Run selected*.
- **Unattended, minimal pass**:
  `powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod ASlothModRenew`.
- **Unattended, with optionals**:
  `powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod ASlothModRenew -DepMap wsl-deps.avec-facultatifs.map`.
  `-DepMap` takes a bare filename, looked for in `Tests/Pickle/`; a path separator makes it a
  full path instead, which a relative one then fails to resolve.
- No session launches either directly: deposit both as tickets with `Submit-PickleRun.ps1`
  instead - see `AUDIT.md`, "Déposer un run au lieu de le lancer".

Nothing here clicks through OS input or opens a window.
