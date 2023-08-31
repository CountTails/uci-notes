# Lecture 20

## String slicing

Slicing allows us to copy a substring of a string

Slicing uses `[]` operator and the same arguments logic of the `range()` function

- `[:]` returns a copy of the string
- `[a:]` returns a copy of the string starting at index `a` to the end of the string
- `[:b]` returns a copy of the string starting at the beginning and up to, but not including, index `b`
- `[a:b]` returns a copy of the string starting at index `a` and up to, but not including, index `b`
- `[a:b:c]` returns a copy of the string starting at index `a` and up to, but not including, index `b`, skipping every `c` characters

## String methods

Plenty of methods to do things with strings

These are already defined, and can be used right out of the box

Can only be used with `str` objects

A complete list of `str` methods can be found [here](https://www.w3schools.com/python/python_ref_string.asp)

## Splitting and joining strings

A couple of `str` methods can assist with these tasks

### Splitting

Use `str.split()` to split a string. By default, the string will be split on whitespace, but you can specify a custom delimiter as an argument

### Joining

Use `str.join()` to concatenate a list of string with `str` in between each string.