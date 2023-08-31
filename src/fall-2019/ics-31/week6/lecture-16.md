# Lecture 16

## Dynamic typing

Python is a dynamically typed language

Type checking is done at runtime

```python
if False:
	1 + 'two'
else:
	1 + 2
```

The snippet above will not cause an error because the problematic statement is never executed. Thus, no type checking is performed there

## Functions are objects

Functions can be assigned to a variable

Functions can be passed to a function as a parameter

Functions can be stored in a list