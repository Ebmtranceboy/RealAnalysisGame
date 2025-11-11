import Game.Levels.L18Levels.L01

open Finset

World "Lecture18"
Level 2
Title "Alternating Series Test"
Introduction "
# Level 2: Alternating Series Test

Suppose `a n` is an `Antitone` sequence with limit `0`. (And hence nonnegative at all inputs by `AntitoneLimitBound` -- to be proved in the homework.)

"

/--
  If `a : ℕ → ℝ` is `Antitone` and converges to `L`, then for all `n`, `L ≤ a n`. Analogous to `MonotoneLimitBound`.
-/
TheoremDoc AntitoneLimitBound as "AntitoneLimitBound" in "Sequences"

-- ADD TO HOMEWORK
theorem AntitoneLimitBound {a : ℕ → ℝ} (aanti : Antitone a) {L : ℝ} (ha : SeqLim a L) : ∀ n,
  L ≤ a n := by
sorry

-- ADD TO HOMEWORK
theorem S2nMonotonic {a : ℕ → ℝ} (aanti : Antitone a) : Monotone (fun n ↦ Series (fun k ↦ (-1)^(k) * a k) (2 * n)) := by
apply Monotone_of_succ
intro n
induction' n with n hn
rewrite [show Series (fun k => (-1) ^ k * a k) (2 * 0) = 0 by bound]
change 0 ≤ ∑ k ∈ range 2, (-1) ^ k * a k
rewrite [sum_range_succ]
rewrite [sum_range_succ]
have h : ∑ x ∈ range 0, (-1) ^ x * a x + (-1) ^ 0 * a 0 + (-1) ^ 1 * a 1 = a 0 + -a 1 := by norm_num
rewrite [h]
have h' : a 1 ≤ a 0 := aanti (by bound)
linarith [h']
change ∑ k ∈ range (2 * (n +1)), (-1) ^ k * a k ≤ ∑ k ∈ range (2 * (n + 2)), (-1) ^ k * a k
rewrite [show 2 * (n + 2) = 2 * (n + 1) + 1 + 1 by bound]
rewrite [sum_range_succ]
rewrite [sum_range_succ]
rewrite [show ∑ x ∈ range (2 * (n + 1)), (-1) ^ x * a x + (-1) ^ (2 * (n + 1)) * a (2 * (n + 1)) +
    (-1) ^ (2 * (n + 1) + 1) * a (2 * (n + 1) + 1) = ∑ x ∈ range (2 * (n + 1)), (-1) ^ x * a x + ((-1) ^ (2 * (n + 1)) * a (2 * (n + 1)) +
    (-1) ^ (2 * (n + 1) + 1) * a (2 * (n + 1) + 1)) by ring_nf]
have : (-1) ^ (2 * (n + 1)) * a (2 * (n + 1)) +
    (-1) ^ (2 * (n + 1) + 1) * a (2 * (n + 1) + 1) = a (2 * (n + 1)) + - a (2 * (n + 1) + 1) := by norm_num
rewrite [this]
have h' : a (2 * (n + 1) + 1) ≤ a (2 * (n + 1)) := aanti (by bound)
linarith [h']

-- ADD TO HOMEWORK
theorem S2np1Bdd {a : ℕ → ℝ} (aanti : Antitone a) (ha : ∀ n, 0 ≤ a n) : ∀ n, 0 ≤ (fun n ↦ Series (fun k ↦ (-1)^(k) * a k) (2 * n + 1)) n:= by
sorry

-- ADD TO HOMEWORK
theorem S2nBdd {a : ℕ → ℝ} (aanti : Antitone a) (ha : ∀ n, 0 ≤ a n) : ∀ n, (fun n ↦ Series (fun k ↦ (-1)^(k) * a k) (2 * n)) n ≤ a 0:= by
intro n
induction' n with n hn
bound
change ∑ k ∈ range (2 * n), (-1) ^ k * a k ≤ a 0 at hn
change ∑ k ∈ range (2 * (n+1)), (-1) ^ k * a k ≤ a 0
rewrite [show 2 * (n + 1) = 2 * n + 1 + 1 by bound]
have h : ∑ k ∈ range (2 * n + 1 + 1), (-1) ^ k * a k = a 0 - a 1 + ∑ k ∈ range n, (a (2 * k + 2) - a (2 * k + 1)) := by
  induction' n with n hn'
  rewrite [sum_range_succ]
  rewrite [sum_range_succ]
  norm_num
  ring_nf
  rewrite [sum_range_succ]
  rewrite [sum_range_succ]
  rewrite [sum_range_succ]

  sorry


rewrite [sum_range_succ]
rewrite [sum_range_succ]
rewrite [show ∑ x ∈ range (2 * n), (-1) ^ x * a x + (-1) ^ (2 * n) * a (2 * n) + (-1) ^ (2 * n + 1) * a (2 * n + 1) = ∑ x ∈ range (2 * n), (-1) ^ x * a x +
( (-1) ^ (2 * n) * a (2 * n) + (-1) ^ (2 * n + 1) * a (2 * n + 1)) by ring_nf]
have h :  (-1) ^ (2 * n) * a (2 * n) + (-1) ^ (2 * n + 1) * a (2 * n + 1)
  =  a (2 * n) + - a (2 * n + 1) := by norm_num
rewrite [h]
have h' : a (2 * n + 1) ≤ a (2 * n) := by apply aanti (by bound)
have h'' : a (2 * n + 1) - a (2 * n) ≤ 0 := by bound
--linarith [hn, h, h'']
sorry


-- ADD TO HOMEWORK
theorem S2n1Antitonic {a : ℕ → ℝ} (aanti : Antitone a) : Antitone (fun n ↦ Series (fun k ↦ (-1)^(k) * a k) (2 * n + 1)) := by
sorry

-- ADD TO HOMEWORK
theorem SeqConv_of_even_odd_Monotone
    {s : ℕ → ℝ} {M m : ℝ}
    (heven_mono : Monotone (fun n ↦ s (2 * n)))
    (heven_bdd : ∀ n, s (2 * n) ≤ M)
    (hodd_anti : Antitone (fun n ↦ s (2 * n + 1)))
    (hodd_bdd : ∀ n, m ≤ s (2 * n + 1))
    (hsqueeze : SeqLim (fun n ↦ s (2 * n + 1) - s (2 * n)) 0) :
    SeqConv s := by
  sorry

/--
  If `a` decreases to `0`, then the alternating series `Series (fun n ↦ (-1)^n * a n)` converges.
-/
TheoremDoc AlternatingSeriesTest as "AlternatingSeriesTest" in "Series"

Statement AlternatingSeriesTest {a : ℕ → ℝ} (ha : Antitone a) (aLim : SeqLim a 0) : SeriesConv (fun n ↦ (-1)^n * a n) := by

have aNonneg : ∀ n, 0 ≤ a n := by
  sorry

let b : ℕ → ℝ := Series (fun n ↦ (-1)^n * a n)
let M : ℝ := a 0
have s2nMono := S2nMonotonic ha
have s2nBdd := S2nBdd ha aNonneg
have s2np1Anti := S2n1Antitonic ha
have s2np1Bdd := S2np1Bdd ha aNonneg
apply SeqConv_of_even_odd_Monotone s2nMono s2nBdd s2np1Anti s2np1Bdd

sorry

Conclusion "
"
