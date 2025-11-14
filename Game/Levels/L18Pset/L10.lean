import Game.Levels.L18Pset.L09
open Finset

World "L18Pset"
Level 10
Title "DiffGoesToZero"
Introduction "
# Level 10: `DiffGoesToZero`

Prove `DiffGoesToZero`:

"

DisabledTheorem DiffGoesToZero

/-- Prove `DiffGoesToZero`
-/
Statement  {a : ℕ → ℝ} (aLim : SeqLim a 0) : SeqLim (fun n ↦ ∑ k ∈ range (2 * n + 1), (-1)^k * a k - ∑ k ∈ range (2 * n), (-1)^k * a k) 0 := by sorry



Conclusion "
"
