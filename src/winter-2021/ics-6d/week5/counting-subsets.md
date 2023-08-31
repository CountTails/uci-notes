# Counting subsets

## Two different counting problems

- Student council has 15 members. Must select a president, a VP, a treasurer, and a secretary
	- A selection is a 4-permutations
	- Orders matters
- Student council has 15 members. Must select an executive committee with 4 members
	- A selection is a 4-subset
	- Order doesn't matter

### Counting subsets vs. permutations

- $S = \{ a,\, b,\, c \}$
- The number of 2-permutations from $S$ is 6
	1) (a, b)
	2) (a, c)
	3) (b, a)
	4) (b, c)
	5) (c, a)
	6) (c, b)
- The number of 2-subsets from $S$ is 3
	1) {a, b}
	2) {a, c}
	3) {b, c}

### From permutations to subsets

- Set $S$ with $n$ elements
- $f: \text{r-permutations from S} \to \text{r-subsets from S}$
- Function $f$ is $r!$-to-1
- To compute the number of r-subsets
	1) Compute the number of r permutations
	2) Divide by $r!$
- The number of r-subsets chosen from a set of $n$ elements is

$$
	C(n,r) = {n \choose r} = \frac{n!}{r!(n-r)!} = \frac{P(n, r)}{r!}
$$

- Read as "n choose r"

### Property of subsets

$$
	{n \choose r} = {n \choose n - r}
$$

- Can show by arithmetic
	- $\frac{n!}{r!(n-r)!} = \frac{n!}{(n-r)!(n-(n-r)!)}$
	- $= \frac{n!}{(n-r)!r!}$
- Can show by bijection
	- $f: \text{r-subsets of S} \to \text{(n-r)-subsets of S}$
	- $f(A) = \overline{A}$

## Playing cards

- A standard deck of playing cards has 52 cards
	- 13 ranks
	- 4 suits
- Each card has a rank and a suit
- Every rank/suit combination possible
	- $4 * 13 = 52$

### 5 card hand

- A 5-card hand is a subset of 5 of the 52 cards
	- Order doesn't matter
	- There are ${52 \choose 5}$ 5-card hands in a standard playing deck

### 5 card hands with exactly 3 clubs

- 3 cards of the hand must be a fixed suit with 13 possible ranks
- The remaining 2 cards can be any of the 39 remaining cards
- There are ${13 \choose 3} {39 \choose 2}$ 5 card hands with exactly 3 clubs