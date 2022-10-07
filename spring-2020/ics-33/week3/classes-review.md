# Python Classes

Most data is stored in the namespace of an object constructed from a class.

Most methods are stored in the namespace of class the object is constructed
from.

The name spaces for classes and instances (objects constructed from classes): how they are initialized, stored, and accessed/updated.

Accessing attributes (both for methods and data) in instance and classes is a 2-step algorithm (which we will extend/generalize when we cover inheritance among classes)

## Defining classes

Defining a class binds the class name to an object representing the entire class. That class object contains mostly method definitions, but it can also contain data that is common to all the objects constructed from the class.

The class object can be called (like a function) to create a new instance of the class. Python
constructs an empty instance object and then calls the `__init__` method defined in the class, (passing the new/empty instance object to its self parameter) to initialize the state of the instance object.

```Python
class C:
	pass 
# defines a new class object called C
# can be instantiated by callint it like C()
```

### How python construct new instance objects

1) It calls a special function that creates an object that is a new instance of the class.
2) It calls the __init__ method for the class, passing the empty object created in (1) to the first parameter of __init__ (by convention, called self), and following this with all the other argument values in the parentheses used in the call to initialize the states of attributes in this instance.
3) A reference to the object that was created in (1) and initialized in (2) is returned as the result of constructing the object


## Manipulating an object's namespace (and `__init__`)

All objects have namespaces, which map attribute names to the values they are associated with. To define or update (if allowed) an attribute we write the following

```Python
self.name = value
```

in any method in the class. Ideally, it would only be in the class's `__init__` method.

In the background, Python does the following:

```Python
object.__dict__[name] = value
```

Attempting to access an attribute that does not exists, results in an `AttributeError` exception.

Assert statements can alsoe be used in a class's `__init__` method to ensure arguments for paremeters are given legal/reasonable values.

## Different kinds of names/attributes: definition and use

1) local variables: defined and used inside functions/methods to help with the computation; parameter variables are typically considered local variables too.  These are created during the execution of the function/method; they disappear when the function/method terminates.
2) instance attributes/variables of an object: typically defined inside `__init__` and used inside class methods (we saw other ways to define them above too). These are referred to as `self.name`. These exist so long as the object exists.
3) class attributes/variables: typically defined in classes (at same level as methods, not inside methods) and typically used in methods; we use a class attribute to store information COMMON to all objects of a class. All class attributes are defined in the class object and they are found by the Fundamental Equation of Object-Oriented Programming through instances of that class.
4) global variables: typically defined in modules (outside of functions and classes) and used inside functions and/or class methods; we typically avoid using them (don't use global variables), and when we do use them, we do so in a cautious and limited manner.

## Strange Python (but now understandable)

### Defining/Redefining/Using a method for a class, AFTER the class has been declared

In python, it is possible to change the meaning of a class as a program is running. Consider the following code:

```Python
class C:
    def __init__(self, init_instance_attr):
        self.instance_attr = init_instance_attr

    def report(self, attr_name):
        print('instance referred to by', attr_name,
              '/instance_attr=', self.instance_attr)
```

Now define the function

```Python
def bump(self,name):          
    print(name,'bumped')      
    self.instance_attr += 1
```

We can add this function to the class `C` by writing the following

```Python
C.__dict__['cbump'] = bump
```

Now `cbump` is a method of class `C` and can be used like other methods



### Defining a method for an instance after the instance has been constructed

Python also allows us to add a reference to the bump method to a single
instance of an object constructed from class C, not the class itself. Consider the following code:

```Python
class C:
    def __init__(self, init_instance_attr):
        self.instance_attr = init_instance_attr

    def report(self, attr_name):
        print('instance referred to by', attr_name,
              '/instance_attr=', self.instance_attr)
```

Now define the function

```Python
def bump(self,name):          
    print(name,'bumped')      
    self.instance_attr += 1
```

We can add bump as a method to an instance of class C by writing the following given the o is an instance of class C

```Python
o.bump = bump;
```

### Combining both worlds using delegation

Consider the following code snippet

```Python
def bump(self,name):
	try:
		self.object_bump(self,name)
	except AttributeError:
		print('could not bump',name)
```

When bump is called here, it tries to call a method named `object_bump` on the
instance it was supplied, passing the object itself to `object_bump`

If that instance defines an `object_bump` function, it is executed; if not, Python raises an attribute exception.

In the world of programming, this is called delegation (which we will see more
of): the bump method delegates to the `object_bump` method (if present) to get
its work done.

## Redefinition of Function Names (or anything else, really)

```Python
def f():
    return 0

def f():
    return 1

print(f())
# Calling f() would return 1 
# there is nothing technically wrong with this code 
#(although the first definition is useless, and ignored by Python

def f():
    return 0

def g():
    return 1

f = g
print(f())
# Calling f() returns 1. Again, def just makes a name refer to a function object;
# if, as in the case of the two definitions of the f name above, the name already
# refers to an object, the binding of f is just changed to refer to the function
# object g refers to
```

Conceptually, it is no different than writing x = 1 and then x = 2 (changing what x refers to from the int object 1 to the int object 2).

## Accessor/Mutator Methods (or query/command methods) and Instance Attributes

If calling o.method(...) returns information about an o's state but does not change o's state, it is called an ACCESSOR (or QUERY).

If o.method(...) changes o's state and returns None (all functions/methods must return some value), it is called a MUTATOR (or COMMAND).

Sometimes, you may want an attribute or method to be privately used as a helper for other interface methods. Python does not support full lock down of attributes and methods. There is a semantical rule, but it is not enforced by Python.

### Single Underscore Prefix

When a programmer uses a single underscore to prefix a name in a class (for data or a method), he/she is indicating  that the name should NOT BE ACCESSED outside of the methods in the class.

### Double Underscore Prefix

If a Python name in a class begins with two underscores, it can be referred to by that name in the class, but not easily outside the class: but it can still be referred to outside the class, but with a "mangled" name that includes the name of the class.

If a class C defines a name `__ia` then the name outside the class
can be referred to as `_C__ia`. This is called a "mangled" name.

## Defining classes in unconventional places

We normally define classes in modules, and often a module does nothing but define just one class (although some define multiple, related classes). Other modules define lots of functions.

We have seen function declare local function (and sometimes return them as a result). A class can also be defined locally in a function and even returned (or an instance of the locally defined class)

```Python
def f(x):
    class C:
        def __init__(self,x):  self.val = x
        def double  (self)  :  return 2*self.val  
    return C(x)
```

## Defining/Using Static Methods in Classes

A method defined in a class is considered "static" if it does not have a self parameter.

```Python
import math

Class Point2d:
    def __init__(self,x,y):
        self.x = x
        self.y = y

    @staticmethod
    def from_polar(dist,angle):
        return Point2d( dist*math.cos(angle), dist*math.sin(angle) )
```

We can call the `from_polar` method with or without an instance. In either way, the method will not know about the instance, only about the class. 

This is useful for defining function that would fit better as a global function, but are tied to closely to a particular class to justify that excess in scope.