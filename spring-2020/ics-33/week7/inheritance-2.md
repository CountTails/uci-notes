# Inheritance 2: Multiple

## Visualizing multiple inheritance hierarchies

Consider the following classes

```Python
class B1a     : pass	   # object is the base class of the derived class B1
class B1(B1a) : pass	   # B1a is the base class of the derived class B1
class B2      : pass	   # object is the base class of derived class B2
class C(B1,B2): pass	   # B1 and B2 (in that order) are the base classes of C
```

The following 3 are equivalent visual representions

```
        object			    object			  
         ^   ^               ^   ^	         	  
        /     \		        /     \			
      B1a     B2 	      B1a     |		     B1a --> object
       ^       ^           ^      |		      ^       ^
       |       |	       |      |		      |       |
       B1      /           B1     B2		  B1      B2
        ^     /            ^      ^		       ^      ^
         \   /		        \    /		        \    /
           C                  C		               C
```

To draw these inheritance networks, 

1) we start at the most derived class
2) then draw all its base classes (in the order they appear in the class definition, mirroring the left to right ordering)
3) directly above the class(es)derived from them, with arrows leading from the derived class to the base class.

## Locating Attributes in Multiple-Inheritance Hierarchies

The search must take into account two fundamental principles:

1) Before searching a base class, all classes derived from it must be searched
2) Base classes must be searched in the order they appear in each derived class definition. The derived class specifies them in a left to right order, with a left base class searched before a right base class.

In the inheritance network above, if c is an object constructed from class C, and the attribute isn't found in c, Python searches the following classes in following order

```
C -> B1 -> B1a -> B2 -> "object"
```

Every class object has a `__bases__` attribute that is a tuple of its base classes; the order that it uses for the base classes in the tuple is the same order the base classes appear in the class definition.

The order of classes that Python uses to search for an attribute name is actually computed when a class is defined. it is stored in the class attribute `__mro__`; it is also retrievable by the parameterless method mro.

The term "mro" stand for "METHOD resolution order", but it applies to all ATTRIBUTES, not just methods. The code directly below shows how the mro is used when searching for an attribute.

```Python
def pgetattr(an_object, attr, *default):
    # Try to locate attr in in object itself
    # Otherwise try to locate it in the classes in the __mro__ tuple
    #   based on the type of an_object (in order), which starts with
    #   type(an_object).
    # Finally return default[0] (if a third argument, and no more, was specified) or
    #   raise AttributeError if it was not

    if attr in an_object.__dict__:
        return an_object.__dict__[attr]
    else:
        for c in type(an_object).__mro__:  # or call .mro(): uses order from mro
            if attr in c.__dict__:
                return c.__dict__[attr]
    
    if len(default) == 1:                  # 3rd argument passed (no others)?
        return default[0]
    else:
        raise AttributeError("'"+type_as_str(an_object)+"' object has no attribute '"+attr+"'")
```

Python also defines a `hasattr` function in the builtins module, returning a boolean value telling whether or not Python can access the specified attribute in the specified object:

```Python
def phasattr(an_object, attr):
    # Try to locate attr in in object itself
    # Otherwise try to locate it in the classes in the __mro__ tuple
    #   based on the type of an_object (in order), which starts with
    #   type(an_object).

    if attr in an_object.__dict__:
        return True
    else:
        for c in type(an_object).__mro__:
            if attr in c.__dict__:
                return True
    return False
```

## Computing the Method Resolution Order

The final order requires two properties (also stated above).

1) Before searching a base class, all classes derived from it must be searched.
2) Base classes must be searched in the order they appear in each derived class definition. The derived class specifies them in a left to right order, with a left base class searched before a right base class; this left-to-right search order applies to base classes of base classes, etc.; which means all non-common classes in the leftmost mro list will be searched before any non-common classes in the next (to the right) mro.

This algorithm is known as the "C3 linearization algorithm". It linearizes (puts into a tuple) the search order for a network of classes in an inheritance hierarchy.

If there is no order that satisfies all these requirements (see below for an example) then the algorithm will detect this fact and Python will raise a `TypeError` exception when the class itself is defined: the __mro__ attribute for the class is computed when the class is defined.

```Python
def compute_mro(*bases, debugging=False):
    # constraints is a list of lists; each inner list specifies the constraints
    #   for a base class or the new class (last, specified by *bases)
    # mro is the final order for searching all the base classes
    constraints = [list(c.__mro__) for c in bases] + [list(bases)] # order important
    mro         = []
    
    # While there are constraints to ensure are satisfied
    while constraints:
        if debugging: print('\nConstraints =',constraints)
        
        # Find the first candidate in an inner constraint-list that does not
        # appear anywhere but as the first in all other inner constraint-lists
        # If none is found, raise TypeError (note use of else: in for loop)
        for const in constraints:
            candidate = const[0]
            if debugging: print('Trying candidate:',candidate)
            if not any([candidate in later[1:] for later in constraints]):
                if debugging: print('Selected candidate:',candidate)
                break
        else: # for finished without breaking; no candidate is possible!
            raise TypeError('Cannot create a consistent method resolution order (MRO) for bases ' +\
                               ', '.join(type_as_str(b) for b in bases))

        # That candidate is next in the mro for the currehnt class
        mro.append(candidate)
        
        # Remove candidate from being the first in any inner constraint-list
        for const in constraints:
            if const[0] == candidate:
                if debugging: print('Removing candidate from:', const)
                del const[0]
                
        # If any innner constraint-list has been reduced to [], remove it
        constraints = [c for c in constraints if c != []]
        
    return tuple(mro)
```

The computation for the mro of `class C(B1,B2): pass` would look like

```
  Constraints = [[<class '__main__.B1'>, <class '__main__.B1a'>, <class 'object'>],
                 [<class '__main__.B2'>, <class 'object'>],
                 [<class '__main__.B1'>, <class '__main__.B2'>]]
  Trying candidate: <class '__main__.B1'>
  Selected candidate: <class '__main__.B1'>
  Removing candidate from: [<class '__main__.B1'>, <class '__main__.B1a'>, <class 'object'>]
  Removing candidate from: [<class '__main__.B1'>, <class '__main__.B2'>]

  Constraints = [[<class '__main__.B1a'>, <class 'object'>],
                 [<class '__main__.B2'>, <class 'object'>],
                 [<class '__main__.B2'>]]
  Trying candidate: <class '__main__.B1a'>
  Selected candidate: <class '__main__.B1a'>
  Removing candidate from: [<class '__main__.B1a'>, <class 'object'>]

  Constraints = [[<class 'object'>],
                 [<class '__main__.B2'>, <class 'object'>],
                 [<class '__main__.B2'>]]
  Trying candidate: <class 'object'>
  Trying candidate: <class '__main__.B2'>
  Selected candidate: <class '__main__.B2'>
  Removing candidate from: [<class '__main__.B2'>, <class 'object'>]
  Removing candidate from: [<class '__main__.B2'>]

  Constraints = [[<class 'object'>], [<class 'object'>]]
  Trying candidate: <class 'object'>
  Selected candidate: <class 'object'>
  Removing candidate from: [<class 'object'>]
  Removing candidate from: [<class 'object'>]

  mro = (<class '__main__.B1'>, <class '__main__.B1a'>, <class '__main__.B2'>, <class 'object'>)
```

Note that we must prepend the C class itself to the result computed.

Now, look at the following example of class that CANNOT meet the requirements of having a C3 linearizable mro:

```Python
class A     : pass   # __mro__ is (A, object)
class B     : pass   # __mro__ is (B, object)
class C(A,B): pass   # __mro__ is (C, A, B, object) :note A before B
class D(B,A): pass   # __mro__ is (D, B, A, object) :note B before A
class E(C,D): pass   # __mro__ is not possible
```

The computation for the mro of `class E(C,D): pass` would look like

```
  Constraints = [[<class '__main__.C'>, <class '__main__.A'>, <class '__main__.B'>, <class 'object'>],
                 [<class '__main__.D'>, <class '__main__.B'>, <class '__main__.A'>, <class 'object'>],
                 [<class '__main__.C'>, <class '__main__.D'>]]
  Trying candidate: <class '__main__.C'>
  Selected candidate: <class '__main__.C'>
  Removing candidate from: [<class '__main__.C'>, <class '__main__.A'>, <class '__main__.B'>, <class 'object'>]
  Removing candidate from: [<class '__main__.C'>, <class '__main__.D'>]

  Constraints = [[<class '__main__.A'>, <class '__main__.B'>, <class 'object'>],
                 [<class '__main__.D'>, <class '__main__.B'>, <class '__main__.A'>, <class 'object'>],
                 [<class '__main__.D'>]]
  Trying candidate: <class '__main__.A'>
  Trying candidate: <class '__main__.D'>
  Selected candidate: <class '__main__.D'>
  Removing candidate from: [<class '__main__.D'>, <class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
  Removing candidate from: [<class '__main__.D'>]

  Constraints = [[<class '__main__.A'>, <class '__main__.B'>, <class 'object'>],
                 [<class '__main__.B'>, <class '__main__.A'>, <class 'object'>]]
  Trying candidate: <class '__main__.A'>
  Trying candidate: <class '__main__.B'>
  Traceback (most recent call last):
  Traceback (most recent call last):
    File "C:\Users\Pattis\workspace\inheritance\inheritancetool.py", line 85, in <module>
      print('\nmro =',compute_mro(C,D,debugging=True))
    File "C:\Users\Pattis\workspace\inheritance\inheritancetool.py", line 68, in compute_mro
      raise TypeError('Cannot create a consistent method resolution order (MRO) for bases ' + ', '.join(type_as_str(b) for b in bases))
  TypeError: Cannot create a consistent method resolution order (MRO) for bases __main__.C, __main__.D
```

Here is a recursive version of the compute_mro function (sans debugging print statements). It defines and calls the recursive helper function merge.

```Python
def compute_mro_r(*bases,debugging=False):
    def merge(constraints):
        if debugging: print(constraints)
        if constraints == []:
            return []
        else:
            # Find the first candidate in an inner constraint-list that does not
            # appear anywhere but as the first in all other inner constraint-list
            for const in constraints:
                candidate = const[0]
                if not any([candidate in later[1:] for later in constraints]):
                    break
            else: # for finished without breaking; no candidate is possible!
                raise TypeError('Cannot create a consistent method resolution order (MRO) for bases ' +\
                                   ', '.join(type_as_str(b) for b in bases))
            # if found, concatenate at front of mro of the solution to merging
            #   the remaining constraints (with it removed; a smaller problem)
            return (candidate,) + \
               merge([const[1:] if const[0] == candidate else const for const in constraints if const != [candidate]])
    return merge([list(c.__mro__) for c in bases] + [list(bases)])
```

## The true meaning of the `isinstance` function 

Python's boolean function isinstance has two parameters: the first should be bound to an instance object; the second to a class object.

The `isinstance(o,C)` function call still returns `True` if `type(o)` is `C`, but it also returns `True` if `type(o)` is any class derived from `C` (meaning `type(o)` is derived from class `C` in one or more steps).

Given what we learned above, we can easily implement the operation of calling
`isinstance(o,C)` in Python as `C in type(o).__mro__`

## Exceptions and Inheritance

All Exceptions are arranged in an inheritance hierarchy. If we write `except Foo` in a try/except, it handles a raised exception that is from the `Foo` class or any class derived from `Foo`

We can create a hierarchy of exception classes, some more general (higher up in the hierarchy, matching more general -many possible- exception classes) and some more specific (lower in the hierarchy).

For example, there might be a FileError exception for general file errors.

```Python
class FileError  (Exception) : ...
class InputError (FileError ): ...
class OutputError(FileError ): ...
class EOFError   (InputError): ...
```

which would have the following hierarchy

```
               object
                  ^
                  |
              BaseException
                  ^
                  |
              Exception
                  ^
                  |
              FileError
               ^     ^
              /        \      
       InputError   OutputError
           ^
           |
        EOFError
```

- `except EOFError`: only handles only EOFError
- `except FileError`: handles FileError, InputError, OutputError, and EOFError

The except clauses are checked SEQUENTIALLY FROM TOP TO BOTTOM. The first one having the isinstance function return True, specifies how that exception is handled.

We can write a a single class or a tuple/list of classes after the except keyword.

- `except (InputError,EOFError)`: handle either InputError or EOFError one way
- `except OutputError`: handle OutputError another one way

WARNING: The one thing that programmers need to watch out for is writing the following (which just reverses the two except clauses used in an example above)

```Python
except FileError :... 
except EOFError  :...
```

Here the except EOFError clause will NEVER be tried, because EOFError is derived from FileError, and therefore will be processed by the code in the FileError's except clause.

Generally, to process exceptions correctly, they should be listed from most SPECIFIC to most GENERAL