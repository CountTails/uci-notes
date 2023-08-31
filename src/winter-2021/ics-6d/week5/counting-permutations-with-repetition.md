# Counting permutations with repetitions

## Permutation counting

### Distinct

- How many ways to permute the letters in the word "BAD"?
- All letters in the word are distinct
- Thus, there are $3!$ ways to permute the word
	1) BAD
	2) BDA
	3) ABD
	4) ADB
	5) DAB
	6) DBA

### With repeated elements

- How many ways to permute the letters in the word "ADD"?
- Not all letters in the word are distinct
	1) ADD
	2) DAD
	3) DDA
- Two matching letters means that we should divide by the number matching

## Permutations with repetitions

- How many ways to permute the letters in the "MISSISSIPPI"?
	- 11 letters total
	- 4 I's
	- 4 S's
	- 2 P's
	- 1 M
- Order does not matter for repeated elements
- Thus the number of ways to permute is $\frac{11!}{4! * 4! * 2! * 1!}$

### In general

- How many permutations are there of
	- $r_{1}$ copies of $c_{1}$
	- $r_{2}$ copies of $c_{2}$
	- ...
	- $r_{k-1}$ copies of $c_{k-1}$
	- $r_{k}$ copies of $c_{k}$
- $r_{1} + r_{2} + \dots + r_{k-1} + r_{k} = n$

$$
	= \frac{n!}{(r_{1}!)(r_{2}!)\dots(r_{k-1}!)(r_{k}!))}
$$

