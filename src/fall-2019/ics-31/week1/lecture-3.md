# Lecture 3

## Error Recap

### TypeError vs. ValueError

When passing an argument into a function, Python will do the following:

1) Determine the type of the argument
2) Is the type compatible/useable by the function?
	- If not: ValueError
3) Can the type be converted?
	- If not: ValueError

## Variables, Assignments and Identifiers

### Literals

raw data given in a variable or constant

Numeric literals

- immutable (unchangeable)
- can be an integer, float, or complex type

String literals

- sequence of characters surrounded by quotes
- can use singe ('), double("), or triple (""") quotes
- a character literal is a single character surrounded by quotes

## Rules and naming conventions

1) create a name that makes sense
2) use snake case for variables
	- lower_case_with_underscores
	- start with lowercase letter
	- separate each successive word with an underscore
3) use capital letters with underscores for constants
	- `PI = 3.14`
4) Never use the following symbols
	- !, @, #, $, %, etc
5) don't start a name with a digit
6) constants are meant not to be changed

### Identifying variables

When describing an algorithm, try to identify nouns & verbs

- Nouns become variables or constants
- Verbs becomes expressions or calculations

### Create meaningful names

Why?

- clearer and easier to read
- allow you to understand code two years after it was written

How?

- think about functionality
- describe value it will hold
- ok to be wordy (abbreviations are ok)
- avoid funny names
- avoid python keywords

Good examples

- `account_number`
- `SPEED_OF_LIGHT`
- `radius`

Bad examples

- `act_no` -> activity number? account number?
- `C` -> the programming language? well known constant?
- `r` -> rate of return? radius?

## Objects

Objects have a value and a type

`type()` gives the type of the given object

`id()` gives a unique identifier for the given object

objects can be mutable or immutable

