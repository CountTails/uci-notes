# Lecture 3

## More on lambda calculus

### Boolean and conditionals

- `True`: $\lambda x.\lambda y.x$
- `False`: $\lambda x.\lambda y.y$
- `If-then-else`: $\lambda a.\lambda b. \lambda c. a \, b \, c = a \, b \, c$
	- If-then-else true $b \, c$
		- $\to (\lambda x.\lambda y.x) \, b \, c \to (\lambda y.b) \, c \to b$
	- If-then-else false $b \, c$
		- $\to (\lambda x.\lambda y.y) \, b \, c \to (\lambda y.y) \, c \to c$

### Recursion

$$
(\lambda n.(if (zero? \, n)1(* n (f(sub \, 1 \, n)))))
$$
- $f$ is a free variable!

#### Without explicit recursion: the Y combinator

$$
	Y = \lambda t.(\lambda x.t(x \, x)) \, (\lambda x.t(x \, x))
$$

- $Y \, a$ is $a$ applied to itself!
- $Y \, a = a(Y \, a) = a(a(Y \, a)) = a(a(a(Y \, a))) = \dots$

#### Factorial again

$$
	Y \, F = \lambda f.\lambda n.(if (zero? \, n)\, 1 \, (* n(f((sub \, 1 \, n)))))
$$

#### Does it work?

> $F$ takes one function and one number as arguments

1) $(Y \, F) \, 2 = F(Y \, F) \, 2$
2) $= \lambda f.\lambda n.(if \, (zero? \, n) \, 1 \, (* \, n(f(sub \, 1 \, n))) ((\lambda t.(\lambda x.t \, (x \, x)) \,  (\lambda x.t \, (x \, x))(\lambda f.\lambda n.(if \, (zero? \, n) \, 1 \, (*n(f(sub \, 1 \, n))))))))$
3) $= if (zero? \, 2) \, 1 \, (*2 (Y \, F (sub \, 1 \, 2)))$
4) $= (*2 \, (Y \, F (sub \, 1\, 2)))$
5) $= (* 2 (Y \, F \, 1)$
6) $= \dots$
7) $= 2$

### Points to take home

- Model of computation completely different form the Turing Machine
	- Pure functions
	- No commands
- Church-Turing thesis: the two models are equivalent
	- What you can compute with one can be computed with the other
- Inspiration behind Lisp (late 1950s)
- Foundation of all functional programming languages

## Lambda calculus in Python

### A PL from lambda calculus

> The bare minimum for a **modern** PL is as follows:

#### Void values

- void: a value to be ignored
	- Remember: only functions of 1 argument are allowed, so void value must be one of these
- Two viable options
	- Identity function: `VOID = lambda x: x`
	- Error function: `def VOID(_): raise Exception("VOID cannot be called")`

#### Multi argument functions

- The modern way

```Python
add = lambda x, y: x +y
add(2, 3)
```

- The primitive way

```Python
add = lambda x: lambda y: x + y
add(2)(3)
```

#### Booleans and conditionals

- Simple conditional: `if <condition> <t_exp> else <f_exp`
- In $\lambda$-calculus: `IF = lambda c, t, f: c(t)(f) = lambda c: lambda t: lambda f: c(t)(f)`
- `True` and `False`
	- `True` = `lambda t, f: t = lambda t: lambda f: t`
	- `False` = `lambda t, f: f = lambda t: lambda f: f`

#### Numbers

- Natural numbers as iterated application: `lambda f, x: f(f(f(x)))`
- What about zero?
	- Given a function of 1 argument, return the identity function (refuse to apply the given function)
	- `ZERO = lambda f: lambda x: x`
- The rest of them

```Python
ONE   = lambda f: lambda x: f(x)
TWO   = lambda f: lambda x: f(f(x))
THREE = lambda f: lambda x: f(f(f(x)))
```

- Some helpers

```Python
def numeral(n):
	"""Python number to a church numeral"""
	return lambda f: lambda x: x if n==0 else f(numeral(n-1)(f)(x))

"""Church numeral to a python number"""
npy = lambda c: c(lambda x: x + 1)(0)
```

#### Arithmetic

- The successor function
- Given a church numeral, $n$, $n+1$ should apply $f$ one more time

```Python
SUCC = lambda n: lambda f: lambda x: f(n(f)(x))
```

- Addition: given two church numerals, $n$ and $m$, apply a function $n$ times, then apply it $m$ times

```Python
ADD = lambda n: lambda m: lambda f: lambda x: n(f)(m(f)(x))
```

- Multiplication: given two church numerals, $n$ and $m$, apply $n$ exactly $m$ times

```Python
MUL = lambda n: lambda m: lambda f: lambda x: m(n(f))(x)
```

#### Pairs

- Given $a$ and $b$, we want to create $(a, \, b)$, a pair

```Python
PAIR = lambda a: lambda b: lambda f: f(a)(b)

LEFT  = lambda p: p(lambda a: lambda b: a)
RIGHT = lambda p: p(lambda a: lambda b: b) 
```

#### Lists

- The empty list

```Python
NIL = lambda onnil: lambda onlist: onnil(VOID)
```

- Given a head and a tail, we want to construct a list from their concatenation

```Python
CONS = (lambda hd: lambda tl: lambda onnil: lambda onlist: onlist(hd)(tl))
```

#### Recursive functions

##### Combinators

- Functions that combine functions in interesting ways
- The call can be made later, and multiple times

##### Non-termination: U combinator

- Applies its argument to its arguments

```Python
U = lambda f: f(f)
```

##### Recursion via the U combinator

```Python
#Example
fact = lambda n: 1 if n <= 0 else n*fact(n-1)

#Try passing fact to itself
fact = (lambda n: 1 if n <= 0 else n*fact(n-1))(lambda n: 1 if n <= 0 else n*fact(n-1))
# doesn't work becuase n is not a function

# We will need an extra paramater
fact = ((lambda f: lambda n: 1 if n <= 0 else n*fact(n-1)) (lambda f: lambda n: 1 if n <= 0 else n*fact(n-1)))
# Works, but still requires an explicit call to fact

# U combinator to the rescue
fact = ((lambda f: lambda n: 1 if n <= 0 else n*U(f)(n-1)) (lambda f: lambda n: 1 if n <= 0 else n*U(f)(n-1)))

# Clean version
fact=U(lambda f: lambda n: 1 if n <= 0 else n*(U(f))(n-1))
```

##### Recursion via the Y combinator

- A bit cumbersome to call `U(f)`
- Another idea: find "fixed point" of the function
	- x such that `x = f(x)`
	- g such that `g = f(g)` for functionals
- Functional for which `fact` is a fixed point
- Wanted: `Y` that finds fixed point of our functional

```Python
fact = Y(lambda f: lambda n: 1 if n <= 0 else n*f(n-1))
```

###### Deriving the Y combinator

- Main property

```Python
Y(F) == f and f == F(f)
Y(F) == F(f)
Y(F) == F(Y(F))
Y = lambda F: F(Y(F))
```

- Given functional `F` and function `f` but this doesn't work because of recursion

```Python
# Observe for any expression e
e == lambda x: e(x)

# Expanding the call to Y
Y = lambda F: F(Y(F))
Y = lambda F: F(lambda x: Y(F) (x))
# This works because of an extra abstraction

Y(lambda f: lambda n: 1 if n <= 0 else n*f(n-1))(5) #prints 120

# We have
Y = lambda F: F(lambda x: Y(F)(x))

# Eliminates explicit recursion with the U combinator
Y = U(lambda h: lambda F: F(lambda x:U(h)(F)(x)))

# inlining U:
Y = ((lambda h: lambda F: F(lambda x:h(h)(F)(x)))(lambda h: lambda F: F(lambda x:h(h)(F)(X))))

# The fixed point of the factorial function is: lambda n: 1 if n <= 0 else n*f(n-1)
```

### Conclusion

> If we have anonymous functions, we have a programming language