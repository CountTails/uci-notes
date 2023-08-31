# Instrospection

## What is it?

Introspection is the ability of running code to examine the objects that it defines (e.g., functions, classes, and data) and its behavior. Many introspection features appear in the `inspect` module

The following are more "is" function predicates that are callable on objects to determine what they are. These are the most useful functions, but not a complete list.

- `ismodule` : is object argument a module?
- `isclass`  : is object argument a class?
- `ismethod` : is object argument a method?
- `iscode`   : is object argument code (see attributes like __code__ below)?
- `isbuiltin` : is object argument a builtin function defined in the builtins module?
- `isroutine` : is object either a function or method? (from the word "subROUTINE")?

The following "get" methods are also available, to retrieve information about the source code for objects

- `getdoc` : obtains the doc string of a function/method/class
- `getcomments` : obtains the lines in the body of a function/method/class that are comments
- `getfile` : obtain the file name that contains a given function/method/class
- `getmodule` : obtain the module object that contains a given function/method/class
- `getsourcefile` : obtain the file object that contains a given function/method/class
- `getsourcelines` : obtain the body of a given function/method/class as a list
- `getsource` : obtain the boyd of a given function/method/class as a string

## Simple and useful attributes

Here are some of the attributes for various types of Python objects

### Functions

Say we have the following definition

```Python
def is_even(x : int = 0) -> bool:
    """x is even if its remainder is 0, when divided by two"""
    return x%2 == 0
```

Here are some of its attributes, their definitions and their values

| Attribute | Definition | Value |
| ---- | ---- | ---- |
| `type(is_even)` | the type of the callable object | `<class 'function'>` |
| `__annotations__` | a dict whose iteration order are parameter names and their associated annotation. The return annotation always appears last | `{'x': <class 'int'>, 'return': <class 'bool'>}` |
| `__closure__` | Not none when the function defines another function | `None` |
| `__code__` | Translated python code to be executed by the Python Virtual Machine | `<code object is_even at 0x104d3a600, file "<stdin>", line 1>` |
| `__defaults__` | `None` if no positional parameters have defaults or an n-tuple specifying the *LAST* $n$ positional arguments | `(0,)` |
| `__doc__` | The function's docstring, if it exists | "x is even if its remainder is 0 when divided by two" |
| `__globals__` | Global names within the module | `{... a large dictionary ...}` |
| `__kwdefaults__` | If `**` parameter is specified, the default values. Otherwise `None` | `None` |
| `__module__` | The module the function is defined in | `__main__` |
| `__name__` | Simple name of the function (as it is defined) | `is_even` |
| `__qualname__` | Qualified name. Different if function was defined in a different scope or module | `is_even` |

Now consider a function that defines another function

```Python
def opposite_of(f : callable) -> callable:
    def not_f(x):
        return not f(x)
    return not_f
```

| Attribute | Definition | Value |
| ---- | ---- | ---- |
| `type(opposite_of)` | the type of the callable object | `<class 'function'>` |
| `__annotations__` | a dict whose iteration order are parameter names and their associated annotation. The return annotation always appears last | `{'f': <built-in function callable>, 'return': <built-in function callable>}` |
| `__closure__` | Not none when the function defines another function | `None` |
| `__code__` | Translated python code to be executed by the Python Virtual Machine | `<code object opposite_of at 0x104de8030, file "<stdin>", line 1>` |
| `__defaults__` | `None` if no positional parameters have defaults or an n-tuple specifying the *LAST* $n$ positional arguments | `None` |
| `__doc__` | The function's docstring, if it exists | `None` |
| `__globals__` | Global names within the module | `{... a large dictionary ...}` |
| `__kwdefaults__` | If `**` parameter is specified, the default values. Otherwise `None` | `None` |
| `__module__` | The module the function is defined in | `__main__` |
| `__name__` | Simple name of the function (as it is defined) | `opposite_of` |
| `__qualname__` | Qualified name. Different if function was defined in a different scope or module | `opposite_of` |

If we write `odd = opposite_of(is_even)`

| Attribute | Definition | Value |
| ---- | ---- | ---- |
| `type(opposite_of)` | the type of the callable object | `<class 'function'>` |
| `__annotations__` | a dict whose iteration order are parameter names and their associated annotation. The return annotation always appears last | `{}` |
| `__closure__` | Not none when the function defines another function | `(<cell at 0x000001750A806A00: function object at 0x000001750ACDDF70>,)` |
| `__code__` | Translated python code to be executed by the Python Virtual Machine | `<code object not_f at 0x104d48920, file "<stdin>", line 2>` |
| `__defaults__` | `None` if no positional parameters have defaults or an n-tuple specifying the *LAST* $n$ positional arguments | `None` |
| `__doc__` | The function's docstring, if it exists | `None` |
| `__globals__` | Global names within the module | `{... a large dictionary ...}` |
| `__kwdefaults__` | If `**` parameter is specified, the default values. Otherwise `None` | `None` |
| `__module__` | The module the function is defined in | `__main__` |
| `__name__` | Simple name of the function (as it is defined) | `not_f` |
| `__qualname__` | Qualified name. Different if function was defined in a different scope or module | `opposite_of.<locals>.not_f` |

## Signatures

To inspect the details of a signature its parameters and return type) for a function object, the inspect module has a function named `signature` that returns a object from the `inspect.Signature` class, with the following attributes

- `str(sig)`: the str version of the signature
- `inspect._empty`: a special class used as the annotation value for any parameter name that is not annotated; also can be specified as `inspect.Signature.empty`
- `sig.return_annotation`: annotation for the return type (or `inspect._empty`, if there is no annotation for the return type) 
- `sig.parameters`: OrderedDict whose keys are parameter names each associated with a Parameter object.
	- Each parameter object has a name, default, annotation, and kind attribute
- `sig.bind(*args,**kargs)`: returns an object from the `inspect.BoundArguments` class.

## Dispatching function calls with their signature

Suppose that we want to define a function whose parameters are either 2 integers or 2 strings: for integers it computes their sum; for strings it computes the sums of their lengths.

We could write this as a single function in Python that "decodes" the types of its arguments.

```Python
def sum(a,b) -> int:
    if type(a) is int and type(b) is int:
        return a+b
    elif type(a) is str and type(b) is str:
        return len(a) + len(b)
    else:
        raise TypeError(f'sum arguments wrong types: {type(a)} and {type(b)}')
```

A "statically-typed" programming language (e.g., C++ and Java) requires that each function definition must specify the type of argument allowed to match each parameter.

In such languages, we are said to "overload" the meaning of the function name based on the different types of arguments it can be called on.

At compile time, the matching signature is used. If none exists, the program will not run

We will be able to define these two overloaded versions of the sum function (remembering both and calling each when appropriate) in Python as follows.

```Python
@DispatchBySignature.register
def sum(a : int, b : int) -> int:
    return a+b

@DispatchBySignature.register
def sum(a : str, b : str) -> int:
    return len(a) + len(b)
```

The signature is implement as follows. It also defines a function map and static methods to ensure no objects of this type are created

```Python
class DispatchableFunction:
    def __init__(self, raw_function, dispatch_class):
        self.raw_function   = raw_function  #decoration information for function
        self.dispatch_class = dispatch_class
    
    def __call__(self, *args, **kargs):
        df = self.dispatch_class.dispatch(self, *args, **kargs) # find it
        return df.raw_function(*args, **kargs)  	      	# call it
```


## Function calls and the stack

Python automatically uses a "stack" data structure to store/manipulate call frames that we can inspect. Below, we will examine function calls and the stack of call frames more formally, using the following rules:

- All call frames in a program are stored in stack, which grows upward
- Python is always executing code in the call frame on the top of the stack.
- Before Python starts executing code in a main module, it creates a stack of one call frame for that module, treating it like a called function with local names
- Whenever the code executing in the top call frame calls another function, Python remembers where the top call frame is executing and then adds (aka "pushes") a new call frame on top of it in the stack
- Whenever the code executing in the top call frame returns, Python removes (aka "pops") that call frame from the stack. Python then continues execution, where it left off, in in the call frame beneath it

### `__setattr__` & `__getattr__` for privacy

Suppose that we wanted to define a __setattr__ method for a class C so that it raised an AssertionError exception if __setattr__ was called from a method not defined in the class

```Python
import inspect
class C:
    def __init__(self,x):
        self.x = x
    
    def bump(self):
        self.x += 1
        
    def __setattr__(self,attr,value):
        code_calling_setattr = inspect.currentframe().f_back.f_code
        code_from_this_class = self.__class__.__dict__.get(code_calling_setattr.co_name,None)
        assert code_from_this_class != None\
                  and code_calling_setattr  is  code_from_this_class.__code__,\
                f'Attempt to set attribute "{attr}" from outside class {self.__class__}'
        self.__dict__[attr] = value
```

How about also requiring that all accesss to attributes be in methods of the classes that defined them? That is harder (but shown below)

```Python
def __getattribute__(self,attr):
    code_calling_setattr = inspect.currentframe().f_back.f_code
    code_from_this_class = self.__class__.__dict__.get(code_calling_setattr.co_name,None)
    assert code_from_this_class != None\
              and code_calling_setattr  is  code_from_this_class.__code__,\
            f'Attempt to get non-method attribute "{attr}" from outside class {self.__class__}'
    return self.__dict__[attr]
```

This code will allow only methods in C to access its non-method attributes.

Again, languages like Java and C++ specify that attributes can be rebound only by methods defined in their class. In Python, we can implement that policy if we want, but we can implement other/different policies too.

