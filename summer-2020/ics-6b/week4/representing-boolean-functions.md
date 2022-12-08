# Representing boolean functions

## Boolean functions

- Example
    - $F(x, y, z) = xy + \overline{z}$
    - let $B = \{ 0,\ 1 \}$
    - $B^{n} = \{ (x_{1}, x_{2}, x_{3}) \ \vert \ x_{i} \in B \}$ or the set of n-bit strings
- Question
    - How many boolean functions exists on $n$ bits?
    - $n$ bits $\implies 2^{n}$ rows in the truth table defining $F$
    - Enumerating all functions $\implies 2^{2^{n}}$ possible functions
- Terms
    - Literal: a boolean variable or its complement
    - Minterm: a product $y_{1}y_{2}y_{3}\dots y_{n}$ where $y_{i}$ is a literal
        - Note: is always $0$ unless all of $y_{i}$ is 1
    - Disjunctive normal form: boolean sum of minterms representing $F$

>Thm: All n-bit function has a disjunctive normal form

- Find a disjunctive normal form for  $F(x, y, z) = (x + y)\overline{z}$
    - $F(x, y, z) = x\overline{z} + y\overline{z}$ by the distributive law
    - $= x1\overline{z} + 1y\overline{z}$ by the identity law
    - $=x(y + \overline{y})\overline{z} + (x + \overline{x})y\overline{z}$ by unitary
    - $= xy\overline{z} + x\overline{y}\overline{z} + y\overline{z}x + y\overline{z}\overline{x}$
    - $= xy\overline{z} + x\overline{y}\overline{z} + \overline{x}y\overline{z}$
- Alternatively,
    1) Write out the truth tale for $F$
    2) When, $F$ evaluates to $T$, the input composes of a minterm to the disjunctive normal form of $F$
    3) The sum of all such evaluations is the disjunctive normal form of $F$

## Functional completeness

>Thm: The set of boolean operators $\{ +,\ \times,\ \overline{  } \}$ is functionally complete because every boolean function can be expressed using these operators

>Thm: $\{ \times, \overline{   } \}$ is functionally complete because $+$ can be replaced by De Morgan's laws

>Thm: NAND is functionally complete becuase $\overline{x} = \overline{xx}$ (Note: $\operatorname{NAND}(x, y) \equiv \overline{xy}$)

> Thm: NOR is functionally complete (Note: $\operatorname{NOR}(x, y) \equiv \overline{(x + y)}$)