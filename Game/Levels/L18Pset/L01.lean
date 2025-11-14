import Game.Levels.L18Lecture
open Finset

World "L18Pset"
Level 1
Title "DiffOfSeries"
Introduction "
# Level 1: `DiffOfSeries`

Prove `DiffOfSeries`.

## New Theorem: `sum_Ico_succ`.

"

DisabledTheorem DiffOfSeries

theorem sum_Ico_succ {M : Type*} [AddCommMonoid M] {a b : ℕ} (hab : a ≤ b) (f : ℕ → M) :
    (∑ k ∈ Ico a (b + 1), f k) = (∑ k ∈ Ico a b, f k) + f b := by
apply sum_Ico_succ_top hab

/-- This is the analog of `sum_range_succ` to summing on intervals. -/
TheoremDoc sum_Ico_succ as "sum_Ico_succ" in "Theorems"

NewTheorem sum_Ico_succ

/-- Prove `DiffOfSeries`
-/
Statement (a : ℕ → ℝ) {n m : ℕ} (hmn : n ≤ m) :
  Series a m - Series a n = ∑ k ∈ Ico n m, a k := by
sorry

Conclusion "
"
