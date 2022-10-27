# Analysis of algorithms

## Getting to Big-O Notation: Throwing away Irrelevant Details

Here is one simple Python function for computing the maximum of a list

```Python
def maximum(alist):
    answer = None if alist == [] else alist[0]
    for i in range(1,len(alist)):
        if alist[i] > answer:
            answer = alist[i]
    return answer
```

Often, the problem size is the number of values processed: e.g., the number of values in a list or lines in a file.

To solve a problem, the computer always executes an integral number of instructions. For simplicity, we will assume that all instructions take the same amount of time to execute.

So to compute the amount of time it takes to solve a problem is equivalent to computing how many instructions the computer must execute to solve it, which we can then divide by the number of instructions per second a machine executes.

It turns out that for a list of N values, we find that the computer executes $14N + 9$ instructions in the worst case for this function.

It can be argued that if we simplify this function to just $I(N) = 14N$ we have lost some information, but not much. Specifically, as $N$ gets bigger, $14N$ and $14N+9$ are relatively close

Analysis of Algorithms really should be referred to as ASYMPTOTIC Analysis of Algorithms, as it is mostly concerned with the performance of algorithms as the problem size gets very big (N -> infinity).

If the real formula I(N) is a sum of a bunch of terms, we can drop any term that doesn't grow as quickly as the most quickly growing term.

Since we are trying to come up with a "science" of algorithms, we don't want our results to depend on technology, so we are also going to drop the constant in front of the biggest term as well.

## A Quick way to compute the complexity class of an algorithm

Approximate THE NUMBER OF TIMES THE MOST FREQUENTLY EXECUTED STATEMENT IS EXECUTED, dropping all the lower (more slowly growing) terms and dropping the constant in front of the most frequently executed statement.

## Comparing Algorithms by their complexity classes

COMPLEXITY CLASSES HAVE MUCH TO SAY ABOUT BIG PROBLEM SIZES BUT  LITTLE TO SAY FOR SMALL PROBLEM SIZES.

Although all possible mathematical functions might represent complexity classes (and many strange ones do), we will mostly restrict our attention to the following complexity classes.

| Class | Algorithm Example | Doubling Signature |
| ------|-------------------|------------------- |
| O(1)	| pass argument->parameters: copying a reference | T(2N) = T(N)
| O(LogN) | binary searching of a sorted list | T(2N) = c + T(N)
| O(N)	| linear searching a list (the in operator)	| T(2N) = 2T(N)
| O(NLogN)| Fast sorting | T(2N) = cN + 2T(N)

## Computing Running Times from Complexity Classes

We can use knowledge of the complexity class of an algorithm to predict its actually running time on a computer as a function of N easily.

Given $Ta(N) \approx cN^2$, substituting 10,000 for N and 4 for Ta(N) (from timing algorithm a running on a computer, as described above) we have $Ta(10,000) = 4 \approx c 10,000^2$ (from the formula), so solving for the the technology constant, we have $c \approx 4x10^{-8}$.

By measuring the run-time of this code, we can calculate the constant "c", which involves all the technology.

If we don't have the code (or find it too complicated to analyze) we can double the input sizes a few times and see whether we can "fit the resulting times" to any of the standard signatures to estimate the complexity class of the algorithm.


