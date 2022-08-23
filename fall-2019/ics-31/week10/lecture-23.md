# Lecture 23

## Loops modifying lists

Lists can be modified while in a loop

Must be careful though, becuase this can be a source of bugs

```python
colors = ["red"]
for i in colors:
	if i == "red":
		colors += ["black"]
	if i == "black":
		colors += ["white"]
print(colors) # prints ['red', 'black', 'white']
```

## List comprehensions

List comprehensions have 3 components

1) An expression component to evaluate for each element of the iterable object
2) A loop variable component to bind to the current element
3) An iterable object component to iterate over

```python
new_list = [expression for name in iterable]
```

A list comprehension can include an **optional** conditional expression to determine if the element should be included in the new list

```python
new_list = [expression for name in iterable if condition]
```

## For loop vs list comprehension

### For loop

```python
new_list = []
for n in numbers:
	if n % 2 == 0:
		new_list.append(n**2)
```

### list comprehension

```python
new_list = [n**2 for n in numbers if n % 2 == 0]
```

## Sorting lists

There are two ways to sort a list

| Method | Explanation |
| --- | --- |
| `sorted()` | Sorts the elements an returns a new list, leaving the original list as is
| `list.sort()` | Sorts the elements in the same list, returning `None` |
