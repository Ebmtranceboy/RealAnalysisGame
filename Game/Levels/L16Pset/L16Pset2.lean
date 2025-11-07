import Game.Levels.L16Lecture

open Finset

World "L16Pset"
Level 2
Title "Problem 2"

Introduction "
# Problem 2: Prove that multiplying a series by a constant scales its sum accordingly.

"

/-- The partial sums of the series `∑ k, c * a k` is equal to that of `c * ∑ k, a k`.
-/
TheoremDoc SeriesConstMul as "SeriesConstMul" in "Theorems"

/-- Prove this
-/
Statement SeriesConstMul (a b : ℕ → ℝ) (c : ℝ) (hb : ∀ n, b n = c * a n) : ∀ n, Series b n = c * Series a n := by
sorry

Conclusion ""
