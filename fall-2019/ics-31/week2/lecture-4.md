# Lecture 4

## Floating point values

`float` should be used to represent quantities that are *counted*

`int` should be used to represent quantities that are *counted*

## Arithmetic Expressions

### Operator Precedence

| Operator | Description |
| --- | --- |
| `()` | Items within parenthesis are evaluated first |
| **unary** `-` | unary minus (used for negation) is next |
| `* / % //` | Multiplication and division ops (with equal precedence) are next|
| `+ -` | Finally, addition and substaction are last |
| **left-to-right** | equal precedence operators are evaluated from left to right |

## Python Expressions

### Modulo operator

`%` is called the modulo operator in Python

Returns the remainder after carrying integer division

Important relation between integer division and mod

 - call $q$ the quotient of $a$ and $b$
 - call $r$ the result of `a % b`
 - then $a = q * b + r$
 - explored more in Math 6B

### Compound operators

Useful when source and destination are included in a calculation

operators:
`+=   -=   *=   /=   %=`

### Expression style

Spreading a Python expression over several lines can improve readability

Good style suggests using line breaks *before* a mathematical operator

## Objects Recap

An object is **mutable** if it is allowed to be changed

An object is **immutable** if it is not allowed to be changed. This generally means a whole new object is created for each change that is made.