import Game.Levels.L17Pset.L05
import Game.Levels.L17Pset.L05'
import Game.Levels.L17Pset.L06

World "L17Pset"
Title "Pset 17"

Introduction "
# Problem Set 17: Solve these problems in Natural Language:

$\\# 1)$ True or false: If a sequence `a : ℕ → ℝ` is bounded, then the
Cesaro-average sequence (see Problem Set 15, Problem 3) converges. Give a proof or a counterexample.

$\\# 2)$
Following Euler, work out the Taylor series for `sin(x)/x`, and show that it equals `1 - x²/3! + x⁴/5! - ...`.


$\\# 3)$
The next thing Euler did was totally crazy: he treated the sine function's infinite series like a polynomial, and factored it!
He claimed that

`sin(x)/x = (1 - x²/π²)(1 - x²/(4π²))(1 - x²/(9π²))...`

holds (it would take a long while to make this rigorous, but it *can* be done). Assume that this identity holds.
Compare the coefficient of `x²` in Problem 2 to the coefficient that comes from multiplying out this formula.
You should be able to deduce that

`1 + 1/4 + 1/9 + ... = π²/6`.

[Euler's claim was considered scandalous at the time—treating infinite series like polynomials! But Euler's intuition was correct, and later mathematicians -- most notably Weierstrass -- made it rigorous and general.]

"
