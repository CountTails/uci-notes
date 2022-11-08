# Propositional equivalences

## Bits

Bits is short for **B**inary dig**its**

- T = 1
- F = 0

A bit string is just a sequence of bits

Bitwise operations are boolean operations of bit string

- "01001" AND "10111" = "00001"
- "01001" OR "10111" = "11111"
- "01001" XOR "10111" = "11110"

## Rules of boolean algebra

- **Tautology**: A statement that is *always* true, regardless of inside variable values ($p \lor \neg p$)
- **Contradiction**: A statement that is *always* false ($p \land \neg p$)
- **Contingency**: A statement that may by true of false depending on variable values
- $p \equiv q$: $p$ and $q$ are equivalent if and only if $p \iff q$ is a tautology

## DeMorgan's law 

1) $\neg(p \land q) \equiv (\neg p \lor \neg q)$ -- distribute the ($\neg$), change ($\land$) to ($\lor$)
2) $\neg(p \lor q) \equiv (\neg p \land \neg q)$ -- distribute the ($\neg$), change ($\lor$) to ($\land$) 