# Propositional logic

## Why learn formal logic and proofs?

- Prove programs are correct -> show they won't crash
- Life critical applications
    - Flight automation
    - Self-driving cars
    - Medical device control
- Financial transactions
- Determine what can be computed
    - e.g. The Halting Problem
- How expensive is a computation (time)?
    - e.g. TSP (Traveling Salesman Problem)
    - NP-complete (optimizations)
- Prove algorithm won't crash on **any** input
    - If given valid input, prove correct answer is returned
    - Correct answer is specified in program specifications
- Engineer might want to prove CPU chips work
    - e.g. Intel Pentium `FDIV` bug
- Rockets
    - Ariane S
    - A software bug caused it to explode
    - The bug came from its predecesor
- A320 crash
    - Flight angle of attack was over corrected as time went on

## Propositions

A **proposition** is a direct statement of fact. It can be true or false

> p = "Toronto is the capital of Canada"
> p evaluates to false. The capital of Canada is actually Ottowa


### Logical operations

#### Negation

Denoted as $\neg p$ and means the negation of $p$ or "not $p$"

| $p$ | $\neg p$ |
|---|---|
| T | F |
| F | T |

#### Conjunction

Denoted as $p \land q$ and means "$p$ and $q$". It is true if and only if both $p$ and $q$ evaluate to true. Otherwise false

| $p$ | $q$ | $p \land q$ |
|---|---|---|
| T | T | T |
| T | F | F |
| F | T | F |
| F | F | F |

Note: the word "but" is logically equivalent to "and", but expresses surprise

#### Disjunction

Denoted as $p \lor q$ and means "$p$ or $q$". It is true if and only if either $p$ or $q$ evaluate to true. Otherwise false

| $p$ | $q$ | $p \lor q$ |
|---|---|----|
| T | T | T |
| T | F | T |
| F | T | T |
| F | F | F |

#### Exclusive disjunction

Denoted as $p \oplus q$ and means "$p$ only or $q$ only". It is true if and only if exactly one of $p$ and $q$ are true

| $p$ | $q$ | $p \oplus q$ |
|---|---|----|
| T | T | F |
| T | F | T |
| F | T | T |
| F | F | F |

Note: exclusive disjunction is usually what is meant in english "or". e.g. "Your money or your life"

#### Material conditional (implication)

Denoted as $p \implies q$ and means "$p$ implies $q$"

> p = "It is raining"
> q = "There are clouds overhead"
> p -> q is true
>     - It rains only if there are clouds overhead
>     - If it is raining, then there are clouds overhead

Note: logical implication is often backwards to causal implication(program `if` statements)

Note: $(p \implies q) \equiv (\neg p \lor q)$

Not equivalent to $p \implies q$

- $q \implies p$ (converse)
- $\neg q \implies \neg p$ (contrapositive)
- $\neg p \implies \neg q$ (inverse)

| $p$ | $q$ | $\neg p$ | $\neg p \lor q$ | $p \implies q$ |
|---|---|---|---|---|
| T | T | F | T | T |
| T | F | F | F | F |
| F | T | T | T | T |
| F | F | T | T | T |

Why does $(F \implies F) \equiv T$

- Recall the contrapositive: $p \implies q \equiv \neg q \implies \neg p$
- Let  $p \equiv q  \equiv T \to T \implies T \equiv \neg T \implies \neg T$
    - $T \equiv (F \implies F$

Why does $(F \implies T) \equiv T$

- $(p \implies q) \land (p \implies r) \equiv p \implies (q \land r)$
- If p is false, q is true, and r is false
    - $(F \implies T) \land (F \implies F) \equiv F \implies (T \land F)$
    - $T \land T \equiv T$

#### Material biconditional (dual implication)

Denoted as $p \iff q$ and means $p$ if and only if $q$. It is true whenever $p$ and $q$ are equivalent statements

$(p \iff q) \equiv (p \implies q \land q \implies p)$

Note on "necessary" and "sufficient"

- rain is a sufficient condition to conclude clouds
- cloud are a necessary condition for rain

### Precedence

1) Negation
2) Conjunction
3) Disjunction
4) Implication
5) Dual implication
6) Equivalence

## Logic puzzles

> "Knights and knaves"
>     Facts:
>         1) Knight always tell the truth
>         2) Knaves always lie

Evaluate the following

- A = "B is a knight"
- B = "We are opposite types"

**Advice**: Always phrase propositions positively

- p = "A is a knight"
- q = "B is a knight"

Propositions

- $(p \implies q \land q \implies \neg p)$
- $(\neg p \implies \neg q \land \neg q \implies \neg p)$

Task: Find values for p and q such that everything works

| $p$ | $q$ | $x \equiv p \implies q$ | $\neg p$ | $y \equiv q \implies \neg p$ | $x \land y$ |
|---|---|----|----|---|----|
| T | T | T | F | F | F |
| T | F | F | F | T | F |
| F | T | T | T | T | T |
| F | F | T | T | T | T |

| $p$ | $q$ | $\neg p$ | $\neg q$ | $w \equiv \neg p \implies \neg q$ | $z \equiv \neg q \implies \neg p$ | $w \land z$ |
|---|---|----|----|---|----|---|
| T | T | F | F | T | T | T |
| T | F | F | T | T | F | F |
| F | T | T | F | F | T | F |
| F | F | T | T | T | T | T |

$p$ is false. $q$ is false. Therfore, A and B are both knaves
