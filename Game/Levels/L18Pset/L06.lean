import Game.Levels.L18Pset.L05
open Finset

World "L18Pset"
Level 6
Title "MonotoneSeriesEven"
Introduction "
# Level 6: `MonotoneSeriesEven`

Prove `MonotoneSeriesEven`:

"

DisabledTheorem MonotoneSeriesEven

/-- Prove `MonotoneSeriesEven`
-/
Statement {a : ℕ → ℝ} (ha : Antitone a) (apos : ∀ n, 0 ≤ a n) : Monotone (fun n ↦ ∑ k ∈ range (2 * n), (-1)^k * a k) := by sorry

Conclusion "
"
