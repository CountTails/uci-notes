# Advanced classes and inheritance

## Abstract base classes

An Abstract Base Class (ABC) is a special kind of class. Being called a Base class signifies that we expect to derive other classes from it; in fact, its ONLY use is to be derived from: it cannot be instantiated.

1) is directly derived from abc.ABC (the ABC class in the abc module) or inherits from abc.ABC via a chain of multiple derived classes.
2) DEFINES (using the @abc.abstractmethod decorator) or INHERITS one or more abstract methods, each of which must eventually be overridden in a by a concrete method in a derived class
3) cannot be instantiated

### Abstract `Shape` class

```Python
import math   # use pi
import abc    # use the class ABC and the function abstractmethod (a decorator)

# Shape is 
class Shape(abc.ABC):
    @abc.abstractmethod
    def perimeter(self): pass  # will be overridden in some derived class

    @abc.abstractmethod
    def area(self): pass       # will be overridden in some derived class

    def one_dimensional(self): # concrete: works by calling an abstract method
        return self.area() == 0
```

### Concrete classes

```Python
# Concrete classes derived from Shape; besides an __init__ specifying their
#   attributes, they specify concrete perimeter/area methods, overriding the
#   abstract methods defined in (and inherited from) the Shape ABC
# We will learn later in these notes how to easily ensure side and radius are >0

class Square(Shape):
    def __init__(self,side)  : self.side = side
    def __repr__(self)       : return f'Square(side={self.side})'
    def perimeter(self)      : return 4*self.side
    def area(self)           : return self.side**2

class Circle(Shape):
    def __init__(self,radius): self.radius = radius
    def __repr__(self)       : return f'Circle(radius={self.radius})'
    def perimeter(self)      : return math.pi * 2*self.radius
    def area(self)           : return math.pi * self.radius**2
```

## Collections

The collections module (which also defines things like namedtuple and defaultdict) defines the collections.abc module, which defines the following ABCs

| ABC | (Inherits From) | new abstract methods |
|-----|----------------|-----------------------|
| Concrete Mix-In methods | | |
| Container | N/A | `__contains__` |
| Hashable | N/A | `__hash__` |
| Iterable | N/A | `__iter__` |
| Iterator | (Iterable) | `__next__` (`__iter__` returns self) |
| Reversible | (Iterable) | `__reversed__` |
| Sized | N/A | `__len__` |
| Callable | N/A | `__call__` |
| Collection | (Sized,Iterable,Container) | N/A |
| Sequence | (Reversible,Collection) | `__getitem__` (used for iteration) |
| MutableSequence | (Sequence) | `__setitem__`, `__delitem__`, `insert` `append`, `reverse`, `extend`, `pop`, `remove`, `__iadd__` |
| Set | (Collection) | all relational operators, all logical operators, `isdisjoint` |
| MutableSet | (Set) |`add`, `discard` `clear`, `pop`, `remove`, all i-logicals (e.g., `__ior__`)  |
| Mapping | (Collection) | `__getitem__` `__contains`, `keys`, `items`, `values`, `get`, `__eq__`, `__neq__` |
| MutableMapping | (Mapping) | `pop`, `pop_item`, `clear`, `update`, and `set_default` |
| MappingView | (Sized) | N/A |
| KeysView  | (MappingView,Set) | N/A |
| ValuesView | (MappingView,Collection) | N/A |
| ItemsView | (MappingView,Set) | N/A |

## Properties as class attributes

Before discussing properties (and later how they are implemented by descriptors) in detail, we must change our understanding of a fundamental part of Python: how attributes are searched for and set.

When attributes are searched for, Python does each of the following, in order, until the attribute is found
 
 1) examine the namespace of the object (its `__dict__`)
 2) examine the namespace of the object's class (its `__dict__`),
 3) examine the namespaces of the classes that the object's class was derived from: repeat 2 in the order specified by the `__mro__` of the object's class

When attributes are set
 
 1) bind the attribute in the object's namespace (its `__dict__` via `__setattr__`)

The "property" class (defined in the builtins module) is defined as follows

```Python
class property:
    def __init__(self, fget=None, fset=None, fdel=None, doc=None):
```

- fget is the code to execute whenan attribute is searched for
- fset is the code to execute when an attribute is set
- fdel is the code to execute when an attributed is deleted

Note that if the parameter's value is None, then that operation is ILLEGAL, which means that searching for/setting/deleting an attribute raises an exception.

If we define a CLASS ATTRIBUTE as a property, it means that when any object constructed from that class searches for or sets or deletes that attribute, it will call the appropriate property's function to do the job.

When attributes are searched for, Python does each of the following, in order, until the attribute is found: THE FIRST STEP IS NEW.

 1) if the attribute is defined in the object's class as a property, run the property's fget method 
 2) examine the namespace of the object (`__dict__`),
 3) examine the namespace of the object's class (`__dict__`),
 4) examine the namespaces of the classes that the object's class was derived from: repeat 1 and 3 in the order specified by the `__mro__` of the object's class

When attributes are set

 1) if the attribute is defined in the object's class as a property, run the property's fset method
 2) bind the attribute in the object's namespace (its `__dict__` via `__setattr__`)

When attributes are deleted

 1) if the attribute is defined in the object's class as a property, run the property's fdel method
 2) delete the attribute in the object's namespace (its __dict__ via del)

## Specifying Properties with Decorators:

```Python
class C:
    def __init__(self,init):
        self.count = init

    def inc(self):
        self.count += 1

    #...def other methods for C...

    @property
    def count(self):
        return self.the_count

    @property.setter
    def count(self, value):
        self.the_count = value

    @property.deleter
    def count(self):
        del self.the_count
```


