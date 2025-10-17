import Game.Levels.L11Levels.L01_IsCauchyOfLim

World "Lecture11"
Level 2
Title "Level 2 : Sums of Cauchy sequences"


Introduction "
# Level 2: Sums of Cauchy Sequences

Now that we know convergent sequences are Cauchy, let's explore how Cauchy sequences behave under arithmetic operations. Just like we proved that sums of convergent sequences converge, we'll show that sums of Cauchy sequences are Cauchy.

This theorem is important because it shows that the Cauchy property is preserved by addition—a crucial fact we'll need when we eventually define the real numbers!

## The Setup

Given:
- `a : ℕ → ℝ` is Cauchy
- `b : ℕ → ℝ` is Cauchy

Prove: `a + b` is Cauchy

## Strategy

This proof follows a familiar pattern from the sum of limits theorem:

1. **Split epsilon**: Apply the Cauchy property to both `a` and `b` using `ε/2`
2. **Take the maximum N**: Use `N₁ + N₂` to ensure both Cauchy conditions hold
3. **Change the goal**: Express `|(a + b)ₘ - (a + b)ₙ|` as `|(aₘ - aₙ) + (bₘ - bₙ)|`
4. **Triangle inequality**: Split the sum into two pieces
5. **Combine estimates**: Each piece is less than `ε / 2`, so the total is less than `ε`

## Key Insight

The beauty of the Cauchy property is that we don't need to know *where* the sequences converge—we only need to know that their terms get close to *each other*. This self-referential definition makes the proof very similar to the sum of limits, but without ever mentioning a limit!

Let's prove it!
"

/--
If sequences `a` and `b` are Cauchy, then so is their sum.
-/
TheoremDoc IsCauchyOfSum as "IsCauchyOfSum" in "Theorems"

/-- Prove this
-/
Statement IsCauchyOfSum {X : Type*} [NormedField X] [LinearOrder X] [IsStrictOrderedRing X] (a b : ℕ → X) (ha : IsCauchy a) (hb : IsCauchy b)
    : IsCauchy (a + b) := by
intro ε hε
choose N1 hN1 using ha (ε / 2) (by bound)
choose N2 hN2 using hb (ε / 2) (by bound)
use N1 + N2
intro n hn m hm
specialize hN1 n (by bound) m (by bound)
specialize hN2 n (by bound) m (by bound)
change |(a m + b m) - (a n + b n)| < ε
rewrite [(by ring_nf : |(a m + b m) - (a n + b n)| = |(a m - a n) + (b m - b n)|)]
have f1 : |a m - a n + (b m - b n)| ≤ |a m - a n| + |(b m - b n)| := by apply abs_add
linarith [f1, hN1, hN2]

Conclusion "
# Excellent work! Cauchy sequences are closed under addition!

You've just proven that the set of Cauchy sequences forms a well-behaved algebraic structure—they can be added together and the result is still Cauchy.

## What this means

This theorem shows that the Cauchy property is **preserved by addition**. This is crucial because:

- We can build more complex Cauchy sequences from simpler ones
- When we eventually construct the real numbers as equivalence classes of Cauchy sequences, we'll need to know that addition is well-defined
- The Cauchy sequences form what algebraists call a **vector space** (or at least a subspace of all sequences)

## The Pattern

Notice how similar this proof was to proving that sums of convergent sequences converge:
- Split `ε` into `ε / 2` for each sequence
- Use the triangle inequality to separate the sum
- Combine the estimates

The key difference? **No limits appeared anywhere!** The Cauchy property is entirely self-contained.

Ready for the next level!
"
