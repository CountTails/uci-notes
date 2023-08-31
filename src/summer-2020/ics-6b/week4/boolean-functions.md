# Boolean functions

## Boolean algebra

- A different notation for logical operators
    - $F \to 0$
    - $T \to 1$
    - $\land \to \text{boolean multiply}$
    - $\lor \to \text{boolean addition}$
    - $\neg \to \text{complement}$
- Boolean operations $(x, y) \in \{0,\ 1 \}$
    - $x + y = 1 \iff x = 1 \lor y = 1$
        - $1 + 1 = 1$
        - $1 + 0 = 1$
        - $0 + 1 = 1$
        - $0 + 0 = 0$
    - $xy = 1 \iff x = 1 \land y = 1$
        - $1 \times 1 = 1$
        - $1 \times 0 = 0$
        - $0 \times 1 = 0$
        - $0 \times 0 = 0$

$$
    1 \times 0 + \overline{(0 + 1)} = 0 + 0 = 0 \equiv (T \land F) \lor \neg(F \lor T) = F \lor \neg T = F
$$

## Precedence

1) Multiplication
2) Addition
3) Complement (applied after expression under is evaluated)

## Evaluating expressions

- Distributive and associate laws apply
- $(x + y)(a + b) = xa + xb + ya + yb$
- $(x + y)(x + z) = xx + xz + yx + yz = x(x + z + y) + yz = (y + z) + yz = y + z + yz$

> Thm: $x(x + y + z) = x$

### Proof by truth table

| x | y | z | x + y + z | x(...) |
|---|---|---|-----------|--------|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 1 | 0 |
| 1 | 0 | 0 | 1 | 1 |
| 1 | 0 | 1 | 1 | 1 |
| 1 | 1 | 0 | 1 | 1 |
| 1 | 1 | 1 | 1 | 1 |

- Examining the first column and the last column reveals the statement to be true

### Proof by boolean algebra

- $x(x + y + z) = x$
- $xx + xy + xz = x$
- $x + x(y + z) = x$
- $x(1 + (y + z)) = x$
- $(x)(1) = x$
- $x = x$