# Boolean algebra review

## Basic logic gates

![Basic Gates](./figures/basic-gates.png)

## Notation and definitions

- *Complement*: opposite of a variable value
- *Multiplication*: represent bit-wise AND
- *Addition*: represent bit-wise OR
- *Operator precedence*: `NOT > AND > OR`
- *Input variables*: represent a binary input value
- *Output variables*: evaluation of a boolean expression represents a binary output value
- *Literal*: each occurance of a variable in the expression
- *Term*: minimum unit of the expression. The form determines the first-level gate unit

## Boolean identities

> The key to simplifying Boolean expressions is to learn the Identities

### Basic identities

- Double complement: $(A')' = A$
- Idempotence: $A \cdot A = A$ or $A + A = A$
- Inverse: $A \cdot A' = 0$ or $A + A' = 1$
- Null (or dominance): $A \cdot 0 = 0$ or $A + 1 = A$
- Identity: $A \cdot 1 = A$ or $A + 0 = A$
- Distributive: $A \cdot (B + C) = A \cdot B + A \cdot C$ or $A + (B \cdot C) = (A + B) \cdot (A + C)$
- Commutative: $A \cdot B = B \cdot A$ or $A + B = B + A$
- Assosiative: $(A \cdot B) \cdot C = A \cdot (B \cdot C)$ or $(A + B) + C = A + (B + C)$

### Advanced identities

- Note that $A$ and $B$ could refer to any complex Boolean expression

#### Absorption law

- $A + (A \cdot B) = A$
- $(A) \cdot (A + B) = A$

#### No-name

- $A + A' \cdot B = A + B$
- $A(A' + B) = A \cdot B$

#### Consensus

- $AB + BC + A'C = AB + A'C$
- $(A + B)(B + C)(A' + C) = (A + B)(A' + C)$

#### De Morgan's law

- $(A + B)' = A' \cdot B'$
- $(A \cdot B)' = A' + B'$
- This holds for any number of terms

## Equivalent representations

- Boolean functions and expressions can be *expressed* in different ways
- *Boolean expression*: the logical expression
- *Gate diagrams*: expressed as a term of logical operations and wires
- *Truth tables*: express output in terms of all possible combination of its input