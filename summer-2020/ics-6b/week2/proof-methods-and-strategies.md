# Proof methods and strategies

## By case

Given an extensive list of all possible cases, show each one to be true

$$
    (p_{1} \lor p_{2} \lor \dots \lor p_{k}) \implies q
$$

$$
    (p_{1} \implies q) \land (p_{2} \implies q) \land \dots \land (p_{k} \implies q)
$$

Example: $(n < 7) \implies 2^{n} < 100$

Proof:

- $n = 1 \implies 2^{1} < 100 \equiv T$
- $n = 2 \implies 2^{2} < 100 \equiv T$
- $n = 3 \implies 2^{3} < 100 \equiv T$
- $n = 4 \implies 2^{4} < 100 \equiv T$
- $n = 5 \implies 2^{5} < 100 \equiv T$
- $n = 6 \implies 2^{6} < 100 \equiv T$

Example: $\vert xy \vert = \vert x \vert \cdot \vert y \vert$

Proof:

- (++): $\vert xy \vert = xy = \vert x \vert \cdot \vert y \vert$
- (+-): $\vert xy \vert = -xy = x(-y) = \vert x \vert \cdot \vert y \vert$
- (-+): same as above, but signs swapped
- (--): $\vert xy \vert = (-x)(-y) = \vert x \vert \cdot \vert y \vert$

## Existence proofs

1) Constructive proofs: find an example
2) Nonconstructive proofs: show something to be true without giving an example

Example: $\exists_{(x, y)} \, \text{both irrational such that } x^{y} \text{ is rational}$

Proof: 

1) Consider $\sqrt{2}^{\sqrt{2}}$ . There are 2 cases to consider
2) $\sqrt{2}^{\sqrt{2}}$ is rational
    1) set $x = y = \sqrt{2}$ are we are done
3) $\sqrt{2}^{\sqrt{2}}$ is rirational
    1) set $x = \sqrt{2}^{\sqrt{2}}$
    2) set $y = \sqrt{2}$
    3) $x^{y} = (\sqrt{2}^{\sqrt{2}})^{\sqrt{2}} = (\sqrt{2})^{2} = 2$ (rational)

## Existance and uniqueness proofs

1) Show existance
2) Show either $y \ne x \implies \neg P(x)$ or $\forall_{x} P(y) \implies y = x$

## Backwards reasoning

Provides hints about a proof by starting at the conclusion. If any equivalences become implications, the proof fails are needs to be modified

Example: Show the geometric mean of two distinct  positive numbers is always less arithmetic mean

Proof:

1) $\dfrac{x + y}{2} > \sqrt{xy}$ (What we want proven)
2) $\dfrac{(x + y)^{2}}{4} > xy$
3) $(x + y)^{2} > 4xy$
4) $x^{2} + 2xy + y^{2} > 4xy$
5) $x^{2} - 2xy + y^{2} > 0$
6) $(x - y)^{2} > 0$ (True if $x \ne y$)

## Adapting similar proofs of similar theorems

Look for counter examples

1) Conjecture might be false
2) How to adjust conjecture
3) Can't find one? often gives ideas for a proof

Lack of a counter example is **NOT** a proof

> Collatz conjecture: 
>     Pick any integer n. 
>         If n is even, n = n/2. 
>         If n is odd, n = 3n + 1. 
>      The sequence will end with n = 1 (Proposed in 1937, still unproven)

>Fermat's last theorem:
>    let a, b, c be integers. There is no such a, b, c for $a^{n} + b^{n} = c^{n}$ for $n > 2$

Creating proofs is a difficult, nonlinear process. It requires perseverance, patience, time, creativity, and *experience*

## Incorrect "proofs"

Example $1 = 2$

"Proof": Let a and b be two equal positive integers

1) $a = b$
2) $a^{2} = ab$
3) $a^{2} - b^{2} = ab - b^{2}$
4) $(a - b)(a + b) = b(a - b)$ **ERROR**: we just divided by 0
5) $a + b = b$
6) $2b = b \implies 2 = 1$

## Levels of proofs

- formal: (slow and careful)(every step is justified)
- non-rigorous
    - verifying proofs are easy
    - generating proofs are simple
    - even mechanically checked proofs are not 100% certain (hardware problems)
- rigorous numerics
    - floating point round offs $\approx 10^{16}$

## Probably true, but hard to prove

- Worldy things can be virtually certain, but unprovable
- Evidence not rigorous, almost  certainly true
- with probability 1 (flip fair coin enough times and head will appear)

## Logical syllogisms

- "All men are mortal" (Induction -- not 100%)
- "Socrates is a man" (adduction: process to create a story that fits observations and has a universal law supporting it)
- "Socrates is mortal" (deduction)