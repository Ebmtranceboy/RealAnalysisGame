import Game.Levels.L17Lecture
open Finset

World "L17Pset"
Level 1
Title "Monotonicity of Series"
Introduction "
# Level 1: Monotonicity of Series

Prove `MonotoneOfNonNegSeries`:
If `0 ≤ a n`, then `Series a` is Monotone.

"
/-- If `a : ℕ → ℝ` is nonnegative, then `Series a` is `Monotone`.
-/
TheoremDoc MonotoneOfNonNegSeries as "MonotoneOfNonNegSeries" in "Series"

Statement MonotoneOfNonNegSeries {a : ℕ → ℝ} (ha : ∀ n, 0 ≤ a n) : Monotone (Series a) := by
sorry


Conclusion "
"
