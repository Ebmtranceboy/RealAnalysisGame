import Game.Levels.L14Lecture

World "Lecture15"
Level 1
Title "Completeness"

Introduction "
# Level 1 **Big Boss:**  Completeness!

This is the key defining characteristic of the Real Numbers:
they are \"complete\". This means that
any Cauchy sequence of *real* numbers converges to a real number!

But we just learned that real numbers are themselves Cauchy sequences of rationals
(or rather, equivalence classes thereof). So how can we prove completeness?

Ah! Let's say that our sequence of reals is `(x₀, x₁, x₂, ...)`. Each
real `xᵢ` has a representation as a Cauchy sequence `(qᵢ₀, qᵢ₁, qᵢ₂,...)` of rationals!

So we have a double-indexed array of rationals:

```
       j=0    j=1    j=2    j=3    ...
i=0:   q₀₀    q₀₁    q₀₂    q₀₃    ...   ← represents x₀
i=1:   q₁₀    q₁₁    q₁₂    q₁₃    ...   ← represents x₁
i=2:   q₂₀    q₂₁    q₂₂    q₂₃    ...   ← represents x₂
i=3:   q₃₀    q₃₁    q₃₂    q₃₃    ...   ← represents x₃
 ⋮      ⋮      ⋮      ⋮      ⋮
```

Each **row** is a Cauchy sequence (that's our assumption `hx`).

The key insight (reminiscent of a Cantor \"diagonalization\" type argument, very prevalent in real analysis): we can extract the **diagonal** sequence `(q₀₀, q₁₁, q₂₂, q₃₃, ...)`!

This diagonal sequence will be Cauchy, and it will represent the limit of our
sequence of reals `(x₀, x₁, x₂, ...)`.

**Your task:** Prove that there exists a sequence `y : ℕ → ℚ` which is Cauchy,
and such that the sequence of reals `(x₀, x₁, x₂, ...)` converges to the real
number represented by `y`.

For this level, we'll simplify a bit and just prove the existence of the diagonal
sequence and that it's Cauchy. The full convergence proof would require more
machinery about equivalence classes that we haven't set up yet.

## New theorem: `Conv_of_IsCauchy` : `IsCauchy (a : ℕ → X)` implies that `SeqConv a`.

Given that a limit exists, we get the following

## New definition: `Real_of_CauSeq` takes `IsCauchy a` and returns a real number.

This real number does what we want:

## New theorem: `SeqLim_of_Real_of_Cau` : `ha : IsCauchy (a : ℕ → X)` implies that `SeqLim a (Real_of_CauSeq ha)`.

"

instance : Coe ℚ ℝ where
  coe := Rat.cast

instance : Coe ℝ ℝ where
  coe := id

theorem Conv_of_IsCauchy {X : Type*} [NormedAddGroup X] [Lattice X] [Coe X ℝ] {a : ℕ → X} (ha : IsCauchy a) : SeqConv (a ·) := by
-- in Mathlib
  sorry

noncomputable def Real_of_CauSeq {X : Type*} [NormedAddGroup X] [Lattice X] [Coe X ℝ] {a : ℕ → X} (ha : IsCauchy a) : ℝ := by
  choose L hL using Conv_of_IsCauchy ha
  exact L

theorem SeqLim_of_Real_of_Cau {X : Type*} [NormedAddGroup X] [Lattice X] [Coe X ℝ] {a : ℕ → X} (ha : IsCauchy a) : SeqLim (a ·) (Real_of_CauSeq ha) := by
  sorry

Statement (x : ℕ → ℕ → ℚ) (hx : ∀ n, IsCauchy (x n))
  (hCauchy_x : IsCauchy (fun n ↦ Real_of_CauSeq (hx n))) :
  ∃ (y : ℕ → ℚ), IsCauchy y ∧ SeqLim (fun n ↦ Real_of_CauSeq (hx n)) (Real_of_CauSeq hCauchy_x) := by
use fun n ↦ x n n
split_ands
unfold IsCauchy
intro ε hε
change ∃ N, ∀ n ≥ N, ∀ m ≥ n, |x m m - x n n| < ε
choose N1 hN1 using hCauchy_x (ε / 3) (by norm_cast; bound)
have hm_lim (m) := SeqLim_of_Real_of_Cau (hx m) (ε / 3) (by norm_cast; bound)

sorry
sorry

Conclusion "
Excellent! You've just proved that the diagonal sequence is Cauchy!

This is the heart of the completeness proof. The full argument would show that:

1. The diagonal sequence `y = (q₀₀, q₁₁, q₂₂, ...)` is Cauchy ✓ (what you just proved!)
2. Each real `xₙ` is equivalent to subsequences of `y`
3. Therefore `(xₙ)` converges to `[y]` (the equivalence class of `y`)

The beautiful thing is that **completeness becomes almost tautological** with
this construction: Cauchy sequences of Cauchy sequences give you a Cauchy sequence!

This is why mathematicians like this construction of ℝ - the main theorem
(completeness) essentially falls out of the definition for free.

**Philosophical note:** With the Dedekind cut construction, completeness is also
\"automatic\" but for different reasons. With Cauchy sequences, it's more direct:
we literally construct limits as equivalence classes of sequences that \"should\"
converge.
"

Statement (x : ℕ → ℕ → ℚ) (hx : ∀ n, IsCauchy (x n)) :
  ∃ (y : ℕ → ℚ), IsCauchy y ∧


Conclusion "
"
