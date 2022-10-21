# Decorators

## Syntax for decorators

If Decorator is the name of a decorator (a class or a function) that takes one argument, we can use it to decorate a function object, by writing either

```Python
def f(params-annotation) -> result-annotation:
    ...
f = Decorator(f)
```

or by using the new decoarator syntax of `@`

```Python
@Decorator
def f(params-annotation) -> result-annotation:
```

We can also use multiple decorators on functions. The meaning of

```Python
@Decorator1
@Decorator2
def f(...)
    ...
```

is equivalent to writing

```Python
f = Decorator1(Decorator2(f))
```

## Examples of function decorators

`Track_Calls` remembers the function it is decorating and initializes the calls counter to 0; the decorator object overloads the __call__ method so that all calls to the decorator object increment its calls counter and then actually calls the decorated function

```Python
class Track_Calls:
    def __init__(self,f):
        self._f = f
        self._calls = 0
    
    def __call__(self,*args,**kargs):  # bundle arbitrary arguments to this call
        self._calls += 1
        return self._f(*args,**kargs)  # unbundle arbitrary arguments to call f

    def called(self):
        return self._calls
    
    def reset(self):
        self._calls = 0
```

Every time `f` is called, the `Track_Calls` object gets is `_calls` attribute incremented.

```Python
def track_calls(f):
    def call(*args,**kargs):
        call._calls += 1
        return f(*args,**kargs)

    call._calls = 0         # define calls attribute on call function-object!
    return call
```

`Memoize` remembers the function it is decorating and initializes a dict to `{}`. It will use this dict to cache (keep track of and be able to access quickly) the arguments to calls, which are associated in the dict with the values ultimately returned by function calls with those arguments.

In this way, a function never has to compute the same value twice. Memoization is useful for multiply-recursive calls, as in the fibonacci function

```Python
class Memoize:
    def __init__(self,f):
        self._f = f
        self._cache = {}

    def __call__(self,*args):
        if args in self._cache:
            return self._cache[args]
        else:
            answer = self._f(*args)        # Recursive calls will set cache too
            self._cache[args] = answer
	    return answer

    def reset_cache(self):
        self._cache = {}
```

Memoization can convert a recursive function requiring an exponential number of  function calls to one requiring just a linear number.

```Python
def memoize(f):
    def wrapper(*args):
        if args in wrapper._cache: 
            return wrapper._cache[args]
        else:
            answer = f(*args)
            wrapper._cache[args] = answer
            return answer

    wrapper._cache = {}
    
    def reset_cache():
        wrapper._cache = {}
    wrapper.reset_cache = reset_cache

    return wrapper
```

`Illustrate_Recursive` remembers the function it is decorating and initializes a tracing variable to `False`. The decorator object overloads the `__call__` method so that all calls to the decorator object just return the result of calling the decorated function (if tracing is off)

```Python
class Illustrate_Recursive:
    def __init__(self,f):
        self._f = f
        self._trace = False
        
    def illustrate(self,*args,**kargs):
        self._indent = 0
        self._trace = True
        answer = self.__call__(*args,**kargs)
        self._trace = False
        return answer
    
    def __call__(self,*args,**kargs):
        if self._trace:
            if self._indent == 0:
                print('Starting recursive illustration'+30*'-')
            print (self._indent*"."+"calling", self._f.__name__+str(args)+str(kargs))
            self._indent += 2
        answer = self._f(*args,**kargs)
        if self._trace:
            self._indent -= 2
            print (self._indent*"."+self._f.__name__+str(args)+str(kargs)+" returns", answer)
            if self._indent == 0:
                print('Ending recursive illustration'+30*'-')
        return answer
```

This is particularly useful for visualizing the execution of a recursive function. If we decorate the `factorial` function like so

```Python
@Illustrate_Recursive
def factorial(n):
    if n == 0:
        return 1
    else:
        return n*factorial(n-1)

print(factorial.illustrate(5))
```

We get the following output.

```
Starting recursive illustration------------------------------
calling factorial(5,){}
..calling factorial(4,){}
....calling factorial(3,){}
......calling factorial(2,){}
........calling factorial(1,){}
..........calling factorial(0,){}
..........factorial(0,){} returns 1
........factorial(1,){} returns 1
......factorial(2,){} returns 2
....factorial(3,){} returns 6
..factorial(4,){} returns 24
factorial(5,){} returns 120
Ending recursive illustration------------------------------
```

Things get more interesting when there are multiple recursive calls in the function like the `fib` function

```Python
@Illustrate_Recursive
def fib(n):
    if    n == 0: return 1
    elif  n == 1: return 1
    else:         return fib(n-1) + fib(n-2)

print(fib.illustrate(5))
```

The trace looks like

```
Starting recursive illustration------------------------------
calling fib(5,){}
..calling fib(4,){}
....calling fib(3,){}
......calling fib(2,){}
........calling fib(1,){}
........fib(1,){} returns 1
........calling fib(0,){}
........fib(0,){} returns 1
......fib(2,){} returns 2
......calling fib(1,){}
......fib(1,){} returns 1
....fib(3,){} returns 3
....calling fib(2,){}
......calling fib(1,){}
......fib(1,){} returns 1
......calling fib(0,){}
......fib(0,){} returns 1
....fib(2,){} returns 2
..fib(4,){} returns 5
..calling fib(3,){}
....calling fib(2,){}
......calling fib(1,){}
......fib(1,){} returns 1
......calling fib(0,){}
......fib(0,){} returns 1
....fib(2,){} returns 2
....calling fib(1,){}
....fib(1,){} returns 1
..fib(3,){} returns 3
fib(5,){} returns 8
Ending recursive illustration------------------------------
```

The `mns` function in the [previous lecture](./functional-programming.md) (minimum number of stamps) does even more than two recursive calls: it does a recursive call one for each stamp denomination in the list constructor.

```
Starting recursive illustration------------------------------
calling mns(10, (1, 6, 14, 57)){}
..calling mns(9, (1, 6, 14, 57)){}
....calling mns(8, (1, 6, 14, 57)){}
......calling mns(7, (1, 6, 14, 57)){}
........calling mns(6, (1, 6, 14, 57)){}
..........calling mns(5, (1, 6, 14, 57)){}
............calling mns(4, (1, 6, 14, 57)){}
..............calling mns(3, (1, 6, 14, 57)){}
................calling mns(2, (1, 6, 14, 57)){}
..................calling mns(1, (1, 6, 14, 57)){}
....................calling mns(0, (1, 6, 14, 57)){}
....................mns(0, (1, 6, 14, 57)){} returns 0
..................mns(1, (1, 6, 14, 57)){} returns 1
................mns(2, (1, 6, 14, 57)){} returns 2
..............mns(3, (1, 6, 14, 57)){} returns 3
............mns(4, (1, 6, 14, 57)){} returns 4
..........mns(5, (1, 6, 14, 57)){} returns 5
..........calling mns(0, (1, 6, 14, 57)){}
..........mns(0, (1, 6, 14, 57)){} returns 0
........mns(6, (1, 6, 14, 57)){} returns 1
........calling mns(1, (1, 6, 14, 57)){}
..........calling mns(0, (1, 6, 14, 57)){}
..........mns(0, (1, 6, 14, 57)){} returns 0
........mns(1, (1, 6, 14, 57)){} returns 1
......mns(7, (1, 6, 14, 57)){} returns 2
......calling mns(2, (1, 6, 14, 57)){}
........calling mns(1, (1, 6, 14, 57)){}
..........calling mns(0, (1, 6, 14, 57)){}
..........mns(0, (1, 6, 14, 57)){} returns 0
........mns(1, (1, 6, 14, 57)){} returns 1
......mns(2, (1, 6, 14, 57)){} returns 2
....mns(8, (1, 6, 14, 57)){} returns 3
....calling mns(3, (1, 6, 14, 57)){}
......calling mns(2, (1, 6, 14, 57)){}
........calling mns(1, (1, 6, 14, 57)){}
..........calling mns(0, (1, 6, 14, 57)){}
..........mns(0, (1, 6, 14, 57)){} returns 0
........mns(1, (1, 6, 14, 57)){} returns 1
......mns(2, (1, 6, 14, 57)){} returns 2
....mns(3, (1, 6, 14, 57)){} returns 3
..mns(9, (1, 6, 14, 57)){} returns 4
..calling mns(4, (1, 6, 14, 57)){}
....calling mns(3, (1, 6, 14, 57)){}
......calling mns(2, (1, 6, 14, 57)){}
........calling mns(1, (1, 6, 14, 57)){}
..........calling mns(0, (1, 6, 14, 57)){}
..........mns(0, (1, 6, 14, 57)){} returns 0
........mns(1, (1, 6, 14, 57)){} returns 1
......mns(2, (1, 6, 14, 57)){} returns 2
....mns(3, (1, 6, 14, 57)){} returns 3
..mns(4, (1, 6, 14, 57)){} returns 4
mns(10, (1, 6, 14, 57)){} returns 5
Ending recursive illustration------------------------------
```

Both the `fib` and `mns` functions can be sped up by utilizing memoization to reduce the number of repeated computation that are done.

## Delegation of attribute lookup

When using (multiple) decorators, we need a way to translate attribute accesses on the decorator object into attribute accesses on the decorated object. This is difficult to do with functions, but `__getattr__` overloading provides a simple way to achieve this.

```Python
def __getattr__(self, attr):        # if attr not here, try self._f
    return getattr(self._f ,attr)
```

Generally this is called **delegation**: where an "outer" object that does not have some attribute delegates the attribute reference to an inner object which might define it.

