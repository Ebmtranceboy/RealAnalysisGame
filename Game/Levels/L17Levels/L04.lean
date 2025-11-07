import Game.Levels.L17Levels.L03
open Finset

World "Lecture17"
Level 4
Title "The Basel Problem"
Introduction "
# Level 4: The Basel Problem

Near the turn of the 18th century, the Bernoulli brothers,
Johann and Jakob, became obsessed with trying to evaluate (one plus) the series

`∑ k, 1 / ((k + 2) ^ 2) = 1/4 + 1/9 + 1/16 + 1/25 +...`.

It would take a few more decades, and their most famous
pupil, Leonhard Euler, to solve it.

For now, let's just prove that it converges.


## New Theorem: `SeqConvOfMonotoneBdd`

`(a : ℕ → ℝ) (M : ℝ) (hM : ∀ n, a n ≤ M) (ha : Monotone a) : SeqConv a`

We already know the theorem `IsCauchyOfMonotoneBdd`, which states that a monotone bounded sequence is Cauchy; and by completeness, it thus converges in the reals.

"

/-- If `a : ℕ → ℝ` is Monotone and bounded, then `SeqConv a`.
-/
TheoremDoc SeqConvOfMonotoneBdd as "SeqConvOfMonotoneBdd" in "Theorems"


theorem SeqConvOfMonotoneBdd (a : ℕ → ℝ) (M : ℝ) (hM : ∀ n, a n ≤ M) (ha : Monotone a) : SeqConv a := by
have := IsCauchyOfMonotoneBdd a M hM ha
sorry

NewTheorem SeqConvOfMonotoneBdd

Statement (a : ℕ → ℝ) (ha : ∀ n, a n = 1 / ((n + 2) ^ 2)) : SeriesConv a := by
apply SeqConvOfMonotoneBdd (Series a) 1
let b : ℕ → ℝ := fun n ↦ 1 / ((n + 1) * (n + 2))
have hb : ∀ n, b n = 1 / ((n + 1) * (n + 2)) := by intro n; rfl
have hab : ∀ n, a n ≤ b n := by
  intro n
  rewrite [ha n, hb n]
  field_simp
  bound
intro n
have bLeib := LeibnizSeries' b hb n
have habBnd := SeriesOrderThm a b hab n
change Series b n = 1 - 1 / (n + 1) at bLeib
have h1 : (1 : ℝ) - 1 / (n + 1) ≤ 1 := by
  field_simp
  bound
linarith [habBnd, h1, bLeib]
apply Monotone_of_succ
intro n
change ∑ k ∈ range n, a k ≤ ∑ k ∈ range (n + 1), a k
rewrite [show ∑ k ∈ range (n + 1), a k = ∑ k ∈ range n, a k + a n by
  apply sum_range_succ]
rewrite [ha n]
have han : (0 : ℝ) ≤ 1 / ((n + 2) ^ 2) := by bound
linarith [han]

Conclusion "
"
