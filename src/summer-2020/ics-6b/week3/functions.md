# Functions

## Mappings or transformations

- Let $A$ and $B$ be a nonempty set
- A fuction from $A \to B$ takes each element in $A$ to **exactly** one element in $B$
- Denoted as $f: A \to B$ if $a \in A$ and $f(a) \in B$
- Multiple elements in $A$ can map to the same element in $B$, but each $a$ has only one "value"
- $b$ is the image of $a$ under $f$
- $a$ is the preimage of $b$ under $f$

## Range

- The range of $A$ under $f$ is $\{ b \in B \ \vert \ \exists_{a \in A} \ \vert \ f(a) = b \}$
- The codomain is the set of all possible values
- Examples
    - $f: \mathbb{R} \to \mathbb{R}$ The codomain is $\mathbb{R}$ and the range is $\mathbb{R}^{+} \cup 0$ 
    - $f: \to \{ 0 \} \cup \mathbb{R}^{+}$ The codomain and the range are equivalent

## Transformation types

### One-to-one (injective)

- A function is 1-to-1 if and only if
    - $f(a) = f(b) \implies a = b$
- each image has only one preimage
- $\forall_{a} \forall_{b} (f(a) = f(b) \implies a = b)$
- $\forall_{a} \forall_{b} (a \ne b \implies f(a) \ne f(b))$

### Onto (subjective)

- A function is onto if and only if
    - $\forall_{b \in B} \exists_{a \in A} f(a) = b$
- The codomain and the range are equivalent
- $f(A) = B$
- Example 1
    - Let $A = \mathbb{R}$ and $B = \mathbb{R}$ and $f(x) = x^{2}$
    - $f$ is neither one-to-one or onto
- Example 2
    - Let $A = \mathbb{R}$ and $B = \{ 0 \} \cup \mathbb{R}^{+}$ and $f(x) = x^{2}$
    - $f$ is both one-to-one and onto

### Bijective

- $f$ is bijective if and only if
    - $f$ is one-to-one
    - $f$ is onto
- known as a "1-to-1 correspondence"
- $\forall_{b \in B} \nexists_{a \in A} f(a) = b$

## Inverse

- denoted as $f^{-1}(x)$
- $a = f^{-1}(b)$
- $f^{-1}: B \to A$
- $f(a) = b \iff f^{-1}(b) = a$
- $f(f^{-1}(b)) = a \land f^{-1}(f(a)) = a$
- $f$ can be well defined, but have no inverse because $f^{-1}$ does not exist

## Composition of functions

- let $g: A \to B \land f: B \to C$
- $f(g(a)) \equiv (f \cdot g)(a) = c \in C$

## Graphs

- $f: A \to B$
- The range is $\{ (a, b) \ \vert \ a \in A \land f(a) = b\}$
- The graph does not need to be drawn
- Another way to think of functions is to use its graph; its set of ordered pairs $(a, b)$
- $Y = \{ y \ \vert \ y = f(x) \forall_{x \in A} \} \equiv (x, y) \in f$ where $A$ is the domain

## Well defined functions

- $f: D \to C$ is well defined if $\forall_{x \in D} \nexists_{y \in C}$
- if $x \in \mathbb{R}$, $floor(x) = max(\{ k \in \mathbb{Z} \ \vert \ k \le x \})$
    - $\lfloor \pi \rfloor = 3$
    - $\lfloor -\pi \rfloor = -4$
- $ceil(x) = min(\{ k \in \mathbb{Z} \ \vert \ k \ge x \})$
    - $\lceil -\pi \rceil = -3$
    - $\lceil \pi \rceil = 4$
