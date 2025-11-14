import Game.Levels.L19Levels.L03

open Finset

World "Lecture19"
Level 4
Title "Conditional Convergence Theorem"
Introduction "
# Level 4: Conditional Convergence Theorem

If `a n` is only conditionally convergent, then for any real number `L` (and also `+∞` and `-∞`, though we won't prove it here), there exists a rearrangement of its terms that converges to `L`!

So inifinite summation, if it's not absolutely convergent, is **as non-commutative as possible!!!**

This fantastic result often goes by the moniker, the \"Riemann Rearrangement Theorem\".

"
/--
Prove the `Conditional Convergence Theorem`
-/
Statement  {a : ℕ → ℝ} (ha1 : SeriesConv a) (ha2 : ¬ AbsSeriesConv a) : ∀ L,
  ∃ (σ : ℕ → ℕ) (hσ : Rearrangement σ), SeriesLim (a ∘ σ) L := by

sorry

Conclusion "
"
