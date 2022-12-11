# Partial orderings

## What are they?

- Given a relation $R$ on $A$, $R$ is a partial ordering if
    - $R$ is reflexive
    - $R$ is asymmetric
    - $R$ is transitive
- $R$ is called a "poset"
    - "po" - partial ordering
- Example 1
    - $\ge$ on $\mathbb{Z}$
    - $R$ is reflexive because $k \ge k$
    - $R$ is asymmetric because $a \ge b \land b \ge a \implies a \ b$
    - $R$ is transitive because $a \ge b \land b \ge c \implies a \ge c$
    - Therefore, $\ge$ is a poset on the set of integers
- Example 2
    - $\vert$ "divides" on $\mathbb{Z}^{+}$
    - $a$ divides $b$ if $\dfrac{a}{b}$ has a remainder of $0$
    - $R$ is reflexive because $\dfrac{a}{a} = 1 \ R0$
    - $R$ is asymmetric because $a \vert b \land b \vert a \implies a = b$
    - $R$ is transitive because $a \vert b \land b \vert c \implies a \vert c$
    - Therefore $\vert$ gives a poset on $\mathbb{Z}^{+}$

## Why they are needed?

- Some pairs may not be comparable
- For instance
    - $(5, 7)$ is not in the divides relation
    - $\neg(5 \vert 7)$ and $\neg(7 \vert 5)$, therefore there is no ordering
- If $\forall_{(a, b) \in A}$ either $(a, b) \in R$ or $(b, a) \in R$ and $R$ is a partial ordering, then $R$ is a total ordering
    - $\ge$ on integers is a *total* ordering
    - $\vert$ on integers in a *partial* ordering
- Let $R$ on $A$ be a total ordering.
- If every non-empty subset of $A$ has at least (smallest) element, then $A$ is well-ordered by $R$
    - $\le$ on integers is not well-ordered because $\{ a \ \vert \ a < 0 \}$ has no smallest element
    - $\le$ on nonnegative integers is well-ordered because the smallest element is $0$
    - $\vert$ on nonnegative integers is not well-ordered becuase it is a partial ordering

## Lexicographical orderings

- $(a_{1}, a_{2}) \prec (b_{1}, b_{2})$ if
    - $a_{1} \prec b_{1}$
    - $a_{1} = b_{1} \land a_{2} \prec b_{2}$
- $a_{i}$ is a letter of a word, shorter words come before longer words

## Hasse diagrams on posets

1) Draw all elements of $A$ with the bigger ones higher
2) Draw only the edges that can't be inferred by transitivity

- $\le$ on $\{ 1,\ 2,\ 3,\ 4\}$
```
    4
    |
    3
    |
    2
    |
    1
```

- "divides" on $\{ 1,\ 2,\ 3,\ 4,\ 6,\ 8,\ 12 \}$
- $8$ is the greatest $k \ge b \ \forall_{b \in A}$
- $(8, 12)$ are the maximals
- $1$ is the least $1 \le b \forall_{b \in A}$
- The greatest and least elements are unique if they exists
```
    8   12
    | / |
    4   6
    | / |
    2   3
     \ /
      1
```

- Given $A \subseteq S$, $u \in S$ is a upperbound on $A$ if
    - $a \le u \ \forall_{a \in A}$
    - $u$ can be inside or outside of $A$
- $24$ is the upperbound on the "divides" relation because
    - $\operatorname{lcm}(8, 12) = 24$
- $1$ is the lowerbound on the "divides" relation
- To be a bound, $u$ must be comparable to $\forall_{a \in A}$
- Least upperbound: the smallest possible upperbound on $A$
- Greatest lowerbound: the largest possible lowerbound on $A$

## Topological sorting

1) Draw a Hasse diagram
2) List each element of $A$ in an order that satisfies the relation
3) Any noncomparable elements are swapable

- "divides" on $\{ 1,\ 2,\ 3,\ 4,\ 6,\ 8,\ 12 \}$
- A valid topoligical sorting is $\left[ 1,\ 3,\ 2,\ 6,\ 4,\ 12,\ 8 \right]$