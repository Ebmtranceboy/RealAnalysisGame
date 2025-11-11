import Game.Levels.L17Pset.L05
open Finset

World "L17Pset"
Level 2
Title "Monotone Limit Bound"
Introduction "
# Level 2: Monotone Limit Bound

Prove the theorem `MonotoneLimitBound`:
Suppose that a sequence `a : ℕ → ℝ` is `Monotone` and has limit `L`. Then
for every `n`, `a n ≤ L`.

"
/-- If `a : ℕ → ℝ` is `Monotone` and has limit `L`, then for all `n`, `a n ≤ L`.
-/
TheoremDoc MonotoneLimitBound as "MonotoneLimitBound" in "Sequences"

Statement MonotoneLimitBound {a : ℕ → ℝ} (amono : Monotone a) {L : ℝ} (ha : SeqLim a L) : ∀ n,
  a n ≤ L := by
sorry

Conclusion "
"
