# Generators

## What are they?

Python includes a special kind of function called a generator function that when called returns a generator (a special kind of iterator: something we can call next(....) on).

Syntactically, generator functions are defined almost exactly like regular functions; the one difference is that generator functions must include one or more `yield` statements.

When we CALL a GENERATOR function, it immediately returns a generator object, without executing any of its body. To begin executing its body, we must call next(...) on the generator.

Doing so executes its body at the beginning ... and when it executes a yield statement, it returns its result (which becomes the result of calling next(...)).

Calling next(...) on the generator again restarts its code exactly where it left off in the computation: in the same state (Python automatically remembers this information), after the yield statement

```Python
from predicate import is_prime      # Could use other predicates just as easily
def primes(max = None):
    p = 2                           # 2 is the first prime; so start there
    while max == None or p <= max:  # Short-circuit evaluation is critical here!
        if is_prime(p):             #  To avoid comparing int < NoneType
            yield p
        p += 1
```

It is easy to determine what it does: it yields only prime numbers, either without limit or whose values are limited to be `<= max` if `max is not None`

To most programmers its mechanism (suspending and resuming execution) is easy/intuitive to understand and use to write generator functions.

```Python
i = primes(10) # calling this generator functions returns an generator/iterator
print(i)       # see how the generator/iterator object prints
print(next(i)) # call next(...) on the generator/iterator object
print(next(i))
print(next(i))
print(next(i))
print(next(i))
```

The script above yields the following output

```Python
<generator object primes at 0x029C5850>
2
3
5
7
Traceback (most recent call last):
File "C:\Users\Pattis\workspace\zexperiment\experiment.py", line 12, in <module>
  print(next(i))
StopIteration
```

## Generators for implementing `__iter__` & `__next__`

```Python
def __iter__(self):
	class PH_iter:
		def __init__(self,histogram):
		# make copy here, so iteration not affected by mutation
			self.histogram = list(histogram)
			self.next = 0

		def __next__(self):
			if self.next == 10:
				raise StopIteration
			answer = self.histogram[self.next]
			self.next += 1
			return answer

		def __iter__(self):
			return self

	return PH_iter(self.histogram)
```

This could be simplified alot using generator functions

```Python
def __iter__(self):     #1: Correct
	def gen(bins):
		for i in range(10):
			yield bins[i]
			
	# copy so iteration not affected by mutation (e.g., clear/tally method)
	return gen(list(self.histogram))
```

It may be tempting to simplify it further so that `__iter__` is a generator function

```Python
def __iter__(self):     #2: WRONG!
	 hist_copy = list(self.histogram)
	 for i in range(10):
		yield hist_copy[i]
```

At first, it may seem like this is a sensible implementation of `__iter__`, **BUT, THERE IS A SUBTLE DIFFERENCE** between these two code fragments.

The copy in #2 is made when `next()` is **CALLED THE FIRST TIME**. Recall that executing #2 (which is itself a generator function) suspends as soon as it is called. So the copying the list **DOES NOT** occur at the time when __iter__ is called.

Why is it easier to write generator functions that implement iterators, compared to writing `__iter__ `and `__next__` methods explicitly? Generally, an iterator must remember its state

Functions don't retain state in their local variables when they return. So instead, we must store the state of an iterator as attributes in an object, on which `__next__` is called repeatedly.

But generators **DO RETAIN THEIR STATE AFTER THEY YIELD A VALUE** (and remember what statement they are executing too). When `next(...)` is called on them, they continuing executing, starting with the statement after the yield (or the first statement in the generator, when `next(...)` is called the first time).

### Hint for writing generator functions

First think about/write a **FUNCTION** that simply *PRINTS* that same sequence of values. Then change every `PRINT` statement into a `YIELD` statement.

### Quick terminology review

| Term | Definition |
| ---- | ----------|
| Iterable | An object that can be iterated over |
| Iterator | An object on which `next(...)` can be called |
| Generator | A special kind of iterator |
| Generator function | A function including one or more `yield` statements |

## Generators as iterable decorators

Here are the classes from the previous lecture rewritten as generator functions, and dramatically simplified.

1) Repeat

```Python
def repeat(iterable):
    while True:
        for i in iterable:
            yield i
```

2) Unique

```Python
def unique(iterable):
    iterated = set()
    for i in iterable:
        if i not in iterated:
            iterated.add(i)
            yield i
```

3) Filter

```Python
def pfilter(iterable, p): #filter is built-in
    for i in iterable:
        if p(i):
            yield i
```


4) Enumerate

```Python
def enumerate(iterable, counter = 0):
    for value in iterable:
        yield (counter, value)
        counter += 1
```

## Space efficiency

Note that generators embody a small amount of code and often don't store any large data structures (unique did use extra space in a set/dict)

The builtin function `sorted` takes an iterable argument; it is not a generator function, though, because it stores all the values in the iterable into a list, sorts the list, and then returns the entire list.

```Python
def sorted (iterable):    # ignore key and reversed arguments here
	alist = list(iterable)  # create a list with all the iterable's values
	alist.sort()		  # sort that list using the sort method for lists
	return alist		  # return the sorted list
```

The builtin function `reversed` takes an argument that is a sequence (something like a list or tuple, supporting the `__len__` and `__getitem__` methods;  but not an general iterable); it is a generator function

```Python
from goody import irange
def gen_reversed(seq):
    for i in irange(len(seq)-1,-1,-1):  # Iterate backwards over all indexes
        yield seq[i]
```

