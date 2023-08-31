# Modular arithmetic

## Integer division

- Integer division: divide $25$ by $7$
	- Quotient: $3$
	- Remainder: $4$
- $25 = 7 * 3 + 4$

### `DIV` and `MOD` functions

- $d$ is an integer such that $d \ge 1$
- $n$ is an integer
	- There are unique integers
		- $q$ for quotient
		- $r$ for remainder where $r \in \{ 0,\, 1,\, 2,\, \dots,\, d-1\}$
	- $n = d * q + r$
- $r = n \mod d$
- $q = n \div d$

### `DIV` and `MOD` functions for negative numbers

- $d$ is an integer such that $d \ge 1$
- $n$ is an integer
	- There are unique integers
		- $q$ for quotient
		- $r$ for remainder where $r \in \{ 0,\, 1,\, 2,\, \dots,\, d-1\}$
- $q = \text{floor}(n / d)$
- $r = n - q * d$

## Partial results

- When computing modular arithmetic expressions, we can compute partial results and the overall result is the same
- $((x \mod n) + (y \mod n)) \mod n = (x + y) \mod n$
- $((x \mod n) * (y \mod n)) \mod n = (x * y) \mod n$
- $(x^{y} \mod n) = (x \mod n)^{y}$

> What is $((13)^{122} + 56) \mod 12$?

$$
	= [(13 \mod 12)^{122} + 56 \mod 12] \mod 12
$$

$$
	= [1^{112} + 8] \mod 12 = 9 \mod 12 = 9
$$

### Rings

- A ring is a closed mathematical system with addition and multiplication operations that
	- Obeys certain laws (associative, distributive, etc)
	- Has identities ($0 + x = x$, $1 * x = x$)
- The elements of a ring can be different kinds of objects
	- Polynomials, sequences, numbers, etc
- The ring $\mathbb{Z}_{n}$ is the set $\{ 0,\, 1,\, 2,\, \dots,\, n - 1 \}$ along with
	- Addition mod n
	- Multiplication mod n

### Equivalence mod n

$$
	x \mod n = y \mod n 
	\leftrightarrow (x - y) = \text{integer multiple of }n 
	\leftrightarrow x \equiv y \mod n
	\leftrightarrow \text{"x is equivalent to y mod n"}
$$

> Which numbers are equivalent to $3 \mod 11$?

- $-7 = 11 * -1 + 4$ -> No
- $11 = 11 * 1 + 0$ -> No
- $58 = 11 * 5 + 3$ -> Yes
- $113 = 11 * 10 + 3$ -> Yes
- $-2 = 11 * -1 +9$ -> No
- $3 = 11 * 0 + 3$ -> Yes
- $-11 = 11 * -1 + 0$ -> No
- $-30 = 11 * -3 + 3$ -> Yes

