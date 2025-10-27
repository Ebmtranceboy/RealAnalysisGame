import Game.Levels.L14Lecture

World "Lecture15"
Level 1
Title "Test"

Introduction "
# Level 1: Test
"

def DivToInf (a : ℕ → ℝ) : Prop := ∀ M > 0 , ∃ N , ∀ n ≥ N , a n > M

/-- Prove this
-/
Statement (a b c : ℕ → ℝ) (ha : DivToInf a) (L : ℝ) (hb : SeqLim b L) (hL : L > 0) (hc : ∀ n, c n = a n * b n) : DivToInf c := by
intro M Mpos
have f : ∃ N, ∀ n ≥ N, L / 2 ≤ b n := by sorry
choose N1 hN1 using f
choose N2 hN2 using ha (M / (L / 2)) (by positivity)
use N1 + N2
intro n hn
specialize hN1 n (by bound)
specialize hN2 n (by bound)
rewrite [hc]
sorry

Conclusion "
"
