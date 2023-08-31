# Lecture 14 (Aside)

## Testing mindset

Testing should be ingrained at all stages at development

Every aspect of a program can be tested

Testing starts before you start coding

## Test Case Design

### Pre conditions

preconditions test that the state of a system and its environment are safe to run the code in

### Using assert statements

assert statements state a fact confidently in your program

```python
assert <condition>, <error message>
```

If the condition in an assert statement is false, the code stops and raises an `AssertionError`

Assert statements also provide an optional error message that will be given along with the `AssertionError`

### Post conditions

postconditions test that the code ran as expected

## Code coverage

The ultimate goal is 100% code coverage. That means that there is at least 1 test that covers every line of code.

There are tools that will perform code coverage analysis for you

Code coverage is the percentage of code that is covered by **automated tests**

## The `try`-`except` statement

Your code should not immediately stop in case of error. Something should be done to try and recover from the error

```python
try:
	<code that might cause an error>
except:
	<code to execute when error occurs>
```

