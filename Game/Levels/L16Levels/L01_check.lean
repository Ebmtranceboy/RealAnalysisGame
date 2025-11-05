import Game.Levels.L15Lecture

open Finset

World "Lecture16"
Level 1
Title "Series"
Introduction "
# Level 1: Series

Given a sequence `a : ℕ → ℝ`, we define a sequence `b : ℕ → ℝ` to be the \"series\" of `a`, meaning the sequence of partial sums:

**Def:** `Series (a : ℕ → ℝ) : ℕ → ℝ := fun n ↦ ∑ k ∈ range n, a k`

A **series is said to converge** if the sequence of its partial sums converges.

**Def:** `SeriesConv (a : ℕ → ℝ) : Prop := SeqConv (Series a)`.

Your challenge: If a series converges, then its terms go to zero!

"



/-- `(a : ℕ → ℝ) : ℕ → ℝ := fun n ↦ ∑ k ∈ range n, a k`

Given a sequence `a : ℕ → ℝ`, the `Series a` is the sequence of its partial sums. -/
DefinitionDoc Series as "Series"

def Series (a : ℕ → ℝ) : ℕ → ℝ := fun n ↦ ∑ k ∈ range n, a k

/-- `(a : ℕ → ℝ) : Prop := SeqConv (Series a)`

The Series of a sequence `a : N → ℝ` converges if the sequence of its partial sums converges. -/
DefinitionDoc SeriesConv as "SeriesConv"

def SeriesConv (a : ℕ → ℝ) : Prop := SeqConv (Series a)

NewDefinition Series SeriesConv

/-- If a series converges, then the terms go to zero
-/
TheoremDoc LimZero_of_SeriesConv as "LimZero_of_SeriesConv" in "Theorems"


Statement LimZero_of_SeriesConv (a : ℕ → ℝ) (ha : SeriesConv a) : SeqLim a 0 := by
intro ε hε
change SeqConv (Series a) at ha
have cau : IsCauchy (Series a) := by apply IsCauchyOfLim (Series a) ha
choose N hN using cau ε hε
use N
intro n hn
specialize hN n hn (n+1) (by bound)
change |∑ k ∈ range (n+1), a k - ∑ k ∈ range n, a k| < ε at hN
rewrite [show ∑ k ∈ range (n+1), a k = ∑ k ∈ range n, a k + a n by apply sum_range_succ] at hN
rewrite [show ∑ k ∈ range n, a k + a n - ∑ k ∈ range n, a k = a n by ring_nf] at hN
rewrite [show a n - 0 = a n by ring_nf]
apply hN


Conclusion "
"
