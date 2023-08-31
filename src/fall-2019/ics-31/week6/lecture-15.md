# Lecture 15

## `while` vs `for` loops

Use a `for` loop when:

- number of iterations is known before loop begins
- accessing elements in a container (list, tuple, etc.)

Use a `while` loop when

- number of iterations is not known before loop begins

### Loop by value

Useful for accessing elements in a list

Ideal when elements are only **accessed** and will not be **modified**

Can be done easily with a `for` loop

### Loop by index

Useful for accessing elements in a list

Ideal when elements will be **modified**

Can be done easily with both `for` and `while` loops

### Loop by value and index

Useful for accessing elements **and** ideal when elements will be modified

Can be done easily with the `for` loop with the `enumerate()` function

## Nested loops

Loop with within a loop

Inner loop will run completely for each time that the other loop completes

```python
for i in range(10):
	for j in range(10):
		print(i, j)
```

## Incremental programming

Develop in small parts

Test those small parts to ensure they work before interweaving the parts into a complete program