# Divisibility and primes

## Evenly divides

- x *divides* y if $y = mx$ for some integer $m$
	- Denoted as $x \vert y$
	- Read as "y is divided by x"
- $y$ is an integer multiple of $x$
- $x$ is a *factor* of $y$

## Primes and composites

- A number $p$ is **prime** if
	- $p$ is an integer **and** $p > 1$
	- The only (positive) of $p$ are 1 and itself
- If $n > 1$ is not a prime, it is **composite**
	- $n$ has a positive factor other than 1 and itself

### Fundamental theorem of arithmetic

- Every integer $n > 1$ can be expressed as a produce of primes.
- Prime factorization is unique up to ordering
	- Usually written out in non-decreasing order
- Example: $124 = 2 * 2 * 31$

### Exponential notation for prime factorization

- Write each distinct prime in the prime factorization in increasing order
- The multiplicity of a prime is written in the exponent
- Example: $124 = 2^{2} * 31$

### Prime factorization and divisibility

- If you have the prime factorization for $x$ and $y$, you can easily determine if $x$ divides $y$

> Does $90$ divide $1260$?

- $1260 = 2^{2} * 3^{2} * 5 * 7$
- $90 = 2 * 3^{2} * 5$
- $1260 = 2 * 90 * 7$
- $90$ divides $1260$ evenly

## LCM and GCD

- For two positive, $x$ and $y$
	- The *least common multiple* of $x$ and $y$, $\text{lcm}(x, y)$, is the smallest integer that is a multiple of $x$ and a multiple of $y$
	- The *greatest common divisor* of $x$ and $y$, $\text{gcd}(x, y)$, is the largest integer that divides both $x$ and $y$
		- $x$ and $y$ are **relatively prime** if $\text{gcd}(x, y) = 1$

### Prime factorization and LCM

- If you have the prime factorization of $x$ and $y$, it is easy to determine $\text{lcm}(x, y)$
	- $44 = 2^{2} * 11$
	- $90 = 2 * 3^{2} * 5$
	- $\text{lcm}(44, 90) = 2^{\text{max}(2, 1)} * 3^{\text{max}(2, 0)} * 5^{\text{max}(1, 0)} * 11^{\text{max}(1, 0)}$
	- $\text{lcm}(44, 90) = 2^{2} * 3^{2} * 5 * 11$
	- $\text{lcm}(44, 90) = 1980$

### Prime factorization and GCD

- If you have the prime factorization of $x$ and $y$, it is easy to determine $\text{gcd}(x, y)$
	- $1320 = 2^{3} * 3 * 5 * 11$
	- $1800 = 2^{2} * 3^{2} * 5$
	- $\text{gcd}(1320, 1800) = 2^{\text{min}(3, 2)} * 3^{\text{min}(1, 2)} * 5^{\text{min}(1, 1)} * 11^{\text{min}(1, 0)}$
	- $\text{gcd}(1320, 1800) = 2^{2} * 3^{1} * 5^{1} * 11^{0}$
	- $\text{gcd}(1320, 1800) = 60$

## Factoring

### Brute force algorithm

```
def factor(input: integer N > 1):
	for x = 2 to N - 1:
		if (x evenly divides N):
			return (x, N/x)
	return "Prime"
```

### Slight better algorithm

> If $N$ is composite then it has at least one factor that is at most $\sqrt{N}$

```
def factor(input: integer N > 1):
	for x = 2 to sqrt(N):
		if (x evenly divides N):
			return (x, N/x)
	return "Prime"
```

### Factoring and primality testing

- Factoring
	- If $N$ is prime: "Prime"
	- If $N$ is composite:
		- $x > 1$
		- $y > 1$
		- $xy = N$
	- Hard: no known algorithm that runs in time $\text{(\# digits)}^{d}$
- Primality testing
	- If $N$ is prime: "Prime"
	- If $N$ is composite: "Composite"
	- Easy: can be solved in time $(\text{\# digits}^{2})$ (probabilistic)

## Find prime numbers

- "Find a 200 digit prime numbers"

```
Repeat:
	N := Pick a number 200 digit number
	if (N is prime):
		return N
```

- The number of trials until success depends on the *density* of prime numbers among all 200 digit numbers

### Density of primes

> Theorem: there are an infinite number of prime numbers

- If finite, they could be listed: $p_{1},\, p_{2},\, \dots,\, p_{k}$
- Multiply and add 1: $p_{1} \times p_{2} \times \dots \times p_{k} + 1$
- If the result is prime
	- It is a prime larger than the largest prime number $p_{k}$
- If the result is composite
	- No prime number smaller than $p_{k}$ divides the result evenly
- Therefore the number of primes cannot be limited and must be infinite

### The prime number theorem

> Let $\pi(x)$ be the number of prime numbers in the range $[2,\, \dots ,\, x]$, then 

- $\lim \limits_{x \to \infty} \frac{\pi(x)}{x / \ln(x)} = 1$
- $\frac{\pi(x)}{x}\ln(x) = 1$
- $\frac{\pi(x)}{x} = \frac{1}{\ln(x)}$

> A randomly chosen number in the range $[2,\, \dots,\, x]$ is prime with probability ~$\frac{1}{\ln(x)}$