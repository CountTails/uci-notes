# Sets

## Definition

Sets are an unordered collection of objects (unlike lists, which are ordered)

$$
    vowels = \{ a,\, e,\, i,\, o,\, u \}
$$
$$
    \mathbb{N} = \{ 0,\, 1,\, 2,\, \dots \}
$$

$$
    \mathbb{Z} = \{ 0,\, \pm1,\, \pm2,\, \dots \}
$$

The membership symbol, which checks if an object is a part of some set is denotes as $\in$

The null or the empty set, which is the set containing nothing, is denotes as $\emptyset = \{ \, \}$

$A$ is a "subset" of $B$ if and only if $\forall_{x \in A} x \in B \equiv \forall_{x} (x \in A \implies x \in B)$ and is denoted as $A \subseteq B$. Note that this allows for the case $A = B$

$A$ is a "proper subset" of $B$ if and only if $A \subset B \equiv ( A \subseteq B \land A = B)$

> Thm: $\emptyset \subseteq S$ for every set S

Proof:

1) Need $\forall_{x} (x \in \emptyset \implies x \in S)$ to be true
2) The left side of the implication is false because $x$ cannot be a member of the empty
3) Since False implies anything is always true, for all $x$, the statement is true


## Properties

### Cardinality

- The cardinality of the set $S$ is the number of elements in the set and is denoted as $\vert S \vert$
- If is possible for $\vert S \vert \ge S$; meaning the size of $S$ is infinite

### Power set

- The power set of $S$ is the set of all subsets and is denoted as $P(S)$

$$
    P(\{ a,\, b,\, c \}) = \{ \emptyset,\, \{ a\},\, \{ b \},\, \{ c \},\, \{ a,\, b\},\, \{ a,\, c \},\, \{ b,\, c \},\, \{ a,\, b,\, c \} \}
$$

| c | b | a | Set |
|---|---|---|-----|
| 0 | 0 | 0 | $\emptyset$ |
| 0 | 0 | 1 | $\{ a \}$ |
| 0 | 1 | 0 | $\{ b \}$ |
| 0 | 1 | 1 | $\{ b,\, a \}$ |
| 1 | 0 | 0 | $\{ c \}$
| 1 | 0 | 1 | $\{ c,\, a \}$ |
| 1 | 1 | 0 | $\{ c,\, b \}$ |
| 1 | 1 | 1 | $\{ a,\, b,\, c \}$ |

>Thm: $\vert P(S) \vert = 2^{\vert S \vert}$

Proof:

- Let $\vert S \vert = n$ and use an n-bit string to denote if each element is in the subset in question
- There are $2^{n}$ entries in such a table
- Thus there are $2^{n}$ possible subsets
- Therefore, enumerating all n-bit string is equivalent to enumerateing all subsets

### Ordered n-tuple

- An ordered list or n-tuple with n elements
- $a_{1},\, \dots,\, a_{n}$ is denoted as $(a_{1},\, \dots,\, a_{n})$
- Two lists are equal if and only if
    - same elements
    - same order
    - $(x, y) \ne (y, x)$ unless $x = y$

### Cartesian product

- Denoted as $A \times B$
- $\{ (a, b) \vert a \in A \land b \in B \}$
- This can be extended to more than two sets