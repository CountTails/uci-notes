# Predicates and qualifiers

## What are predicates?

Propositions deal with fixed, small sets are variables.

Sometimes we need to deal with bit sets of items

Predicates can deal with variables

Let $P(x) \equiv (x > 3)$

- $P$ is undefined until $x$ is known
- $P(7) \equiv (7 > 3)$ is true
- $P(1) \equiv (1 > 3)$ is false

Let $Q(x, y) \equiv (x = y + 3)$

- $Q(3, 0) \equiv (3 = 0 + 3)$ is true
- $Q(4, 2) \equiv (4 = 2 + 3)$ is false

## Quantifiers

### Universal

$[\forall x \in S \,\, Q(x)]$: True if and only if $Q(x)$ evaluates to true for every $x$ in $S$, otherwise false

### Existential

$[\exists x \in S \,\, Q(x)]$: True if at least one $x$ in $S$ satisfies predicate $Q$, otherwise false

### De Morgan's laws for quantifiers

- move the ($\neg$) in between the quantifier and predicate, then switch the quantifier
- $\neg(\exists x \,\, P(x)) \equiv \forall x \,\, \neg P(x)$
- $\neg(\forall x \,\, P(x)) \equiv \exists x \,\, \neg P(x)$

## Something useful for system specification

Prove there is no elevator state for which the exterior doors open but no elevator is waiting or a state where the interior doors open between floors

As predicates and quantifiers

- $E(x) = \text{"Exterior doors open on floor k"}$
- $I(x) = \text{Interior doors open}$
