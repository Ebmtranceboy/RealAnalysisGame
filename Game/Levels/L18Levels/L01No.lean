import Game.Levels.L17Lecture

open Finset

World "Lecture18"
Level 1
Title "Absolute Convergence Implies Convergence"
Introduction "
# Level 1: Absolute Convergence Implies Convergence

A series `Series a` is said to converge *absolutely* (`AbsSeriesConv`) if the series of absolute values
`Series (fun n ↦ |a n|)` converges.

Prove `Conv_of_AbsSeriesConv`: if a series converges absolutely, then it converges.

"

/--
  If `Series (fun n ↦ |a n|)` converges, then `Series a` converges.
-/
TheoremDoc DiffSeries as "DiffSeries" in "Series"

-- ADD TO HOMEWORK
theorem DiffSeries (a : ℕ → ℝ) {m n : ℕ} (hnm : n ≤ m) :
  Series a m - Series a n = ∑ k ∈ Ico n m, a k := by
change ∑ k ∈ range m, a k - ∑ k ∈ range n, a k = ∑ k ∈ Ico n m, a k
refine Eq.symm (sum_Ico_eq_sub a hnm)

-- ADD TO HOMEWORK
theorem Ico0_eq_Range (n : ℕ) : Ico 0 n = range n := by
sorry

-- ADD TO HOMEWORK
theorem Series_abs_add (a : ℕ → ℝ) (n m : ℕ) : |∑ k ∈ Ico n (n + m), a k| ≤ ∑ k ∈ Ico n (n + m), |a k| := by
induction' m with m hm
bound
rewrite [← DiffSeries a (show n ≤ n + (m + 1) by bound)]
sorry




-- theorem SeqConv_of_IsCauchy {a : ℕ → ℝ} (ha : IsCauchy a) : SeqConv a := by
-- -- in Mathlib -- `ℝ` version of `Conv_of_IsCauchy`...
--   sorry

-- /--
-- If a sequence `a : ℕ → ℝ` is Cauchy, then it converges.
-- -/
-- TheoremDoc SeqConv_of_IsCauchy as "SeqConv_of_IsCauchy" in "Sequences"

def AbsSeriesConv (a : ℕ → ℝ) : Prop := SeriesConv (fun n ↦ |a n|)

/--
  If `Series (fun n ↦ |a n|)` converges, then `Series a` converges.
-/
TheoremDoc Conv_of_AbsSeriesConv as "Conv_of_AbsSeriesConv" in "Series"

Statement Conv_of_AbsSeriesConv {a : ℕ → ℝ} (ha : AbsSeriesConv a) : SeriesConv a := by
apply SeqConv_of_IsCauchy
change SeqConv (Series (fun n ↦ |a n|)) at ha
apply IsCauchy_of_SeqConv at ha
intro ε hε
choose N hN using ha ε hε
use N
intro n hn m hnm
rewrite [DiffSeries a hnm]
let ℓ := m - n
have hℓ : m = n + ℓ := by grind
have habs : |∑ k ∈ Ico n (n + ℓ), a k| ≤ ∑ k ∈ Ico n (n + ℓ), |a k| := by apply Series_abs_add a n ℓ
rewrite [← hℓ] at habs
specialize hN n hn m hnm
rewrite [DiffSeries (fun n ↦ |a n|) hnm] at hN
have h : ∑ k ∈ Ico n m, |a k| ≤ |∑ k ∈ Ico n m, (|a k|)| := by bound
linarith [habs, hN, h]


Conclusion "
"
