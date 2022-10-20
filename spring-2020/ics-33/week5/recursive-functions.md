# Recursive functions

## Recursion vs iteration

Recursion is a programming technique in which a call to a function often results
in another call to that same function. There are two types of recursion

- Direct recursion: a call to a function appears in that function's body
- Indirect recursion: the pattern is some function calls some other function ... which ultimately calls the firstfunction.

The general form of a directly recursive function is

```Python
def Solve(Problem):
  if (Problem is minimal/not decomposable into a smaller problem: a base case)
    Solve Problem directly and return solution; i.e., without recursion
  else:
    (1) Decompose Problem into one or more SIMILAR, STRICTLY SMALLER
        subproblems: SP1, SP2, ... , SPn

    (2) Recursively call Solve (this function) on each SMALLER SUBPROBLEM
        (since they are all SIMILAR): Solve(SP1), Solve(SP2),..., Solve(SPN)

    (3) Combine the returned solutions to these smaller subproblems into a
        solution that solves the original, larger Problem (the one this
        original function call must solve)
  
    (4) Return the solution to the original Problem
```

**Formulate your base cases correctly. DO NOT use `try/except` to compensate for
omitted or incorrectly written base cases.

## Simple recursion

Examine a recursive definition for the factorial function and then a recursive function that implements it. The definition is recursive because we define how to compute a big factorial in terms of how to compute a smaller factorial.

- 0! = 1 the smallest value we can compute ! of
- N! = N*(N-1)!  for all N>0; recursive: we define ! in terms of a smaller !

By this definition, we can say

$$
5! = 5*4! = 5*4*3! = 5*4*3*2! = 5*4*3*2*1! = 5*4*3*2*1*0! = 5*4*3*2*1*1
$$

We have eliminated all occurances of ! and can just solve $5 * 4 * 3 * 2 * 1 = 120$ directly. The code the implements this solution is

```Python
def factorial (n):
  if n == 0:
    return 1
  else:
    sp1        = n-1                    # Decompose problem n into 1 subproblem
    solved_sp1 = factorial(sp1)         # Recursive call to Solve subproblem
    solved_n   = n*solved_sp1           # Solve problem n with solved subproblem
    return solved_n                     # Return solution
```

The iterative code that implements the exact same solution is

```Python
from goody import irange
def factorial (n):
    answer = 1;
    for i in irange(2,n)
        answer *= i
    return answer
```

We can mimic factorial's recursive definition for a function that raises a number to an integer power.

- A\*\*0 = 1 (yes, this is even true when A=0)
- A\*\*N = A \* A\*\*(N-1)  for all N>0

$$
A^{4} = A * A^{3} = A * A * A^{2} = A * A * A * A^{1} = A * A * A * A * A^{0} = A * A * A * A * 1
$$

The code that implements this solution looks like

```Python
def power(a,n):
    if n == 0:
        return 1
    else:
        return a*power(a,n-1)
```

The iterative equivalent would be

```Python
def power(a,n):
    answer = 1
    for i in irange(1,n):
        answer *= a
    return answer
```

We can speed up the recursive solution by solving similar problems identically. In this case, it would be the parity of the power

```Python
def power(a,n):
    if n == 0:
        return 1
    else:
       if n%2 == 1:               # n is odd  (if n remainder 2 == 1)
           return a*power(a,n-1)  
       else:                      # n is even (if n remainder 2 == 0)
           temp = power(a,n//2)   #   n is divided by 2 perfectly: no remainder
           return temp*temp
```

Recursive functions tend to be easier to prove correct than their iterative counterpart, we will see a proof for the correctness of the function above later

## Hand simulation

To hand-simulate a recursive functions use a "tower of call frames" in which each resident in an apartment executes the same code (acting as the function definition)

Each unit is called by the resident above and calls the resident underneath, when a recursive call is needed (calling back the resident above when their answer is computed).

Hand simulation is a good way to get a better understanding recursion. It is not a good way to understand a specific recursive function or debug it.

```
       Factorial Towers
       +---------------------------+
       |   n int    return value   |
       | +------+  +------------+  |
       | |      |  |            |  |
       | +------+  +------------+  |
-------+---------------------------+--------
       |   n int    return value   |
       | +------+  +------------+  |
       | |      |  |            |  |
       | +------+  +------------+  |
       +---------------------------+
       |   n int    return value   |
       | +------+  +------------+  |
       | |      |  |            |  |
       | +------+  +------------+  |
       +---------------------------+
       |   n int    return value   |
       | +------+  +------------+  |
       | |      |  |            |  |
       | +------+  +------------+  |
       +---------------------------+
       |   n int    return value   |
       | +------+  +------------+  |
       | |      |  |            |  |
       | +------+  +------------+  |
       +---------------------------+
       |   n int    return value   |
       | +------+  +------------+  |
       | |      |  |            |  |
       | +------+  +------------+  |
       +---------------------------+
```

## Proof rules for recursive functions

The following rules can by used to

- VERIFY that recursive functions are correct
- SYNTHESIZE new recursive functions

These rules mirror the rules for proofs by induction in mathematics

1) Prove that the base case (smallest) problem is processed correctly: the function **RECOGNIZES** the base case and then **RETURNS THE CORRECT RESULT** *without* a recursive call.
2) Prove that each recursive call is on a **STRICTLY SMALLER-SIZED PROBLEM**: the problem gets closer to the base case.
3) *ASSUMING* **ALL RECURSIVE CALLS SOLVE THEIR SMALLER SUBPROBLEMS CORRECTLY**, prove that the code combines these solved subproblems correctly, to solve the original Problem

For the factorial function

1) The base case is 0; and according to the recursive mathematical definition, 0! = 1. This function recognizes an argument/parameter of 0 in the if statement and returns the correct value 1 as the result.
2) If n is a non-negative number that is not 0 (not the base case), then this function makes one recursive call: n-1 is a smaller-sized problem, closer to 0 (the base case) than n is. It is closer by 1: the distance between n-1 and 0 is 1 less than the distance between n and 0.
3) *ASSUMING* `factorial(n-1)` **COMPUTES** $(n-1)!$ **CORRECTLY**, this function returns `n*factorial(n-1)`, which is $n*(n-1)!$ by our assumption, which according to the mathematical definition is the correct answer for $n!$, the parameter to the function call.

For the fast power function

1) The base case is 0; and according to the recursive mathematical definition, $a^0 = 1$. This function recognizes an argument of 0 if the if statement and returns the correct value 1 for it.
2) If n is a non-negative number that is not 0 (not the base case), then if n is odd, `n-1` is a smaller-sized problem: closer to 0 (the base case) than n is; if n is even (it must be >= 2), `n//2` is also a smaller-sized problem: closer to 0 (the base case) than n is (2//2 is 1, 4//2 is 2, 6//2 is 3, etc). For large `n`, `n//2` is much closer to the base case than `n-1`, which is what gives this method its speed.
3) *ASSUMING* `power(a,n-1)` **COMPUTES** `a**(n-1)` **CORRECTLY AND** `power(a,n//2)` **COMPUTES** `a**(n//2)` **CORRECTLY.** We know that any `n` must be either odd or even: if n is odd, this function returns `a*power(n-1)`, which is $a*a^{(n-1)}$, so it returns (by simplifying) $a^n$, which is the correct answer for the parameters to this function; likewise, if `n` is even, this function returns the value `square( power(a,n//2) )`, which is `square(a**(n//2))`, which returns (by simplifying) $a^n$, which is the correct answer for the parameters to this function. For all even numbers `n`, `n//2` is half that value, with no truncation: for example, for n the even number 10, `square (a**(10//2))` = `square (a**5) =(a**5)**2 = a**10`

## Synthesizing recursive string methods

We can define strings recursively:

- `''` is the smallest string (empty string; string whose len == 0)
- a character concatenated to the front of any string is a (bigger) string

```Python
def reverse(s):
    if s == '':		# or len(s) == 0
        return ''
    else
        return reverse(s[1:]) + s[0]
```

1) the reverse of the smallest string (empty) is computed/returned correctly
2) the recursive call is on a string argument smaller than s (all the characters from index 1 to the end, skipping the character atindex 0, and therefore a string with one fewer characters)
3) ASSUMING THE RECURSIVE CALL RETURNS THE CORRECT ANSWER FOR THE SMALLER STRING, then by concatenating the first character after the end of the solution to the smaller problem, we have correctly reversed the entire string (solving the problem for the original parameter).

```Python
def to_str(n):
    if 0 <= n <= 9:				# 1 digit (no 0 digit numbers)
        return '0123456789'[n]			# 0<=n<=9, so no index error
    else:
        return to_str(n//10) + to_str(n%10)
```

1) the to_str of the smallest ints (1 digit) are computed/returned correctly
2) the two recursive calls are on int arguments that are smaller than n by at least one digit (in fact the second call is always exactly 1 digit).
3) ASSUMING THE RECURSIVE CALLS WORK CORRECTLY FOR THE SMALLER ints, then by concatenating the recursive calls on these two numbers together, we have correctly found the string representation of n (solving the original problem)

## Recursive list processing

We can define lists recursively:

- `[]` is a list
- a value concatenated to the front of a list is a (bigger) list

```Python
def len(l):
    if l == []:
        return 0
    else:
        return 1 + len(l[1:])

def sum(l):
    if l == []:
        return 0
    else:
        return l[0] + sum(l[1:])

def all_pred(l,p): # where p is some predicate whose domain includes l's values
    if l == []:
        return True
    else:
        return p(l[0]) and all_pred(l[1:],p)
        
```

Generally, recursive-call(base case) must be the identity for the operator used.

```Python
def sum(iterator): #iterator is an iterator, not an iterable
    try:
        x = next(iterator)
        return x + sum(iterator)
    except StopIteration:
        return 0
```

```Python
def sum(iter_x):           # it_x is iter...able or an iter...ator
    i = iter(iter_x)       # returns just itter_x if it is already an iterator
    try:
        x = next(i)
        return x + sum(i)
    except StopIteration:
        return 0
```

## Proving Properties of Recursively defined functions using Mathematical Induction

Not only can we prove that recursive functions compute the correct result, we can also prove relationships among recursive functions.

```Python
def length(l : list) -> int:
    if l == []:
        return 0
    else:
        return 1 + length(l[1:])

def append(a : list, b : list) -> list:
    if a == []:
        return b
    else:
        return [a[0]] + append(a[1:], b)
```

We can prove that `length(append(a,b)) = length(a) + length(b)`; that is, the length of appending two lists is the sum of the lengths of the lists

1) Base case: a is the smallest list possible: `a = []`

```
  length(append(a,b))      :left side of equation 
  length(append([],b))     :substitute [] for a
  length(b)                :append's a==[] is true; returns b
   
  length(a) + length(b)    :right side of equation 
  length([]) + length(a)   :substitute [] for a)
  0 + length(b)            :length's l==[] is true; returns 0
  length(b)                :0 + x = x
```

This proves for the base case that `length(append(a,b)) = length(b) = length(a) + length(b)` when `a = []`

2) Inductive case: Assuming length(append(a,b)) = length(a) + length(b) we must
   prove that `length(append([v]+a,b)) = length([v]+a)` + length(b) is true

```
  length(append([v]+a,b)) :left side of equation 
  length([v]+append(a,b)) :append's a==[] is false; return [v]+append(a,b)
  1+length(append(a,b))   :length's l==[] is false; return 1+length(append(a,b))
  1+length(a)+length(b)   :by induction hypothesis/assumption for list a

  length([v]+a)+length(b) :right side of equation
  1+length(a)+length(b)   :length's l==[] test is false; return 1 + length(a)
```

Program verification is an area in CS that has a long and interesting history (and is still an important area of research). While large programs are not often proven correct, some of their core algorithms are.





