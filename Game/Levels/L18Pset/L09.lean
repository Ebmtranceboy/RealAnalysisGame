import Game.Levels.L18Pset.L08
open Finset

World "L18Pset"
Level 9
Title "BddSeriesOdd"
Introduction "
# Level 9: `BddSeriesOdd`

Prove `BddSeriesOdd`:

"

DisabledTheorem BddSeriesOdd

/-- Prove `BddSeriesOdd`
-/
Statement {a : ℕ → ℝ} (ha : Antitone a) (ha' : ∀ n, 0 ≤ a n) (n : ℕ) : 0 ≤ ∑ k ∈ range (2 * n + 1), (-1)^k * a k := by sorry


Conclusion "
"
