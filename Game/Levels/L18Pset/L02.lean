import Game.Levels.L18Pset.L01
open Finset

World "L18Pset"
Level 2
Title "Series_abs_add"
Introduction "
# Level 2: `Series_abs_add`

Prove `Series_abs_add`:

"

DisabledTheorem Series_abs_add

/-- Prove `Series_abs_add`
-/
Statement (a : ℕ → ℝ) {n m : ℕ} (hmn : n ≤ m) :
  |∑ k ∈ Ico n m, a k| ≤ ∑ k ∈ Ico n m, |a k| := by
sorry

Conclusion "
"
