import Game.Levels.L17Pset.L05
open Finset

World "L17Pset"
Level 2
Title "The Comparison Test"
Introduction "
# Level 6: The Comparison Test

Prove the `ComparisonTest`: if `a n` is dominated by a convergent series,
then it also converges.

"
/-- If `0 ≤ a n ≤ b n` and `Series b` converges, then so does `Series a`.
-/
TheoremDoc ComparisonTest as "ComparisonTest" in "Series"

Statement ComparisonTest {a b : ℕ → ℝ} (ha : ∀ n, 0 ≤ a n) (hab : ∀ n, a n ≤ b n)
  (hb : SeriesConv b) : SeriesConv a := by
choose L hL using hb
apply SeqConvOfMonotoneBdd (Series a) L
intro n
have habBnd := SeriesOrderThm hab n
by_contra h
push_neg at h
have : L < Series b n := by linarith [h, habBnd]

sorry
sorry

Conclusion "
"
