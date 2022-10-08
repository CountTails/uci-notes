# Operator overloading 2

## Container operators

| dunder method | use |
| ---- | ---- |
| `__getitem__(self,index)` | index: `l[3]` or `l[1:-1]` |
| `__setitem__(self,index,value)` | store list: `l[3]='a'` or `l[2:4]=('a','b','c')` |
| `__delitem__(self,index)`   | delete: `del l[3]` or del `l[1:-1]` |
| `__contains__(self,item)` | called by the in operator: `'a' in l` |

### For lists/tuples

To illustrate these methods, let's write a class that allows us to specify
a list that is indexed staring at 1 (not 0)

```Python
class List1:
    def __init__(self,iterable):
        self._plist = list(iterable)
        
    def __str__(self):
        return str(self._plist)
```

The following helper method will help adjust our index

```Python
@staticmethod
def _fix_index(i):
	return (i-1 if i >= 1 else i)
```

With `_fix_index` defined, we can write `__getitem__` as follows.

```Python
def __getitem__(self,index):
	print('List1.__getitem__('+str(index)+')') # for illumination/debugging
	if type(index) is int:
		return self._plist[List1._fix_index(index)]
	else:
		raise TypeError('List1.__getitem__ index('+str(index)+') must be int')
```

If we run the following script

```Python
x = List1(['a','b','c','d','e'])
print(x)
print(x[1], x[2], x[-2], x[-1])
```

The output is as follows

```Python
['a', 'b', 'c', 'd', 'e']
List1.__getitem__(1)
List1.__getitem__(2)
List1.__getitem__(-2)
List1.__getitem__(-1)
a b d e
```

### Slices

To finish writing __getitem__ we must take a short detour to talk about slices.

Each of these slices translates into an actual slice object (yes there is a slice class defined in the builtins module which is automatically imported into every python module)

>`x[1:4]`  translates to `x[slice(1,4,None)]`
>`x[2:-2]` translates to `x[slice(2,-2,None)]`
>`x[:-1]`  translates to `x[slice(None,-1,None)]`
>`x[::2]`  translates to `x[slice(None,None,2)]`

We can delegate these slices to be used on `self._plist`, but we need to fix the start and stop indexes

Updating the `_fix_index` and `__getitem__` methods as shown below. Now for
slices, we construct a fixed slice from the one passed as an argument

```Python
@staticmethod
def _fix_index(i):
	if i == None:
		return None
	else:
		return (i-1 if i >= 1 else i)
		# for + indexes, 1 smaller: 1 -> 0
		# for - indexes, the same: -1 (still last), -2 (still 2nd to last)
	
def __getitem__(self,index):
	print('List1.__getitem__('+str(index)+')') # for illumination/debugging
	if type(index) is int:
		return self._plist[List1._fix_index(index)]
	elif type(index) is slice:
		s = slice(List1._fix_index(index.start), List1._fix_index(index.stop), index.step)
		return self._plist[s]
	else:
		raise TypeError('List1.__getitem__ index('+str(index)+') must be int/slice')
```

Running the following script

```Python
x = List1(['a','b','c','d','e'])
print(x)
print(x[1:4], x[2:-2], x[:-1], x[::2])
```

Gives the following output

```Python
['a', 'b', 'c', 'd', 'e']
List1.__getitem__(slice(1, 4, None))
List1.__getitem__(slice(2, -2, None))
List1.__getitem__(slice(None, -1, None))
List1.__getitem__(slice(None, None, 2))
['a', 'b', 'c'] ['b', 'c'] ['a', 'b', 'c', 'd'] ['a', 'c', 'e']
```

Now that we know how to handle indexes that are integers or slices (by fixing them and delegating their use to `self._plist`), we can easily write the remaining methods.

#### `__setitem__`

```Python
def __setitem__(self,index,value):
	print('List1.__setitem__('+str(index)+','+str(value)+')') # for illumination/debugging
	if type(index) is int:
		self._plist[List1._fix_index(index)] = value
	elif type(index) is slice:
		s = slice(List1._fix_index(index.start), List1._fix_index(index.stop), index.step)
		self._plist[s] = value
	else:    
		raise TypeError('List1.__setitem__ index('+str(index)+') must be int/slice')
```

#### `__delitem__`

```Python
def __delitem__(self,index):
	print('List1.__delitem__('+str(index)+')') # for illumination/debugging
	if type(index) is int:
		del self._plist[List1._fix_index(index)]
	elif type(index) is slice:
		s = slice(List1._fix_index(index.start), List1._fix_index(index.stop), index.step)
		del self._plist[s]
	else:            
		raise TypeError('List1.__delitem__ index('+str(index)+') must be int/slice')
```

### Implement `in` via `__getitem__`

Before defining the `__contains__` method, we will learn that if there is no defined `__contains__` method, Python will check `x in l` by first checking if `x == l[0]`, then `x == l[1]`, then `x == l[2]`, ... until it finds `x`, or indexing raises an exception

Now, we can define our own contains to just use the in operator for lists.

```Python
def __contains__(self,item):
	for v in self._plist:
		if v == item:
			return True
	return False
```

We can simplify it to delegate to the in operator for the standard list it stores.

```Python
def __contains__(self,item):
	return item in self._plist
```

If we want to iterate over a class (for example, in a for loop) we should implement the `__iter__` and `__next__` methods.

But like `in`/`__contains__` if those methods aren't defined, Python calls the `__getitem__` method for indexing.

### In dictionaries

For classes that will be used like dicts, there is another special method `__missing__(self,key)` which should be called whenever a dict fails to find a key it is looking up.

## Function call

We can also define how to use an instance as if it were a function itself, allowing us to "call it" as o(...). The way we do this is by defining a method named `__call__` in the class.

```Python
class C:
    def __init__(self):
        self.x = 0
    
    def __call__(self,inc=1):
        self.x += inc
```

Calling an instance of class C as it were a function will cause that instance's x attribute to be incremented.

## Context managers

Context managers have the following syntax

>with A_Class(...) [as name]:        # as name  is optional: in [] (EBNF)
>	block  # (possibly using name in its statements)

Generally, the purpose of a context manager is to simplify the setup/tear-down of a context in which to execute the block. Oftentimes, the context includes information about how to do exception handling for the block, if any statement in the block raises an exception.

To be used by a context manager, the class must define both `__enter__` and `__exit__` methods.

Python calls these dunder methods automatically based on us using the "with" syntax, which is why we discuss them in this lecture.

Generally, the `__enter__` method takes the standard self and performs the **SETUP**. It must return self if the optional name is present so that it is bound properly

The `__exit__` method takes four arguments

1) the standard self
2) an object that is an exception class
3) and object that is a raised exception: 2 is the type of 3; for example, for raise AttributeError('...') (2) is AttributeError and (3) is the raised exception object, which includes the text '...'
4) a traceback (which we can print, and typically is formatted to print nicely).

The `__exit__` method performs the **TEAR_DOWN** and looks at these parameters and does what it wants with them:

- If it returns True any exception is considered to be handled
- If `__exit__` returns False, Python propagates the exception

## Attributes

| dunder method | use |
| ---- | ---- |
| `__getattr__(self,name)` | called, when cannot find name attribute |
| `__setattr__(self,name,value)` | set name attribute to value |
| `__delattr__(self,name)` | delete name attribute |
| `__getattribute__(self,name)` | access name attribute(tough to overload, unless you know about inheritance, we will discuss it then) |

All require careful use or they will cause big problems (often infinite recursion) that stop the execution of all Python code.

```Python
def __setattr__(self,name,value):    # NEVER DO THIS
    pass                             # NEVER DO THIS
```

The snippet above prevent attributes from being bound. It kind of break the whole idea of a class in Python

The `delattr` is rarely used and `__getattribute__` is quite dangerous, so it should be avoided.