# Relations and their relations

## Relations

- Let $A$ and $B$ be sets. Recall $A \times B$ is the set of all ordered pairs $\{ (a, b) \ \vert \ a \in A \land b \in B \}$
- A relation is any subset of $A \times B$
- Written as $(a, b) \in R$ or $a \ R \ b$ or "a is related to b by R"
- Examples
    - $A = \{ \text{students @ UCI} \}$, let $s \in A$
    - $B = \{ \text{classes @ UCI} \}$, let $c \in B$
    - let $s \ R \ c$ = "student $s$ is taking class $c$"
- Is $R$ a function? No, it is not 1-to-1

## Representing relations

| $A$ \ $B$  | x | y | z | $\dots$ |
|---|---|---|---|---|
| a | 0 | 0 | 1 | $\dots$ |
| b | 0 | 0 | 0 | $\dots$ |
| c | 0 | 1 | 1 | $\dots$ |

- Relations
    - $a \ R \ z$
    - $c \ R \ y$
    - $c \ R \ z$
- How many possible relations?
    - $n = \vert A \vert$ rows
    - $m = \vert B \vert$ columns
    - number of bits is $n \cdot m$
    - total number of relations is $2^{n \cdot m}$ (BIG)

## Relations on one set

- $\mathbb{N} \ R \ \mathbb{N}$, $x \ R \ y$ = "x is divisible by y"
    - $(4, 2),\, (6, 3),\, (9, 3) \in R$
    - $(4, 3) \notin R$
- $\neg \exists_{k > 1} (11, k) \in R \equiv \text{11 is prime}$

## Properties of relations

### Reflective

- If and only if $(a, a) \in R \forall_{a \in A}$
- The diagonal is all one in the tabular representation

### Symmentric

- If and only if $(a, b) \in R \iff (b, a) \in R \forall_{(a, b) \in A}$
- If a 1 occurs in the lower triangle of the tabular represenation, its mirror in the upper triangle is also 1

### Antisymmetric

- $\left[ \forall_{(a, b) \in A} (a, b) \in R \land (b, a) \in R \implies a = b \right]$
- $a = b \implies \neg ( (a, b) \in R \land (b, a) \in R)$ (contrapositive)
- $a \ne b \implies (a, b) \notin R \lor (b, a) \notin R$ (de morgan)
- Off diagonal, at most one of $(a, b)$ and $(b, a)$ is 1 in $R$
- Note: symmetric and antisymmetric are not opposite: $\exists_{R}$ both or $\exists_{R}$ neither

### Transitivity

- $R$ is transitive if and only if $(a, b) \in R \land (b, c) \in R \implies (a, c) \in R$
- $<$ on integers is transitive
- $=$ on integers is transitive
- $\ne$ on integers is not transitive ($a \ne b \land b \ne c \implies a \ne c$) is false if $a = c$

## Combining relations

- They are just sets, so any set operation can be applied
- Let $A = \{ \text{students} \}$ and $R_{1}$ = "has taken"
- Let $B = \{ \text{courses} \} and $R_{2}$ = "needs course to graduate"
    - $R_{1} \cup R_{2}$: "All course you've either taken or need to take to graduate"
    - $R_{1} \cap R_{2}$: "Require courses you've taken"
    - $R_{1} \oplus R_{2}$: "Elective you've taken and required ones you haven't"
    - $R_{1} - R_{2}$: "Elective you've taken"
    - $R_{2} - R_{1}$: "Remaining courses to graduate"

## Composition of relations

- Let $R \le A \times B$, $S \le B \times C$
- $S \circ R = \{ (a, c) \ \vert \ a \in A \land c \in C \land \exists_{b \in B} (a, b) \in R \land (b, c) \in S \}$
- Example
    - $A = B = C$ is the set of people
    - $R$ is the relation "is the parent of"
    - $R \circ R$ is the relation "is the grandparent of"
    - $a \ R \ b \land b \ R \ c \implies$ a is the grandparent of c

## Matrix representation of relational composition

- Let $R$ relate $A$ and $B$ and $S$ relate $B$ and $C$
- Define $M_{R}$ and $M_{S}$
- Then $M_{S \circ R}$ is the matrix representation of $S \circ R$ and relates $A$ and $C$ and $t_{ik} = 1$ if and only if $\exists_{j}$ such that $a_{i} \ R \ b_{j} \land b_{j} \ S \ c_{k}$ 
- By **boolean matrix product**, $M_{S \circ R} = M_{S}M_{R}$
- Note that boolean matrix product gives 1 if any member of the dot product is 1, otherwise 0

## Recursive relations

- Given relation $R$ on $A$
- $R^{1} \equiv R$
- $R^{n + 1} \equiv R \circ R^{n}$
- $R^{0} \equiv \mathbb{I}$

>Thm: Relation $R$ on set $A$ is transitive if and only if $R^{n} \le R \ \forall_{n > 0}$

Proof:

- Suppose $R^{n} \subseteq R \ \forall_{n > 0}$
- In particular $R^{2} \le R$
- Thus, by relational composition $(a, b) \in R \land (b, c) \in R \implies (a, c) \in R$
- This is also the definintion of transitivity

## Closure of relations

- Closure of relation $R$ under property $p$ is the smallest new relation $S$ such that
    - Contains $R$ ($R \le S$)
    - has the property $p$
- Example
    - Reflective closure, given $R$
    - Reflective closure of $R$ is $R \cup \{ (a, a) \ \vert \ a \in A \}$
- Let $R =$ "<" on integers. What is the closure of $R$?
    - $R \cup \{ (i, j) \ \vert \ \forall_{j \in \mathbb{Z}} \}$
    - Reflective closure of "<" is "$\le$" (includes diagonal elements) 