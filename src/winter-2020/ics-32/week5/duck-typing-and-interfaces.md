# Duck typing and interfaces

## Background

Python is happy to allow us to store any kind of value in any variable we'd like.

```Python
x = 3  
y = 'Boo'  
z = [1, 2, 3]
```

We can potentially change the type of a variable any time we'd like by simply assigning a value of a different type into it.

```Python
x = (1, 2)      # x is now a tuple  
y = 9.5         # y is now a float  
z = 'Alex'      # z is now a str
```

Variables themselves don't have types at all in Python; only the values of those variables have types. If we use a variable after assigning it a value, what we're allowed to do with it

```Python
w = 'Alex'  
print(len(w))   # prints 4  
q = 57  
print(len(q))   # raises an exception, because ints don't have a length
```

In general, Python uses a technique that is sometimes called duck typing when deciding what we can and can't do with the values stored in variables.

If you try to call a method on an object, it's legal so long as that object's class has such a method; it's illegal if it doesn't.

```Python
s = 'Hello'  
print(s.upper())   # no problem, because the str class has an upper() method  
  
class XYZ:  
    def upper(self):  
        return 'Argh!'  
  
x = XYZ()  
print(x.upper())   # also legal, prints Argh!  
  
i = 19  
print(i.upper())   # not legal, because ints have no upper() method
```

Based on the type of the object, the "right thing" will happen automatically.

The same method or the same operator will behave in wildly different ways depending on the type of objects it's called on, but the behavior will always be the "right" behavior for that type, without you having to do anything special to ensure that.

## How duck typing affects the way we write functions

We can write functions and methods that are more flexible than we could before.

```Python
def foo(x, y):  
    return x.bar(y) * 2
```

What must be true about the types of `x` and `y` in order to successfully evaluate a call to `foo(x, y)`?

- `x` must be an object of some class that has a method called `bar` that takes one parameter (in addition to `self`).
- `y` must have a type that is compatible as an argument to `bar`.
- The type of value returned from the `bar` method must be something that can be multiplied by 2

It is legal to call a method on an object and pass it parameters if and only if the object's class has such a method that can accept those parameters.

We can write multiple classes and intentionally give them the same **interface** and then use objects of these classes interchangeably.

## Using duck typing to our advantage

Suppose we wanted to write a function makelist, which is intended to do the same thing that Python's built-in list function does.

```Python
>>> list([1, 2, 3])          # you can pass it a list  
[1, 2, 3]  
>>> list((1, 2, 3))          # you can also pass it a tuple  
[1, 2, 3]  
>>> list({'a', 'b', 'c'})    # or even a set  
['b', 'a', 'c']              # (remember that sets are not ordered)
>>> list(range(5))  
[0, 1, 2, 3, 4]
```

Seeing all of this, you might conclude that makelist would be a difficult function to write, since it needs to take such a wide variety of types of input.

However, all the types share an interface, namely that they are meant to be iterated over. (Can be used in a `for` loop)

```Python
>>> for x in [1, 2, 3]:  
        print(x)  
  
1  
2  
3  
>>> for x in (1, 2, 3):  
        print(x)  
  
1  
2  
3  
>>> for x in range(5):  
        print(x)  
  
0  
1  
2  
3  
4
```

The reason this works is that iteration is always done using the same interface. What makes an object iterable is that it has particular methods with particular names, and these are the methods used for iteration.

Not all object have them, which is why some cannot be iterated over

```Python
>>> for x in 3:  
        print(x)  
  
Traceback (most recent call last):  
  File "<pyshell#28>", line 1, in <module>  
    for x in 3:  
TypeError: 'int' object is not iterable
```

Knowing all of this, we can rely on the same approach to write our makelist function. If something is iterable, we can use it in a for loop.

```Python
def makelist(items):  
    the_list = []  
  
    for x in items:  
        the_list.append(x)  
  
    return the_list
```

```Python
>>> makelist([1, 2, 3])  
[1, 2, 3]  
>>> makelist((1, 2, 3))  
[1, 2, 3]  
>>> makelist({'a', 'b', 'c'})  
['b', 'a', 'c']  
>>> makelist(range(5))  
[0, 1, 2, 3, 4]
```

The key is that our function says `for x in items`, and how Python handles the iteration is by asking to iterate `items`

Depending on the type of `items`, the iteration will be done in the appropriate way automatically, so our function can be blissfully unaware of what types of input it can handle.

## The code

```Python
# duck_typing.py
#
# ICS 32 Winter 2020
# Code Example
#
# This module makes use of Python's "duck typing" feature by implementing
# six classes that all have the same interface, meaning that objects of
# these classes can be used interchangeably.  Each class represents some
# kind of operation that can be performed on a single input; asking an
# object of one of these classes to "calculate" is how you ask it to
# perform its operation.
#
# Collectively, we'll say that objects of these classes are "calcs"
# (i.e., you can ask them to calculate something, by giving them a value
# and expecting some value back).  In general, a "calc" (in our definition
# here) is an object that has a method "calculate" that takes a single
# parameter (in addition to "self") and returns the result of some arbitrary
# calculation on that input.
#
# It should be noted that all calcs don't necessarily take the same kind
# of input (e.g., a calc that squares a number works for numbers but not
# for lists, while a calc that finds the length of its input works for lists
# but not for numbers).  Ultimately, a calc will fail if given input
# incompatible with its operation, though this is no different than any
# other function in Python.

import math



class ZeroCalc:
    def calculate(self, n):
        return 0


class SquareCalc:
    def calculate(self, n):
        return n * n


class CubeCalc:
    def calculate(self, n):
        return n * n * n


class LengthCalc:
    def calculate(self, n):
        return len(n)


class SquareRootCalc:
    def calculate(self, n):
        return math.sqrt(n)


class MultiplyByCalc:
    def __init__(self, multiplier):
        self._multiplier = multiplier

    def calculate(self, n):
        return n * self._multiplier


# As an example of a function that uses these classes, consider this
# one called run_calcs, which takes a list of calcs and a starting
# value, and applies the calcs in sequence (i.e., the first calc is run
# against the starting value, the second is run against the result of
# the first, the third is run against the result of the second, and
# so on).  The result of the last calc in the list is the overall
# result.
#
# Note that I haven't written a type annotation for the starting_value
# parameter, and that I haven't specified a return type.  That's because
# what makes starting_value legal depends on the calcs, and the type of
# result also depends on the calcs; different kinds of calcs operate on
# different kinds of values and give back different kinds of results.


def run_calcs(calcs: ['Calc'], starting_value):
    current_value = starting_value

    for calc in calcs:
        current_value = calc.calculate(current_value)

    return current_value
    

# The thing to notice about run_calcs is that it doesn't have any code
# in it that checks types.  There's nothing like this:
#
#     if type(x) == SquareCalc:
#         square the number
#     elif type(x) == MultiplyByCalc:
#         multiply the number
#     ...
#
# Why that's such a good thing is because we can add new kinds of
# calcs by simply writing new classes that implement the same
# interface (i.e., that have the appropriate calculate method),
# without ever having to touch run_calcs again, yet run_calcs will
# work automatically with the new kinds of objects.  One of the goals
# when we write ever-larger programs is isolating the effect of
# changes, so anything we can do to prevent one change from causing
# cascading changes in many other places is a big win.
#
# Try executing this module and then evaluating these expressions in
# the Python interpreter.  Before you evaluate each one, decide what
# you think its outcome should be.
#
#     run_calcs([SquareCalc(), SquareCalc()], 4)
#     run_calcs([LengthCalc(), MultiplyByCalc(2)], 'Boo')
#     run_calcs([], 80)
#     run_calcs([MultiplyByCalc(3), LengthCalc(), SquareCalc()], 'Boo')
#
# Now try writing a new class that implements the operation of your
# choice.  Re-execute this module (after writing your new class) and
# try calling run_calcs and passing it an object of your class.
# Voila!  Works fine!
#
# I should note here that this appears to be similar to the idea of
# passing functions as parameters to other functions, and, indeed, it
# is.  Where it differs, though, is that the objects we're creating
# are capable of carrying state with them, whereas functions are 
# limited to accessing the parameters that are passed to them.
# So, for example, our MultiplyByCalc class takes a parameter to its
# constructor; its __init__ method stores it in an attribute, and that
# attribute is then available at the time the calculate() method is
# called.  This is not actually as mind-bending as it sounds; since
# calculate() is a method, it accepts an additional "self" parameter,
# and the attribute "_multiplier" actually belongs to the "self"
# object.
```

