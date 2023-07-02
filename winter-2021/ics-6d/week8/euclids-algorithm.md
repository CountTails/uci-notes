# Euclid's algorithm

## The algorithm

- $\text{gcd}(a, b) = \text{gcd}(b, a \mod b)$

### Base case

- If $b \vert a$ then $\text{gcd}(a, b) = b$
- If $a \mod b = 0$, then $\text{gcd}(a, b) = b$
- Even simpler, next step gives us $\text{gcd}(b, 0) = 0$

### Recursive case

```
def gcd(a, b)
	if (a mod b == 0):
		return b
	return gcd(b, a mod b)
```

> Find $\text{gcd}(72, 56)$

$$
	\text{gcd}(72, 56) = \text{gcd}(56, 16) = \text{gcd}(16, 8) = \text{gcd}(8, 0) = 8
$$

## Extended version

> Let $a$ and $b$ be two positive numbers, then there are two integers $s$ and $t$ such that $s*a + t*b = \text{gcd}(a, b)$

- Provides a linear combination for the GCD and $a$ and $b$

> Find $s$ and $t$ such that $72s + 56t = \text{gcd}(72, 56)$

- The $\text{gcd}(72, 56)$ can be sequenced as $72,\, 56,\, 16,\, 8$
	- $16 = 72 - 56$
	- $8 = 56 - 3*16$
	- $8 = 56 - 3(72 - 56)$
	- $8 = 56 - 3 * 72 + 3 * 56$
	- $8 = 4 * 56 - 3 * 72$
- $s = -3$ and $t = 4$

### Multiplicative inverse

- Let $a,\, b \in \mathbb{Z}_{n}$
- The $a$ is a multiplicative inverse of $b$ if $ab \mod N = 1$
- Not every number has a multiplicative inverse

> Fact: $a$ has a multiplicative inverse mod $N$ if and only if $a$ is relatively prime to $N$ ($\text{gcd}(a, N) = 1$)

- One direction follows easily from Euclid's algorithm
	- If $a$ is relatively prime to $N$ then $a$ has a multiplicative inverse mod $N$

> Find the multiplicative inverse of $4 \mod 5$

- $a * 11 \mod 5 = 1$
- If $a = 4$, the statement holds

- Suppose $a$ and $N$ are relatively prime
- $\text{gcd}(a, N) = 1$
- There are integers $s$ and $t$ such that $s * a + t * N = 1$
	- if $t * N \mod N = 0$, we are left with $s \mod a = 1$
	- $s$ is the multiplicative inverse mod of $a$