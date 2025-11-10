import Game.Levels.L17Levels.L04
open Finset

World "Lecture17"
Level 5
Title "Monotonicity of Series"
Introduction "
# Level 5: Monotonicity of Series

If `0 ≤ a n`, then `Series a` is Monotone.

"
/-- If `a : ℕ → ℝ` is nonnegative, then `Series a` is `Monotone`.
-/
TheoremDoc MonotoneOfNonNegSeries as "MonotoneOfNonNegSeries" in "Theorems"

Statement MonotoneOfNonNegSeries (a : ℕ → ℝ) (ha : ∀ n, 0 ≤ a n) : Monotone (Series a) := by
apply Monotone_of_succ
intro n
change ∑ k ∈ range n, a k ≤ ∑ k ∈ range (n + 1), a k
rewrite [show ∑ k ∈ range (n + 1), a k = ∑ k ∈ range n, a k + a n by
  apply sum_range_succ]
specialize ha n
linarith [ha]

Conclusion "
"
