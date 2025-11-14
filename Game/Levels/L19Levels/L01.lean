import Game.Levels.L18Lecture
import Game.Levels.L18PsetIntro

open Finset Function

World "Lecture19"
Level 1
Title "More Flexible Cauchy"
Introduction "
# Level 1: More Flexible Cauchy

If `a n` is absolutely convergent, then for any `ε > 0`, there is an `N` so that for
any finite set (`Finset ℕ`) whose elements all exceed `N`, we have that:

`∑ k ∈ S, |a k| < ε`.

## New theorems: `sum_le_sum_of_nonneg`, `sum_le_mem_of_nonneg`, `mem_Ico`

"

theorem sum_le_sum_of_nonneg {ι : Type*} {N : Type*} [AddCommMonoid N] [PartialOrder N]
  [IsOrderedAddMonoid N] {f : ι → N} {s t : Finset ι} (h : s ⊆ t) (hf : ∀ i ∈ t, 0 ≤ f i) :
  ∑ i ∈ s, f i ≤ ∑ i ∈ t, f i :=
  sum_le_sum_of_subset_of_nonneg h fun i a a_1 => hf i a

theorem sum_le_mem_of_nonneg {ι : Type*} {N : Type*} [AddCommMonoid N] [PartialOrder N]
  [IsOrderedAddMonoid N] {f : ι → N} {s : Finset ι} {i : ι} (hi : i ∈ s) (hf : ∀ i ∈ s, 0 ≤ f i) :
  f i ≤ ∑ j ∈ s, f j := by
have : ∑ j ∈ {i}, f j ≤ ∑ j ∈ s, f j := by
  apply sum_le_sum_of_nonneg
  intro j hj
  norm_num at hj
  rewrite [hj]
  apply hi
  apply hf
norm_num at this
apply this

/--
If `s ⊆ t`, and `0 ≤ f i`, for all `i ∈ t`, then `∑ i ∈ s, f i ≤ ∑ i ∈ t, f i`.
-/
TheoremDoc sum_le_sum_of_nonneg as "sum_le_sum_of_nonneg" in "Theorems"

/--
If `x ∈ s`, and `0 ≤ f i`, for all `i ∈ s`, then `f x ≤ ∑ i ∈ s, f i`.
-/
TheoremDoc sum_le_mem_of_nonneg as "sum_le_mem_of_nonneg" in "Theorems"

/--
For `a` and `b`, `x ∈ Ico a b ↔ a ≤ x ∧ x < b`.
-/
TheoremDoc Finset.mem_Ico as "mem_Ico" in "Theorems"


NewTheorem sum_le_sum_of_nonneg sum_le_mem_of_nonneg Finset.mem_Ico

/--
  If `Series a` converges absolutely, then for any `ε > 0`, there is an `N`, so that,
  for any finite set `S` whose elements are all at least `N`, `∑ k ∈ S, |a k| < ε`.
-/
TheoremDoc StrongCauchy_of_AbsSeriesConv as "StrongCauchy_of_AbsSeriesConv" in "Series"

Statement StrongCauchy_of_AbsSeriesConv
    {a : ℕ → ℝ} (ha : AbsSeriesConv a) {ε : ℝ} (hε : ε > 0) :
    ∃ N, ∀ (S : Finset ℕ), (∀ k ∈ S, k ≥ N) → ∑ k ∈ S, |a k| < ε := by
choose M hM using IsCauchy_of_SeqConv ha ε hε
use M
intro S hS
let sMax := 1 + ∑ k ∈ S, k
have sMaxIs : sMax = 1 + ∑ k ∈ S, k := by rfl
have kInS : ∀ k ∈ S, k < sMax := by
  intro n hn
  have f : id n ≤ ∑ k ∈ S, id k := by apply sum_le_mem_of_nonneg hn (by intro; bound)
  change n ≤ ∑ k ∈ S, k at f
  linarith [f, sMaxIs]
by_cases hSne : S.Nonempty
choose k0 hk0 using hSne
have hk0' : M ≤ k0 := by apply hS k0 hk0
have hk0'' : k0 ≤ sMax := by linarith [kInS k0 hk0]
have sMaxBnd : M ≤ sMax := by linarith [hk0', hk0'']
specialize hM M (by bound) sMax (by bound)
rewrite [show Series (fun n => |a n|) sMax - Series (fun n => |a n|) M =
  ∑ n ∈ Ico M sMax, (|a n|) by apply DiffOfSeries _ sMaxBnd] at hM
have f0 : 0 ≤ ∑ k ∈ S, |a k| := by apply sum_nonneg; intro n hn; bound
have hM0 : 0 ≤ ∑ k ∈ Ico M sMax, |a k| := by apply sum_nonneg; intro k hk; bound
rewrite [show |∑ k ∈ Ico M sMax, (|a k|)| = ∑ k ∈ Ico M sMax, |a k|  by apply abs_of_nonneg hM0] at hM
have Ssub : S ⊆ Ico M sMax := by
  intro k hk
  rewrite [mem_Ico]
  split_ands
  apply hS k hk
  linarith [kInS k hk]
have f2 : ∑ k ∈ S, |a k| ≤ ∑ k ∈ Ico M sMax, |a k| := by
  apply sum_le_sum_of_nonneg Ssub
  intro k hk
  bound
linarith [f2, hM]
norm_num at hSne
rewrite [hSne]
norm_num
apply hε


Conclusion "
"
