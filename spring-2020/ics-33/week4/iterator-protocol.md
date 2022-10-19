# Python Iterators

## Loops in depth

For a class to be iterable (i.e., used in any kind of for loop) it must implement the iterator protocol. which means both the `__iter__` and `__next__` methods

Python translate `for` loops into `while` loops using `__iter__` and `__next__` automatically

```Python
for index(es) in iterable:  # indexes for unpacked assignment: e.g, key,value
      block-body
  [else:
      block-else]
```

Is translated automatically to

```Python
_hidden = iter(iterable)                # ultimately calls iterable.__iter__()
try:
  while True:
	  try:
		  index(es) = next(_hidden)   # ultimately calls _hidden.__next__()
	  except StopIteration:
		  [block-else]                # omit if no block-else in for loop
	  break
	  block-body
finally:
  del _hidden                         # Remove _hidden from name_space
```

Notice, the `index(es) = next(_hidden)` statement is in its own special `try/except`, which handles the `StopIteration` exception that might be raised during its execution

In Python the `StopIteration` **ISN'T** supposed to terminate the loop normally! The loop should be terminated normally only when there are no more range values.

Raising `StopIteration` explicitly would now be controlled in the outer `try/except`, again causing the loop to terminate, but the `StopIteration` exception is still raised because the outer `try/except` has no except clause to handle that type of exception.

## `__iter__` and `__next__`

Like Python's `len` function, its `iter` and `next` functions translate into method calls of `__iter__` and `__next__` on their argument

The `iter` function MUST return an object on which `next` can be called.

Each call to the `next` function returns a value and advances the state of the iteration, until there are no more values to return; then calling `next` raises `StopIteration`

Each iteration of the loop binds the next value(s) to be iterated over to index(es) and then executes block-body. This rebinding/block-body execution continues until either:

1) next raises the StopIteration exception, which is handled by causing the loop to terminate
2) block-body itself executes a break statement, which causes the loop to terminate

## Classes implementing the iterator protocol

I would like the following iterator behavior for Countdown objects. The loop

```Python
for i in Countdown(10):
    print(str(i)+', ',end='')
print ('blastoff')
```

Should print: 

```
10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, blastoff
```

Here is one class implementing these semantics

```Python
class Countdown:
    def __init__(self,start):
        self.start = start	# self.start never changes; see self.n in __iter__
    
    # __iter__ must return an object on which __next__ can be called; it returns
    # self, which is an object of the Countdown class, which defines __next__.
    # Later we will see a problem with returning self (when the same Countdown
    # object is iterated over in a nested structure), and how to solve that
    # problem. 

    def __iter__(self):
        self.n = self.start	# n attribute is added to the namespace here 
        return self             # (not in __init__) and processed in __next__
    
    def __next__(self):
        if self.n < 0:
            raise StopIteration # can del self.n here, after exhausting iterator
        else:
            answer = self.n	# or, without the temporary, but more confusing
            self.n -= 1		#  self.n -= 1
            return answer       #  return self.n+1
```

When `__iter__` is called it (re)sets self.n (the value `__next__` will return first) to `self.start`. The `__iter__` method has a requirement that it must return an object that defines a `__next__` method.

When `__next__` is called it checks whether `self.n` has been decremented past `0`, and if is has, raises `StopIteration`; otherwise it returns the current value of `self.n`, but before doing so, it decrements `self.n` by `1`

## Sharing iterators

Consider the following code

```Python
l = [0,1,2,3,4,5,6,7,8,9]
x = iter(l)
y = iter(l)

print(next(x))
print(next(y))

print(next(x))
print(next(y))

print(next(x))
print(next(y))
```

It defines one list `l`, and constructs two iterator objects for the list: the first bound to `x`,the second bound to `y`. Each call of `next(x)` refers to one iterator object and each call of `next(y)` refers to another. 

Now, consider this code

```Python
l = [0,1,2,3,4,5,6,7,8,9]
x = iter(l)
y = x
```

Now `x` and `y` are bound to the same iterator object. Each call of next is on the same OBJECT

Finally, what about this code?

```Python
l = [0,1,2,3,4,5,6,7,8,9]
x = iter(l)
l.append(10)

try:
    while True:
       print(next(x),end=' ')
except StopIteration:
    pass
```

Does Python iterate over the values in `l` when the iterator is *CREATED*, or does it iterate over the values of `l` at the time the iterator is *USED*?

The answer is that it iterates over the values of `l` at the time the iterator is *USED*. In this case it prints the integers `0 - 10`


