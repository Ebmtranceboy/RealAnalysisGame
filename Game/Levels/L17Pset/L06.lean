import Game.Levels.L17Levels.L05
open Finset

World "Lecture17"
Level 6
Title "The Comparison Test"
Introduction "
# Level 6: The Comparison Test

More generally, if `a n` is dominated by a convergent series,
then it also converges.

"
/-- If `0 ≤ a n ≤ b n` and `Series b` converges, then so does `Series a`.
-/
TheoremDoc ComparisonTest as "ComparisonTest" in "Theorems"

Statement ComparisonTest (a b : ℕ → ℝ) (ha : ∀ n, 0 ≤ a n) (hab : ∀ n, a n ≤ b n) (hb : SeriesConv b) : SeriesConv a := by
choose L hL using hb
apply SeqConvOfMonotoneBdd (Series a) L
intro n
sorry
sorry

Conclusion "
"
