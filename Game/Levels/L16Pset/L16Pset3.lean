import Game.Levels.L16Lecture

open Finset

World "L16Pset"
Level 3
Title "Problem 3"

Introduction "
# Problem 3: Prove that the sum of two series is the series of the sum.

"

/-- The partial sums of the series `∑ k, a k + b k` is equal to that of `∑ k, a k + ∑ k, b k`.
-/
TheoremDoc SeriesAdd as "SeriesAdd" in "Theorems"

/-- Prove this
-/
Statement SeriesAdd (a b c : ℕ → ℝ) (h : ∀ n, c n = a n + b n) : ∀ n, Series c n = Series a n + Series b n := by
sorry

Conclusion ""
