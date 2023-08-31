# Asymptotic analysis

## Algorithm types

### Linear-time algorithms

- Time to solve is proportional to the problem size
- Double problem size doubles time to solve

### Constant-time algorithms

- Time to solve is constant
- Problem size does not affect solving time

### Small details

- Lower-order terms can be dropped
- Constant factors can be dropped
- Growth rates should be grouped together

## Asymptotic notation

### Big-O notation

> $f(n)$ is $O(g(n))$ if and only if there are two positive constants $c$ and $n_{0}$ such that $f(n) \le c * g(n)$ for all $n \ge n_{0}$

- $f(n)$ is the real function
- $g(n)$ is the simpler, but similar function
- $c$ is the negligible constant to make it work
- $3n + 4$ is $O(n)$
	- $f(n) \le c * g(n)$ for all $n \ge n_{0}$
	- $3n + 4 \le c * n$ for all $n \ge n_{0}$
	- Let $c = 4$
	- $3n + 4 \le 4n$
	- $4 \le n \to n_{0} = 4$
- Cannot answer for specific $n$
- Answers for arbitrarily large $n$
- $3n$ is $O(n^{2})$
	- By definition, yes
	- Establishes an upper bound
	- Tolerant of overestimates

### Omega notation

> $f(n)$ is $\Omega(g(n))$ if and only if there are two positive constants, $c$ and $n_{0}$ such that $f(n) \ge c * g(n)$ for all $n \ge n_{0}$

- Places lower bound on $f(n)$'s growth rate
- Anything that grows more slowly than $f(n)$
- Sorting takes $\Omega(n)$ time in the worst case, regardless of the algorithm

### Theta notation

> $f(n)$ is $\theta(g(n))$ if and only if $f(n)$ is $O(g(n))$ and $f(n)$ is $\Omega(g(n))$

- Bounded about and below
- Tightened by definition (squeeze theorem)
- Print all 3 digit ints in a vector
	- As $n$ gets larger, grows in a straight line
	- $\theta(n)$ because it is always this good/bad
- Search for value `x` in a vector
	- $O(n)$
	- Growth rate is not always linear
	- Only linear if traversing *entire* vector to find `x`
- Search for value `x` in vector (worst case)
	- $\theta(n)$
	- Always linear
- Search for value `x` in vector (best case)
	- $\theta(1)$
	- Always constant

## Combining asymptotic notations

- Makes it easier to analyze complex algorithms
- Adding same notations
	- $\theta(n) + \theta(n) = \theta(n)$
	- Constant factor doesn't matter
- Adding different notations
	- $O(n^{2}) + \theta(n) = O(n^{2})$
	- Take the one with the faster growth rate
- Adding mixed notations
	- $O(n^{2}) + \theta(n^{2}) = \theta(n^{2})$
	- Take the one with the tighter meaning
	- $O(n^{3}) + \theta(n^{2}) = O(n^{3})$ or $\Omega(n^{2})$
	- Interpreted as a range between the sums
- Multiplying notations
	- $\theta(n) * \theta(n) = \theta(n^{2})$
- Multiple variables
	- $\theta(n) * \theta(m) = \theta(n * m)$
	- $\theta(n) + \theta(m) = \theta(n + m)$