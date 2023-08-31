# Lecture 9

## Formal code specifications

### Specs

- A precise and unambiguous description of something
- **declarative** representations of verifiable properties
- 3 camps
	1) Separate annotation: verifiable bits are independent of the code
	2) Embedded annotations: pre/post conditions, assertions, and invariants are part of the code
	3) Type systems: Any theorem/proof can be encoded as a dependent type

### Let's prove `leftpad`

> `leftpad` is a function that takes a character, a length, and a string, and pads the string to that length.
> It pads it by adding the character to the left. So it's adding *padding* on the *left*

```python
>>> leftpad('!', 5, "foo")
!!foo
>>> leftpad('!', 0, "foo")
foo
```

#### Implementations

- Code golf

```Python
def leftpad(c, n, s):
	return s.rjust(n, c)
```

- Pythonic

```Python
def leftpad(c, n, s):
	return ''.join([c]*(n - len(s))) + s
```

- Imperative

```Python
def leftpad(c, n, s):
	padded = s
	for i in range(n - len(s)):
		padded = c + padded
	return padded
```

#### Verifications

- Is **it** correct?
	- What is "it"?
- Need to specify the properties we want to prove
	- The length of the return value is always `max(n, length(s))`
	- The first `max(n - length(s), 0)` characters of the result are all `c`
	- The final `length(s)` characters of the result are the same as `s`

## Design by contract

### Hoare's logic

$$
	\{P\}C\{Q\}
$$

- where $P$ is the preconditions (or assertions)
- where $C$ is a piece of code or function
- where $Q$ is the postconditions (or assertions)

### Dafny

- An an imperative/OOP language with an additional set of *specification constructs*

### JML

- Java modeling language
- It's java with formal specifications as annotations

## Dependent types

- Types whose definition depends on *values*
	- array of a certain size $n$
	- trees of a certain height $h$
	- integers greater than $10$
	- sorted lists
	- lowercase strings
	- "term frequency"
- Curry-Howard correspondence: a series of observations starting in 1934 through 1969 leading to the following realization
	- Mathematical propositions <-> dependent types
	- Mathematical proofs <-> programs
- Adga: dependently typed functional programming language
- Idris: dependently typed functional programming language
- The "right" spec
	- Verification $\ne$ Validation
	- Assuming it does what we want it do to, how do we spec it formally
		- Easy to exchange ideas informally
		- Hard to know what to formalize: too little vs. too much

## Code verification

### Early days

- Dijkstra: "Think really hard about why something is true"
	- The classical mathematics way of proving theorems
	- Many algorithms were proven correct this way
- Let's prove that insertion sort works by arguing
	- Base case: if we add a number to an empty list, that will be the only element, so it's sorted
	- Induction: if we have a sorted list of $k$ elements and add one element so that all the smaller numbers are before and all the larger numbers are after, the list is still sorted
	- QED

### Problems with manual proofs

- They are often wrong!
- Beware of bugs in the above code; I have only proved it correct, not tried it

### Automated theorem provers

- First one: automath (1967)
- Formal code proofs are much harder than mathematical theorems
	- Mathematicians rely on common understanding of many things like induction, proof by contradiction, associativity, etc.
	- Theorem provers need to *define* those and in some cases, they may not even hold

### Writing the proofs

- Let the computer write them
	- would be great for people
	- is an NP-complete problem
- Write them yourself, have the computer check
	- much easier (for the computer)
	- much harder for people

### The theorem prover's dilemma

- The more expressive the language, the harder it is to *prove* anything in it.
- The less expressive the language, the harder it is the *write* anything in it.

### SMT: a big qualitative jump

- SMT = satisfiability module theories
- SMT solvers transform some theorems into constraint satisfaction problems, and then verify that the constraints are met (or not)

### Worth it?

- In practice: currently no
	- Tests will get you to 90%-95% correctness
	- Other methodologies can get you past 95%
- In research: still a very worthy goal

### Take home

- Verification is a spectrum
	- There are automated tools to verify assertions and types/theorems
- Types themselves are a spectrum
	- from simple data types to dependent types (theorems)

## Formal design verification

### Design vs. code

- Design = zoom out of code
- Design specification = intentions of the overall system
- Design specification languages
	- Z
	- SDL
	- Decision tables
- Verification with "model checkers"

### Benefits

- Formal writing forces you to think about details
- ... and you get formal verification