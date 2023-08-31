# Infinities in math and computation

## Big questions

- Are there different "infinities"?
- How does the number of mathematical functions compare with the number of computer program (both are infinite)?
- Can we precisely specify a function that cannot be written as a computer program (there are more functions than programs)?

## Proof by contradiction

- Assume that a statement is TRUE
- By mathematical logic, deduce the consequence of such a statement
- If the statement is known to be FALSE (a contradiction) is deduced, the original statment must be FALSE

So, to prove S is TRUE, assume S is FALSE and show that such an assumption leads to a contradiction: then S is proved TRUE

### Example

To prove $\sqrt{2}$ is irrational, assume the opposite: that it is rational and can be represent as the ratio of two integers $p$ and $q$ that have NO common factors

- $\sqrt{2} = \dfrac{p}{q}$
- Squaring both sides: $2 = \dfrac{p^{2}}{q^{2}}$
- Multiply by $q^{2}$: $2q^{2} = p^{2}$
- $p^{2}$ is even if it has a factor of $2$ -> $p$ is even
- If $p$ odd -> $p^{2}$ is also odd
- Let $p = 2m$
- Substitute: $2q^{2} = (2m)^{2} \to 2q^{2} = 4m^{2} \to q^{2} = 2m^{2}$
- $q^{2}$ is even if it has a factor of $2$
- If $q$ odd -> $q^{2}$ is also odd

Contradiction: $p$ and $q$ are both even, so they have a common factor of $2$

Since a contradiction was reached, the original assumption is FALSE, therefore $\sqrt{2}$ cannot be written as a ratio of two integers

## Comparing sizes of finite sets

1) Count the elements

```
A = {a, b, c}
X = {x, y, z}

|A| = 3
|X| = 3
```

2) Pair the elements

```
A = {a, b, c}
     ^  ^  ^
     |  |  |
     v  v  v
X = {x, y, z}
```

In a 1-to-1 mapping, every element in a set appears at the end of exactly one arrow. Therefore `|A| = |X|`. We do not need to know the actual size of either set to know they are the same size

## Comparing sizes of infinite sets

- Sets of positive and whole numbers have the same size
- Sets of positive and even numbers have the same size

## The first infinity

The sets of positive, whole, even, and integer numbers all have the same size

The set of rationals is also the same size of the aforementioned sets

The set of real numbers is bigger than the first infinity

## The continuum hypothesis

In summary, $X_{0} = |P| < |R| = X_{1}$

There is no such set $S$ such that $X_{0} < |S| < X_{1}$

This hypothesis is unproven, although it has been proven that most of mathematics remains the same regardless of whether it is TRUE or FALSE

## The halting problem

Does there exist a program H, which given any program P and data D determines whether or not P halts when run on D?

Let P(D) denote running program P on data D.

So H(P,D) is either T or F, depending on whether or not P(D) halts.

H itself must always halt and produce an answer telling whether P(D) halts.

### A partial answer

We can  *almost* compute H by running program P on data D and returning T whenever P(D) halts; but such a function would never return a value if P(D) never halted. At some point an actual H would have to return F -- when it *knew* that P(D) would never halt -- if it could somehow know

### Proving the Halting problem is unsolvable

Assume H(P,D) exists as described; define G(x) = if H(x,x) then loop forever else halt;

Does G(G) halt?

If we assume it halts, we can prove it runs forever; if we assume it runs forever, we can prove it halts. Therefore, we have constructed a function G that cannot exist; therefore H cannot exist, because if H existed, we could easily construct G as described above.

### H is a powerful theorem prover

If H existed, we could use it as a powerful theorem prover in mathematics.

> Fermat's Conjecture:
> There are no integral solutions to the equation $a^{n} + b^{n} = c^{n}$ for $n > 2$

Write a program that generates every possible integral value for a, b, c, and n. The program halts if and only if the conjecture is FALSE