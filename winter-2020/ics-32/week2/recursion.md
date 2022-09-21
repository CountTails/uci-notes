# Recursion

## Summing the numbers in a list of integers

Given a list of integers, you could use the following function to calculate the sum of all of the integers in the list.

```Python
def sum_numbers(numlist: [int]) -> int:  
    '''Adds up the integers in a list of integers'''  
    total = 0  
  
    for num in numlist:  
        total += num  
  
    return total
```

Suppose we change the problem just slightly, so that we instead are given a list containing lists of integers

```Python
def sum_numbers(numlist: [[int]]) -> int:  
    '''Adds up the integers in a list of lists of integers'''  
    total = 0  
  
    for sublist in numlist:  
        for num in sublist:  
            total += num  
  
    return total
```

Notice that the structure of the code follows the structure of the data we're dealing with — the list is two levels deep, and the loops are nested two levels deep.

Now let's assume we want to sum the numbers in a list whose elements are either integers or lists of integers.

We can add the appropriate condition to our function to handle this case, which requires only that we know that the function `type(x)` returns the type of the expression `x`, and that we can compare types using`==` to see if they're the same

```Python
def sum_numbers(numlist: [int or [int]]) -> int:  
    '''  
    Adds up the integers in a list whose elements are either integers or  
    lists of integers  
    '''  
    total = 0  
  
    for element in numlist:  
        if type(element) == list:  
            for num in element:  
                total += num  
        else:  
            total += element  
  
    return total
```

## Unconstraining the problem

Imagine now what you might need to do to our function in order to be able to sum the numbers in a list like this one: `[[1, [2, 3], 4], [[5], 6], 7]`

Using the strategy above, supporting a third level of depth would require another level of nesting in our function.

You could indeed solve the problem this way, but it wouldn't support four levels without a fourth level of nesting in the code. And then a fifth level of nesting in the list would require a fifth level of nesting in the code.

But, no matter how much patience you have in writing a function that's more deeply nested, there is a list that is potentially deeper than that.

But what if we unconstrain the problem altogether? Consider the following definition of a data structure:

- A nested list of integers is a list in which every element is either:
	- an integer
	- a nested list of integers

This data structure is recursive; it is included in its own definition.

## The code

A function that can sum the numbers in a nested list of integers is the broadest generalization of the three functions we wrote above

```Python
# sum_recursive.py
#
# ICS 32 Winter 2020
# Code Example
#
# This module contains a function capable of summing the numbers in a
# "nested list of integers".  A nested list of integers, by our definition
# from lecture, is a list in which each element is either:
#
#    * an integer
#    * a nested list of integers
#
# The key technique in use here is called "recursion".  More precisely,
# the function is a "recursive function", which is a function that uses
# itself in its own solution; part of what nested_sum does is to call
# nested_sum again.
#
# We talked at some length in lecture about the thinking behind writing
# a function like this, centering on a concept I call the "leap of faith",
# which means this:
#
#    When you're considering making a recursive call to a function,
#    make the assumption that it will do what it's supposed to do.
#    If, under that assumption, the function works -- if you work
#    out the details on paper and, based on that assumption, the
#    entire function will do what it's supposed to do -- then, as a
#    general rule, the function works.
#
# This may seem like an overly optimistic approach, but it has rarely
# led me astray (and when it has, it's usually because I've misunderstood
# the problem).


def nested_sum(nested_list: 'nested list of integers') -> int:
    '''Adds up the integers in a nested list of integers'''

    total = 0
    
    for element in nested_list:
        if type(element) == list:
            total += nested_sum(element)
        else:
            total += element

    return total


# It's also possible to reason about a recursive function in a different
# way, by considering all of the steps.  This requires realizing that
# recursive function calls are no different than any other:
#
# * When a function is called, the calling function pauses until the
#   called function is complete.
# * When the called function is complete, the calling function picks up
#   where it left off, using the result returned from the called function.
#
# If the calling function and the called function are the same, that just
# means that there are two copies of the function running simultaneously,
# each with their own local variables and their own parameters.
#
# For example, given the input [[1, 2], 3], our function will do this:
#
# * nested_sum([[1, 2], 3]) will create a local variable "sum" and assign
#   0 to it, then will begin looping.  The first element is the list [1, 2],
#   so it will make a recursive call to nested_sum([1, 2]).
#
# * nested_sum([1, 2]) will create a local variable "sum" (separate from the
#   one in the caller) and assign 0 to it, then will begin looping.  The first
#   element in the list is 1, which is an integer, so it's added to sum.
#   Ditto the second element.  sum, in this iteration, has the value 3 after
#   the "for" loop completes.  3 is returned.
#
# * nested_sum([[1, 2], 3]) picks up where it left off, by adding the result
#   of the recursive call (3) to its copy of sum (0), so its copy of sum now
#   has the value 3.  Continuing in its loop, the next element is 3, which is
#   added to the sum (3) giving 6.  There are no more elements in the list,
#   so the final result is 6.
#
# This kind of reasoning can be helpful in understanding how a recursive
# function works -- so you can read it more easily -- but I find the "leap
# of faith" approach to be a lot more useful for writing a recursive function.



assert nested_sum([3, 6, 4]) == 13
assert nested_sum([[[1, 2], 3], 4]) == 10
assert nested_sum([[2, 7], [3, 8], [4, 9]]) == 33
assert nested_sum([1, [2, [3, [4, [5], 6], 7], 8], 9]) == 45
assert nested_sum([]) == 0
```

## The moral

Some programming languages encourage recursion as a primary form of repetition. Python is not one of them, however; in Python, your first inclination should be to use loops to solve problems of repetition.

Not all problems lead to a well-formulated solution this way. Particularly when you find yourself needing to iterate through recursive data structures.

This is of particular interest in the context of Project #1 is because a file system is a recursive data structure. Directories contain collections of files and other directories, which, in turn, contain collections of files and other directories, and so on.

You don't want to take this new knowledge too far, using recursion in situations for which it's not an appropriate solution in Python

Your inclination should be to use loops whenever you can, and recursion when you must.