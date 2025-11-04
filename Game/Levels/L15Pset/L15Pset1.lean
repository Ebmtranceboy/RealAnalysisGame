import Game.Levels.L15Lecture

World "L15Pset"
Level 1
Title "Problem 1"

Introduction "
# Problem 1:

Prove that $0.999... = 1.0000$. Better yet, let's do it in binary.
That is, you have two **rational** (Cauchy) sequences, `a n = 1 - 1 / 2^n` and `b n = 1`.
The two sequences are equivalent if `a n - b n` goes to zero, that is, if for all `ε > 0, ∃ N, ∀ n ≥ N, |a n - b n| < ε`.

Hint: In Lecture 8, we proved a theorem (now) called `IdLeTwoPow`...

"

/-- Prove this
-/
Statement (a b : ℕ → ℚ) (ha : ∀ n, a n = 1 - 1 / 2 ^ n) (hb : ∀ n, b n = 1) : ∀ ε > 0, ∃ N, ∀ n ≥ N, |a n - b n| < ε := by
sorry

Conclusion ""
