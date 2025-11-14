import Game.Levels.L18Pset.L03
open Finset

World "L18Pset"
Level 4
Title "CoherenceOfReals"
Introduction "
# Level 4: `CoherenceOfReals`

Prove `CoherenceOfReals`:

"

DisabledTheorem CoherenceOfReals

/-- Prove `CoherenceOfReals`
-/
Statement {a b : ℕ → ℝ} {L M : ℝ} (ha : SeqLim a L) (hb : SeqLim b M) (hab : SeqLim (fun n ↦ a n - b n) 0) : L = M := by
sorry

Conclusion "
"
