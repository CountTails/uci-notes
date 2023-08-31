# Lecture 22

## Nested lists

A list within a list

A string within a list (strings are lists of characters)

Access each dimension using `[]`, chaining them together to access inner lists

## List slicing

Slicing allows us to copy a sublist of a list

Slicing uses `[]` operator and the same arguments logic of the `range()` function

- `[:]` returns a copy of the list
- `[a:]` returns a copy of the list starting at index `a` to the end of the list
- `[:b]` returns a copy of the list starting at the beginning and up to, but not including, index `b`
- `[a:b]` returns a copy of the list starting at index `a` and up to, but not including, index `b`
- `[a:b:c]` returns a copy of the list starting at index `a` and up to, but not including, index `b`, skipping every `c` elements
