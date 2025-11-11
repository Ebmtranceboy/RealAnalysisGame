import Game.Levels.L18Levels.L02

open Finset Function

World "Lecture18"
Level 3
Title "Rearrangement Theorem I"
Introduction "
# Level 3: Rearrangement Theorem I

If `a n` is absolutely convergent, then any rearrangement of its terms also converges to the same sum.

"

def Rearrangement (σ : ℕ → ℕ) : Prop := Injective σ ∧ Surjective σ

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

sorry

Conclusion "
"
