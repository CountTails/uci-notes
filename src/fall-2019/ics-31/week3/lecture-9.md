# Lecture 9

## Types summary

### Numeric types

Used to store numeric data

Values for mathematical operations

| type | notes |
| --- | --- |
| int | used for variable-width integers | 
| float | used for floating point numbers |

### Containers
| type | notes |
| --- | --- |
| str | used for text |
| list | mutable container with ordered elements |
| tuple | immutable container with ordered elements |
| dict | container with key-value associated elements |

### Sequence operations

| operation | description |
| --- | --- |
| `len(list)` | find the length of a list |
| `list1 + list2` | produce a new list by concatenating the two lists |
| `min(list)` | find the smallest element in the list
| `max(list)` | find the largest elements in the list
| `sum(list)` | sum the elements of the list |
| `list.index(val)` | find the index of the first element that matches val |
| `list.count(val)` | count the number of occurences of val in list |

## Type conversions

| function | notes | can convert |
| --- | --- | --- |
| `int()` | creates integers | ints, floats, strings w/ integers only |
| `float()` | creates floats | ints, floats, strings w/ integers of fractions |
| `str()` | create strings | any* |

## User define function basics

### Structuring your python file

- Import statements at the top of the file
- Function and data definitions
- Code to test the module at the bottom

### Functions

They act like isolated universes. Each has a portal for passing in information into the function

Functions cannot see inside other functions

Values are passed into functions as arguments. Arguments are mapped onto the function's parameters

A function can take zero or more arguments

```python
def f(a, b, c):
	...

x = 5
y = 8
z = 10
f(x, y, z)
```

When f starts running

- a gets the value of x
- b gets the value of y
- c gets the value of z

Changes to parameters do not change the arguments

### Function definition vs Function object vs Function call

**Function definition**: states the number of parameters required, and the behavior /  actions the function carries out

**Function object**: every function is an object

**Function call**: invoking / calling the behavior of the function with the required number of arguments enclosed by matching parenthesis

## Returning values

If a function returns a value, `return` will exit the function an replace the function call with the returned value

If there is no `return`, the function exits at the bottom and automatically returns `None`

