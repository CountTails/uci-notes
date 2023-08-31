# Lecture 7

## List basics: lists, tuples, and named tuples

Python provides so many different ways to structure and store data because some are more useful than others at particular tasks

### Lists

Store collections of data with indices

| scores | 17 | 30 | 100 | 99 | 52 | 1 |
| --- | --- | --- | --- | --- | --- | --- |
| index | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |

- `scores[0] = 17`
- `scores[4] = 52`
- `len(scores) = 6`

### Lists vs. Strings

| Lists | String | 
| --- | --- | 
| Elements can be any type | Elements are characters |
| Mutable | Immutable |
| Heterogeneous elements | Homogeneous elements |

### Working with lists

```python
# Creating a list
empty = [] # empty
oddNums = [2, 3, 5]

# Adding elements to a list
oddNums.append(7) # adds 7 to the end of oddNums

# Removing elements from a list
oddNums.pop(0) # remove element at index 0
oddnums.remove(5) 
# remove first element where value is 7
```

### List functions

- `len`: length of a list
- `min`, `max`: maximum and minimum of list
- `sum`: sum of the elements in the list
- `+` will concatenate list

### Visualizing a list

| Negative Index | -3 | -2 | -1 |
| --- | --- | --- | --- |
| pets | 'goldfish' | 'cat' | 'dog' |
| Index | 0 | 1 | 2 |

### Tuples

Unlike lists, tuples are immutable

```python
# Create using ()
bestTeams = ('Rockets', 'Raptors', 'Warriors', 'Lakers')

# Access using []
print(bestTeams[0])
```

### Named Tuples

#### Defining

```python
from collections import namedtuple
Student = namedtuple('Student', 'name ID GPA year major')
```

The snippet above creates a named tuple `Student` with fields `[name, ID, GPA, year, major]`

The fields can be access by either name or index

#### Creating

```python
s = Student("Programer Paula", 11112222, 3.95, 1997, "COMPSCI")
```

The snippet above creates an instance of named tuple with the provided values as the fields. The fields are assigned sequentially

#### Using

```python
print('The student', s.name, 'majors in', s.major, 'and has a GPA of', s.GPA)
```

## Set basics

A set is an **unordered** collection of **unique** elements

Sets are mutable

### Creating

```python
set([1, 2, 3]) # any iterable object is OK
{1, 2, 3} # literal syntax
```