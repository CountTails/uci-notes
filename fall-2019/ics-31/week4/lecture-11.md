# Lecture 11

## Booleans

Another type like `int`, `str`, `float`

The typename in Python for boolean values is `bool`

Boolean values may only hold the following values

- True
- False

The following objects are considered False

- The integer 0
- The float 0.0
- The empty string
- The None object
- other empty data structures

All other values are considered True

## Relational operators

| operator | meaning |
| --- | --- |
| `>` | greater than |
| `>=` | greater than or equal to |
| `<` | less than |
| `<=` | less than or equal to |
| `==` | equals |
| `!=` | not equals |

All of these operators return boolean values

Remember that `=` is the assignment operator. In math, `=` denotes equality, but in Python `=` means that the variable on the left should be set to the evaluated right side value

## Boolean operators

There are three boolean operators in Python

Ordered by precedence, they are as follows

| Boolean operator | Descriptions | 
| --- | --- |
| `not a` | Boolean **NOT** (opposite) |
| `a and b` | Boolean **AND** (True when both are true, false otherwise)
| `a or b` | Boolean **OR** (True when at lest one is true)

