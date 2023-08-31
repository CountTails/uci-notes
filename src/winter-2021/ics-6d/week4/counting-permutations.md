# Counting permutations

## Counting as a selection process

- Select an element from a set to be counted
- Selection process is a sequence of steps. In each step, one more decision is made about the item to be selected
- At the end of the process, the item to be selected is fully specified
- If at each step, the number of choices is independent of the previous choices made
	- The number of items in the set of equal to the product of the number of choices at each step

- Proof:
	- Base case
		- $n_{1}$: first choice
		- $n_{2}$: second choice
		- There are $n_{1} \times n_{2}$ possible first two choices
	- Inductive step
		- $\prod_{i = 1}^{k} n_{i} = (i_{1},\, i_{2},\, \dots,\, i_{k})$
		- $\prod_{i = 1}^{k + 1} n_{i} = (i_{1},\, i_{2},\, \dots,\, i_{k},\, i_{k + 1})$
		- $\prod_{i = 1}^{k} n_{i} \times n_{k + 1} = \prod_{i = 1}^{k + 1} n_{i}$ 

## Generalized product rule

- Set $S$ of sequences of $k$ items
- Suppose there are
	- $n_{1}$ choices for the first item
	- For every possible choice for the first item, there are $n_{2}$ for the second item
	- For every possible choice for the first and second item, there are $n_{3}$ choices for the third item
	- For every possible choice for the first $k - 1$ items, there are $n_{k}$ choices of the $k$th item
- Then $\vert S \vert = n_{1} * n_{2} * \dots * n_{k}$

### Example

- A group of software engineers must complete three modules in a software project. One programmer must be assigned to each module and there are 10 programmers in the group
- How many ways are there to select the programmers to write the different modules?

$$
	10 * 10 * 10 = 1000
$$


## R-Permutations

- AN *r-permutation* is a sequence of $r$ items with no repetitions selected from the same set
	- $S = \{a,\, b,\, c,\, d,\, e,\, f,\, g\}$
	- $\{ g,\, a,\, b,\, e \}$ is a 4-permutation
	- $\{ a,\, e,\, b,\, g \}$ is a **different** 4-permutation

### Counting r-permutations

- The number of ways to select an r-permutation from a set of $n$ items is

$$
	n(n-1)(n-2) \dots (n-r+1)
$$

- Choices are independent and there is no repetition of elements
- In terms of factorials

$$
	P(n, r) = \frac{n!}{(n-r)!}
$$

- The factorial form is convenient for algebra, but not so for computation

### Example

- Four different tasks are distributed to computers in a distributed system of 20 computers
	- How many ways are there to assign the tasks to computers with no restrictions on the number of tasks assigned to any one computer
		- $20^{4}$
	- How many ways are there it assign the tasks if each computer gets assigned at most one task
		- $20 * 19 * 18 * 17$

## Permutations

- A **permutation** is a sequence that contains each element of a finite set exactly once
- The number of permutations of a set with $n$ elements is $P(n, n) = n!$

### Counting permutations

- The number of permutations of the set $S = \{ a,\, b,\, c,\, d,\, e \}$ is $120$
- How many permutations in which $b$ comes immediately before $e$
	- $S' = \{ a, be, c, d \}$
	- $4! = 24$