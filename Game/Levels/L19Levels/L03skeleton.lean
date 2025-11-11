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

theorem Rearrangement_eventually_covers {σ : ℕ → ℕ} (hσ : Rearrangement σ) :
    ∀ n, ∃ m, ∀ k < n, ∃ j < m, σ j = k := by
sorry
/--
  If `Series a` converges absolutely, then any rearrangement of `a` also converges, and to the same sum.
-/
TheoremDoc RearrangementThm as "RearrangementThm" in "Series"

Statement RearrangementThm {a : ℕ → ℝ} (ha : AbsSeriesConv a) {σ : ℕ → ℕ}
  (hσ : Rearrangement σ) : ∃ L, SeriesLim a L ∧ SeriesLim (a ∘ σ) L := by
sorry

Conclusion "
"




















#exit
intro n
have : ∀ k, ∃ j, σ j = k := fun k ↦ hσ.2 k
choose τ hτ using this
use ∑ k ∈ range n, τ k
intro k hk
use (τ k)




choose L hL using Conv_of_AbsSeriesConv ha
use L
split_ands
apply hL
