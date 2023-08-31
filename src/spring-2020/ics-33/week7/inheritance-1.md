# Inheritance 1: Single

## Class inheritance in Python

To get to full object-oriented programming, we must also learn how to define derived classes from base classes (aka create subclasses from superclasses)

All classes are defined in an inheritance hierarchy and learn how finding attributes of objects is generalized:
  
1) looking for an attribute in the namespace of instance objects
2) looking for an attribute in the namespace of the class the object was constructed from (we already know these two rules)
3) searching the classes in the inheritance hierarchy, looking in the namespaces of each, in turn, until the attribute is found or there are no more classes to examine.

```Python
class C:
      pass
```

Note the lack of parentheses after the class name `C` (just a colon). This means that the class `C` is implicitly a class derived from the "object" class

```
     object
       ^
       |
       C
```

We can specify this relationship explicitly

```Python
  class C(object): # any class name can go in the paranthesis
      pass
```

Each class "KNOWS" its base class(es), but a class DOES not "KNOW" its derived class(es): the arrow is one way.

## The fundamental equation of OOP

We now generalize this look up mechanism for single-inheritance hierarchies:

1) Python first tries to find the attribute in the instance object.
2) If Python fails, it next tries to find the attribute in the class object from which the instance was constructed (the type function provides this information: we can compute the class from which any objects is constructed).
3) If Python fails, it tries to find the attribute in the base class of the class from which the instance was constructed;
4) If Python fails, it next tries to find it in the base class of that class,... and continues until it reaches the object class at the root of the inheritance hierarchy.
5) If Python fails to find the attribute in the object class, it calls `__getattr__` in the original class of the object (and if it is not there, it repeats searching for that method in the hierarchy). The object class at the root of the hierarchy defines `__getattr__` to raise an `AttributeError` exception.

```
  
                                     object                <-- looks here last
                              (root of hierarchy)
                                        ^
                                        |
                                       ...
                                        ^
                                        |
                                      class		   <-- looks here 3rd
                                        ^
                                        |
Look here 1st -->      o    -->       class		   <-- looks here 2nd
                  (instance)   (o constructed from)
                                        ^
                                        |
                                      class		   <-- doesn't look here
                                        ^
                                        |
                                      class		   <-- doesn't look here
```

## A very simple but representative example

Base class

```Python
class Counter:                   # implicitly use object as its base class
    hierarchy_depth = 1		 # object is at depth 0, Counter is 1 beneath it
    counter_base = 0  		 # track how often Counter.__init__ is called

    def __init__(self,init_value=0):
        assert init_value >= 0,\
            'Counter.__init__ init_value('+str(init_value)+') < 0'
        self._value = init_value
        Counter.counter_base += 1    # Increment class variable on __init__ call

    def __str__(self):               # str of Counter is str of its _value
        return str(self._value)
        
    def reset(self):                 # reset of Counter assigns _value = 0
        self._value = 0
        
    def inc(self):                   # inc(rement) of Counter increments _value
        self._value += 1
        
    def value_of(self):              # value_of Counter is _value (an int)
        return self._value 
```

Subclass

```Python
class Modular_Counter(Counter): # explicitly use Counter as its base class
    hierarchy_depth = Counter.hierarchy_depth + 1 # 1 more than Counter's depth
    counter_derived = 0         # how many times Modular_Counter.__init__ called

    def __init__(self,init_value,modulus):
        assert modulus >= 1,\
            'Modular_Counter.__init__ modulus('+str(init_value)+') < 1'
        assert 0 <= init_value < modulus,\
            'Modular_Counter.__init__ init_value('+str(init_value)+') not in [0,'+str(modulus)+')'
        Counter.__init__(self,init_value)
        self._modulus = modulus
        Modular_Counter.counter_derived += 1    
    
    def __str__(self):
        return Counter.__str__(self)+' mod '+str(self._modulus)
        
    # Note, calling self.value_of() and self.reset() is equivalent to (and
    #   preferred to) calling Counter.value_of(self) and Counter.reset(self)
    # But it is critical that Counter.inc(self) is called that way, because
    #   calling self.inc() would be an infinitely recursive call to inc.
    def inc(self):
        if self.value_of() == self._modulus - 1:
            self.reset()
        else:
            Counter.inc(self)
        
    def modulus_of(self):
        return self._modulus
```

## The `Counter` base class

The `Counter` class defines two class attributes that are shared by all Counter objects: `hierarchy_depth`, which doesn't change, and `counter_base` which is incremented each time `__init__` is called. The `Counter` class also stores the class method names `__init__`, `__str__`, `reset`, `inc`, and `value_of`.

```Python
c = Counter(0) 	    	 # OK
print(c.hiearchy_depth)	 # prints 1 (because c = ...; FEOOP for data attribute)
print(c.counter_base)	 # prints 1 (because c = ...; FEOOP for data attribute)

c.inc()			 # OK; uses FEOOP to call method attribute
c.inc()			 # OK; uses FEOOP to call method attribute
c.inc()			 # OK; uses FEOOP to call method attribute

print(c)		 # prints 3 via calling str/__str__ on c, using FEOOP
print(c.value_of())	 # prints 3 via calling str(c.value_of()), using FEOOP
```

The pictorial memory would look like

```
                        type
 Counter         (------------------)
  +---+          |  hierarchy_depth |      int
  | --+--------->| +------+         |     (---)
  +---+          | |   ---+---------+---->| 1 |
                 | +------+         |	  (---)
                 |                  |
                 |  counter_base    |      int
                 | +------+         |     (---)
                 | |   ---+---------+---->| 0 |
                 | +------+         |	  (---)
                 |                  |
                 |                  |
                 |  __init__        |    function
                 | +------+         |     (---)
                 | |   ---+---------+---->|   |
                 | +------+         |	  (---)
                 |                  |
                 |  ... all the     |
                 |  other methods   |
                 |                  |
                 (------------------)

                  Counter
   c            (----------)
 +---+          |  _value  |      int
 | --+--------->| +------+ |     (---)
 +---+          | |   ---+-+---->| 0 |
                | +------+ |	 (---)
                (----------)
```

## The `Modular_Counter` derived class

a `Modular_Counter` **IS-A** special kind of Counter. Generally, class B should be derived from class A if B **IS-A** special kind of A. We will classify every Class attribute usable in the
derived class as

1) a new attribute defined in the derived class: not an inherited attribute
2) an inherited attribute: not defined/overridden in the derived class
3) an inherited attribute: (re)defined in the class OVERRIDING an inherited one

## Avoiding infinite recursion in methods

```Python
def __str__(self):
    return Counter.__str__(self)+' mod '+str(self._modulus)
```

```Python
 def __str__(self):					                # WRONG
    return str(self)+' mod '+str(self._modulus)     # WRONG
```

So generally, in a method that OVERRIDES an INHERITED method, if we want to call the INHERITED method inside it, we must preface it with the class in which the inherited method is to be called.

```Python
def __str__(self):
    return super().__str__()+' mod '+str(self._modulus)
```

we can also call `super()` to call a method in the base class implicitly. Python then chooses which inherited method to use. 

## Inheritance design rules

If a class adds a data attribute (state) to an object (mostly in __init__) then only THAT class is allowed to access that state directly as an attribute.

To solve this problem, each class should define methods to access/set all the attributes it defines. That is why in there are reset/inc/value_of methods in the Counter class

1) If a class adds an attribute to an object (e.g., in __init__) then methods defined in only that class should access the attribute directly by name.
2) If other classes (including derived/subclasses) need to access/update theinformation stored in that attribute, then the class defining the attributeshould also define METHODS that do these jobs, which the other class should call.

> Python allows any code to access all the attributes in an object by writing self.attribute.  But we should USE SELF CONTROL".

