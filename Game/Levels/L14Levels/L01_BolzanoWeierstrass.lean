import Game.Levels.L12PsetIntro
import Game.Levels.L13Lecture

World "Lecture14"
Level 1
Title "Bolzano-Weierstass"

Introduction "
# Level 1 **Big Boss:**  Bolzano-Weierstrass

This is it. The crown jewel. One of the most celebrated theorems in all of real analysis.

**The Bolzano-Weierstrass Theorem:** Every bounded sequence has a Cauchy subsequence.

Think about what this says. Take *any* sequence confined to a bounded region—no matter how wildly it oscillates, no matter how chaotic its behavior—and this theorem *guarantees* you can extract from it a subsequence that converges (is Cauchy). Boundedness alone is enough to ensure hidden convergent behavior exists somewhere within.

This theorem is the foundation for:
- Proving continuous functions on closed intervals attain their max and min
- Understanding compactness in metric spaces
- Existence proofs throughout optimization and differential equations
- Sequential compactness arguments everywhere in analysis

And here's the beautiful part: **you've already done all the hard work.** This lecture is about watching the pieces fall into place.

## The Architecture

Over the past few lectures, you've been building a cathedral. Today, we place the capstone:

**Lecture 12:** Bounded monotone sequences are Cauchy (you proved this)

**Pset 12:** Bounded antitone sequences are Cauchy (dual by negation)

**Lecture 13:** Sequences without unbounded peaks → have monotone subsequences (you proved this)

**Pset 13:** Sequences with unbounded peaks → have antitone subsequences (you'll prove this)

**Today:** We combine everything. Any bounded sequence either has unbounded peaks or doesn't. In either case, we extract a monotone (or antitone) bounded subsequence, which must be Cauchy by our earlier results.

The proof is short—maybe the shortest \"big theorem\" proof you'll see—precisely because we've built the right machinery. Every complex proof should feel like this at the end: inevitable.

## New Theorems (From Your Work)

**abs_le:** The companion to `abs_lt` for non-strict inequalities. Says `|x| ≤ y ↔ -y ≤ x ≤ y`, letting us split absolute value bounds into simultaneous one-sided inequalities.

**IsCauchyOfAntitoneBdd:** From Pset 12. If a sequence is antitone (non-increasing) and bounded below, it's Cauchy. Dual to the monotone result.

**AntitoneSubseq_of_UnBddPeaks:** From Pset 13. If a sequence has unbounded peaks, we can extract an antitone (non-increasing) subsequence by picking the peaks themselves.

## The Strategy

The proof uses **case analysis** with the dichotomy from Lecture 13:

**Case 1: Unbounded peaks exist**
- Extract an antitone subsequence (by `AntitoneSubseq_of_UnBddPeaks`)
- It's bounded below (inherits from the original sequence)
- Therefore it's Cauchy (by `IsCauchyOfAntitoneBdd`)

**Case 2: Unbounded peaks don't exist**
- Extract a monotone subsequence (by `MonotoneSubseq_of_BddPeaks`)
- It's bounded above (inherits from the original sequence)
- Therefore it's Cauchy (by `IsCauchyOfMonotoneBdd`)

Either way, we get a Cauchy subsequence. The theorem falls out from the law of excluded middle plus our carefully constructed library of results.

## What You'll Learn

Beyond the theorem itself, this lecture teaches you:

1. **Proof architecture:** How to structure a theory so that major theorems become natural consequences of well-chosen lemmas

2. **Case analysis:** Using `by_cases` to split on a proposition and handle each case separately

3. **Duality:** How proving one direction (monotone) often gives you the other (antitone) almost for free

4. **Synthesis:** Combining multiple prior results into something greater than the sum of its parts

## Historical Note

Bernard Bolzano (1781-1848) and Karl Weierstrass (1815-1897) were pioneers of rigorous analysis. They understood a profound insight:

**Boundedness + Infinity → Accumulation**

If you have infinitely many values trapped in a bounded region, they *must* cluster somewhere. There's nowhere else to go. This theorem makes that intuition precise and constructive.

## The Payoff

With Bolzano-Weierstrass in hand, a vast landscape of analysis opens up:
- Extreme Value Theorem (continuous functions on closed intervals attain bounds)
- Intermediate Value Theorem (continuous functions hit all intermediate values)
- Heine-Borel Theorem (characterizing compact sets in ℝⁿ)
- Sequential compactness arguments throughout topology
- Fixed point theorems
- And so much more...

This isn't just a theorem. It's a *key* that unlocks doors throughout mathematics.

## Let's Do This

You've climbed the mountain. The summit is in sight. Time to prove one of the most important theorems in real analysis.

The proof is elegant, almost anticlimactic. That's how you know you've done mathematics right: when the final step feels obvious because you've laid the groundwork so carefully.

**Ready? Let's prove Bolzano-Weierstrass.**
"

/-- `|x| ≤ y ↔ -y ≤ x ≤ y`
-/
TheoremDoc abs_le as "abs_le" in "Theorems"

/--
If a sequence `a : ℕ → X` (where `X` can be `ℚ` or `ℝ`) is antitone and bounded, then it is Cauchy.
-/
TheoremDoc IsCauchyOfAntitoneBdd as "IsCauchyOfAntitoneBdd" in "Theorems"

Statement IsCauchyOfAntitoneBdd {X : Type*} [NormedField X] [LinearOrder X] [IsStrictOrderedRing X] [FloorSemiring X] (a : ℕ → X) (M : X) (hM : ∀ n, M ≤ a n) (ha : Antitone a)
    : IsCauchy a := by
let b := -a
have hb : Monotone b := by apply MonotoneNeg_of_Antitone a ha
have b_bdd : ∀ n, b n ≤ -M := by intro n; change -a n ≤ - M; linarith [hM n]
have bCauchy : IsCauchy b := IsCauchyOfMonotoneBdd b (-M) b_bdd hb
have negbCauchy : IsCauchy (-b) := IsCauchyNeg b bCauchy
change IsCauchy (- -a) at negbCauchy
rewrite [show - - a = a by ring_nf] at negbCauchy
apply negbCauchy

/--
If a sequence `a : ℕ → X` (where `X` could be `ℚ` or `ℝ`) is `Monotone` and grows along some subsequences by `ε`, then it eventually grows by `k * ε` for any `k`.
-/
TheoremDoc AntitoneSubseq_of_UnBddPeaks as "AntitoneSubseq_of_UnBddPeaks" in "Theorems"

theorem AntitoneSubseq_of_UnBddPeaks
{X : Type*} [NormedField X] [LinearOrder X] [IsStrictOrderedRing X] [FloorSemiring X] (a : ℕ → X) (ha : UnBddPeaks a) : ∃ σ, Subseq σ ∧ Antitone (a ∘ σ) := by
sorry

NewTheorem AntitoneSubseq_of_UnBddPeaks IsCauchyOfAntitoneBdd abs_le

/--
If a sequence `a : ℕ → X` (where `X` could be `ℚ` or `ℝ`) is bounded, then it has a subsequence which is Cauchy.
-/
TheoremDoc BolzanoWeierstrass as "BolzanoWeierstrass" in "Theorems"

/-- Prove this
-/
Statement BolzanoWeierstrass {X : Type*} [NormedField X] [LinearOrder X] [IsStrictOrderedRing X] [FloorSemiring X] (a : ℕ → X) (ha : SeqBdd a) : ∃ σ, Subseq σ ∧ IsCauchy (a ∘ σ) := by
choose M Mpos hM using ha
have aBddAbove : ∀ n, a n ≤ M := by intro n; specialize hM n; rewrite [abs_le] at hM; apply hM.2
have aBddBelow : ∀ n, -M ≤ a n := by intro n; specialize hM n; rewrite [abs_le] at hM; apply hM.1
by_cases hPeaks : UnBddPeaks a
choose σ σsubseq σanti using AntitoneSubseq_of_UnBddPeaks a hPeaks
use σ
split_ands
exact σsubseq
apply IsCauchyOfAntitoneBdd (a ∘ σ) (-M)
intro n
change -M ≤ a (σ n)
apply aBddBelow
apply σanti
choose σ σsubseq σmono using MonotoneSubseq_of_BddPeaks a hPeaks
use σ
split_ands
apply σsubseq
apply IsCauchyOfMonotoneBdd (a ∘ σ) M
intro n
change a (σ n) ≤ M
apply aBddAbove
apply σmono

Conclusion "

# 🏆 You Just Proved Bolzano-Weierstrass!

Stop for a moment. Breathe. You've just proved one of the most important theorems in real analysis.

**Every bounded sequence has a Cauchy subsequence.**

This isn't just another result—this is a *cornerstone* of modern mathematics. Textbooks build entire chapters around this theorem. Graduate qualifying exams test it. Researchers use it daily. And you just proved it formally, rigorously, in Lean.

## What Just Happened

The proof was... short. Almost suspiciously short. Just:
1. Split the absolute value bound using `abs_le`
2. Case split on whether peaks are unbounded
3. Extract the appropriate subsequence (monotone or antitone)
4. Apply the right Cauchy theorem

Done. Twenty lines of code for a theorem that's worth its weight in gold.

**Why was it so short?** Because you built the right foundation. This lecture wasn't about clever tricks—it was about *architecture*. You spent lectures building:
- `IsCauchyOfMonotoneBdd` (Lecture 12)
- `IsCauchyOfAntitoneBdd` (Pset 12)
- `MonotoneSubseq_of_BddPeaks` (Lecture 13)
- `AntitoneSubseq_of_UnBddPeaks` (Pset 13)

When you have the right pieces, the cathedral builds itself.

## The Profound Insight

Here's what Bolzano and Weierstrass understood:

**Boundedness is suffocating.**

If you trap infinitely many values in a finite region, they have nowhere to spread out. They *must* accumulate. They *must* cluster. Convergent behavior isn't a special case—it's *inevitable*.

Your sequence might bounce around chaotically. It might oscillate wildly. It might seem to have no pattern whatsoever. But the moment you say \"it's bounded,\" you've sealed its fate: somewhere within it, convergence is hiding, waiting to be extracted.

## The Dichotomy: Complete

Every sequence falls into exactly one of two categories:

**Has unbounded peaks →** Extract the peaks themselves → Get an antitone bounded subsequence → Cauchy

**Doesn't have unbounded peaks →** Peaks eventually stop → Get a monotone bounded subsequence → Cauchy

There is no third option. There is no escape. Boundedness + infinity → convergence.

This is why the proof by cases works so elegantly. We're not being clever—we're being *exhaustive*. The law of excluded middle gives us both cases, and both roads lead to Rome.

## What This Unlocks

With Bolzano-Weierstrass, you can now prove:

**Extreme Value Theorem:** Continuous functions on closed bounded intervals attain their maximum and minimum. (Why? The sequence of values must have a Cauchy—hence convergent—subsequence, and continuity preserves limits.)

**Heine-Borel Theorem:** Closed and bounded subsets of ℝⁿ are compact. (Sequential compactness = compactness in metric spaces, and you just proved sequential compactness for bounded sets.)

**Existence of solutions:** Optimization problems, differential equations, fixed points—countless existence proofs rely on extracting convergent subsequences from bounded sequences.

**Compactness arguments:** Throughout topology, functional analysis, PDE theory—whenever you see \"compact,\" Bolzano-Weierstrass is lurking nearby.

This theorem is a *skeleton key* for real analysis.

## The Technique: Synthesis

This lecture taught you something crucial about mathematical maturity:

**The best proofs are the shortest ones.**

Not because you're cutting corners, but because you've built the right infrastructure. Compare this proof to what it would look like if you tried to prove Bolzano-Weierstrass from scratch without the lemmas. You'd be drowning in cases, wrestling with constructions, fighting to keep track of which subsequence does what.

Instead, you:
- Identified the key dichotomy (peaks or no peaks)
- Proved a result for each case separately (Lectures 12-13, Psets 12-13)
- Combined them with one simple case split

This is how mathematics should feel at the highest level: each theorem builds naturally on what came before, and the major results feel almost inevitable once you have the right perspective.

## The Bigger Picture: Compactness

In topology, a space is called **sequentially compact** if every sequence has a convergent subsequence. You just proved:

**Bounded subsets of ℝ (or ℚ with the right structure) are sequentially compact.**

In metric spaces, sequential compactness is equivalent to compactness (every open cover has a finite subcover). This connection between sequences and topology is one of the deepest in mathematics.

Compactness is often called \"the next best thing to finiteness.\" Finite sets are easy to work with—you can always find maxima, minima, you can't have infinite descent, etc. Compact sets preserve many of these nice properties. And Bolzano-Weierstrass is what makes boundedness behave \"almost like finiteness.\"

## Historical Legacy

When Bolzano and Weierstrass worked on this theorem in the 19th century, they were doing something revolutionary: making infinity *rigorous*.

Before them, analysis was full of vague intuitions about \"approaching\" and \"tending toward.\" Mathematicians knew calculus worked, but couldn't really explain why. Infinity was mysterious, even suspicious.

Bolzano-Weierstrass (along with Cauchy's work on limits and Weierstrass's ε-δ definitions) changed everything. They showed you could reason about infinite processes with the same precision as finite ones. You could *prove* things about limits, not just calculate them.

This theorem is part of the foundation that transformed calculus from a bag of tricks into *analysis*—a rigorous mathematical discipline.

## What You've Mastered

✓ **Proof by exhaustive case analysis:** Using `by_cases` to split on propositions and handle all possibilities

✓ **Working with absolute values:** Decomposing `|x| ≤ M` into simultaneous bounds with `abs_le`

✓ **Duality arguments:** Seeing how monotone/antitone, increasing/decreasing, upper/lower bounds are mirror images

✓ **Synthesizing results:** Combining multiple lemmas into a cohesive whole

✓ **Mathematical architecture:** Building theories so major theorems become natural consequences

✓ **The power of dichotomies:** Finding the right case split that makes everything fall into place

These skills transcend this particular theorem. You're thinking like a mathematician now.

## Reflection: The Journey

Let's trace where you've been:

**Lecture 12:** You learned about orbits and iteration. You proved bounded monotone sequences are Cauchy by contradiction—if they weren't, gaps would accumulate and violate the bound.

**Lecture 13:** You discovered the peak dichotomy. You proved that without unbounded peaks, you can extract monotone subsequences using clever orbit constructions.

**Psets 12-13:** You filled in the dual results for antitone sequences and sequences with unbounded peaks.

**Today:** You combined everything. The pieces clicked together. The theorem emerged.

This is real mathematics. Not memorizing formulas, not following algorithms—*building*. Constructing a foundation stone by stone, then stepping back to see the edifice you've created.

## Looking Forward

Where do we go from here? With Bolzano-Weierstrass in your toolkit, vast territories of analysis open up:

- **Convergence theorems:** Dominated convergence, monotone convergence, equicontinuity
- **Functional analysis:** Weak compactness, reflexivity, dual spaces
- **Optimization:** Existence of extrema, constrained optimization, variational methods
- **Differential equations:** Existence and uniqueness theorems via fixed points
- **Topology:** Compactness, connectedness, continuous maps between spaces

Each of these builds on what you've proved today. Bolzano-Weierstrass isn't the end—it's the *beginning* of deep analysis.

## Final Thought

Mathematics has a peculiar beauty: the most powerful theorems are often the simplest to state.

*Every bounded sequence has a Cauchy subsequence.*

Eleven words. A freshman can understand the statement. But hidden in those words is profound insight about the nature of infinity, limits, and convergence. Hidden in the proof is a elegant dichotomy that exhausts all possibilities.

You didn't just prove a theorem today. You glimpsed the architecture of analysis itself—how careful definitions, well-chosen lemmas, and strategic case analysis can tame infinity and make it rigorous.

Bolzano and Weierstrass would be proud. You've carried their torch forward, proving their theorem not just with pencil and paper, but formally, mechanically, in a way that a computer can verify.

**This is real mathematics. And you just did it.**

---

## 🎓 Achievement Unlocked: Bolzano-Weierstrass Theorem

You are now equipped with one of the most powerful tools in real analysis. Use it wisely. Use it well. And remember: bounded sequences can run, but they cannot hide from convergence.

**Onward to new theorems!**
"
