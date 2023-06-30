# Introduction to counting

## The product rule

- The product rule gives a way to count sequences
	- Example: lunch special at a restaurant includes a selection of sandwich, side, and drink
		- Sandwiches = $\{ \text{Burger},\, \text{Grilled chicken},\, \text{Grilled cheese}\}$
		- Sides = $\{ \text{Fries},\, \text{Fruit} \}$
		- Drinks = $\{ \text{Coke},\, \text{Diet Coke},\, \text{OJ},\, \text{Sprite} \}$
	- A lunch selection is specified by a triple
		- $([\text{Sandwich}],\, [\text{Side}],\, [\text{Drink}])$
	- The product rule says that the number of distinct lunch choices is
		- $\vert \text{Sandwiches} \vert \times \vert \text{Sides} \vert \times \vert \text{Drinks} \vert = 3 \times 2 \times 4 = 24$
- For finite sets $A_{1},\, A_{2},\, \dots ,\, A_{n}$

$$
	\vert A_{1} \times A_{2} \times \dots \times A_{n} \vert = \vert A_{1} \vert \times \vert A_{2} \vert \times \dots \times \vert A_{n} \vert
$$
- Can see product rule as a sequence of steps in making a selection
	- Multiple the number of choices at each step
	- Works when the number of choices at each step is **independent** of the choices made so far

## The sum rule

- For finite sets $A_{1},\, A_{2},\, \dots,\, A_{n}$ if the sets are pairwise disjoint ($A_{i} \cap A_{j} = \emptyset \, \forall_{i \ne j}$)

$$
	\vert A_{1} \cup A_{2} \cup \dots \cup A_{n} \vert = \vert A_{1} \vert + \vert A_{2} \vert + \dots + \vert A_{n} \vert
$$
- Lunch special selections
	- Sandwiches = $\{ \text{Burger},\, \text{Grilled chicken},\, \text{Grilled cheese} \}$
	- Sides = $\{ \text{Fries},\ \text{Fruit} \}$
	- Hot drinks = $\{ \text{Coffee},\, \text{Tea},\, \text{Cocoa} \}$
	- Cold drinks = $\{ \text{Water},\, \text{Soda} \}$
- A lunch selection includes a sandwich, a side and a drink
	- $\vert \text{Drinks} \vert = \vert \text{Hot drinks} \cup \text{Cold drinks} \vert = \vert \text{Hot drinks} \vert + \vert \text{Cold drinks} \vert$
- The total number of selection is
	- $\vert \text{Sandwiches} \vert \times \vert \text{Sides} \vert \times \vert \text{Drinks} \vert$

### Counting passwords

- Digits = $\{0,\, 1,\, 2,\, 3,\, 4,\, 5,\, 6,\, 7,\, 8,\, 9 \}$
- Letters = $\{A,\, B,\, C,\, D,\, \dots,\, X,\, Y,\, Z \}$
- How many valid passwords are there if a password must...
	- be a string of letters or digits of length 7? $36^{7}$
	- be a string of letters or digits of length 7 and start with a letter? $26 \times 36^{6}$

## Bijection rule

- Let $S$ and $T$ be two finite sets. If there is a bijection (1-to-1 mapping) from $S$ to $T$, then $\vert S \vert = \vert T \vert$

### Palindromes

- A string is a *palindrome* if it is the same after it is reversed
- Let $P_{6}$ be the set of all 6-bit strings that are also palindromes
- There is a bijection between $\{0,\, 1\}^{3}$ and $P_{6}$
	- Therefore $\vert \{0,\, 1\}^{3} \vert = \vert P_{6} \vert$

$$
	f: \{0,\, 1\}^{3} \to P_{6} \, f(x) = xx^{R}
$$
## K-to-1 rule

- Let $X$ and $Y$ be finite sets
- A k-to-1 correspondence is a function $f: X \to Y$ such that for each $y \in Y$, there are exactly k different $x \in X$ such that $f(x) = y$
- If there is a k-to-1 correspondence from $X$ to $Y$, then $|vert Y \vert = \vert X \vert / k$