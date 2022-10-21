# Functional programming

## What is it?

Functional programming is a style of programming that uses the simplicity and power of functions to accomplish programming tasks.

In a purely functional solution to a problem, there will be no mutation to data structures (instead of mutating one, a new one is built/returned, with the required changes: just as we have seen with strings, which are immutable)

Functional languages easily support and frequently use the passing of functions as arguments to other functions and functions being returned from other functions as their values

For the most part, functional languages achieve parity in time/space efficiency with imperative programming languages.

Functional programming languages are still not as widely used as imperative languages, but they continue to find many uses in industry, and in some industries (telecommunications) they have achieved dominance (at least with some companies within the industries).

## Map/transform, filter, Reduce/Accumulate

1) Map/transform: takes a unary function and an iterable then produces an iterable of mapped/transformed values

As a recursive function

```Python
def map_l(f,alist):
    if alist == []:
        return []
    else:
        return [f(alist[0])] + map_l(f,alist[1:])
```

As an iterative function

```Python
def map_l(f,alist):
    return [f(i) for i in alist]
```

As a generator function

```Python
def map_i(f,iterable):
    for i in iterable:
        yield f(i)
```

Using zip, `f` can be a function that can take an arbitrary number of arguments

```Python
def map(f,*iterables):
    for args in zip(*iterables):
        yield f(*args)
```

2) Filter: Takes a predicate and some iterable and produces an iterable with only the values for which the predicate holds true

As a recursive function

```Python
def filter_l(p,alist):
    if alist == []:
        return []
    else:
        return ([alist[0]] if p(alist[0]) else [])   +   filter_l(p,alist[1:])
```

As an iterative function

```Python
def filter_l(p,alist):
    return [i for i in alist if p(i)]
```

As a generator function

```Python
def filter_i(p,iterable):
    for i in iterable:
        if p(i):
            yield i
```

3) Reduce/accumulate: Takes a binary function and some iterable and produces a single value

As an iterative function

```Python
def reduce(f,iterable):
    i = iter(iterable)    # create iterator
    a = next(i)			  # get first value
    for j in i:			  # iterate over all remaining valuse in i
        a = f(a,j)	      #   using j/f combines with previous result
    return a			  # return reduced/accumulated result
```

## Structural recursion, accumulation, and tail recursion

A directly recursive function is *STRUCTURAL-RECURSIVE* if the function recurs on a substructure until we reach its base case

A directly recursive function is *TAIL-RECURSIVE* if the the result the function returns in a recursive call is exactly the value computed by the recursive call, **NOT MODIFIED IN ANY WAY**.

We can sometimes transform structurally recursive functions into tail-recursive functions by using an accumulator: an extra parameter that accumulates the answer.

```Python
def list_sum ( l : [int] ) -> int:

    def sum_tail(alist : [int], acc : int)
        if alist == []:
            return acc
        else:
            return sum_tail( alist[1:], alist[0]+acc )

    return sum_tail(l,0)
```

The `sum_tail` function returns the value accumulated in acc when its list parameter is empty; otherwise is performs structural recursion while increasing acc by the amount of the first value in the list

We can transform any tail-recursive function into an iterative one by using a while loop whose test is the opposite of the one for the base case, and whose body updates the parameter names in the same way that they would be updated by performing the recursive function call

```Python
def list_sum (l : [int]) -> int:
    al,acc = l,0	                # mirrors the initial call of sum_tail
    while al != []:
        al,acc = al[1:], al[0] + acc    # mirrors the recursive call to sum_tail
    return acc
```

**IMPORTANT**: Every programmer should know how to negate complicated expressions
with and/or operators:

DeMorgan's laws (negate each subexpression and interchange and <-> or):

- not (a and b) -> not(a) or  not(b)
- not (a  or b) -> not(a) and not(b)

## An example of generative recursion 

Suppose that a country has certain standard stamp denominations. We can represent all the denominations in a tuple.

Now, suppose that we want to write a function named `mns` (Minimum Number of Stamps) that computes the minimum number of stamps needed for any amount of postage.

You might think to compute this number by using as many of the biggest denomination stamps as you can, then as many of the next biggest denomination stamps as you can, ..., until you have put on enough stamps. However, this does not always produce the minimum solution

```Python
def mns(amount : int, denom : (int)) -> int:
    if amount == 0:
        return 0
    else:
        return 1 + min( [mns(amount-d,denom) for d in denom if amount-d >= 0] )
```

For the recursive part, we will try each denomination: reducing the amount by that denomination and computing the minimum number of stamps needed for the choice/reduced amount.

Then, we will find which denomination leads to the minimum number of stamps for the reduced amount. The minimum number of stamps needed for the original amount is 1

This solution is quite elegant, although it can take a long time to run for a large amount with many denominations in the tuple. In the next lecture, we will learn how to speed-up this computation using caching/memoization

## Map reduce, associative functions, and parallel processing

`MapReduce` is a special implementation of the map/reduce functions implemented to run in parallel on cluster, or multi-core computers.

The original map/reduce function would add numbers like

```
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 13 + 14 + 15 + 16
|   |   |   |
+-+-+   |   |
  |     |   |
  3     |   |
  |     |   |
  +--+--+   |
     |      |
     6      |
     |      |
     +------+
         |
        10
         .... note that one more operand is used at each level
```

The `MapReduce` implementation would add numbers like

```
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 13 + 14 + 15 + 16
|   |   |   |   |   |   |   |   |   |     |   |     |   |     |   | 
+-+-+   +-+-+   +-+-+   +-+-+   +-+-+     +-+-+     +-+-+     +-+-+    8 cores
  |       |       |       |       |         |         |         |
  3       7      11      15      19        23        27        31
  |       |       |       |       |         |         |         |
  +---+---+       +---+---+       +----+----+         +----+----+      4 cores 
      |               |                |                   |
     10              26               42                  58
      |               |                |                   |
      +-------+-------+                +---------+---------+           2 cores
              |                                  |
             36                                 100
              |                                  |
              +----------------+-----------------+		               1 core
                               |
                              136
```

## Combinatorial computing

- `product(*iterables)`: yields tuples with the cartesian product of the iterators
- `permutations(iterable,r=None)`:yields tuples (in sorted order) that are permutations of the values produced from iterable. If r is specified, each result is an r-tuple
- `combinations(iterable,r)`:yield r-tuples (in sorted order) that are combinations of the unique values produced the from iterable (where only the values, not their order, is important).
- `combinations_with_replacement(iterable,r)`:yield r-tuples (in sorted order) that are combinations of the values (which don't have to be unique) produced the from iterable (where only the values, not their order, is important)


