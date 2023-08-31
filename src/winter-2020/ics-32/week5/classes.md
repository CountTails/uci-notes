# Classes

## Background

`namedtuples` are one way in Python to collect heterogeneous data into a single object. 

Each piece of data is called a field and the fields are identified by their names. You can access the value of each field, but you can't change its value

`namedtuples` don't really know how to do much of anything; they're useful, but limited to the problem of bringing a few pieces of data together into the same object.

Think about the types in the Python standard library. You'll realize that they don't just *store* information, but they also *do* things with that information.

```Python
>>> s = 'Boo is happy today'  
>>> s.upper()  
'BOO IS HAPPY TODAY'  
>>> s.split(' ')  
['Boo', 'is', 'happy', 'today']
```

The above IDLE interaction is akin to the following

- Hey, s, what would you look like if all your letters were uppercase?
- Hey, s, split yourself into a list of words, by using spaces to delimit where one word ends and another begins, and give me back the resulting list.

The syntax `s.upper()` is called a **method call** on the object `s`. In the case above, `s` is the object and `upper()` is the method.

Different classes support different methods that are specific to what each type of object can reasonably do.

## Classes

a class is a blueprint for a new kind of object. They specify what the object can do through a set of methods. The example below is the simplest class that can be defined using the `class` construct

```Python
class Thing:
	pass
```

## Method calls

Methods aren't quite like functions; they get called on an object. There is an alternative syntax that shows this

```Python
>>> s = 'Boo is happy today'  
>>> s.split(' ')  
['Boo', 'is', 'happy', 'today']
>>> str.split(s, ' ')
['Boo', 'is', 'happy', 'today']
```

The two calls are equivalent. Python essentially translates these calls behind the scenes to the longer form. 

This is a critical detail if you want to understand how to write classes that contain their own methods.

Methods need what seems like an "extra" parameter, usually called `self`, which represents the object that the method is called on.

## Constructing an object

A class is a blueprint for a new object. There must be a way to create an object from that blueprint

In Python, that is called constructing an object, and we do it by calling a class' constructor, which we do by calling a function whose name is the name of the class:

```Python
>>> x = Thing()
```

It's also possible to require a constructor to take parameters, and we can write code that is executed when an object is initialized and uses those parameters during the initialization.

## Objects and their attributes

All objects in Python have a class, which specifies what kind of object they are. Additionally, all objects in Python have a collection of attributes, which are the information that they're storing at any given time.

Assigning a value to an attribute is as simple as any other assignment statement, except that we use the "dot" operator to qualify which object we'd like to store the attribute into.

```Python
>>> x.a1 = 3  
>>> x.a2 = 4  
>>> x.a3 = 5  
>>> x.a1 + x.a2 + x.a3  
12
```

We rarely assign to an object's attributes willy-nilly like this. Instead, we assign values into attributes only within the class, initializing them when the object is constructed, and changing them only within methods whenever they need to be changed.

This makes it easier to find and fix bugs, and makes it easier to make changes without causing a cascade of negative effects in other places.

You assign to an object's attribute by saying `object_name.attribute_name = value`. In the class itself, you would use `self`

## Writing a `Counter` class

Let's say that this is what we decide we want:

```Python
>>> c1 = Counter()  
>>> c1.count()  
1  
>>> c1.count()  
2  
>>> c1.count()  
3  
>>> c1.peek()  
3  
>>> c2 = Counter()  
>>> c2.count()  
1  
>>> c2.peek()  
1  
>>> c1.peek()  
3  
>>> c1.count()  
4  
>>> c1.reset()  
>>> c1.count()  
1  
>>> c2.count()  
2
```

We want:

- construct a `Counter` object with no parameters and initialize its count to 0
- a `count` method that increments the counter and returns the new value
- a `peek` method to return the counter without changing it
- a `reset` method that resets the counter to 0

`Counter` objects should have separate counts; attributes belong to objects, as opposed to classes.

A class is a blueprint for a kind of object, but many objects can be created from that blueprint, with each of those objects being separate from the others

```Python
class Counter:  
    def __init__(self):  
        self._count = 0  
  
    def count(self) -> int:  
        self._count += 1  
        return self._count  
  
    def peek(self) -> int:  
        return self._count  
  
    def reset(self) -> None:  
        self._count = 0
```

## Some things to notice

- Writing a method in a class is a lot like writing a function; the `def` construct is used. However, they all take a `self` parameter that represent the object the method is being called on
- The `__init__` function says "When an object is being initialized, set the `_count` attribute belonging to the object being initialized to zero."
- A single underscore in front of the name of a function in a module to specify that it is intended to be private. Nothing stops someone from assigning a new value into the `_count` attribute, but it is a hint that we intend for the attribute to be private

## The code

### counter.py

```Python
# counter.py
#
# ICS 32 Winter 2020
# Code Example
#
# This module defines a class called Counter, which is a kind of object
# called a "counter", whose goal is to count how many times its "count"
# method has been called.  Each time you call "count", it increments
# its count and returns it, so each time you call "count", you'll receive
# a value one greater than the value you received the previous time.  It
# is also possible to reset the counter and to "peek" at its count (i.e.,
# see the value without changing it).
#
# Counter objects have one private attribute, _count, which specifies
# how many times its count() method has been called.
#
# If you run this module in IDLE, you would be able to do this in the
# interpreter:
#
#     >>> c1 = Counter()
#     >>> c1.count()
#     1
#     >>> c1.count()
#     2
#     >>> c1.count()
#     3
#     >>> c1.peek()
#     3
#     >>> c2 = Counter()
#     >>> c2.count()
#     1
#     >>> c1.count()
#     4
#     >>> c1.peek()
#     4
#     >>> c1.reset()
#     >>> c1.peek()
#     0
#     >>> c1.count()
#     1
#     >>> c2.count()
#     2


class Counter:
    def __init__(self):
        '''Initializes a Counter with a count of zero'''
        self.reset()


    def count(self) -> int:
        '''Increments and returns the count'''
        self._count += 1
        return self._count


    def peek(self) -> int:
        '''Returns the count without updating it'''
        return self._count


    def reset(self) -> None:
        '''Resets the counter, so that its value is zero'''
        self._count = 0


# So why do we care about being able to do this?  In a sense, it seems like
# a Counter can't do anything that an integer can't also do.  You can
# initialize an integer to 0; you can increment it; you can look at its
# value without changing it; and you can reset it back to 0 again.  So why
# bother with writing a class?
#
# The reason isn't because Counters can do things that integers can't.
# It's actually the opposite: Integers can do a lot of things that
# Counters can't.  You can multiply an integer by 9.  You can set it
# to -5.  You can divide it by 3 and get back a float.  But none of
# those things would be desirable if we want one of our counters, the
# goal of which is to provide *only* the abilities we have here and
# nothing else.
#
# So, in this case, we've built an abstraction around a Counter not because
# it provides new behavior that integers don't have, but because it *limits*
# the behavior to only what we want.  That eliminates whole categories of
# mistakes we might make, which is a really important part of designing
# high-quality software.  You *will* make mistakes writing programs.  But
# if you go out of your way to make it harder (or even impossible) to make
# certain kinds of mistakes, your programs will certainly be better for it.
#
# Of course, this also seems unpalatable at first, because classes are new
# territory and you still may not have your mind around them.  But how long
# do you think it would take for someone who already knows how to write
# classes in Python to write this one?  Weighing that against the time saved
# not hunting for mistakes that now can't be made, that investment will
# likely pay off very nicely going forward.
```

### person.py

```Python
# person.py
#
# ICS 32 Winter 2020
# Code Example
#
# This module defines a class called Person.  In this case, Person objects
# have the following abilities:
#
# * A Person object knows its first name
# * A Person object knows its last name
# * A Person object can tell you its first name
# * A Person object can tell you its last name
# * A Person object can tell you its full name, represented as its
#   first name, followed by a space, followed by the its last name
# * When you construct a Person object, you need to specify its
#   first name and last name, which are stored in the Person object
# * A Person's name cannot change
#
# To enforce (or, at least, strongly encourage) the last requirement,
# we store the first and last name in private attributes (i.e., their
# names begin with underscores).


class Person:

    # Notice that our __init__ method has three parameters here.
    # However, the first one is "self", the parameter that indicates
    # what object the method was called on (in this case, what object
    # is being initialized).  Aside from "self", the method has two
    # additional parameters: both of these would need to be specified
    # if you wanted to construct a new Person.  So, for example, this
    # would be legal, in which case the newly-constructed Person would
    # be passed as self, 'Alex' would be passed as first_name,
    # and 'Thornton' would be passed as last_name.
    #
    #     p = Person('Alex', 'Thornton')
    #
    # but this would not be legal, because the two necessary parameters,
    # first_name and last_name, are missing:
    #
    #     p = Person()

    def __init__(self, first_name: str, last_name: str):
        '''Initializes this Person to have the given first name and
        last name'''
        self._first_name = first_name
        self._last_name = last_name


    def first_name(self) -> str:
        '''Returns the first name of this Person'''
        return self._first_name


    def last_name(self) -> str:
        '''Returns the last name of this Person'''
        return self._last_name


    def full_name(self) -> str:
        '''Returns the full name of this Person'''
        return self._first_name + ' ' + self._last_name
```
