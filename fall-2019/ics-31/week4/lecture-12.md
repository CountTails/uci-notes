# Lecture 12

## Short circuit evaluation

Can be done when a Python expressions contains an `and` and `or` in it

Python will evaluate from left to right and will stop when the truth value is known

For `x and y`, if `x` is False, there is no reason to evaluate `y`

For `x or y`, if `x` is True, there is no reason to evaluate `y`

The value of the expression ends up being the last condition actually evaluated by Python

## Writing code with booleans

Use parenthesis for clarity or if precedence needs to be overridden

Use the simplest expressions possible

- double negative `not not a`
- `== True` or `== False`

## Membership and identity operators

### Membership

```python
if name in container:
	...
```


```python
if name not in container:
	...
```

Check in name is in the container

Works with:

- dictionaries(keys only)
- list
- strings
- tuples
- set

### Identity

```python
if z is x:
	...
```

```python
if z is not y:
	...
```

Check if the two names refer to the same object

Works with:

- dictionaries(keys only)
- list
- strings
- tuples
- set
