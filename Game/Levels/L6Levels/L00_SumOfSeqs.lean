import Game.Levels.L5Lecture

World "Lecture6"
Level 1
Title "Big Boss: The Sum of Convergent Sequences"

Introduction "
# Level 1 **Big Boss**: Adding Convergent Sequences

Now that we've had some experience with the definition of convergence, let's tackle this world's Big Boss. One of the most fundamental ideas in analysis is that 'nice operations preserve convergence.' If two sequences each converge, then their sum also converges, and converges to the sum of their limits.

This might seem obvious at first -- after all, if $a(n)$ is getting close to $L$ and $b(n)$ is getting close to $M$, shouldn't $a(n) + b(n)$ get close to $L + M$? While the intuition is correct, making this rigorous requires some clever maneuvering with our epsilon-N definition.

**Big Boss**
Here's the key insight: if an engineer demands that our combined output be within $\\varepsilon$ of the target $L + M$, we can't just demand that each factory independently meet the full tolerance $\\varepsilon$. Instead, we need to be clever about how we allocate our 'tolerance budget.'

Think of it this way: if the first factory can guarantee its output is within $\\varepsilon/2$ of $L$, and the second factory can guarantee its output is within $\\varepsilon/2$ of $M$, then by the triangle inequality, their sum will be within $\\varepsilon$ of $L + M$. This is the heart of the proof!

## The Mathematical Setup

Suppose we have:
- A sequence $a : \\mathbb{N} \\to \\mathbb{R}$ that converges to $L$
- A sequence $b : \\mathbb{N} \\to \\mathbb{R}$ that converges to $M$
- A sequence $c : \\mathbb{N} \\to \\mathbb{R}$ with the property that $c(n) = a(n) + b(n)$ for all $n$

We want to prove that $c$ converges to $L + M$.


## Your Strategic Approach

- Start by unfolding the definitions of `SeqLim` in the Goal and hypotheses. I recommend you give your dummy variables different names, so as not to get confused later.
- Given any `ε > 0`, use the convergence of `a` to get an `Na` that works for `ε / 2`.
- Similarly, use the convergence of `b` to get an `Nb` that works for `ε / 2`
- You might think that it would be a good idea at this point to `use max Na Nb`, that is, take the larger of the two for `N`. But we don't care how big `N` is! Can you
think of another way to achieve the same objective? (Hint:
 I haven't told you how to use the `max` function, but I bet you can come up with another function for which you already have everything you need at your disposal...)
- Use the triangle inequality to combine the two half-tolerances

This proof embodies a fundamental principle in analysis: when dealing with sums, we often need to 'divide and conquer' by splitting our error tolerance between the components.
"


/-- For two sequences `a b : ℕ → ℝ` and real numbers `L M : ℝ`, with the hypotheses that `SeqLim a L` and `SeqLim b M`, the theorem `SumLim` says that if
there is a third sequence `c : ℕ → ℝ` so that for all `n`, `c n = a n + b n` (that is, `c` is the sum of the sequences), then `SeqLim c (L + M)` holds. -/
TheoremDoc SumLim as "SumLim" in "Theorems"

/-- Prove that the sum of two convergent sequences converges to the sum of their limits.
This is the mathematician's version of 'if two factories each meet their quality standards, their combined output will too!' -/
Statement SumLim (a b c : ℕ → ℝ) (L M : ℝ)
    (ha : SeqLim a L) (hb : SeqLim b M) (hc : ∀ n, c n = a n + b n) :
    SeqLim c (L + M) := by
  change ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |c n - (L + M)| < ε
  intro ε hε
  change ∀ ε₁ > 0, ∃ Na : ℕ, ∀ n ≥ Na, |a n - L| < ε₁ at ha
  change ∀ ε₂ > 0, ∃ Nb : ℕ, ∀ n ≥ Nb, |b n - M| < ε₂ at hb
  specialize ha (ε / 2)
  specialize hb (ε / 2)
  have eps_on_2_pos : 0 < ε / 2 := by linarith [hε]
  specialize ha eps_on_2_pos
  specialize hb eps_on_2_pos
  choose Na hNa using ha
  choose Nb hNb using hb
  use Na + Nb
  intro n hn
  specialize hc n
  rewrite [hc]
  have thing : a n + b n - (L + M) =
    (a n - L) + (b n - M) := by ring_nf
  rewrite [thing]
  specialize hNa n
  specialize hNb n
  have ineq_a : Na ≤ n := by bound -- linarith [hn]
  have ineq_b : Nb ≤ n := by bound -- linarith [hn]
  specialize hNa ineq_a
  specialize hNb ineq_b
  have ineq : |a n - L + (b n - M)| ≤
    |a n - L| + |(b n - M)| := by apply abs_add
  bound --linarith [hNa, hNb, ineq]


Conclusion "
# 🎉 Outstanding! 🎉

You've just proven one of the fundamental theorems of analysis! Let's celebrate what you accomplished and understand why this result is so powerful.

**Why This Matters:**
This theorem and others like it are the foundation for all of calculus! Every time we differentiate or integrate a sum, we're implicitly using arguments of this kind.

**The Deeper Insight:**
Notice how the proof required more than just intuition. The 'obvious' fact that sums of convergent sequences converge needed careful epsilon management. This is the hallmark of rigorous analysis: making intuitive ideas completely precise.

## Check in, in Natural Language

Yet again, let's step back from the formal Lean proof and understand what we just proved in plain English.

**Theorem (in natural language):** If two sequences of real numbers converge to their respective limits, then the sequence formed by adding corresponding terms also converges, and its limit is the sum of the original limits.

**Proof:** Suppose sequences $a(n)$ and $b(n)$ converge to $L$ and $M$ respectively, and we want to show that $c(n) = a(n) + b(n)$ converges to $L + M$.

By definition, we need to show that for any tolerance $\\varepsilon > 0$, we can find a point $N$ such that for all $n \\geq N$, we have $|c(n) - (L + M)| < \\varepsilon$.

Since $a(n)$ converges to $L$, we can find $N_1$ such that $|a(n) - L| < \\varepsilon/2$ for all $n \\geq N_1$.
Since $b(n)$ converges to $M$, we can find $N_2$ such that $|b(n) - M| < \\varepsilon/2$ for all $n \\geq N_2$.

Let $N = N_1 + N_2$ (any number that's at least as large as both $N_1$ and $N_2$ would work). Then for any $n \\geq N$:

$$|c(n) - (L + M)| = |(a(n) + b(n)) - (L + M)| = |(a(n) - L) + (b(n) - M)|$$

By the triangle inequality, this is at most:
$$|a(n) - L| + |b(n) - M| < \\frac{\\varepsilon}{2} + \\frac{\\varepsilon}{2} = \\varepsilon$$

Therefore, $c(n)$ converges to $L + M$. **QED**

"
