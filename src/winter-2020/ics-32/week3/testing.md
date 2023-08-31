# Testing

## On the need for testing

Stated simply, a program's requirements are what we want the program to do: what problem we want it to solve, what outputs we want it to yield given various inputs, and so on.

## How do we know that our programs meet their requirements?

- How do we know that our programs have actually met them? 
- At what point do we conclude that our program is done? 
- Thinking at a smaller scale, at what point do we conclude that a function is done?

Mathematics provides us with proof techniques that might be leveraged to demonstrate completeness and correctness in an absolute sense, the popularity of these kinds of techniques in real-world software development is fairly limited.

We can get a long way by testing our program to see how it handles various inputs and whether it generates the correct outputs for them.

We want to apply a methodology similar to the [scientific method](https://en.wikipedia.org/wiki/Scientific_method), which is to say that we want to do the following things:

1) Formulate a hypothesis about how we expect our program or function to behave for a given set of inputs.
2) Run the program or function with those inputs and observe the outputs to see if they match our expectations.
	1) If so, we know our program handles the specific scenario represented by this test case
	2) If not, figure out why and make the necessary adjustments to the code. Then, re-run the expirament



## Test cases

Suppose we wanted to write a function that takes two parameters, a list and an arbitrary "search" value, then returns a list that contains everything in the given list except the search value. A first attempt at implementing the function might look like this.

```Python
def remove_from(the_list: list, value) -> list:  
    new_list = []  
  
    for element in the_list:  
        if element != value:  
            new_list.append(element)  
  
    return new_list
```

Lets see if it is complete and correct

```Python
>>> x = [1, 3, 5, 7, 9, 11, 13]  
>>> remove_from(x, 3)  
[1, 5, 7, 9, 11, 13]  
>>> x  
[1, 3, 5, 7, 9, 11, 13]  
>>> remove_from(x, 7)  
[1, 3, 5, 9, 11, 13]  
>>> x  
[1, 3, 5, 7, 9, 11, 13]
```

What else would you want to verify about it? In general, what you'd want to do is develop a collection of test cases. A test case is a complete scenario that you want to verify.

But the key in deciding what tests you need is to think carefully.

- remove the first one, making sure that the resulting list contains the remaining four. (Boundary conditions like these tend to be where problems lie
- Put five values into a list and remove the last one. (As long as we're considering one boundary, we should consider the other
- Put one value into a list and remove it, checking that the resulting list is empty

The function above seems to handle the scenarios list just fine. But consider the following scenario

```Python
>>> x = [1, 3, 5, 7]  
>>> remove_from(x, 8)  
[1, 3, 5, 7]
```

But is that what we want? Let's suppose that we instead want the function to raise an exception in this case

```Python
def remove_from(the_list: list, value) -> list:  
    new_list = []  
    found = False  
  
    for element in the_list:  
        if element != value:  
            new_list.append(element)  
        else:  
            found = True  
  
    if not found:  
        raise ValueError('value not found in list')  
  
    return new_list
```

Now that we've updated our function, we have a little more work to do. The tests we ran previously might no longer pass; we might have made a change that invalidated one of them. So we need to run those again. Then, we'd add some additional test cases to verify the new behavior.

- Put four values into a list and then try to remove an value that isn't there. It should raise a `ValueError`.
- Trying to remove anything from an empty list should also raise a `ValueError`.

What if the value we're trying to remove is in the list more than once?

```Python
>>> x = [1, 3, 5, 7, 1, 3, 5, 7, 1, 3, 5, 7]  
>>> remove_from(x, 5)  
[1, 3, 7, 1, 3, 7, 1, 3, 7]
```

Our current implementation removes all of the values that match the search value.

Maybe that suggests that our name should be more specific. The name `remove_from` doesn't make clear whether we remove duplicate values, but the name `remove_all` would do a better job of conveying that.

```Python
def remove_all(the_list: list, value) -> list:  
    new_list = []  
    found = False  
  
    for element in the_list:  
        if element != value:  
            new_list.append(element)  
        else:  
            found = True  
  
    if not found:  
        raise ValueError('value not found in list')  
  
    return new_list
```

## Categories of test cases

As we've seen, we can categorize our test cases, which helps us to think about which ones we might still need

- *Normal cases*: A normal case exercises some ordinary circumstance using valid input.
- *Error cases*: An error case verifies that the function correctly handles invalid input or other error conditions.
- *Boundary cases*: A boundary case is what it sounds like: It's on the boundary between the normal and error cases, where the function might barely work correctly or barely fail.

It's important to realize that testing is an exercise in quality rather than quantity

Multiple tests that are based around the same idea are worth less than multiple tests that differ in some fundamental way from each other.

## The code

```Python
# remove_all.py
#
# ICS 32 Winter 2020
# Code Example
#
# An implementation of a function called remove_all, along with
# automated, assert-based tests for it.


def remove_all(the_list: list, value) -> list:
    '''
    Returns a new list containing all elements from the given list
    that are not equal to the search value.
    '''
    new_list = []
    found = False

    for element in the_list:
        if element != value:
            new_list.append(element)
        else:
            found = True

    if not found:
        raise ValueError('value not found in list')

    return new_list


# Tests for remove_all()
# -----------------------
# Normal cases (removing an element in the list)
assert remove_all([1, 3, 5, 7, 9, 11, 13], 3) == [1, 5, 7, 9, 11, 13]
assert remove_all([1, 3, 5, 7, 9, 11, 13], 7) == [1, 3, 5, 9, 11, 13]

# Boundary cases (remove the first, last, and only elements)
assert remove_all([1, 2, 3, 4, 5], 1) == [2, 3, 4, 5]
assert remove_all([1, 2, 3, 4, 5], 5) == [1, 2, 3, 4]
assert remove_all([11], 11) == []

# Error cases (removing elements not in the list)
try:
    remove_all([1, 3, 5, 7], 8)
    assert False, 'ValueError should have been raised'
except ValueError:
    pass

try:
    remove_all([], 8)
    assert False, 'ValueError should have been raised'
except ValueError:
    pass

# Removing repeated elements
assert remove_all([1, 3, 5, 7, 1, 3, 5, 7, 1, 3, 5, 7], 5) == [1, 3, 7, 1, 3, 7, 1, 3, 7]
assert remove_all([7, 7, 7, 7, 7, 7, 7], 7) == []
```