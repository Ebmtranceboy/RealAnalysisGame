import Game.Levels.L18Pset.L04
open Nat

World "L18Pset"
Level 5
Title "SeqEvenOdd"
Introduction "
# Level 5: `SeqEvenOdd`

Prove `SeqEvenOdd`:

## New theorem: `even_or_odd`

"

/--
A natural number `n` is either `Even` (that is, `∃ k, n = 2 * k`), or `Odd` (that is, `∃ k, n = 2 * k + 1`)
-/
TheoremDoc Nat.even_or_odd as "even_or_odd" in "Theorems"

NewTheorem Nat.even_or_odd

DisabledTheorem SeqEvenOdd

/-- Prove `SeqEvenOdd`
-/
Statement {a : ℕ → ℝ} {L : ℝ} (ha2n : SeqLim (fun n ↦ a (2 * n)) L)
(ha2np1 : SeqLim (fun n ↦ a (2 * n + 1)) L) : SeqLim a L := by
sorry

Conclusion "
"
