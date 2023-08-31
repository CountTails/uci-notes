# Closure of relations

## Symmetric closure

- The symmetric closure of $R = R \cup \{ (b, a) \ \vert \ (a, b) \in R \}$
- Example
    - The symmetric closure of "$<$": $R \cup \{ (b, a) \ \vert \ a < b \}$
    - $\equiv \{ a < b \cup b < a \}$
    - $\equiv$ "not equal"
    - Symmetric closure of $<$ is $\ne$

## Transitive closure

- Let $A = \{ a,\, b,\, c \}$
- Idea: It is possible to get from one node to another only by following directed edges
- $\exists_{\text{path}}$ from $u$ to $v$?
    - Yes: add edge `(u, v)` to $R$
- The transitive closure of $R$ is $\{ (a, b) \ \vert \ \exists_{\text{path}} \in R \ a \to b \}$
- Let $R$ be a relation of $A$ let $p$ be a property
    - If $\exists$ a relation $S$ with property $p$ and $S$ is a subset of **every** relation with $p$ that contains $R$, then $S$ is the closure of $R$ under $p$
    - $\exists_{S} \left[ p(S) \land \forall_{T} \ (R \subseteq T \land p(T)) \implies S \subseteq T \right]$
- Example
    - $R = \{ (1, 3),\, (1, 4),\, (2, 1),\, (3, 2) \}$ on $A = \{ 1,\, 2,\, 3,\, 4 \}$
    - Add: $(1, 2) ,\, (2, 3),\, (3, 1),\, (2, 4)$ (but not done yet)
        - $(3, 4)$ is not in the set, but there exists a path
    - Keep going until no new pairs are needed
- The transitive closure is harder than both the symmetric or reflective closures

## Path

- A path in a directed graph (digraph)
    - from $u$ to $v$ is a sequence of pairs
    - $u = a_{0},\, a_{1},\, a_{2},\, \dots,\, a_{k} = v$ when $(a_{i}, a_{i + 1}) \in R \ \forall_{(i, k-1)}$
- The path from $a$ to $a$ has length 0 if there are no self loops and has length 1 otherwise
- Path beginning at $u$ and ending at $u$ is a cycle or a circuit
- Note that nodes and edges can be repeated
- A path is simple if no nodes or edges are repeated
- Recall $R^{2} \equiv R \circ R$
    - $M_{R \circ R} \equiv M_{R} \cdot M_{R}$
    - Note: $R^{k} = \{ (a, b) \ \vert \ \exists_{\text{length k path from} a \to b \in R} \}$
    - $R^{0}$ is the identity matrix
    - $R^{*} = \bigcup \limits_{k = 1}^{\infty} R^{k}$ is the connectivity relation or the reachability relation
        - The set of all pairs reachable from one to the other

> Thm: $R^{*}$ is the transitive closure of $R$

> Lemma: If $\vert A \vert = n$, then $\bigcup \limits_{k = 1}^{n} R^{k}$ is sufficient