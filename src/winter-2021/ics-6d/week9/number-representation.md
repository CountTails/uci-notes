# Number representation

## Decimal and binary

- Our number system represents numbers in base 10 (also called decimal notation)
	- Each place represents a power of 10
	- $3045 = 3*10^{3} + 0*10^{2} + 4*10^{1} + 5*10^{0}$
- Computers are limited to two digits (0, 1) and therefore represents numbers in base 2 (also called binary)
	- Each place represents a power of 2
	- $1011 = 1*2^{3} + 0*2^{2} + 1*2^{1} + 1*2^{0}$

## Arbitrary base

- Can represent the value of a number in any base
	- Representation in base b uses digits $\{ 0,\, 1,\, 2,\, \dots,\, b-1 \}$
	- Example: representing in base 7 uses digits $\{0,\, 1,\, 2,\, 3,\, 4,\, 5,\, 6,\, 7 \}$
	- $(612)_{7} = 6*7^{2} + 1*7^{1} + 2*7^{0}$

> Theorem: Fix an integer $b > 1$. Any non-negative integer $n$ can be expressed uniquely as

$$
	n = a_{k}*b^{k} + a_{k-1}*b^{k-1} + \dots + a_{1}*b^{1} + a_{0}*b^{0}
$$

> Each $a_{j}$ is an integer digit in the range $\{ 0,\, 1,\, \dots,\, b-1 \}$ and $a_{k} \ne 0$

### Base `b` to decimal

> Convert $(6502)_{7}$ to decimal

- Non-recursive method 
	- $6*7^{3} = 2058$
	- $5*7^{2} = 245$
	- $0*7^{1} = 0$
	- $2*7^{0} = 2$
	- Summed up: $2305$
- Recursive method
	- $=((6*7 + 5)*7 + 0)*7 + 2$
	- $=(42 + 5) * 7 * 7 + 2$
	- $=(47*7 + 0) * 7 + 2$
	- $=329*7 + 2$
	- $= 2305$

### Decimal to base `b`

- Represent $n$ base $b$: $[\text{base b representation (n div b)}][n \mod b]$

> Convert $743$ to base 5

- $743 \div 5 = (148,\, 3)$
- $148 \div 5 = (29,\, 3)$
- $29 \div 5 = (5,\, 4)$
- $5 \div 5 = (1, 0)$
- $1 \div 5 = (0,\, 1)$
- String remainders together: $(10433)_{5}$

### Algorithm for conversion

- Input: integer $n$ and $b$ such that $b > 1$ and $n \ge 1$
- Output: Base $b$ representation of $n$

```
def base_b_rep(n, b):
	if (n == 0) return
	base_b_rep(n DIV b, b)
	OUTPUT digit n MOD b
```

## Hexadecimal

- If $b > 10$, then we need to use letters to represent digits larger than $9$
- Base 16, also called hexadecimal notations uses the digits: $\{ 0,\, 1,\, 2,\, 3,\, 4,\, 5,\, 6,\, 7,\, 8,\, 9,\, A,\, B,\, C,\, D,\, E,\, F \}$
- $(6D)_{16} = 6*16^{1} + 13*16^{0} = 96 + 13 = 109$
- $(E1F)_{16} = 14*16^{2} + 1*16^{1} + 15*16^{0}$

### Conversion table

| HEX | Decimal | Binary |
|:----:|:-------:|:------:|
| 0 | 0 | 0000 |
| 1 | 1 | 0001 |
| 2 | 2 | 0010 |
| 3 | 3 | 0011 |
| 4 | 4 | 0100 |
| 5 | 5 | 0101 |
| 6 | 6 | 0110 |
| 7 | 7 | 0111 |
| 8 | 8 | 1000 |
| 9 | 9 | 1001 |
| A | 10 |1010 |
| B | 11 |1011 |
| C | 12 |1100 |
| D | 13 |1101 |
| E | 14 |1110 |
| F | 15 |1111 |

### Hex to binary

- Divide the number into chunks of 4, left pad with 0's if needed
- Use the conversion table above to convert each digit quickly

### Binary to hex

- Convert each hex digit to its corresponding 4 bit sequence

## Number of digits

- The largest number that can be represented with $5$ digits base $8$ is: $100000$
- If $n$ is represented with $5$ digits base $8$ then: $n \le 8^{5} - 1$
- The largest number that can be represented with $d$ digits base $b$ is $b^{d} - 1$
- If $n$ is represented with $d$ digits base $b$ then: $n \le b^{d} - 1$
- The number of digits needed to represent $n$ in base $b$ is at least: $\log_{b}(n + 1)$
