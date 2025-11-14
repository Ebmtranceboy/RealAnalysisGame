import Game.Levels.L18Pset.L02
open Finset

World "L18Pset"
Level 3
Title "AntitoneLimitBound"
Introduction "
# Level 3: `AntitoneLimitBound`

Prove `AntitoneLimitBound`:

"

DisabledTheorem AntitoneLimitBound

/-- Prove `AntitoneLimitBound`
-/
Statement {a : ℕ → ℝ} (ha : Antitone a) {L : ℝ} (aLim : SeqLim a L) : ∀ n,
  L ≤ a n := by
sorry

Conclusion "
"
