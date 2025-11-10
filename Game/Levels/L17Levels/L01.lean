import Game.Levels.L16Lecture

open Finset

World "Lecture17"
Level 1
Title "Leibniz Series"
Introduction "
# Level 1: Leibniz Series

Let's evaluate this series, known to Leibniz, explicitly:

`∑ k, 1 / ((k + 1) * (k + 2)) = 1 / 2 + 1/6 + 1/12 + 1/20 + 1/30 +...`.

First let's evaluate the partial sums explicitly.
"

/-- The series `∑ k, 1 / ((k + 1) * (k + 2))` converges.
-/
TheoremDoc LeibnizSeries' as "LeibnizSeries'" in "Theorems"

Statement LeibnizSeries' {a : ℕ → ℝ} (ha : ∀ n, a n = 1 / ((n + 1) * (n + 2))) :
∀ n, ∑ k ∈ range n, a k = 1 - 1 / (n + 1) := by
  intro n
  induction' n with m hm
  bound
  rewrite [show ∑ k ∈ range (m + 1), a k = ∑ k ∈ range m, a k + a m by apply sum_range_succ]
  rewrite [hm]
  rewrite [ha m]
  push_cast
  norm_num
  field_simp
  ring_nf

Conclusion "
"
