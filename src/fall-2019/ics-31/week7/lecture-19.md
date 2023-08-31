# Lecture 19

## Assert Review

Asserts statements check for a condition

If the condition is `False`, an error is raised

Preconditions are test cases that ensure code is safe to execute

Post conditions are test cases that ensure code executed as expected

Try-except statements give a chance to recover from an error

## Test coverage

Code coverage is is the percentage of code covered by automated test cases

Tests should be generated to ensure code coverage

```python
def is_lower_case(c):
	assert type(c) is str, f"TypeError {type(c)}. Expected str"
	assert len(c) == 1, f"LengthError {len(c)}. Expected len(c) == 1"
	return ord('a') <= ord(c) <= ord('z')
	
```

```python
if __name__ == '__main__':
	# test to trigger/verify postconditions
	assert is_lower_case("c") is True #CC: line 5
	assert is_lower_case("C") is False #CC: line 5
	assert is_lower_case("1") is False #CC: line 5

	# test to triger/verify preconditions
	try:
		is_lower_case(1) #CC: line 3
	except AssertionError as e:
		print(e)

	try:
		is_lower_case("aa") #CC: line 4
	except AssertionError as e:
		print(e)
```
