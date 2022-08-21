# Lecture 13

## Loops (General)

A loop must define a loop control variable (LCV)

The LCV must be **initialized**

The LCV must be **Tested** against a stopping value

The LCV must be **Changed** to get closer to the stopping value

## While loop

```python
loopControlVariable = initial_value
while loopControlVariable <?> sentinalValue:
	<loop body>
	loopControlVariable = change_expression
```

The first `<?>` is a relational operator that will result in a boolean value.

If the result of the boolean expression is `True`, the loop body is executed

If the result of the boolean expression is `False`, the loop body is skipped

When the loop body is finished executing, the condition is checked again. Then rinse and repeat

The LCV must be updated manually or it will result in an infinite loop

## For loop

```python
for LCV in range(initial_value, stopping_value, change):
	<loop body>
```

The LCV is initialized to the first object in the range.

If there is another object in the range, then loop body is executed.

If there are no more objects in the range then loop body is skipped

The LCV is automatically updated and checked by Python, so there is no need to update it yourself

## Ranges

```python
for <var> in range(<start>, <end>, <step>):
	pass
```

`range` provides an immutable sequence of `int` as needed

Can provide one, two, or three arguments for `range`

If one argument is provided, Python returns `range(0, end)`

If two arguments are provided, Python returns `range(start, end)`

If three arguments are provided, Python returns `range(start, end, step)`

There are multiple ways to specify the same range, For instance, `for i in range(7)` is the same as `for i in range(0, 7)`