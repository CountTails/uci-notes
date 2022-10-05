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

### The `print` function

### String/list/tuple slicing

### Conditional statement vs conditional expression

### The `else` options for `for`/`while` loops

### Argument/parameter matching

### Constructors operates on iterables

### Sharing vs. copying

### Hashable vs. mutable

### Questions

## Part 3

### Comprehensions

### Nine important/useful functions

### `**kwargs` of non-matched arguments

### Data structures

### Exceptions

### Name spaces for objects

### Trivial things

### Questions