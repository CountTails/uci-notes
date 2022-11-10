# Introduction to proofs

## Definitions

### Formal proofs

- Like real code vs psuedo code
- Real code specifies every single step in gory detail (perfect syntax)
- General idea for human consumption

### Informal proofs

- Omit univeral quantifiers for brevity (implied)
    - if $x > y$, then $x^{2} > y^{2}$
    - $\vert x \vert > \vert y \vert \implies x^{2} > y^{2}$
- Omit domains if implied by context
- Shouldn't use "obviously" or "clearly" unless you can clearly identify the steps skipped

### Theorem

A formal statement that has been proven

## Proof types

### Direct

A sequence and axioms, implications, and previous theorems/lemmas/corollaries moving directly from $p \implies \dots \implies q$. Pure deduction

Example: If $n$ is odd, then $n^{2}$ is odd ($n \in \mathbb{N}^{2}$)

Proof:

1) $\exists_{k \in \mathbb{N}}$ such that $n = 2k + 1$
2) $(2k + 1)^{2} = (2k + 1)(2k + 1) = 4k^{2} + 4k + 1$
3) Factoring out a $2$ from the terms containing $k$: $2(2k^{2} + 2k) + 1$

The resulting expression has the same form as $n$, therefore $n^{2}$ is also odd. Q.E.D

### By contrapositive

We want to show $p \implies q$, but it may be difficult/unclear. So it may be easier to prove $\neg q \implies \neg p$ 

Example: If $3n + 2$ is odd, then $n$ is odd

Proof:

1) Identify the contrapositive: If $n$ is not odd, then $3n + 2$ is not add
2) Equivalently: If $n$ is even, then $3n + 2$ is also even
3) $\exists_{k \in \mathbb{N}}$ such that $n = 2k$
4) $3(2k) + 2 = 6k + 2 = 2(3k + 1)$

The resulting expression has the same form as $n$, therefore $3n + 2$ is also even. Since we have proven the contrapositive, the original statement has also been proven.

### Vacuous or trivial proofs

The hypothesis is false and since false implies anything is always true, so is the statement

Example: let $P(n) = n > 1 = n^{2} > n$. $P(0)$ is true

1) $0 > 1 \implies 0^{2} > 0$
2) $F \implies F \equiv T$

Example: let $P(n) = a > 0 \land b > 0 \land a \ge b \implies a^{n} \ge b^{n}$. $P(0)$ is true

1) $(a > 0 \land b > 0) \implies (a^{0} = 1) \land (b^{0} = 1) \implies a^{n} \ge b^{n}$
2) Note: vacuous because  $a \ge b$

### By contradiction

When we want to prove statement $p$, but it is infeasible to do so directly. So we find a statement $q$ that is known to be false. We can than prove $\neg p \implies q \equiv \neg q \implies p$ by contrapositive. 

The difficult part is identifying the statement $q$. One way is to find a statement $r$ such that $\neg p \implies (r \land neg r) \equiv (\neg p \implies r) \land (\neg p \implies \neg r)$

Example: Reprove that if $3n + 2$ is odd, then $n$ is also odd

1) Let p = "$3n + 2$ is odd" and q = "$n$ is odd"
2) Assume that $p \land \neg q \implies (p \implies \neg q)$ is true. Therefore if $3n + 2$ is odd, then $n$ is even
3) But, we have already proven that $(3n + 2) \implies n$ is odd. Therefore $p \implies \neg q$ is actuall false
4) But only a false implication if $T \implies F$. Therefore $q$ is false and $F \implies q \equiv T$

Example: show that at least 4 days of any 22 days must fall on the same day of the week

1) Let $p$ = "at least 4 days of any 22 days must fall on the same day of the week"
2) Assume that $\neg p$ is true and that there are 7 days to choose from
3) Let $r$ = "there are 22 days under consideration"
4) $\neg p$ is as above, which we can formally state as $\neg p \implies r$
5) However, given 7 days a week and at most 3 repititions, we can have 21 days under consideration, which is $\neg r$
6) Thus, $\neg p \implies r$ is true, 
    1) direct proof of $\neg p \implies \neg r$
    2) $(\neg p \implies r) \implies (\neg p \implies \neg r) \equiv \neg p \implies (r \land \neg r) \equiv \neg p \equiv F$
7) So if $\neg p$ is false, $p$ must be true