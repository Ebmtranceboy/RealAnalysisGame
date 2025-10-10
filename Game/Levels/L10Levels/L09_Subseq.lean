import Game.Levels.L10Levels.L08_Mono

open Finset

World "Lecture10"
Level 4
Title "Subsequence Example"

Introduction "
# Level 4: Subsequence Example

We've proven that `(-1)^n` does not converge—it oscillates between -1 and 1 forever. But even though the full sequence diverges, it has subsequences that converge!

**The Goal:** Exhibit a subsequence of `a n = (-1)^n` that converges to some limit `L`.

**The Idea:** Extract the **even-indexed terms**.

Define `σ(n) = 2*n`, which picks out indices 0, 2, 4, 6, 8, ...

Then:
- `(a ∘ σ)(0) = a(0) = (-1)^0 = 1`
- `(a ∘ σ)(1) = a(2) = (-1)^2 = 1`
- `(a ∘ σ)(2) = a(4) = (-1)^4 = 1`
- `(a ∘ σ)(n) = a(2n) = (-1)^(2n) = 1` for all `n`

So the subsequence is constant: `1, 1, 1, 1, ...` which clearly converges to 1!

**New Tool: The `let` Tactic**

To define `σ` within our proof, we use the `let` tactic. This creates a new variable or function/sequence (unlike `have`, which proves propositions).

**The `fun` Keyword:**

To create a function in Lean, we use `fun`:
```
fun x ↦ expression
```
This creates a function that takes input `x` and returns `expression`.

The arrow `↦` (type `\\mapsto` or just use `=>`) separates input from output.

Example: `fun x ↦ x ^ 2` is the squaring function.

**Combining `let` and `fun`:**

```
let σ : ℕ → ℕ := fun n ↦ 2 * n
```

This defines a function `σ : ℕ → ℕ` by `σ(n) = 2*n`.

**The Proof Structure:**

We need to prove `∃ σ L, Subseq σ ∧ SeqLim (a ∘ σ) L`.

1. Define `σ(n) = 2*n` using `let`
2. Use `σ` and `L = 1` as our witnesses
3. Prove two things:
   - `σ` is a subsequence (strictly increasing)
   - `a ∘ σ` converges to 1

For part 2, compute `a(2*n) = (-1)^(2*n) = 1`, so `|a(2*n) - 1| = 0 < ε` for any `ε > 0`.

**The Deeper Lesson:**

Even though `(-1)^n` diverges, we can extract convergent behavior by focusing on the even terms (or odd terms). This shows that **subsequences can be better behaved than the original sequence**.

The fact that the even and odd subsequences converge to *different* limits (1 and -1) is exactly what proves the original sequence diverges!
"



/-- The `let` tactic is like `have`, but for creating variable names or functions. -/
TacticDoc «let»

NewTactic «let»

/-- Prove this
-/
Statement (a : ℕ → ℝ) (ha : ∀ n, a n = (-1) ^ n) :
    ∃ σ L, Subseq σ ∧ SeqLim (a ∘ σ) L := by
let σ : ℕ → ℕ := fun n ↦ 2 * n
use σ, 1
split_ands
intro i j hij
change 2 * i < 2 * j
linarith [hij]
intro ε hε
use 0
intro n hn
change |a (2 * n) - 1| < ε
specialize ha (2 * n)
rewrite [ha]
have f1 : (-1 : ℝ) ^ (2 * n) = 1 := by bound
rewrite [f1]
norm_num
apply hε

Conclusion "
Excellent! You've shown that the oscillating sequence `(-1)^n` has a convergent subsequence.

**What We Constructed:**

The subsequence `σ(n) = 2*n` extracts the even-indexed terms:
- Original sequence: `-1, 1, -1, 1, -1, 1, ...`
- Even subsequence: `1, 1, 1, 1, ...` → converges to 1

**The Other Subsequence:**

Similarly, the odd-indexed subsequence `τ(n) = 2*n + 1` gives:
- Odd subsequence: `-1, -1, -1, -1, ...` → converges to -1

**Why This Proves Divergence:**

We now have **two subsequences converging to different limits** (1 and -1). By the Subsequence Theorem, if the full sequence `(-1)^n` converged to some limit `L`, then *every* subsequence would have to converge to that same `L`.

But we have subsequences converging to 1 and -1, which are different! This is a contradiction, so `(-1)^n` does not converge.

This is a powerful technique: **to prove divergence, exhibit two subsequences with different limits.**

**The `let` Tactic in Action:**

Notice how `let` allowed us to define `σ` cleanly within the proof. The `fun n ↦ 2*n` syntax creates an anonymous function, and `let` gives it a name we can use.

This is much cleaner than trying to construct the function implicitly!

**Subsequences Extract Hidden Structure:**

Even though `(-1)^n` oscillates wildly and has no limit, by looking at subsequences we can isolate the \"constant behavior\" hidden within:
- The even terms are constantly 1
- The odd terms are constantly -1

Subsequences let us zoom in on specific patterns and behaviors that might be obscured in the full sequence.

**Coming Up:**

- Other oscillating sequences with convergent subsequences
- The **Bolzano-Weierstrass Theorem**: every *bounded* sequence has a convergent subsequence (this is much deeper!)
- Using subsequences to understand **limsup** and **liminf**

Great work on completing Lecture 10! You now have the complete Algebraic Limit Theorem, order properties of limits, and the power of subsequences at your disposal.
"

-- OrderLimGe in exercises
