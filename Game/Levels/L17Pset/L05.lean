import Game.Levels.L17Lecture
open Finset

World "L17Pset"
Level 1
Title "Monotonicity of Series"
Introduction "
# Level 1: Monotonicity of Series

Prove `Monotone_of_NonNegSeries`:
If `0 ≤ a n`, then `Series a` is Monotone.

"
/-- If `a : ℕ → ℝ` is nonnegative, then `Series a` is `Monotone`.
-/
TheoremDoc Monotone_of_NonNegSeries as "Monotone_of_NonNegSeries" in "Series"

Statement Monotone_of_NonNegSeries {a : ℕ → ℝ} (ha : ∀ n, 0 ≤ a n) : Monotone (Series a) := by
sorry


Conclusion "
"
