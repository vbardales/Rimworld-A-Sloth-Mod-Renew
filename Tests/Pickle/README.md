# In-game scenarios, run by Pickle

Played inside a running RimWorld by [Pickle](https://github.com/RimWorks/Rimworld-Pickle)
(`rimworks.pickle`, Workshop 3791648678). `Mod/` is a companion mod, **A Sloth Mod Renew -
Pickle tests**, never published: it holds the feature files. It uses only Pickle's own built-in
vocabulary - no PickleTools step, no local C# - because everything this port ships is XML: two
Defs and four guarded patches, nothing a custom step would be needed to reach.

| Feature | Checks | Needs a save |
| --- | --- | --- |
| 01-repair | Both defs load; `Wildness` reads 0.5 from `statBases`, the whole reason this port exists; the two vanilla biome patches applied | No |
| 02-optional-biomes | Cloud forest patched when More Vanilla Biomes is present; the three Alpha Biomes jungles patched when it is present | No |
| 03-compat | Sloth added to ADS 2's three surgery categories; Sloth patched with a nocturnal cycle when Nocturnal Animals (Continued) is present | No |

Every scenario reads the def database at the main menu. None loads a save, because nothing this
port checks needs one: `raw stat` and `was patched by mod` both read facts settled once loading
ends, before any colony exists. That is also the whole reason none of it needed new steps -
see `PickleTools/docs/steps.md` and `Rimworld-Pickle`'s own `Docs/steps.md`, "Defs" section:
"An XML-only mod can test everything it ships this way."

**Not covered here, on purpose**, and still only checkable by playing (`../../TESTING.md`
explains why for each): whether the sloth actually spawns on a generated rainforest or swamp map
(scenario F), whether a trader actually offers one for sale (scenario G), and whether ADS 2's
Health tab actually lists the copied operations in play (scenario P). A "was patched" pass proves
the mechanism fired against the real installed file; it does not prove what a colonist sees.

**Known uncertainty, 03-compat's first scenario**: `ADS_Cat1`/`Cat2`/`Cat3` are `Abstract="True"`
RecipeDefs, kept only as XPath patch targets, and it is not verified here that Pickle's `def`
lookup can resolve an Abstract def by name. See the comment in the feature file for the fallback
if a run reports "no such def" instead of a pass or a fail.

## Setup, once

1. Enable Pickle.
2. Stage `ASlothModRenew` through the shared launcher (below); it enables `A Sloth Mod Renew`
   then this companion.

## Passes

- **Minimal** (`01-repair` only applies; `02` and `03` skip every scenario on `@requires`): no
  `-DepMap` needed.
- **With optionals** (`wsl-deps.avec-facultatifs.map`): all four mods this port has a guarded
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

Nothing here clicks through OS input, opens a window, or needs a fixture.
