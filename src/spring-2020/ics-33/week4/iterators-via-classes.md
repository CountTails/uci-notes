# Iterators via classes

## The problem

In the last lecture, we discussed various classes that implemented the iterator protocol (by implementing the methods `__iter__` and `__next__`). Typically in these cases (for both the Countdown and prange classes) the main purpose of the class was to create an object to iterate over once.

To illustate the defect, we first define the following function, which uses a doubly-iterating comprehension to return all pairs of values produced by its single argument iterators.

```Python
def all_pair(i1,i2):
    return [(x,y) for x in i1 for y in i2]
```

The outer for loop we iterate over `i1`, and while we are doing this iteration, we iterate over `i2` in the inner for loop. The while loop translation of both for loops call `__init__` on `i1` and `i2` respectively to get started.

```Python
r = range (3)
p = prange(3)

print(all_pair(r,p))	# use range and prange
print(all_pair(p,r))	# use prange and range
print(all_pair(r,r))	# use only range,  but the same range object twice
print(all_pair(p,p))	# use only prange, but the same range object twice
```

The output is all follows

```Python
[(0, 0), (0, 1), (0, 2), (1, 0), (1, 1), (1, 2), (2, 0), (2, 1), (2, 2)]
[(0, 0), (0, 1), (0, 2), (1, 0), (1, 1), (1, 2), (2, 0), (2, 1), (2, 2)]
[(0, 0), (0, 1), (0, 2), (1, 0), (1, 1), (1, 2), (2, 0), (2, 1), (2, 2)]
[(0, 0), (0, 1), (0, 2)]
```

The problem is that when __iter__ is called on the prange argument (the same object in the outer loop and innner loop), it returns the object itself

When the inner iterator is exhausted, it cause the outer iterator to get the next value. However, since they are **SHARING** the same object, the outer iterator is also exhausted and so the loop terminates

## Fixing the problem

To address this issue, create a local class inside the `__iter__` method. That way, Python creates a new/different object with its OWN STATE, so multiple iterations on the same prange object don't interact badly with each other.

The local class need only define the following methods

- `__init__` 
- `__iter__`
- `__next__`

The class we want to iterate over should define an `__iter__` method that constructs and returns and instance of the local iterator class

## Classes the store interesting data

Examine the definition of the following class that stores and processes histograms.

```Python
class Percent_Histogram:
    def __init__(self,init_percents=[]):
        self._histogram = 10*[0]    # [0,0,0,...,0,0] length 10, all 0s
        for p in init_percents:
            self.tally(p)
         
    # Called only when 0<=p<=100: 100//10 is 10 but 100 belongs in index 9
    def _tally(self,p):
        self._histogram[p//10 if p<100 else 9] += 1
    
    def clear(self):
        for i in range(10):         # could write: self._histogram = 10*[0]
            self._histogram[i] = 0

    # tally allows any number of arguments, collected into a tuple by *args
    def tally(self,*args):
        if len(args) == 0:
            raise IndexError('Percent_Histogram.tally: no value(s) to tally')
        for p in args:
            if 0 <= p <= 100:
                self._tally(p)
            else:
                raise IndexError('Percent_Histogram.tally: '+str(p)+' outside [0,100]')
                # Another approach would be to store/remember all tally failures

    # allow indexing for bins [0-9]
    # but can mutate these values only through __init__, clear, and tally
    # no __setitem__ defined
    def __getitem__(self,bin_num):
        bin = (bin_num if bin_num >= 0 else 10+bin_num): # bin_num = -1, 10-1 = 9 (last bin)
        if 0 <= bin <= 9:
            return self._histogram[bin]
        else:
            raise IndexError('Percent_Histogram.__getitem__: '+str(bin_num)+' outside [0,9]')

    # standard __iter__: defines a class with __init__/__next__ and returns
    #   an object from that class
    def __iter__(self):

        class PH_iter:
            def __init__(self,histogram):
                self._histogram = histogram          # sharing; sees mutation
                # self._histogram = list(histogram)  # copying; doesn't see it
                self._next = 0

            def __next__(self):
                if self._next == 10:
                    raise StopIteration
                answer = self._histogram[self._next]
                self._next += 1
                return answer

            def __iter__(self):
                return self

        return PH_iter(self._histogram)
            
    # To reconstruct a call the __init__ that reproduces the correct counts in
    #   the histogram, we supply the correct number of values, but all at the
    #   start of the bin: e.g., if bin 5 has 3 items, the repr has three 50s
    def __repr__(self):
        param = []
        for i in range(10):
            param += self[i]*[i*10]
        return 'Percent_Histogram('+str(param)+')'
    
    # a 2-dimensional display; do you understand the use of .format here?
    def __str__(self):
        return '\n'.join(['[{l: >2}-{h: >3}] | {s}'.format(l=10*i,h=10*i+9 if i != 9 else 100,s=self[i]*'*') for i in range(10)])
```

When Python executes the following script

```Python
quiz1 = Percent_Histogram([50, 55, 70, 75, 85, 100])
quiz1.tally(20,30,95)
print(repr(quiz1))
for count in quiz1:
    print(count,end=' ')
print('\n',quiz1,sep='')
```

It prints the following information

```Python
Percent_Histogram([20, 30, 50, 50, 70, 70, 80, 90, 90])
0 0 1 1 0 2 0 2 1 2 
[ 0-  9] | 
[10- 19] | 
[20- 29] | *
[30- 39] | *
[40- 49] | 
[50- 59] | **
[60- 69] | 
[70- 79] | **
[80- 89] | *
[90-100] | **
```

Note that mutating the quiz1 object during each iteration would result in the new, accumulated values for the results produce by the iterator (in the last bin).

If we wanted to have the iterator produce the values in the histogram WHEN THE ITERATION STARTED, and not show any updates after that. The change is
trivial: `self._histogram = histogram` -> `self._histogram = list(histogram)`

## Iterable decorators

When a class takes as an argument an object that has methods implementing a certain protocol and returns an object that has methods that implement the same protocol, the class is called a **DECORATOR**.

If we wrote something like

```Python
for i in Repeat("abcde"):
    print(i,end='')
```

The `Repeat` decorators might look something like

```Python
class Repeat:
    def __init__(self, iterable):
        self._iterable = iterable
        
    def __iter__(self):
        class Repeat_iter:
            def __init__(self, iterable):
                self._iterable = iterable      # remember for restarting in next
                self._iterator = iter(iterable)# remember for direct use in next
            
            def __next__(self):
                try:
                    return next(self._iterator)# return next result in iterator
                except StopIteration:          # but if there is none...
                    self._iterator = iter(self._iterable) # restart iterable
                    return next(self)                     #call next to start
            def __iter__(self):
                return self

        return Repeat_iter(self._iterable)
```

Here is a second kind of decorator for iterables. It returns all the values in an iterable, but never the same value twice. We call this class Unique.

```Python
class Unique:
    def __init__(self, iterable):
        self._iterable = iterable
        
    def __iter__(self):
        class Unique_iter:
            def __init__(self, iterable):
                self._iterated = set()
                self._iterator = iter(iterable)
            
            def __next__(self):
                answer = next(self._iterator)		# StopIteration raised?
                while answer in self._iterated:
                    answer = next(self._iterator)	# StopIteration raised?
                self._iterated.add(answer)
                return answer

            def __iter__(self):
                return self

        return Unique_iter(self._iterable)
```

As another example, we will write the Filter class, which is supplied with a predicate function (of one argument that returns a bool), indicating whether or not a value should be produced by the iterable or FILTERED OUT

```Python
class Filter:
    def __init__(self, iterable, predicate):
        self._iterable  = iterable
        self._predicate = predicate
        
    def __iter__(self):
        class Filter_iter:
            def __init__(self, iterable, predicate):
                self._iterator  = iter(iterable)
                self._predicate = predicate
            
            def __next__(self):
                answer = next(self._iterator)           # StopIteration raised?
                while self._predicate(answer) == False:
                     answer = next(self._iterator)      # StopIteration raised?
                return answer

            def __iter__(self):
                return self

        return Filter_iter(self._iterable, self._predicate)
```

