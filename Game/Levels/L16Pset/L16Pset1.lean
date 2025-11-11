import Game.Levels.L16Lecture

open Finset

World "L16Pset"
Level 1
Title "Problem 1"

Introduction "
# Problem 1: Finite geometric series

"

/-- For any real `x` and natural number `n`,
`(1-x)*(1+...+x^(n-1)) = 1- x^n`.
-/
TheoremDoc FiniteGeomSeries as "FiniteGeomSeries" in "Series"

/-- Prove this
-/
Statement FiniteGeomSeries (x : ℝ) (n : ℕ) : (1 - x) * ∑ k ∈ range n, x ^ k = 1 - x ^ n := by
sorry

Conclusion ""
