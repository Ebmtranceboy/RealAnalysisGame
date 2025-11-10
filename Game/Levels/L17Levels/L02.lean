import Game.Levels.L17Levels.L01

open Finset

World "Lecture17"
Level 2
Title "Leibniz Series"
Introduction "
# Level 2: Leibniz Series

Now evaluate the infinite sum

`∑ k, 1 / ((k + 1) * (k + 2)) = 1 / 2 + 1/6 + 1/12 + 1/20 + 1/30 +...`.

"

/-- The series `∑ k, 1 / ((k + 1) * (k + 2))` converges.
-/
TheoremDoc LeibnizSeries as "LeibnizSeries" in "Theorems"

Statement LeibnizSeries (a : ℕ → ℝ) (ha : ∀ n, a n = 1 / ((n + 1) * (n + 2))) : SeriesConv a := by
have f : ∀ n, ∑ k ∈ range n, a k = 1 - 1 / (n + 1) := by
  apply LeibnizSeries' ha
use 1
intro ε hε
choose N hN using ArchProp hε
use N
intro n hn
have epsinv : 0 < 1 / ε := by bound
have hN' : (0 : ℝ) < N := by linarith [hN, epsinv]
have hNpos : 0 < N := by exact_mod_cast hN'
have Nge : 1 ≤ N := by bound
have nge : 1 ≤ n := by bound
change |∑ k ∈ range n, a k - 1| < ε
rewrite [f n]
rewrite [show |(1 : ℝ) - 1 / (n + 1) - 1| = |-((1 : ℝ) / (n + 1))| by ring_nf]
rewrite [show |- ((1 : ℝ) / (n + 1))| = |(1 : ℝ) / (n + 1)| by apply abs_neg]
rewrite [show |((1 : ℝ) / (n + 1))| = (1 : ℝ) / (n + 1) by apply abs_of_pos (by bound)]
have hn' : (N : ℝ) ≤ n := by exact_mod_cast hn
have hn'' : (1 : ℝ) / n ≤ 1 / N := by field_simp; bound
have hN' : (1 : ℝ) / N < ε := by field_simp; field_simp at hN; linarith [hN]
have hn''' : (1 : ℝ) / (n + 1) ≤ 1 / n := by field_simp; bound
linarith [hn''', hn'', hN']

Conclusion "
"
