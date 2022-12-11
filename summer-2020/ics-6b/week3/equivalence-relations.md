# Equivalence relations

## What is a equivalence relation?

- A relation $R$ on $A$ is an equivalence relation if
    - It is reflexive
    - It is symmetric
    - It is transitive
- Two elements $(a, b)$ are considered equivalent if
    - $a \ R \ b$
    - $R$ is an equivalence relation
- All such elements make up the equivalence class of $A$. $a \in A$ is a representative of that class
- $[a]_{R} = \{ b \ \vert \ a \ R \ b \}$ (given $a \in A$ and $R$ is an equivalence relation on $A$)

>Thm: $a \ R \ b \iff [a]_{R} = [b]_{R} \iff [a]_{R} \cap [b]_{R} \ne \emptyset$ where $R$ is an equivalence relation

> Corrollary: $\neg(a \ {R} \ b) \iff [a]_{R} \cap [b]_{R} \ne \emptyset$ where $A = \bigcup \limits_{a \in A} [a]_{R}$

## Examples of equivalence relations

### Example 1: Variable names and identifiers

- In the traditional C programming language, names could be, at most, 8 characters
- Compilers would only store 8 characters, so `thisVariable = 1` and `thisVariation = ''` would be the same
- $A = \{ \text{All strings of any length} \}$ are classified in sets of equivalence strings based on the first 8 characters
    - $R \subseteq A \times A = \{ (a, b) \ \vert \ \text{first 8 chars are the same}\}$
- $R$ is reflexive, symmetric, and transitive, therefore $R$ is an equivalence relation.
- One such equivalence class is "thisVari"

### Example 2: All integers separated into 4 classes

- Depends of the value of the remainder when the integer is divided by 4
- This relation is an equivalence relation because it is reflexive, symmetric, and transitive

### Example 3: A random relation

- Let $x,\, y$ be real numbers and $R = \{ (x, y) \ \vert \ \vert x - y \vert \ < 1 \}$
- $R$ is reflexive and symmetric, but it is not transitive, therefore it is not an equivalence relation
    - Reflexivity: $\vert x - x \vert = 0 < 1$ is true
    - Symmetry: $\vert x - y \vert < 1 \iff \vert y - x \vert < 1$ is true
    - Transitivity: let $\begin{cases} x = 1.6 \\ y = 2.4 \\ z = 3.1 \end{cases}$ and $\vert x - z \vert > 1$

## Partitions

- A partition is the set of all equivalence classes of set $A$ under $R$
- Given a set of subsets of $A$ where $A_{i} \le A$, they implicitly define an equivalence relation on $A$
    - $\{ A_{i} \}$ forms a partition of $A$
    - $\forall_{i} \ A_{i} \ne \emptyset$
    - If $i \ne j \implies A_{i} \cap A_{j} = \emptyset$
    - $A = \bigcup \limits_{i} A_{i}$

>Thm: Let $R$ be an equivalence relation on $A$. Then the equivalence classes form a partition of $A$. Conversely, an $\{ A_{i} \}$ partition of $A$ imposes an equivalence relation on $A$ with $A_{i}$ as its equivalence class