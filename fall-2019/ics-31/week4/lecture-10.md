# Lecture 10

## Branches (general)

Branches allow for snippets of code to be executed selectively

Code in branches is executed based on a boolean value

A control structure determines whether a branch is executed or not

## if statement

```python
if condition:
	statements

```

The `if` statement is the most basic control structure 

The statements within the if statment is the branch to be conditionally excuted

If the condition is true, the statements in the indented block are executed

If the condition is false, the statements in the indented block are not executed

## if-else block

```python
if condition
	statements
else:
	statements
```

The `if`-`else` statement is a control structure that allows for one or the other branch to be executed

If the condition is true, the statements in the first indented block are executed and the statements in the second indented block are not executed

If the condition is false, the statements in the second indented block are executed and the statements in the first indented block are not executed

## if-elif-else block

```pyton
if condition1:
	statements
elif condition2:
	statements
else:
	statements
```

The `if`-`elif`-`else` block is a control structure that allows for a series of conditions to be checked and determine the correct block statements to run

There are allowed any number of `elif` clauses in the block

The first condition that evaluates to `True` will be executed

The rest of the indented blocks are not executed

## Nested conditionals

Conditionals can be nested within each other

This allows for multiple check to be performed within an indented block

