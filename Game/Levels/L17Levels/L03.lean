import Game.Levels.L17Levels.L02

open Finset

World "Lecture17"
Level 3
Title "Series Order Theorem"
Introduction "
# Level 3: Series Order Theorem

If `a n ≤ b n` for all `n`, then the same
holds for their partial sums.

"

/-- If `a n ≤ b n`, then `∑ k, a n ≤ ∑ k, b n`.
-/
TheoremDoc SeriesOrderThm as "SeriesOrderThm" in "Theorems"


Statement SeriesOrderThm (a b : ℕ → ℝ) (hab : ∀ n, a n ≤ b n) : ∀ n, Series a n ≤ Series b n := by
intro n
induction' n with n hn
bound
change ∑ k ∈ range (n + 1), a k ≤ ∑ k ∈ range (n + 1), b k
change ∑ k ∈ range (n), a k ≤ ∑ k ∈ range (n), b k at hn
rewrite [show ∑ k ∈ range (n + 1), a k = ∑ k ∈ range n, a k + a n by
  apply sum_range_succ]
rewrite [sum_range_succ]
linarith [hab n, hn]

Conclusion "
"
