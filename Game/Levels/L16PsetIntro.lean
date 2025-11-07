import Game.Levels.L16Pset.L16Pset1
import Game.Levels.L16Pset.L16Pset2
import Game.Levels.L16Pset.L16Pset3

World "L16Pset"
Title "Pset 16"

Introduction "
# Problem Set 16: Solve these problems in Natural Language:

$\\# 1)$ Let `0 < x < 1`. Prove that the sequence `n ↦ x ^ n` converges to `0` as `n` tends to infinity. [Hint: First prove that the sequence is `Antitone` and bounded from below; therefore it converges to some limit `L`. Notice that the sequence `n ↦ x ^ (2 * n)` is a subsequence of the original, and hence converges to the same limit. On the other hand, `x ^ (2 * n) = (x ^ n) ^ 2`, so this subsequence converges to `L ^ 2`...]

$\\# 2)$ You will prove formally that the finite geometric series satisfies the formula:

`(1 - x) * ∑ k ∈ range n, x ^ k = 1 - x ^ n`.

Assume that `0 < x < 1` and use this to prove that the infinite geometric series

`∑ k, x ^ k`

converges to `1 / (1 - x)`.

$\\# 3)$ Find an explicit formula for the sequence of partial sums of the series

`∑ k, log ((k + 1) / k)`

and determine whether the series converges or diverges.

"
