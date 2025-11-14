import Game.Levels.L18Pset.L04
open Finset

World "L18Pset"
Level 5
Title "SeqEvenOdd"
Introduction "
# Level 5: `SeqEvenOdd`

Prove `SeqEvenOdd`:

"

DisabledTheorem SeqEvenOdd

/-- Prove `SeqEvenOdd`
-/
Statement {a : ℕ → ℝ} {L : ℝ} (ha2n : SeqLim (fun n ↦ a (2 * n)) L)
(ha2np1 : SeqLim (fun n ↦ a (2 * n + 1)) L) : SeqLim a L := by sorry

Conclusion "
"
