import Game.Levels.L15Levels.L01_check

World "Lecture15"
Title "Lecture 15: The Real Numbers"

Introduction "
# Lecture 15: The Real Numbers

**SIMPLICIO:** Ok, *now* can you tell me what the real numbers, `ℝ`, actually are?

**SOCRATES:** Almost. First: what are the integers, `ℤ`?
What \"problem\" are the integers trying to solve?

**SIMPLICIO:** Hmm... Subtraction?

**SOCRATES:** Very good! Yes, in fact, in Lean, do you know what `3 - 7` is?

**SIMPLICIO:** I'm guessing it's not `-4`, since that's not a natural number.
You've already told me that functions are \"total\", so if `3 : ℕ` is a natural number
and `7 : ℕ` is a natural number, then `3 - 7` will also be a natural number. So I don't know, is it ... `0`?

**SOCRATES:** Yep! In Lean, `3 - 7 = 0`. So the \"theorem\" that `N - 7 + 7 = N` is **literally False**! When `N = 3`, we get:

`3 - 7 + 7 = (3 - 7) + 7 = 0 + 7 = 7 ≠ 3`

So we have to fix subtraction. Here's one way to do it, one \"model\" for `ℤ`:

I want to think of `ℤ` as differences of naturals (but done properly this time); so let's start with `ℕ × ℕ`, just a pair of natural numbers.

**SIMPLICIO:**
Ok, and I guess what you're saying is that I'm supposed to imagine a pair `(m, n) : ℕ × ℕ` as representing the integer `m - n`?

**SOCRATES:**
Yes but
I don't want you to
 literally write `m - n`,
 since that doesn't have the right \"meaning\" (yet). Just keep the pair `(m, n)`.
What should addition look like on `ℕ × ℕ` so that it \"represents\" what we think of as integer addition, but in this model?


**SIMPLICIO:**  Hmm...
You're saying that if we're given, say, `(7, 2)`, which represents the integer `7 - 2 = 5`, and `(4, 8)`, which is meant to represent the integer `4 - 8 = -4`, then I want to define an operation `+ : (ℕ × ℕ) → (ℕ × ℕ) → (ℕ × ℕ)` representing addition. Ah! Why not just add the components? Then

`(7, 2) + (4, 8) = (7 + 4, 2 + 8) = (11, 10)`

which, in our mental model, is supposed to mean `11 - 10 = 1 = 5 + (-4)`. It works!

**SOCRATES:**
Great! You see why this works right? Ok, so what operation should we try to construct next?


**SIMPLICIO:**
How about multiplication?


**SOCRATES:**
Sure, go for it!

**SIMPLICIO:**
I have a feeling this won't be quite as simple. Oh, wait, no, I just have to do a little calculation first in my model. To multiply `(a, b)` by `(c, d)`, I should multiply `(a - b) * (c - d) = a * c - b * c - a * d + b * d`. Ah, I've got it; group the plusses and the minuses!

`(a, b)` \" `×` \" `(c, d)` should be defined as: `(a * c + b * d, a * d + b * c)`

Hey, this is fun!

**SOCRATES:**
I'm glad to hear it. But wait, I wanted to talk about another operation on `ℤ`, the one you can't do \"properly\" in `ℕ`...

**SIMPLICIO:**
Ah, sorry, subtraction.

**SOCRATES:**
There's no such thing! :)

**SIMPLICIO:**
Huh? Of course there is. But obviously you're trying to get me to say something... Oh, I see! If you have addition and **negation**, then you have subtraction. So subtraction is not a \"fundamental\" operation, it's merely the combination of two other operations. So we need to define negation?

**SOCRATES:**
You've got it! Nu?

**SIMPLICIO:**
What should the negation of `a - b` be? Easy! `b - a`. Oh, so *that's* the operation, just switch the entries!

\"`-`\" `(a, b) = (b, a)`

Nice!

**SOCRATES:** Indeed.
I'm sure that at this point, you could carry on like this, working out all the usual properties, commutativity, associativity, distribution, etc, just from the properties you already know about the natural numbers and their operations. But I want to move on to the real numbers. There's just one problem with your model of the integers.

**SIMPLICIO:**
Oh?

**SOCRATES:**
There's **too many of them**. What could I mean by that?

**SIMPLICIO:**
Oh, I see... The pair `(7, 2)` represents `5`, but so does the pair `(8, 3)`, and `(5, 0)`, and infinitely many others. So what are we supposed to do?

**SOCRATES:**
It turns out that it's not too difficult to solve this problem. We simply declare two pairs `(a, b)` and `(c, d)` to be \"the same\" (mathematicians would say \"equivalent\", and write `(a, b) ≈ (c, d)`) if their difference is zero. Lean's flexible handling of equality allows us to do this!

**SIMPLICIO:**
Oooooh cool! So wait, we're just going to say that the pair `(a, a)`, for any natural number `a`, *is* zero? And then two pairs `(a, b)` and `(c, d)` are \"equivalent\"
if:

`(a, b) - (c, d) = (a, b) + (d, c) = (a + d, b + c)`

has two equal entries, that is, when `a + d = b + c`?

**SOCRATES:**
Yes, exactly! Technically, we have to check a few things. This operation of calling things equivalent needs to be an \"equivalence relation\". This means that three conditions are satisfied:

- reflectivity: `x ≈ x` for any `x : ℕ × ℕ`,
- symmetry: `x ≈ y` if and only if `y ≈ x`, and
- transitivity: `x ≈ y` and `y ≈ z` implies that `x ≈ z`.

I'll let you check on your own that those hold for our notion of equivalence, `(a, b) ≈ (c, d)` if and only if `a + d = b + c`.

So finally, here's our \"official\" definition of the integers: they're the \"equivalence classes\" of `ℕ × ℕ` under the \"relation\" `≈`.

Pretty cool, huh?


**SIMPLICIO:**
Yes! But wait... We had defined addition on *pairs* `(a, b) + (c, d) = (a + c, b + d)`. But you're saying the integers are actually equivalence *classes* of pairs. So which pair in the equivalence class should I use when I compute a sum?

**SOCRATES:**
Excellent question! What do you think we should do?

**SIMPLICIO:** Hmm...
Well, ideally it shouldn't *matter* which representative I pick from each equivalence class. The answer should come out the same either way. Otherwise the whole construction would be ambiguous!

**SOCRATES:**
Very good! So what does that mean, precisely?

**SIMPLICIO:**
Let me think... Suppose I have two pairs `(a, b)` and `(a', b')` that represent the same integer, so `(a, b) ≈ (a', b')`. And suppose I have another two pairs `(c, d)` and `(c', d')` that also represent the same integer, so `(c, d) ≈ (c', d')`.

Then I need to check that when I add them:

`(a, b) + (c, d)` should be equivalent to `(a', b') + (c', d')`

Otherwise, the \"sum\" would depend on which representatives I chose, which would be a disaster!

**SOCRATES:**
Exactly! This is what mathematicians call \"well-definedness\". Can you verify that this actually holds for our definition of addition?

**SIMPLICIO:**
Let me try... So I'm assuming that `(a, b) ≈ (a', b')`, which means `a + b' = b + a'`. And I'm assuming that `(c, d) ≈ (c', d')`, which means `c + d' = d + c'`.

Now, we can calculate that `(a, b) + (c, d) = (a + c, b + d)` and `(a', b') + (c', d') = (a' + c', b' + d')`.

For these to be equivalent, I need that: `(a + c) + (b' + d') = (b + d) + (a' + c')`.

Let me rearrange the left side: `(a + c) + (b' + d') = a + b' + c + d'`.

And the right side: `(b + d) + (a' + c') = b + a' + d + c'`.

But wait! From my assumptions, I have `a + b' = b + a'` and `c + d' = d + c'`. So:

`a + b' + c + d' = (a + b') + (c + d') = (b + a') + (d + c') = b + a' + d + c'`

They're equal! So addition really is well-defined.

**SOCRATES:**
Excellent work! And of course, you'd need to verify the same property for multiplication and negation. In Lean, when you \"lift\" an operation from `ℕ × ℕ` to the quotient `ℤ`, you must provide exactly this kind of proof that the operation respects the equivalence relation.

**SIMPLICIO:**
That's great. So ... what does any of this have to do with the real numbers?

**SOCRATES:**
Well, remember how we proved that if you have a sequence that's bounded (from above and below), then it has a subsequence that's Cauchy?

**SIMPLICIO:**
Yeah, Bolzano-Weierstrass. So what?

**SOCRATES:**
And I kept dropping pretty big hints that a sequence being Cauchy was going to be equivalent to being convergent? (In fact, we proved one direction: if a sequence converges, then it's Cauchy.)

**SIMPLICIO:**
Yeah??

**SOCRATES:**
So all that's left is to prove that if a sequence is Cauchy, then it converges to a real number.


**SIMPLICIO:**
Yeah???

**SOCRATES:**
Ok, so here it is, here's the definition. This is your last chance. Take the blue pill and the real numbers go back to being a number line, and everything is honky-dory. Take the red pill, and there's no turning back; you'll never see the real numbers the same way again.

**SIMPLICIO:**
Oh would you just get on with it already!

**SOCRATES:**
Fine, sorry; just trying to build up some suspense.

**SIMPLICIO:**
Yes, I noticed.

**SOCRATES:** Ok.
So the reason that Cauchy sequences converge to real numbers is ... that:

Cauchy sequences **are** real numbers!!!

**SIMPLICIO:**
No duh, you telegraphed that from like a mile away.

**SOCRATES:**
You're ... completely unimpressed?

**SIMPLICIO:** Completely.


**SOCRATES:**
Hm, ok, fine. But... do you really get it?

**SIMPLICIO:**
What's not to get? You're saying that real numbers are Cauchy sequences.
I even remember our discussion of how we want real numbers to be limits of rational
sequences, but the way we defined limits presumed the existence of real numbers.
That was our rationale for defining Cauchy sequences in the first place.
It all works,
I get it.

**SOCRATES:**
Well, that's *almost* right.

**SIMPLICIO:**
Ok, so what's wrong?

**SOCRATES:**
You tell me.

**SIMPLICIO:** ... Well, ok...
Hmm... You told me a whole long story about `ℤ` and `ℕ × ℕ`. You were probably trying to
set something up. Oh, wow. Now I see it. Wow, that's ... SO cool!

**SOCRATES:**
What is it, what do you see?

**SIMPLICIO:**
There are **too many** Cauchy sequences!! Kind of like how there were too many elements
of `ℕ × ℕ`. I could have lots of *different* rational sequences all being Cauchy and converging to the same real number, and I wouldn't want to call them different real numbers. So what do we do?

**SOCRATES:**
Yes?

**SIMPLICIO:**
We say that Cauchy sequences are \"the same\"...

**SOCRATES:**
You mean \"equivalent\"

**SIMPLICIO:** ... yeah, whatever,
equivalent, if their limit is the same real number!

**SOCRATES:**
Whoops, you did it again! You can't use real numbers to define real numbers!!

**SIMPLICIO:**
Argh, right. Now I really see it. We just subtract the two Cauchy sequences.
There's one real number that we know for sure: ZERO!!!

So: two Cauchy sequences are *equivalent* if their difference (which we proved is also a Cauchy sequence) converges to Zero (which is a number we **know**, so we can easily speak of a sequence having limit zero)!

**SOCRATES:**
Now you've got the whole picture. The real numbers are:

Equivalence classes of Cauchy sequences of rational numbers.

**SIMPLICIO:**
Well, why didn't you just say so from the beginning! :)

**SOCRATES:**
I guess maybe I should have.
Hey, remember when we proved that the sum of two Cauchy sequences was Cauchy?

**SIMPLICIO:**
Yeah?

**SOCRATES:**
Any guesses what that means?

**SIMPLICIO:**
Oh! So we get all the operations on the real numbers *from* the operations we proved about Cauchy sequences! So cool! You just add two Cauchy sequences term by term, and get another. As you just explained, we'd have to check that this is \"well-defined\",
so that if you took two other Cauchy sequences that differ from our original two by sequences going to zero, then the limit also differs by a sequence going to zero. I think I could work out all the details pretty easily.


**SOCRATES:**
Wonderful, you've really got it now! Hey, remember all those headaches with casting between natural numbers and reals? What do you think that was all about?

**SIMPLICIO:**
Oh, I see! Since, unlike us humans, Lean can't \"cheat\", it *literally* has to go through all the motions we just described! So say you start with a natural number like `3`, which I remember is secretly `succ (succ (succ zero))`. To get to the real numbers, I'm guessing you
first have to coerce `3 : ℤ`, which, as we just saw, means something like creating the
pair `(3, 0)` in `ℕ × ℕ` (or anything else equivalent to it). Then we have to send
`(3, 0)` up to the rationals, which are probably something like `ℤ × ℕ` where the first
factor is supposed to be the numerator and the second is the denominator, and you have to worry about dividing by zero and equivalent fractions and so on and so forth. So as a rational number, I should really think of `3 : ℚ` as having turned into a fraction `3/1`. And finally,
to send that up to the reals, I need to make a Cauchy sequence that converges to `3`.
But that's easy, I just make the constant sequence! So that's what all those annoying
up arrows mean!!! The map `↑ : ℕ → ℝ` works like this:

`↑ : 3 ↦ (3/1, 3/1, 3/1, 3/1, 3/1, ...)`

That is truly amazing, it all really works!

**SOCRATES:**
It sure does :) Now let's keep playing.

"
