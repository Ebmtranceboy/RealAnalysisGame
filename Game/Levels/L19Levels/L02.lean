import Game.Levels.L19Levels.L01

open Finset Function

World "Lecture19"
Level 2
Title "Rearrangements"
Introduction "
# Level 2: Rearrangements

Theorem `EventuallyCovers_of_Rearrangement`:
If `σ` is a `Rearrangement`, then for any `M : ℕ`, there is an `N` so that, for all
`n ≥ N`, the `image` of
`σ` on `range n` contains `range M`.

## New definition: `Injective`, `Surjective`, `Rearrangement`, `Finset.Nonempty`, `image`

"

def Rearrangement (σ : ℕ → ℕ) : Prop := Injective σ ∧ Surjective σ

/--
A function `f` is called `Injective` if: for all `i, j`, `f i = f j → i = j`.
-/
DefinitionDoc Injective as "Injective"


/--
A function `f : X → Y` called `Surjective` if: for all `y : Y`, `∃ x : X` so that `f x = y`.
-/
DefinitionDoc Surjective as "Surjective"


/--
A `Rearrangement` `σ : ℕ → ℕ` is a function that is `Injective` and `Surjective`.
-/
DefinitionDoc Rearrangement as "Rearrangement"

NewDefinition Rearrangement Surjective Injective

/--
  If `σ` is a `Rearrangement`, then for any `M`, there is an `N`, so that,
  for all `n ≥ N`, the `range M` is contained in `image σ (range n)`.
-/
TheoremDoc EventuallyCovers_of_Rearrangement as "EventuallyCovers_of_Rearrangement" in "Theorems"

Statement EventuallyCovers_of_Rearrangement
    {σ : ℕ → ℕ} (hσ : Rearrangement σ) (M : ℕ) :
    ∃ N, ∀ n ≥ N, (range M) ⊆ image σ (range n) := by
have surj : ∀ j, ∃ n, σ n = j := hσ.2
choose τ hτ using surj
let N := 1 + ∑ k ∈ range M, τ k
have hN : N = 1 + ∑ k ∈ range M, τ k := by rfl
use N
intro n hn m hm
rewrite [mem_image]
use τ m
split_ands
rewrite [mem_range]
have hτ' : ∀ k ∈ range M, 0 ≤ τ k := by intro k hk; bound
have f : τ m ≤ ∑ k ∈ range M, τ k := by apply sum_le_mem_of_nonneg hm hτ'
linarith [f, hN, hn]
apply hτ m


Conclusion "
"
