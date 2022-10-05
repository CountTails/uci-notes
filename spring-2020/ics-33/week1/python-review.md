# Python review

## Part 1

### Python in 4 sentences

1) Names (in namespaces) are bound to objects
2) Everything the Python computes with is an object
3) Every object has its own namespace
4) Python has rules about how things work

### Objects of fundamental 

### Binding

Binding is the process of making a name refer to a value. I.E. `x = 1`

To illustrate binding:

- Write the name over a rectangle
- Write the type over a rounded-corner rectangle with the value inside
- The tail starts inside the name rectange, ends just outside of the rounder-corner rectangle

```
  x           int
+---+        (---)
| --|------->| 1 |
+---+        (---)
```

Technically `x` is inside a module `m`, so

```
             module
          (---------)
  m       |    x    |      int
+---+     |  +---+  |     (---)
| --+---->|  | --+--+---->| 1 |
+---+     |  +---+  |     (---)
          (---------)
```

Note that the `del` command in Python (e.g., del name) removes a name from the current namespace/dictionary of the object in which name is bound.

If we write

```Python
x = ['a','b']
y = ['a','b']
```

Python creates two list objects, binding index 0 to the value 'a' in each and binding index 1 to the value 'b' in each.

The binding diagram might look something like

```
                list
            (-----------)
  x         |   0   1   |       str
+---+	    | +---+---+ |      (---)
| --+------>| | | | --+-+----->|'b'|<- +
+---+	    | +-+-+---+ |      (---)   |
		    (---+-------)              |
                |               str    |
                |              (---)   |
				+------------->|'a'|   |
		                       (---)   |
                                 ^     |
                list             |     |
            (-----------)        |     |
  y         |   0   1   |        |     |
+---+	    | +---+---+ |        |     |
| --+------>| | | | --+-+--------+-----+
+---+	    | +-+-+---+ |        |
		    (---+-------)        |
                |                |
                |                |
				+----------------+
```

The `is` operator in Python determines whether two references refer to the same object (it is called the (object)identity operator)

The `==` operator determines whether two references refer to objects that store the same internal state.

In the above picture, `x is y` is `False` and `x == y` is `True`

If we instead write

```Python
x = ['a','b']
y = x
```

A picture would look something like

```
  x
+---+           list
| --+------>(-----------)
+---+       |   0   1   |        str
            | +---+---+ |       (---)
  y         | | | | --+-+-----> |'b'|
+---+	    | +-+-+---+ |	    (---)
| --+------>(---+-------)
+---+           |
				v
		       str		
		      (---)
		      |'a'|
		      (---)
```

And then both `x is y` and `x == y` are `True`

### Statements vs. expressions

Statements are executed to cause an effect. Expressions are evaluated to compute a result

Control structures (even simple sequential ones, like blocks) are considered
to be statements in Python.

#### None

None is a value (object/instance) of NoneType; it is the ONLY VALUE of that
type. 

Look for some function whose return value you FORGOT to
specify explicitly

#### pass

pass is the simplest statement in Python; semantically, it means "do nothing".

It is used most frequently as a placeholder for a function or code block that is going to be filled in.

### Importing

"import module-name" form: one or more modules, optionally renaming each

1) `import module-name{,module-name}`
2) `import module-name [as alt-name] {,module-name [as alt-name]}`

"from module-name import" form: one or more attributes, optionally renaming each

3) `from module-name import attr-name{,attr-name}`
4) `from module-name import attr-name [as alt-name] {,attr-name [as alt-name]}`
5) `from module-name import *`

### Iterate by value vs iterate by index

#### By index

```Python
alist = [5, 2, 3, 1, 4, 0]
for i in range(len(alist)):          # same as for i in range(0,len(alist)):
    print(alist[i])
```

Here `i` takes on the values `0, 1, ... , len(alist)-1` and can be used to access alist as an index

#### By value

```Python
for v in alist:
    print(v)
```

Here `v` takes on each value in `alist` in the order that it is stored

### Arguments and parameters

Whenever we DEFINE a function we specify the names of its PARAMETERS in its header (in parentheses, separated by commas).

Whenever we CALL a function we specify the values of its ARGUMENTS (also in
parentheses, separated by commas).

Parameter/argument binding occurs sequential, binding the first evaluated argument to the
first parameter, the second evaluated argument to the second parameter (etc.).

Parameters are always names. Arguments are always expressions that evaluate to
objects.

### Function calls

Function calls ... always include ()

Any time a reference to an object is followed by (...) it means to perform a
function call on that object. Some objects will raise an exception if they do
not support function calls

If there are no () in the code above, so there is NO FUNCTION CALL

Consider the following definitions

```Python
def double(x):
    return 2*x

def triple(x):
    return 3*x

def times10(x):
    return 10*x
```

If we then wrote `f = double`, then `f` and `double` refer to the same function. They can be called with the different names, but will invoke the same operations

We can also pass (uncalled) functions (objects) as arguments to other functions. So, functions are objects just like integers are objects.

There are 7 categories of things we can CALL in Python.

1) Built-in functions: e.g., len('abc')
2) User-defined (by def/lambda) functions
3) Built-in methods: e.g., 'abc'.uppercase()
4) User-defined methods (in user defined classes)
5) Classes: C() invokes `__new__` and then `__init__` in user-defined class C
6) Class instances (any object): via `__call__`
7) Generator functions: return generator objects/iterators to call next on

### Scope: local and global names

The topic of SCOPE concerns the visibility of variable names. Names defined in a module are global definitions; names defined in a function (including its parameters) are local definitions.

Here are Python's rules for resolving names

1) A name used (to lookup or bind) in a module is global
2) A name used (to lookup or bind) in a function is global if 
	1) that name is explicitly declared global (e.g., global x) PRIOR to its use in the function
    2) that name is only looked-up (and never bound) in the function
3) A name used (to lookup or bind) in a function is local, otherwise (e.g., bound in a function AND not declared global before its use; also, all parameters are considered to be local)

We can always lookup (find the value of, evaluate) a global name inside a function to find its value without doing anything special, but if we want to (re)bind the global name to a new value inside the function, we must declare the name global somewhere in the function (before its first use).

### Generalizing scope

These local/global rules are generalized in the next section to include 4
different locations/scopes: LEGB

1) functions (Local scope -as seen above)
2) enclosing functions (Enclosing scope)
3) modules (Global scope -as seen above)
4) the special builtins module (Builtins scope)

### Functions vs. methods

Functions are typically called `f(...)` while methods are called on objects like
`o.m(...)`. 

A method call is just a special syntax to write a function call. The
special "argument" o prefixes the method name.

```
o.m(...)     =     type(o).m(o,...)
```

### Lambda

We use lambdas when we need to use a very simple function object: so simple,
it doesn't even need a name.

A lambda produces an UNNAMED function object: there is no name bound to it. But
we can always use an assignment statement to define a name and bind it to the
function object created by a lambda.

```Python
lambda x,y : x+y  # lambdas have one expression after : without a return
```

### Parrallel/tuple/list/assignment

This is valid Python code

```Python
x,y = 1,2
```

To do any tuple/parallel assignment, Python

1) first computes all the values of the expressions/objects on the right (1 and 2 from the top)
2) second binds each name on the left (in order: x then y) to these computed values/objects (binds x to 2, then bind y to 1)

This is also called "sequence unpacking assignment.

```Python
x,y = 1,2,3 
x,y,z = 1,2
```

The statements above would raise ValueError exceptions, because there are different numbers of names and values to bind to them.

## Part 2

### Iterable

When we specify that an argument of a function must be iterable, it might be one
of the standard data structures in Python.

Or it might be a class or generator, which are also iterable, but cannot be indexed `[...]` or have the `len()` function used on them.

Any iterable object can be transformed into a list or tuple of its values. (it might be big though)

### `list.sort` vs `sorted` function

`sort` is a method defined on arguments that are LIST objects; it returns the value None, but it MUTATES its list argument with its values in some specified order

`sorted` is a function defined on arguments that are ITERABLE objects; it returns a LIST of its argument's values, with its values in some specified order

To tell Python how to do the sorting, use the `key` parameter. To reverse the order in which Python will sort, set the `reverse` parameter to `True`

There is a standard way to compare any data structure if `key` is not used.

### The `print` function

the `sep` and `end` parameters in print help control how the printed
values are separated and what is printed after the last one.

The print function returns the value None: this function serves as a statement: it has an "effect" but returns no useful "value"; but all functions must return a value, so this one returns None.

For formatting string, just use f-strings, they are amazing

### String/list/tuple slicing

We can specify a slice by `SLT[i:j]` which includes `SLT[i]` followed
by `SLT[i+1]`, ... `SLT[j-1]`.

Slicing creates a copy of the subcontainer being sliced. If the slice contain no values it is empty. If the first index come before index 0, then index 0 is used; if the second index comes after the biggest index, then index `len(SLT)` is used.

When the stride is omitted, it is +1. If the stride is negative, if the first index is omitted it is `len(SLT)`; if the last index is omitted it is -1.

### Conditional statement vs conditional expression

A conditional statement uses a boolean expression to decide which indented
block of statements to execute; 

A conditional expression uses a boolean expression to decide which one of exactly two other expressions to evaluate.

The form of a conditional expression is: `resultT if test else resultF`

Not all conditional statements can be converted into conditional expressions; typically only simple ones can

### The `else` options for `for`/`while` loops

```Python
for index(es) in iterable:
    block-body
[else:
    block-else]

while <bool-expression>:
    block-body
[else:
    block-else]
```

If the else: block-else option appears, and the loop terminated normally, (not with a break statement) then execute the block-else statements

### Argument/parameter matching

Remember that arguments appear in function CALLS and parameters appear in function HEADERS (the first line in a function definition).

#### Arguments

| type | definition |
| --- | --- |
| positional argument | an argument NOT preceded by the name= option |
| named argument | an argument preceded by the name= option |

#### Parameters

| type | definition |
| --- | --- |
| name-only parameter | a parameter not followed by =default argument value |
| default-argument parameter | a parameter followed by =default argument value |

#### Matching rules

1) Match positional argument values in the call sequentially to the parameters named in the header's corresponding positions. Stop when reaching any named argument in the call, or the *parameter (if any) in the header.
2) If matching a \*parameter in the header, match all remaining positional argument values to it.
3) Match named-argument values in the call to their like-named parameters in the header
4) Match any remaining default-argument parameters in the header with their specified default values
5) Exceptions
	- `SyntaxError`
		- an argument cannot match a parameter
	- `TypeError`
		- a parameter is matched multiple times by arguments
		- any parameter has not been matched
		- a named-argument does not match the name of a parameter
6) A / may appear once in a parameter list by itself, preceded by any number of parameter names. Any arguments preceding the / are positional only
7) A \* may appear once in a parameter list by itself, followed by any number of parameter names. Any arguments following \* are named only

### Constructors operates on iterables

it is very easy to construct lists, tuples, and sets from anything that is iterable by using the
list, tuple, and set constructors.

```Python 
l = list ('radar') # then l is ['r', 'a', 'd', 'a', 'r']
t = tuple('radar') # then t is ('r', 'a', 'd', 'a', 'r')
s = set  ('radar') # then s is {'a', 'r', 'd'} or {'d', 'r', 'a'} or ...
```

Conversion between `list`, `set`, and `tuple` is also easy becuase these data structures are iterable

Dictionaries have three ways to iterable, so you can extract a dict's contents in three different ways

```Python
list(d.keys  ()) # is like ['c', 'b', 'a', 'e', 'd']
list(d.values()) # is like [3, 2, 1, 5, 4]
list(d.items ()) # is like [('c', 3), ('b', 2), ('a', 1), ('e', 5), ('d', 4)]
```

To construct a dict, the iterable often requires a specific structure. Usually, it will involve an iterable where each element is also an iterable object of length 2

```Python
d = dict( [['a', 1], ['b', 2], ['c', 3], ['d', 4], ['e', 5]] ) #list of  2-list
d = dict( [('a', 1), ('b', 2), ('c', 3), ('d', 4), ('e', 5)] ) #list of  2-tuple
d = dict( (['a', 1], ['b', 2], ['c', 3], ['d', 4], ['e', 5]) ) #tuple of 2-list
d = dict( (('a', 1), ('b', 2), ('c', 3), ('d', 4), ('e', 5)) ) #tuple of 2-tuple
```

### Sharing vs. copying

It is important to understand the fundamental difference between two names sharing an object (bound to the same object) and two names referring/bound to "copies of the same object".

Note that if we mutate a shared object, both names "see" the change: both are bound to the same object which has mutated. But if they refer to different copies of an object, only one name "sees" the change.

Checking `a is b` is equivalent to checking `id(a) == id(b)`

#### Shallow copies

Shallow copies mean the top level object that was being referenced was copied, but the references in that object are shared.

```Python
x = [1, [2]]
y = list(x) # or y = copy(x) or y = x[:]
```

In memory, `x` and `y` would look like

```
                list              list
            (-----------)      (-------)        
  x         |   0   1   |      |   0   |        int
+---+	    | +---+---+ |      | +---+ |       (---)
| --+------>| | | | --+-+----->| | --+-+-----> | 2 |
+---+	    | +-+-+---+ |      | +---+ |       (---)
		    (---+-------)      (-------)
                |                  ^
				v    	           |
		       int		           |
		      (---)		           |
		      | 1 |<--------+	   |
		      (---)	        |	   |
	      		            |	   |
                list	    |	   |
            (-----------)   |	   |
  y         |   0   1   |   |	   |
+---+	    | +---+---+ |   |	   |
| --+------>| | | | --+-+---+------+
+---+	    | +-+-+---+ |   |
		    (---+-------)   |
                |           |
                +-----------+
```

#### Deep copies

Deep copies  copy the top level object as well as every mutable reference that the object had. This is usually accomplished recursively.

```Python
from copy import deepcopy
x = [1, [2]]
y = deepcopy(x)
```

In memory, `x` and `y` would look like

```
                list              list
            (-----------)      (-------)        
  x         |   0   1   |      |   0   |       int
+---+	    | +---+---+ |      | +---+ |       (---)
| --+------>| | | | --+-+----->| | --+-+-----> | 2 |
+---+	    | +-+-+---+ |      | +---+ |       (---)
		    (---+-------)      (-------)         ^
                |                                |
				v                                |
		       int                               |
		      (---)			                	 |
		      | 1 |<--------+                    |
		      (---)	        |                    |
			      		    |                    |
                list	    |      list          |
            (-----------)   |   (-------)        |
  y         |   0   1   |   |   |   0   |        |
+---+	    | +---+---+ |   |   | +---+ |        |
| --+------>| | | | --+-+---+-->| | --+-+--------+
+---+	    | +-+-+---+ |   |   | +---+ |
		    (---+-------)   |   (-------)
                |           |   
                +-----------+
```

### Hashable vs. mutable

Python uses the term Hashable, which has the same meaning as Immutable. So
hashable and mutable are OPPOSITES.

| Hashable/Immutable | Mutable/Unhashable |
| ---- | ---- |
| numbers | lists |
| strings | sets |
| tuples (if their contents are immutable) | dicts |
| frozensets | user-defined classes (by default) |

Small integer objects are unique in Python. Two names assigned to the same small integer will be considered identical. However, tow names assigned to the same large integer are considered different. This is done to save memory

## Part 3

### Comprehensions

Comprehensions are compact ways to create complicated (but not too complicated) lists, tuples, sets, and dicts.

The general form of a list comprehension is as follows, where f means any function using var (or expression using var: we can also write just var there because a name by itself is a very simple expression) and p means any predicate (or bool expression) using var.`[f(var,...) for var in iterable if p(var,...)]`

For tuple or set comprehensions, we would use `()` and `{}` as the outermost
grouping symbol instead of `[]`

Comprehensions provides a simpler way to write loops that construct a list, tuple, set from scratch

Comprehensions cannot add data to a data structure and then mutate that data.

#### Dict comprehensions

The structure differs slightly, requiring a key and value as follows: `{k(var,...) : v(var,...) for var in iterable if p(var,...)}`

#### Tuple comprehensions

When writing a tuple comprehension `(...)`, you actually get a generator instead of a tuple

### Nine important/useful functions

#### `split` and `join` methods

Both split and join are methods in the str class.

The split method also takes one str argument as .... and the result it returns
is a list of of str.

The join method also takes one iterable argument (it must produce str values) 
as ....; the result it returns is a str.

#### `all` and `any` functions

The `all` function takes one iterable argument (and returns a bool value): it
returns True if ALL the bool values produced by the iterable are True.

The `any` function takes one iterable argument (and returns a bool value): it
returns True if ANY the bool values produced by the iterable are True.

These pair well with comprehensions, since comprehensions product iterable objects

#### `sum`, `min`, and `max` functions

The sum function requires that the iterable produce numeric values that can be added. It returns the sum of all the values produced by the iterable; if the iterable argument produces no values, sum returns 0.

The min/max functions require that the iterable produce values that can be
compared with each other and return the minimum/maximum value produced by their iterable argument.

For the min/max functions, a key can be provided that dictated how the elements in the iterable arguments will be compared.

#### `zip` and `enumerate` functions

The zip that takes an arbitrary number of iterable arguments and zips/interleaves them together. They can be unzipped in a for loop that utilizes unpacking.

The enumerate function takes a single iterable and an optional starting number and returns an iterable with pairs of `enum, value`

### `**kwargs` of non-matched arguments

This parameter (just a name, can be anything else) must occur as the last parameter. kargs stands for keyword arguments. Basically, if Python has any  keywords arguments that do not match keyword parameters, they are all put in a dictionary that is stored in the last parameter named kargs.

1) Writing * and ** when specifying parameters makes those parameters names bind to a tuple/dict respectively.
2) Using the parameter names by themselves in the function is equivalent to using the tuple/dict respectively.

3) Using * and ** followed by the parameter name as ARGUMENTS IN FUNCTION CALLS expands all the values in the tuple/dict respectively to represent all the arguments.

### Data structures

#### Sequence types

These sequence operations (operators and functions) are defined

- x in s
- x not in s
- s + t
- s * n
- s[i]
- s[i:j]
- s[i:j:k]
- len(s) 
- min(s)
- max(s)
- s.index(x[, i[, j]])
- s.count(x)

Mutable sequence allow the following operations

- s[i] = x 
- s[i:j] = t
- del s[i]
- s[i:j:k] = t
- del s[i:j:k]
- s.append(x)
- s.clear()
- s.copy()
- s.extend(t)
- s.insert(i, x)
- s.pop()
- s.pop(i)
- s.remove(x)
- s.reverse()

#### Set Types

set (mutable) an frozenset (immutable)

- len(s)
- x in s
- x not in s
- isdisjoint(other)
- issubset(other)
- set <= other 
- set < other
- issuperset(other)
- set >= other
- set > other
- union(other, ...)
- intersection(other, ...)
- difference(other, ...)
- symmetric_difference(other)
- copy
- also the operators
	- | (for union)
	- & (for intersection)
	- (for difference) 
	- ^ (for symmetric difference)

The following operations are allowed on sets only

- update(other, ...)
- intersection_update(other, ...)
- difference_update(other, ...)
- symmetric_difference_update(other)
- add(elem)
- remove(elem)
- discard(elem)
- pop()
- clear()
- also the operators 
	- |= (union update)
	- &= (intersection update)
	- -= (difference update)
	- ^= (symmetric difference update)

#### Mapping Types

Mapping types allow the following operations

- d[key] = value 
- del d[key]
- key in d
- key not in d
- iter(d) 
- clear()
- copy()
- fromkeys(seq[, value])
- get(key[, default])
- items()
- keys()
- pop(key[, default])
- popitem()
- setdefault(key[, default])
- update([other])
- values()

### Exceptions

We do two things with exceptions in Python: we raise them (with the raise statement) and we handle them (with the try/except statement).

A function raises an exception if it cannot do the job it is being asked to
do. Rather than fail silently, possibly producing a bogus answer that gets used
to compute an even bigger bogus result, it is better that the computation
announces that a problem occurred.

```Python
try:
    try-block

except EorSE:
    except-block
except EorSE:
    except-block
...
except EorSE:
    except-block

else:
    else-block

finally:
    finally-block
```

Python tries to execute the statements in a try-block sequentially...

- if NONE raise an exception, it executes the statements in else-block (if else: is present) and then the statements in finally-block (if finally: is present)
- if ANY raise an exception, no more statements in the try-block are executed; it executes the statements in except-block (if except: is present) for the first EorSE matching the raised exception (if any match), then the statements in finally-block (if finally: is present)
- If no EorSE matches the raised exception, then after executing the finally-block (if finally: is present), Python propagates the exception.

### Name spaces for objects

Every object has a special variable named `__dict__` that stores all its
namespace bindings in a dictionary.

Writing `x.a = 1` is similar to writing `x.__dict__['a'] = 1`; both associate a name with a value in the object.

### Trivial things

An empty dict is created by {} and empty set by set() (we can't use {} for an
empty set because Python would think it is a dict). Non-empty dicts can
be distinguished from a non-empy set.

A one value tuple must be written like (1,) with that "funny" comma (we can't write just (1) because that is just the value 1, not a tuple storing just 1).