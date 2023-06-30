# Recursion

## Pseudo code

- Algorithms for solving problems
- Specified in a language between english and programming language
	- The syntax is informal -- meant to convey the meaning of steps
	- Should be complete enough that it can be unambiguously translated into code
	- Use elements of computer languages
		- if-then-else
		- (x := 6)

## Recursive algorithm

- A *recursive algorithm* is an algorithm that calls itself
- A recursive algorithm has
	- Base case: output computed directly on small inputs
	- On larger input, the algorithm calls itself using smaller inputs and then uses the results to construct a solution for that large input
	- The calls to itself are called *recursive calls*

### Fast recursive exponentiation

- `FastPower(a, n)`
	- Input: a real number $a$, and a non-negative integer $n$
	- Output: $a^{n}$

```
define FastPower(a, n):
	if (n == 0): return 1
	d := n DIV 2
	p := FastPower(a, d)
	if (n is even): return p^2
	if (n is odd): return a*p^2
```

### Proof of correctness

- Prove: for integer $n \ge 0$, `FastPower(a, n)` returns $a^{n}$
- Base case: $n = 0$
	- `FastPower(a, 0)` returns $a^{0} = 1$
- Inductive step: we will show that for $k \ge 0$
	- If `FastPower(a, j)` returns $a^{j}$ for every $j = 0, \, \dots, \, k$ then `FastPower(a, k+1)` returns $a^{k+1}$
	- case 1: $k + 1$ is even
		- $k + 1 = 2m / 2 = m$
		- $0 \le m \le k$
		- `FastPower(a, m)` returns $a^{m}$
		- `FastPower(a, k+1)` $= (a^{m})^{2} = a^{2m} = a^{2k + 1}$
	- case 2: $k + 1$ is odd
		- $k + 1 = (2m + 1)/2 = m$
		- $0 \le m \le k$
		- `FastPower(a, m)` $= a^{m}$
		- `FastPower(a, k + 1)` $= a*(a^{m})^{2} = a^{2n + 1} = a^{k + 1}$

