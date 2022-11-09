# Rules of inference

An argument is a sequence of propositions (premises) that lead to a final proposition (conclusion). It takes the form of an actual of premises that lead to a conlusion

## The rules

### Modus Ponens

1) if $p$ is true and
2) $p \implies q$ is true
3) then we can conclude $q$ is also true

### Modus tollens

1) if $\neg q$ is true and
2) $p \implies q$ is true
3) then we can conclude $\neg p$ is also true

### Hypothetical syllogism

1) if $p \implies q$ true and
2) if $q \implies r$ is true
3) then we can conclude $p \implies r$ is also true

### Disjuction syllogism

1) if $p \lor q$ is true and
2) $\neg p$ is true
3) then we can conclude $q$ is also true

### Addition

1) if $p$ is true
2) then we can conclude $p \lor q$ is also true

### Simplification

1) if $p \land q$ is true
2) then we can conclude $p$ is also true

### Conjunction

1) if $p$ is true and
2) if $q$ is true
3) then we can conclude $p \land q$ is also true

### Resolution

1) if $p \lor q$ is true and
2) if $\neg p \lor r$ is true
3) then we can conclude $q \lor r$ is also true

## Fallacies

A fallacy is an invalid argument where a tautology (always true) is replaced by a contigency

$$
    [(p \implies q) \land q] \implies p
$$

## Inference in quantified statements

### Universal instatiation

> "All men are mortal"
> "Socrates is a man"
> "Socrates is mortal"

1) if $\forall_{x \in S} \, P(x)$ is true and
2) $C \in S$ is true
3) then we can conclude $P(C)$ is also true

### Universal generalization

1) if $P(c)$ is true for an arbitrary $c$
2) then we can conclude $\forall_{x} \, P(x)$ is also true

Note: arbitrary and random are not the same

- An arbitrary $c$ can be chosen by an adversary
- Often used in proofs
- No restriction on $c$ except for those already imposed on $S$

### Existential instantiation

1) if $\exists_{x \in S} \, P(x)$ is true 
2) then we can conclude $P(c)$ is true

Note: we don't necessarily know what $c$ is, only that such a $c$ exists

### Existential generalization

1) if $c \in S$ such that $P(c)$ is true
2) then we can conclude $\exists_{x \in S} \, P(x)$

### Universal modus ponens

1) if $\forall_{x \in S} \, (P(x) \implies Q(x))$ is true and
2) if $a \in S$ is true and
3) if $P(a)$ is true
4) then we can conclude $Q(a)$ is also true

### Universal modus tollens

1) if $\forall_{x \in S} \, (P(x) \implies Q(x))$ is true and
2) if $a \in S$ is true and
3) if $\neg Q(a)$ is true
4) then we can conclude $\neg P(a)$ is also true