# Empirical-analysis

## Understanding Sorting and NLogN Algorithms

We previous discussed that the fastest algorithm for sorting a list is in the complexity class O(N Log N). In this section, without using this knowledge, we will time the sorting function and infer its complexity class.

Here are Python statements that generate a list of a million integers, shuffle them into a random order, and then sort them.

```Python
alist = [i for i in range(1_000_000)] #Python >= 3.6 allows _ to clarify numbers
random.shuffle(alist)
alist.sort()
```

There is a time module in Python that supplies access to various system clocks and conversions among various time formats. I have written a Stopwatch class (in the stopwatch.py module, which is part of courselib) that makes clocks easier to use for timing code.

## Objects, Memory, and Garbage (collection)

When we construct an object in Python, we allocate part of the computer's memory to store the object's attributes/state. "Garbage" is objects constructed by Python, which can no longer be referred to.

Garbage collection is a way for the computer to find/reclaim memory that is garbage. Typically Python allocates memory for objects until it finds it has no more memory to allocate.

Better terms would be recyclables (not garbage) and recycling (not garbage collection), because memory is never thrown away, but is continually recycled when it can be reused.

## Performance

We would like to develop a Performance tool that minimizes what we have to do to time the code: a tool that also gives us interesting information about multiple timings.

```Python
alist = [i for i in range(100_000)]
p = Performance(lambda:alist.sort(), lambda:random.shuffle(alist),100,'Sorting')
p.evaluate()
p.analyze()
```

It first statement creates a list of 100,000 numbers. Then it constructs a Performance object with 4 arguments

1) A parameterless lambda of the code to execute and time
2) A parameterless lambda of the setup code to execute (but not time) before the lambda in part (1) is called
3) The number of times to measure the code's execution: how many times to do step 2 followed by timing step 1
4) A short title (printed by the analyze method, which prints the analysis)

Calling `p.evaluate()` does all the timings and collects the information. Calling `p.analyze()` prints the following result

```
Sorting
Analysis of 100 timings
avg = 0.041   min = 0.040  max = 0.043  span = 5.9%

   Time Ranges    
4.04e-02<>4.06e-02[ 58.4%]|**************************************************
4.06e-02<>4.08e-02[ 20.8%]|*****************A
4.08e-02<>4.11e-02[  6.9%]|*****
4.11e-02<>4.13e-02[  5.0%]|****
4.13e-02<>4.16e-02[  5.0%]|****
4.16e-02<>4.18e-02[  0.0%]|
4.18e-02<>4.20e-02[  1.0%]|
4.20e-02<>4.23e-02[  1.0%]|
4.23e-02<>4.25e-02[  0.0%]|
4.25e-02<>4.28e-02[  1.0%]|
4.28e-02<>4.30e-02[  1.0%]|
```

Using this tool, the doubling expirament can be performed easily

```Python
from goody import irange
import random
from performance import Performance

for i in irange(0,9)  :
    size = 100_000 * 2**i
    alist = [i for i in range(size)]
    p = Performance(lambda : alist.sort(), lambda : random.shuffle(alist),10,'\n\nSorting '+str(size)+' values')
    p.evaluate()
    p.analyze()
```

Sample results

```
Sorting 100000 values
Analysis of 10 timings
avg = 0.01542   min = 0.01505  max = 0.01651  span = 9.5%

   Time Ranges    
1.50e-02<>1.52e-02[ 40.0%]|**************************************************
1.52e-02<>1.53e-02[ 10.0%]|************
1.53e-02<>1.55e-02[ 30.0%]|*************************************A
1.55e-02<>1.56e-02[  0.0%]|
1.56e-02<>1.58e-02[ 10.0%]|************
1.58e-02<>1.59e-02[  0.0%]|
1.59e-02<>1.61e-02[  0.0%]|
1.61e-02<>1.62e-02[  0.0%]|
1.62e-02<>1.64e-02[  0.0%]|
1.64e-02<>1.65e-02[  0.0%]|
1.65e-02<>1.67e-02[ 10.0%]|************


Sorting 200000 values
Analysis of 10 timings
avg = 0.03662   min = 0.03462  max = 0.04495  span = 28.2%

   Time Ranges    
3.46e-02<>3.57e-02[ 60.0%]|**************************************************
3.57e-02<>3.67e-02[ 20.0%]|****************A
3.67e-02<>3.77e-02[  0.0%]|
3.77e-02<>3.88e-02[ 10.0%]|********
3.88e-02<>3.98e-02[  0.0%]|
3.98e-02<>4.08e-02[  0.0%]|
4.08e-02<>4.19e-02[  0.0%]|
4.19e-02<>4.29e-02[  0.0%]|
4.29e-02<>4.39e-02[  0.0%]|
4.39e-02<>4.50e-02[  0.0%]|
4.50e-02<>4.60e-02[ 10.0%]|********


Sorting 400000 values
Analysis of 10 timings
avg = 0.09267   min = 0.08984  max = 0.09464  span = 5.2%

   Time Ranges    
8.98e-02<>9.03e-02[ 10.0%]|****************
9.03e-02<>9.08e-02[  0.0%]|
9.08e-02<>9.13e-02[ 10.0%]|****************
9.13e-02<>9.18e-02[  0.0%]|
9.18e-02<>9.22e-02[  0.0%]|
9.22e-02<>9.27e-02[ 30.0%]|**************************************************A
9.27e-02<>9.32e-02[ 10.0%]|****************
9.32e-02<>9.37e-02[ 10.0%]|****************
9.37e-02<>9.42e-02[ 20.0%]|*********************************
9.42e-02<>9.46e-02[  0.0%]|
9.46e-02<>9.51e-02[ 10.0%]|****************


Sorting 800000 values
Analysis of 10 timings
avg = 0.21788   min = 0.21384  max = 0.22209  span = 3.8%

   Time Ranges    
2.14e-01<>2.15e-01[ 40.0%]|**************************************************
2.15e-01<>2.15e-01[  0.0%]|
2.15e-01<>2.16e-01[  0.0%]|
2.16e-01<>2.17e-01[  0.0%]|
2.17e-01<>2.18e-01[ 10.0%]|************A
2.18e-01<>2.19e-01[  0.0%]|
2.19e-01<>2.20e-01[ 10.0%]|************
2.20e-01<>2.20e-01[ 10.0%]|************
2.20e-01<>2.21e-01[ 10.0%]|************
2.21e-01<>2.22e-01[ 10.0%]|************
2.22e-01<>2.23e-01[ 10.0%]|************


Sorting 1600000 values
Analysis of 10 timings
avg = 0.48776   min = 0.48294  max = 0.49364  span = 2.2%

   Time Ranges    
4.83e-01<>4.84e-01[ 10.0%]|*************************
4.84e-01<>4.85e-01[  0.0%]|
4.85e-01<>4.86e-01[ 20.0%]|**************************************************
4.86e-01<>4.87e-01[ 20.0%]|**************************************************
4.87e-01<>4.88e-01[ 10.0%]|*************************A
4.88e-01<>4.89e-01[ 10.0%]|*************************
4.89e-01<>4.90e-01[ 10.0%]|*************************
4.90e-01<>4.91e-01[ 10.0%]|*************************
4.91e-01<>4.93e-01[  0.0%]|
4.93e-01<>4.94e-01[  0.0%]|
4.94e-01<>4.95e-01[ 10.0%]|*************************


Sorting 3200000 values
Analysis of 10 timings
avg = 1.08046   min = 1.07263  max = 1.09409  span = 2.0%

   Time Ranges    
1.07e+00<>1.07e+00[ 10.0%]|****************
1.07e+00<>1.08e+00[ 20.0%]|*********************************
1.08e+00<>1.08e+00[ 30.0%]|**************************************************
1.08e+00<>1.08e+00[ 10.0%]|****************A
1.08e+00<>1.08e+00[ 10.0%]|****************
1.08e+00<>1.09e+00[  0.0%]|
1.09e+00<>1.09e+00[  0.0%]|
1.09e+00<>1.09e+00[  0.0%]|
1.09e+00<>1.09e+00[ 10.0%]|****************
1.09e+00<>1.09e+00[  0.0%]|
1.09e+00<>1.10e+00[ 10.0%]|****************


Sorting 6400000 values
Analysis of 10 timings
avg = 2.38002   min = 2.35988  max = 2.41731  span = 2.4%

   Time Ranges    
2.36e+00<>2.37e+00[ 20.0%]|**************************************************
2.37e+00<>2.37e+00[ 20.0%]|**************************************************
2.37e+00<>2.38e+00[  0.0%]|
2.38e+00<>2.38e+00[ 20.0%]|**************************************************A
2.38e+00<>2.39e+00[ 20.0%]|**************************************************
2.39e+00<>2.39e+00[  0.0%]|
2.39e+00<>2.40e+00[ 10.0%]|*************************
2.40e+00<>2.41e+00[  0.0%]|
2.41e+00<>2.41e+00[  0.0%]|
2.41e+00<>2.42e+00[  0.0%]|
2.42e+00<>2.42e+00[ 10.0%]|*************************


Sorting 12800000 values
Analysis of 10 timings
avg = 5.46846   min = 5.19780  max = 5.88381  span = 12.5%

   Time Ranges    
5.20e+00<>5.27e+00[ 20.0%]|*********************************
5.27e+00<>5.34e+00[  0.0%]|
5.34e+00<>5.40e+00[ 30.0%]|**************************************************
5.40e+00<>5.47e+00[ 10.0%]|****************A
5.47e+00<>5.54e+00[ 10.0%]|****************
5.54e+00<>5.61e+00[ 10.0%]|****************
5.61e+00<>5.68e+00[  0.0%]|
5.68e+00<>5.75e+00[  0.0%]|
5.75e+00<>5.82e+00[  0.0%]|
5.82e+00<>5.88e+00[ 10.0%]|****************
5.88e+00<>5.95e+00[ 10.0%]|****************


Sorting 25600000 values
Analysis of 10 timings
avg = 12.00993   min = 11.52789  max = 12.52565  span = 8.3%

   Time Ranges    
1.15e+01<>1.16e+01[ 10.0%]|****************
1.16e+01<>1.17e+01[  0.0%]|
1.17e+01<>1.18e+01[ 10.0%]|****************
1.18e+01<>1.19e+01[ 30.0%]|**************************************************
1.19e+01<>1.20e+01[ 10.0%]|****************A
1.20e+01<>1.21e+01[ 10.0%]|****************
1.21e+01<>1.22e+01[ 10.0%]|****************
1.22e+01<>1.23e+01[  0.0%]|
1.23e+01<>1.24e+01[  0.0%]|
1.24e+01<>1.25e+01[ 10.0%]|****************
1.25e+01<>1.26e+01[ 10.0%]|****************


Sorting 51200000 values
Analysis of 10 timings
avg = 26.22217   min = 25.98514  max = 26.48482  span = 1.9%

   Time Ranges    
2.60e+01<>2.60e+01[ 40.0%]|**************************************************
2.60e+01<>2.61e+01[ 10.0%]|************
2.61e+01<>2.61e+01[  0.0%]|
2.61e+01<>2.62e+01[  0.0%]|
2.62e+01<>2.62e+01[  0.0%]|A
2.62e+01<>2.63e+01[ 10.0%]|************
2.63e+01<>2.63e+01[  0.0%]|
2.63e+01<>2.64e+01[  0.0%]|
2.64e+01<>2.64e+01[  0.0%]|
2.64e+01<>2.65e+01[ 30.0%]|*************************************
2.65e+01<>2.65e+01[ 10.0%]|************
```

Result summary

```
        N  |   Time | Ratio | Predicted | %Error
-----------+--------+-------+-----------+--------
   100,000 |  0.015 |       |   0.025	|    64
   200,000 |  0.037 |  2.5  |	0.052	|    41
   400,000 |  0.093 |  2.5  |	0.110	|    18
   800,000 |  0.218 |  2.3  |	0.232	|     6
 1,600,000 |  0.488 |  2.2  |	0.488	|     0  (predictions based on this run)
 3,200,000 |  1.080 |  2.3  |	1.023	|     5
 6,400,000 |  2.380 |  2.2  |	2.141	|    10 
12,800,000 |  5.468 |  2.3  |	4.472   |    18
25,600,000 | 12.010 |  2.2  |   9.323   |    22
51,200,000 | 26.222 |  2.2  |  19.405   |    26
```

## Heights of Random Binary Search Trees: A Dynamic Analysis

We know that the maximum/worst-case height for a binary search tree with size N is N-1; the minimum/best case is a height of about (Log2 N)-1

Here is the code to prompt the user for the experiment and compute a histogram
of all the different tree heights.

```Python
import prompt,random,math
from goody import irange
from collections import defaultdict

experiments = prompt.for_int('Enter # of experiments to perform')
size        = prompt.for_int('Enter size of tree for each experiment')

hist  = defaultdict(int)
alist = [i for i in range(size)]

for exp in range(experiments):
    if exp % (experiments//100) == 0:
        print('Progress: {p:d}%'.format(p =int(exp/(experiments//100))))
    random.shuffle(alist)
    hist[ height(add_all(None,alist)) ] += 1

print_histogram('Binary Search Trees of size '+str(size),hist)
print('\nminimum possible height =',math.ceil(math.log2(size)-1),'  maximum possible height =',size-1)
```

```
Binary Search Trees of size 1000
Analysis of 10,000 experiments

avg = 21.0  min = 16  max = 31

  16[  0.0%]|
  17[  1.0%]|**
  18[  5.4%]|************
  19[ 14.3%]|*********************************
  20[ 21.2%]|*************************************************
  21[ 21.5%]|**************************************************A
  22[ 16.1%]|*************************************
  23[  9.8%]|**********************
  24[  5.7%]|*************
  25[  2.9%]|******
  26[  1.3%]|**
  27[  0.5%]|*
  28[  0.1%]|
  29[  0.1%]|
  30[  0.0%]|
  31[  0.0%]|

minimum possible height = 9   maximum possible height = 999
```

If you know a lot about math and probability, you compute the height of a random binary search tree, and it will closely agree with this empirical result.

## Profiling Programs: Performance Summary of all Functions at the Program Level

Profilers are modules that run other modules and collect information about their execution: typically information about how many times their functions are called, and the time spent inside each function.

In a large system with thousands of functions, it is a big win to use the profiler to focus our attention on the important functions: the ones that take a significant amount of time, and therefore the ones likely to cause major decrease in the runtime if improved.

## Hashing: How Sets/Dicts are Faster than Lists for operations like `in`

Python defines a hash function that takes any object as an argument and produces a "small" integer. How this value is computed won't concern us now. But we are guaranteed

1) there is a fast way to compute it
2) within the same program, an object with unchanged state always computes the same result for hashing, so immutable objects always compute the same result for their hash function.

Each class in Python implements a `__hash__` method, which is called by the hash function in Python's builtins module.

Note that when we define our own classes, if we want them to be used in sets or as the keys in dictionaries (things that are hashed), we must define a `__hash__` method for that class (with only self as its parameter), and this method must return an `int`.

Technically, classes that contain mutator methods should NOT be hashable, but it is OK to define `__hash__` for a class of mutable objects: but if we do so, we must NEVER mutate an object while it is in a set or the key of dictionary: otherwise the object might be "lost"

Let's investigate how to use hashing and lists to implement pset (pseudo set)

```Python
class pset:
    def __init__(self,iterable=[],load_factor_threshold=1):
        self._bins = [[]]
        self._len  = 0      # cache, so don't have to recompute from bins
        self._lft  = load_factor_threshold
        for v in iterable:
            self.add(v)     # See add method below, using hashing into _bins

    def __str__(self):
        return str(self._bins)
```

Recall that `_bins` will store a list of lists (which we call a hash table). Each inner list is called a bin.

The load factor of a hash table is the number of values in the table divided by the number of bins (inner lists). Whenever this value exceeds the load factor threshold the number of bins is doubled, and all the values that were in the original bins are put back into the new bins

Now lets look at the `_bin_of` helper method, which finds the bin for the value:

```Python
def _bin_of(self,v):
    return abs(hash(v))%len(self._bins)
```

The code for add is as follows

```Python
def add(self,v):
	index = self._bin_of(v)     # hash v and compute its bin
	if v in self._bins[index]:  # No work to do: already in the pset
		return                  #  bins tend to be small so "in" is fast
	
	self._len += 1              # Cache len: now containing one more value
	self._bins[index].append(v) # Store it in the right bin

	# if exceed LoadFactorThreshold, rehash all values in a bigger table
	if self._len/len(self._bins) > self._lft:
		self._rehash()
```

But if the newly added value makes the load factor exceed the threshold all the values are rehashed in the following helper method. The `_rehash` helper method is only called from `add`

```Python
def _rehash(self):
	old = self._bins
	#double the number of bins (to drop the load_factor_threshold)
	#rehash old values: len(self._bins) has changed
	self._bins = [[] for _ in range(2*len(old))]
	self._len = 0
	for bins in old:
		for v in bins:
			self.add(v)
```

Checking whether a value v is in a pset is simple: it just checks whether v is in the bin/list that hashing says it belongs in.

```Python
def __contains__(self,v):
    return v in self._bins[self._bin_of(v)]
```

Likewise, removal goes to the bin the value v would be in IF it were in the pset

```Python
def remove (self,v):
	alist = self._bins[self._bin_of(v)]  # Share list in hash table
	if v in alist:
		alist.remove(v)
	else:
		raise KeyError(str(v))
```




