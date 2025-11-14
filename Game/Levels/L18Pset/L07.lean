import Game.Levels.L18Pset.L06
open Finset

World "L18Pset"
Level 7
Title "AntitoneSeriesOdd"
Introduction "
# Level 7: `AntitoneSeriesOdd`

Prove `AntitoneSeriesOdd`:

"

DisabledTheorem AntitoneSeriesOdd

/-- Prove `AntitoneSeriesOdd`
-/
Statement {a : ℕ → ℝ} (ha : Antitone a) (apos : ∀ n, 0 ≤ a n) : Antitone (fun n ↦ ∑ k ∈ range (2 * n + 1), (-1)^k * a k) := by sorry

Conclusion "
"
