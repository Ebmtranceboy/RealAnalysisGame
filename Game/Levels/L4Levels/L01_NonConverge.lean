import Game.Levels.L3Lecture

open Nat Real

World "Lecture4"
Level 1
Title "NonConvergence"

Introduction "
# A Great Debate

In the 19th century, when people were still confused about limits in general, there was a specific sequence that they fought over:

1, -1, 1, -1, 1, -1, ...

Does this converge or not???

Some people said, well, you go up one then down one, so on average, it's around zero. So the limit should be 0.

Other people said: look at the partial sums of the sequence:

1 = 1

1 + (-1) = 0

1 + (-1) + 1 = 1

1 + (-1) + 1 + (-1) = 0

Ah so the partial sums alternate between 1 and 0, so maybe the limit is 1/2!

This is the kind of trouble you get into if you don't have a community consensus on what the definitions of things are, namely, if you don't have a rigorous definition of limit. Luckily, we now do!

With that definition, this sequence .... does not have a limit (\"diverges\").

In order to express that formally, let's make a new definition:

`def SeqConv (a : ℕ → ℝ) : Prop := ∃ L, SeqLim a L`

That is, a sequence `a` \"converges\" (without specifying to what), if there indeed exists some real number `L`
so that `a` converges to that number.

In this level, then, our goal is to prove:

`Goal : ¬ SeqConv a`,

given the assumption `ha : ∀ n, a n = (-1 : ℝ) ^ n`. (Note that the \"not\" symbol, `¬`, is obtained by typing
`\\not`.)

How do you prove the negation of something? Logically speaking, you would say, well, if that thing did happen, then we'd have a contradiction. Technically, `¬ P` is definitionally equivalent to: `P → False`.

So we could start our proof by reminding ourselves of this fact, by typing:

`change SeqConv a → False`

That will change the Goal to: `SeqConv a → False`.

In general, I would recommend the following protocol:

1) Think. Do scratchwork, get a vague sense of how to piece the argument together.

2) Then prove it formally. You're NOT done! Just because you proved it formally doesn't *necessarily* mean that you really understand what's going on! The goal of mathematics is *not* that it just works, but rather that you **understand** exactly what's going on. So step 3 is:

3) Give a natural language proof that explains (to yourself, as much as to anyone else, including me) what's going on and why.

Using only knee jerk reactions (if you see `P → Q` in the Goal, write `intro`. If you see `∃` in a hypothesis, write `choose`. If you see a definition in the Goal or a hypothesis, write `change`), we got as far as:

**Objects:** `a : ℕ → ℝ`, `L : ℝ`

**Assumptions:** `ha : ∀ (n : ℕ), a n = (-1) ^ n`, `hL : ∀ ε > 0, ∃ N, ∀ n ≥ N, |a n - L| < ε`

**Goal:** `False`

Remember the Engineer and Mechanic: the Engineer gets to specify any tolerance, and the Mechanic has to guarantee that we'll be within that tolerance \"eventually\", that is, for all large enough `n`, as measured by the lower bound `N`.

**Key Idea:** Find an `ε` that is too tight a tolerance, and the Mechanic will never be able to get within that specification. Because the sequence alternates between `1` and `-1`, which differ by `2`, the tolerance `ε = 1` would already be enough, but just to be safe, let's give ourselves a little more room, and set `ε = 1/2`.

Note: Had we set `ε = 1.5`, that would *not* work. We can't rule out the possibility that `L= 0`, and both values `1` and `-1` *are* indeed within that tolerance. So we won't find a contradiction that way.


After a bunch of computation, we reached the following:

`|1 - L| < 1/2`

and

`|-1 - L| < 1/2`

Let's try to come up with a contradiction from that.

`2 = |2| = |1 - (-1)| = |(1 - L) + (L - (-1))|`

`≤|(1 - L)| + |(L - (-1))| = |(1 - L)| + |-((-1) - L)|`

`= |(1 - L)| + |((-1) - L)| < 1/2 + 1/2 = 1`

And that get us the desired contradiction.


## New Tools You'll Need

- **Negation**: If `P` is some `Prop`, then `¬ P` is definitionally equivalent to `P → False`. So you can write `change P → False`, either at the Goal, or `at` a hypothesis.


- **The triangle inequality**: To add the fact that `|x + y| ≤ |x| + |y|` to our list of hypotheses, invoke the `abs_add` theorem:

`have factName : |x + y| ≤ |x| + |y| := by apply abs_add`

- **Negation inside an absolute value**: You may also find useful the theorem `abs_neg`, which can be called via:

`have factName : |-x| = |x| := by apply abs_neg`

Warning! Make sure the pattern `|-Something|` is on the left hand side. If Lean doesn't see an absolute value
followed by a minus sign, `abs_neg` won't work!


"

/--
Usage: `have factName : |x + y| ≤ |x| + |y| := by apply abs_add`
-/
TheoremDoc abs_add as "abs_add" in "Theorems"

/--
Usage: `have factName : |-x| = |x| := by apply abs_neg`
-/
TheoremDoc abs_neg as "abs_neg" in "Theorems"

NewTheorem abs_add abs_neg

/-- `(a : ℕ → ℝ) := ∃ L, SeqLim a L`

A sequence `a : N → ℝ` converges (`SeqConv a` holds) if there exists some
`L : ℝ` so that `a → L`, that is, `SeqLim a L` holds. -/
DefinitionDoc SeqConv as "SeqConv"

NewDefinition SeqConv

def SeqConv (a : ℕ → ℝ) : Prop :=
  ∃ L, SeqLim a L

/-- Prove that the sequence `1`, `-1`, `1`, `-1`,... diverges.
-/
Statement (a : ℕ → ℝ) (ha : ∀ n, a n = (-1) ^ n) :
  ¬ SeqConv a := by
  change SeqConv a → False
  intro h
  change ∃ L, SeqLim a L at h
  choose L hL using h
  change ∀ ε > 0, ∃ N, ∀ n ≥ N, |a n - L| < ε at hL
  specialize hL (1/2)
  have whatever : (0 : ℝ) < 1/2 := by norm_num
  specialize hL whatever
  choose N hN using hL
  have h2N : N ≤ 2 * N := by bound
  have h2Np1 : N ≤ 2 * N + 1 := by bound
  have f1 : |a (2 * N) - L| < 1 / 2 := by apply hN (2 * N) h2N
  have f2 : |a (2 * N + 1) - L| < 1 / 2 := by apply hN (2 * N + 1) h2Np1
  have f3 : a (2 * N) = (-1) ^ (2 * N) := by apply ha (2 * N)
  have f4 : a (2 * N + 1) = (-1) ^ (2 * N + 1) := by apply ha (2 * N + 1)
  rewrite [f3] at f1
  rewrite [f4] at f2
  have f5 : (-1 : ℝ) ^ (2 * N) = 1 := by bound
  rewrite [f5] at f1
  have f6 : (-1 : ℝ) ^ (2 * N + 1) = -1 := by bound
  rewrite [f6] at f2
  have f7 : (2 : ℝ) = |2| := by norm_num
  have f8 : |(2 : ℝ)| = |1 - (-1)| := by ring_nf
  have f9 : |1 - (-1)| = |(1 - L) + (L - (-1))| := by ring_nf
  have f10 : |(1 - L) + (L - (-1))| ≤ |(1 - L)| + |(L - (-1))| := by apply abs_add
  have f11 : |(L - (-1))| = |-((-1) - L)| := by ring_nf
  have f12 : |-((-1) - L)| = |((-1) - L)| := by apply abs_neg
  have f13 : (2 : ℝ) < 1/2 + 1/2 := by linarith [f8, f9, f10, f11, f12, f7, f1, f2]
  norm_num at f13

Conclusion " Step 3:
Once more, in natural language.


## Natural Language Proof

**Theorem:** The sequence `1`, `-1`, `1`, `-1`, ... does not converge.

**Proof by contradiction:**
1. Suppose the sequence converges to some limit `L`
2. Set `ε = 1 / 2` and apply the convergence definition
3. This guarantees some `N` such that `|a n - L| < 1 / 2` for all `n ≥ N`
4. Consider two specific indices: `n = 2N` and `n = 2N+1` (both are `≥ N`)
   - `a (2N) = (-1)²ᴺ = 1`, so `|1 - L| < 1 / 2`
   - `a (2N+1) = (-1)²ᴺ⁺¹ = -1`, so `|-1 - L| < 1 / 2`.
5. But then:

   `2 = |1 - (-1)| = |(1 - L) + (L + 1)|`

     `≤ |1 - L| + |L + 1|`     [triangle inequality]

     `= |1 - L| + |-1 - L|`    [algebraic manipulation]

     `< 1/2 + 1/2 = 1`         [from steps above]
6. This gives us `2 < 1`, which is impossible. QED

## Key Insights

- **Geometric intuition:** Any proposed limit L must be within 1/2 of both 1 and -1 simultaneously, but these values are distance 2 apart
- **Critical ε choice:** We chose ε = 1/2 strategically; larger values like ε = 1.5 wouldn't work since L = 0 could satisfy the constraints.
- **Triangle inequality:** The key step uses |a + b| ≤ |a| + |b| to convert the distance between sequence values into a sum of distances from the limit.

This proof exemplifies how rigorous definitions resolve historical mathematical debates and provide clear criteria for convergence.

"
