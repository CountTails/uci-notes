# Two dimensional lists

## Background

Connect Four is a game whose playfield is a two-dimensional grid, with tiles being dropped into columns from the top or popped from columns at the bottom; for that reason, connectfour.py organized the playfield as a two-dimensional list

The interal representation of the board would be something like this.

```Python
[[0, 0, 0, 0, 1, 2],  
 [0, 0, 0, 2, 2, 1],  
 [0, 0, 0, 0, 1, 1],  
 [0, 0, 0, 1, 2, 2],  
 [0, 0, 0, 0, 1, 2],  
 [0, 0, 2, 1, 1, 2],  
 [0, 0, 0, 0, 0, 1]]
```

The user interface would be represented as so.

```Python
. . . . . . .  
. . . . . . .  
. . . . . Y .  
. Y . R . R .  
R Y R Y R R .  
Y R R Y Y Y R
```

Even if the user interface and internal representation don't match, the implemenation provides time and memory efficient ways to do the most common operations 

## References, mutability and immutability

You eventually run into issues where you simply need to understand the reality of the language if you want to be able to write programs correctly

### Variables contain references, not objects

When assigning a value to a variable that variable does not actually store the object. Instead, the variable stores a reference to that object.

```Python
>>> x = 20563  
>>> x  
20563  
>>> id(x)  
55367280
```

The variable may store different objects throughout its lifetime. This causes the `id` of the variable to change

```Python
>>> x += 1  
>>> x  
20564  
>>> id(x)  
55367568
```

### Mutability vs Immutability

Mutable types are the ones whose objects can be changed; immutable types are the ones whose objects cannot.

Integer values are immutable in Python, which means that there's nothing you can do to change an integer object once it's been created; all you can do is create a new integer object.

Lists in Python are mutable, which means that alterations to an existing list change that list, as opposed to building a new one.

```Python
>>> a = [1001, 1002, 1003]  
>>> id(a)  
55035272  
>>> a.append(1004)  
>>> a  
[1001, 1002, 1003, 1004]  
>>> id(a)  
55035272
```

Note how the `id(a)` does not change after modifying the list.

What happens when multiple variables refer to the same object?

```Python
>>> a = 657123
>>> id(a)  
55088720  
>>> b = a  
>>> id(b)  
55088720
```

`a` and `b` both refer to the same integer. If we change `a`, but not `b`, what will happen to `b`?

```Python
>>> a += 1
>>> a  
657124  
>>> id(a)  
55628976  
>>> b  
657123  
>>> id(b)  
55088720
```

Nothing will happent to `b`. It will remain unchanged since integers are immutable. Adding 1 to `a` caused a new integer object to be created and `a` to refer to it while `b` still refers to the existing integer object

Now, consider the same scenario with a list

```Python
>>> a = [1001, 1002, 1003]  
>>> id(a)  
55266312  
>>> b = a  
>>> id(b)  
55266312
```

`a` and `b` both refer to the same list. Modifying one variable will affect both `a` and `b`

```Python
>>> a.append(1004)  
>>> a  
[1001, 1002, 1003, 1004]  
>>> id(a)  
55266312  
>>> id(b)  
55266312  
>>> b  
[1001, 1002, 1003, 1004]
```

Consider the effect on mutating one of the elements in the list

```Python
>>> c = a[0]  
>>> id(c)  
55088736  
>>> id(a[0])  
55088736  
>>> c  
1001  
>>> c += 1
```

The list elements are integers, which are immutable. Therefore, `c` will change, but `a[0]` will not change

```Python
>>> c  
1002  
>>> id(c)  
55628912  
>>> a[0]  
1001  
>>> id(a[0])  
55088736  
>>> a  
[1001, 1002, 1003, 1004]
```

### Why the mutability disctinction matters

- Use a `for` loop that iterates over the list's elements. If the elements are immutable, then modifying the loop variable will not affect the list overall
- Use a `for` loop that iterates over the indices of the list's elements. In this case, the loop variable stores and index which can be used to get direct access to the list elements and modify them
- Use a `while` loop, managing the values of variables that access indices manually, while ensuring that they remain valid. This scenario also stores and index, which will allow for list elements to by modified

## The code

```Python
# two_d_lists.py
#
# ICS 32 Winter 2020
# Code Example
#
# This module demonstrates a few examples of functions that operate on
# two-dimensional lists in a handful of ways.




# The sum_all function takes a two-dimensional list of integers, such
# as [[1, 2, 3], [4, 5, 6], [7, 8, 9]], and returns the sum of all the
# integers in that list.  Note that this is a special case of the
# sum_recursive function we wrote in an earlier code example, and that
# we could theoretically use recursion to solve it, but if we're in a
# situation where we *know* that we have a two-dimensional list, it's
# better for us to use a more straightforward algorithm that solves
# the problem we know we have.

def sum_all(x: [[int]]) -> int:
    # Before we're seen any of the integers, our sum so far is 0.
    the_sum = 0

    # Loop through all of the sublists.  In each one, loop through
    # the integers in that sublist.  For each of those integers, add
    # them to our running sum.
    for i in x:
        for j in i:
            the_sum += j

    # Return the sum when we're finished.
    return the_sum

# sum_all ends up being an example of the simplest pattern for processing
# a two-dimensional list.  All we needed were the elements in the sublists;
# we had no need to know their index, to modify them, or to include certain
# ones but not others.




# The increment_all function takes a two-dimensional list of integers, such
# as [[1, 2, 3], [4, 5, 6], [7, 8, 9]], and adds 1 to each of the integers.
# The change is made to the list passed in as a parameter, as opposed to
# creating and returning a new list.  So, for example:
#
#     >>> a = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
#     >>> increment_all(a)
#     >>> a
#     [[2, 3, 4], [5, 6, 7], [8, 9, 10]]
#
# Since the list is being modified in place, this function has no return
# value.

def increment_all(x: [[int]]) -> None:
    # In this example, we're going to need to modify the list.  We won't
    # be able to do that by simply visiting each value in the sublists;
    # we'll need to assign new values back into the list, which means
    # that we'll need to know the indices.
    #
    # The only other trick is to be sure we handle the fact that the
    # list might not be a "square" (i.e., the sublists may not have the
    # same number of elements as the outer list does), and it might not
    # even be a "rectangle" (i.e., different sublists might have different
    # numbers of elements), so we'll have to separately check the length
    # of each sublist in our inner loop.

    for i in range(len(x)):
        for j in range(len(x[i])):
            x[i][j] += 1

# The way to understand how this function works is to figure out what
# the values of i and j will be as you work through the loops.  Assuming
# a 3x3 list:
#
#     i = 0, j = 0
#     i = 0, j = 1
#     i = 0, j = 2
#     i = 1, j = 0
#     i = 1, j = 1
#     i = 1, j = 2
#     i = 2, j = 0
#     i = 2, j = 1
#     i = 2, j = 2
#
# For each of those combinations (in that order), x[i][j] will be incremented.
# That covers every element in the two-dimensional list.
#
# Work out on your own that this also handles the following inputs correctly,
# by writing the sequence of i/j combinations as I did above:
#
#     [[1, 2], [3, 4], [5, 6]]
#     [[1, 2, 3], [4, 5, 6]]
#     [[1, 2], [3, 4, 5, 6], [7], [8, 9, 10]]




# Finally, we wrote a function increment_diagonal, which took a two-dimensional
# list of integers and incremented all of the elements on the "diagonal" of
# the two-dimensional list, while leaving the others untouched.  By "diagonal",
# I mean the first element of the first sublist, the second element of the
# second sublist, and so on.  Writing the list in a particular way makes the
# "diagonalness" clearer:
#
#     [[1, 2, 3],
#      [4, 5, 6],
#      [7, 8, 9]]
#
# In this case, we want to increment 1 (the first element of the first sublist),
# 5 (the second element of the second sublist), and 9 (the third element of
# the third sublist).
#
# Where this function gets a little bit tricky is that the list may not be
# "square" and it may not be "rectangular".  For example, given this input:
#
#     [[1, 2], [3, 4, 5], [6], [7, 8, 9, 10]]
#
# we would want to increment:
#
# * 1 (the first element of the first sublist)
# * 4 (the second element of the second sublist)
# * 10 (the fourth element of the fourth sublist)
#
# but to do nothing with the third element of the third sublist, since it
# doesn't exist (the third sublist has only one element).

def increment_diagonal(x: [[int]]) -> None:
    # We need only one loop, as opposed to two, because the sequence of
    # indices we want is: x[0][0], x[1][1], x[2][2], etc.  The index in the
    # two dimensions never vary independently in this problem.
    #
    # The "if" statement is there to be sure that the i-th sublist has
    # enough elements in it.

    for i in range(len(x)):
        if i < len(x[i]):
            x[i][i] += 1

# Work through a couple of interesting examples, by writing out the sequence
# of i values (and whether the "if" statement is True or False in each case),
# to be sure you understand why this solves the problem correctly.
```