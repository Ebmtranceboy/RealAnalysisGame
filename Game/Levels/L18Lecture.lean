import Game.Levels.L18Levels.L01

World "Lecture18"
Title "Lecture 18: Rearrangements"

Introduction r"
# Lecture 18: Rearrangements

**SIMPLICIO:** Does rearranging the terms of a series change its sum?

**SOCRATES:** Great question! Here's the way I like to illustrate this idea. Imagine a massive
matrix, $M$, infinite in both directions, to the right, and down. It is upper triangular, has $-1$s on the diagonal, and at
position $(i, j)$ for $i < j$ its entry is $1/ 2 ^ {(j - i + 1)}$. So $M$ looks like this:

$
\begin{pmatrix}
-1 & 1/2 & 1/4 & 1/8 & 1/16 & \cdots \\
0 & -1 & 1/2 & 1/4 & 1/8 & \cdots \\
0 & 0 & -1 & 1/2 & 1/4 & \cdots \\
0 & 0 & 0 & -1 & 1/2 & \cdots \\
\vdots & \vdots & \vdots & \vdots & \vdots & \ddots
\end{pmatrix}
$

What is the sum of the elements in $M$?

**SIMPLICIO:** Ok let's see if we can work this out. Hmm this isn't so hard, I'll sum the rows, and
then add those up.

The first row sums to $-1 + 1/2 + 1/4 + 1/8 + \cdots = 0$.

The second row sum is $0 + -1 + 1/2 + 1/4 + \cdots = 0$ as well.

In fact, every row obviously sums to $0$. So the sum of all the elements in $M$ is $0$.

**SOCRATES:** Very good. What will my next question be?

**SIMPLICIO:** I bet you're going to ask me to sum the columns instead of the rows...?

**SOCRATES:** You bet! :)

**SIMPLICIO:** Alright, let's do that. The first column sums to $-1 + 0 + 0 + 0 + \cdots = -1$.

The second column sums to $1/2 + -1 + 0 + 0 + \cdots = -1/2$.

The third column sums to $1/4 + 1/2 + -1 + 0 + \cdots = -1/4$.

Ok, I see the pattern. The $n$th column sums to $-1 / 2^{n-1}$. So the sum of all the elements in $M$ is
$-1 - 1/2 - 1/4 - 1/8 - \cdots = -2$.

Uh oh. So what *is* the sum?

**SOCRATES:** Well that's just it! There is *no* 'the sum', because it depends on in what order you add the terms up!
A sequence is called 'conditionally convergent' if it converges, but not when you add absolute values.
That is, the matrix $|M|$ would look like this:

$
\begin{pmatrix}
1 & 1/2 & 1/4 & 1/8 & 1/16 & \cdots \\
0 & 1 & 1/2 & 1/4 & 1/8 & \cdots \\
0 & 0 & 1 & 1/2 & 1/4 & \cdots \\
0 & 0 & 0 & 1 & 1/2 & \cdots \\
\vdots & \vdots & \vdots & \vdots & \vdots & \ddots
\end{pmatrix}
$

and hopefully it's clear (just from the diagonal!) that the sum of all its elements diverges (to infinity).

People like Euler and Ramanujan were absolute wizards with divergent series, getting out of them all
kinds of bizarre results, like $1 + 2 + 3 + 4 + \cdots$ '`=`' $-1/12$. As the great
Oliver Heaviside supposedly once said, `This series is divergent, therefore we may be able to do something with it!`

**SIMPLICIO:** I like it! Let's go.

"
