import Game.Levels.L19Levels.L02

open Finset Function

World "Lecture19"
Level 3
Title "Rearrangement Theorem"
Introduction "
# Level 3: Rearrangement Theorem

If `a n` is absolutely convergent, then any rearrangement of its terms also converges to the same sum.

Huge story in all of Real Analysis:

Infinite summation actually **is** commutative, but **only** if it's absolutely convergent.
"

/--
  If `Series a` converges absolutely, then any rearrangement of `a` also converges, and to the same sum.
-/
TheoremDoc RearrangementThm as "RearrangementThm" in "Series"

Statement RearrangementThm {a : ℕ → ℝ} (ha : AbsSeriesConv a) {σ : ℕ → ℕ}
  (hσ : Rearrangement σ) : ∃ L, SeriesLim a L ∧ SeriesLim (a ∘ σ) L := by
choose L hL using Conv_of_AbsSeriesConv ha
use L
split_ands
apply hL
intro ε hε
apply IsCauchy_of_SeqConv at ha
choose N1 hN1 using ha (ε / 2) (by bound)
choose N2 hN2 using hL (ε / 2) (by bound)
choose N3 hN3 using EventuallyCovers_of_Rearrangement hσ (N1 + N2)
use N1 + N2 + N3 + 1
intro n hn
specialize hN2 (N1 + N2) (by bound)
specialize hN1 (N1 + N2) (by bound)
rewrite [show Series (a ∘ σ) n - L = (Series (a ∘ σ) n - Series a (N1 + N2)) + (Series a (N1 + N2) - L) by ring_nf]
have f1 : |Series (a ∘ σ) n - Series a (N1 + N2) + (Series a (N1 + N2) - L)|
          ≤ |Series (a ∘ σ) n - Series a (N1 + N2)| + |(Series a (N1 + N2) - L)| := by apply abs_add
have f2 : |Series (a ∘ σ) n - Series a (N1 + N2)| =
    |∑ k ∈ image σ (range n) \ range (N1 + N2), a k| := by sorry
have f3 : |∑ k ∈ image σ (range n) \ range (N1 + N2), a k| ≤ ∑ k ∈ image σ (range n) \ range (N1 + N2), |a k| := by sorry
let M := N1 + N2 + ∑ k ∈ range n, σ k
have Mis : M = N1 + N2 + ∑ k ∈ range n, σ k := by rfl
have f4 : ∑ k ∈ image σ (range n) \ range (N1 + N2), |a k| ≤ ∑ k ∈ Ico (N1 + N2) M, |a k| := by sorry
have Mbnd : N1 + N2 ≤ M := by sorry
specialize hN1 M Mbnd
rewrite [DiffOfSeries _ Mbnd] at hN1
have f5 : ∑ k ∈ Ico (N1 + N2) M, |a k| ≤ |∑ k ∈ Ico (N1 + N2) M, (|a k|)| := by bound

linarith [f1, hN2, f2, f3, f4, f5, hN1, hN3]


Conclusion "
"
