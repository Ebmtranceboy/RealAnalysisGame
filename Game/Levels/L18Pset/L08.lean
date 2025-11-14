import Game.Levels.L18Pset.L07
open Finset

World "L18Pset"
Level 8
Title "BddSeriesEven"
Introduction "
# Level 8: `BddSeriesEven`

Prove `BddSeriesEven`:

"

DisabledTheorem BddSeriesEven

/-- Prove `BddSeriesEven`
-/
Statement {a : ℕ → ℝ} (ha : Antitone a) (apos : ∀ n, 0 ≤ a n) (n : ℕ) : ∑ k ∈ range (2 * n), (-1)^k * a k ≤ a 0 := by sorry


Conclusion "
"
