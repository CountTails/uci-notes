# Lecture 6

## Return vs. Print

### Print

A `print` statement displays information to the user (often to a monitor)

It is like writing a message on the whiteboard

### Return

A `return` statement allows a function to give back/leave a useful value in its place

Every function (in Python) returns a value. If no return value is specified, the function will return `None`

## String basics

A string is a sequence of characters

Strings are immutable

Surround text with single or double quotes to indicate something is a string

Use `[]` for accessing portions of a string

Use `+` for string concatenation

#### Some string functions

- To get the ith character of a string: `s[i]`
- To get the length of a string: `len(s)`

## String formatting

### Format method

Three ways to specify print format arguments

1) *Positional*: an integer that describes the position of the value
	- `'The {1} in the {0}'.format('hat', 'cat')`
2) *Inferred positional*: Empy `{}` assumes ordering of replacement fields
	- `'The {} in the {}'.format('cat', 'hat')`
3) *Named*: a name matchin a keyword argument
	- `'The {animal} in the {headwear}'.format(animal='cat', headwear='hat')`

### Printing precision

`%[flags][width][.precision]type`

Consult documentation for full options and meaning