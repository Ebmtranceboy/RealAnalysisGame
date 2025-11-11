import Game.Levels.L18Levels.L03

open Finset

World "Lecture18"
Level 4
Title "Rearrangement Theorem II"
Introduction "
# Level 4: Rearrangement Theorem II

If `a n` is only conditionally convergent, then for any real number `L` (and also `+∞` and `-∞`, though we won't prove it here), there exists a rearrangement of its terms that converges to `L`.

"

Statement {a : ℕ → ℝ} (ha1 : SeriesConv a) (ha2 : ¬ AbsSeriesConv a) : ∀ L,
  ∃ (σ : ℕ → ℕ) (hσ : Rearrangement σ), SeriesLim (a ∘ σ) L := by

sorry

Conclusion "
"
