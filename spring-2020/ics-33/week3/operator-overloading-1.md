# Operator Overloading 1

Most of these methods (but not all) are invoked by Python operators (whose first arguments are instances of the class that they are defined in) so we call this technique "operator overloading"

Overloading has a good, not bad, connotation here. By studying operator overloading, we will better understand how Python executes our programs, and be able to write classes that are more powerful, by exploiting our understanding of this mechanism.

We will illustrate each overloaded operator simply with methods defined in a "simple" class, Vector.

## `__init__`

Recall that when you "call the class" (write the class name followed by parentheses), you can supply it with some arguments. 

Python creates an object (something that has an empty namespace/`__dict__`) for the instance of the class and then calls __init__ with self as the first parameter

```Python
class Vector:
    def __init__(self,*args):
        self.coords = args
```

`self.coords = args` establishes a new attribute name in the namespaceof the constructed object and initializes it to the tuple args.

We don't call `__init__` directly, but Python does, automatically, when we "call the Vector class" to construct a new object from that class.

## `__len__`

We can call the len function on any object. It translates into a call of the
parameterless `__len__` method on the object.

```Python
def len(x):
    return x.__len__()
```

Some objects do no define a `__len__` method (like `int`)  so calling `len()` on such objects cause Python to raise an exception.

Python requires that the len function always return an integer value. So the `len()` function must check if the `__len__` method returned an `int`

```Python
class Vector:
    def __init__(self,*args):
        self.coords = args

    def __len__(self):
        print('Calling __len__')
        return len(self.coords) #NOT recursive, calls tuple.__len__
```

## `__bool__`

Whenever Python needs to interpret some object as a boolean value, it calls the
parameterless method `__bool__` on the object.

Consider the following function

```Python
def test(x):
    print('x\'s boolean equivalent is ')
    if x:
        print(True)
    else:
        print(False)
```

This function will work (not raise an exception) if x is an instance of our Vector class.

The actual rule in Python for evaluating an object as follows

1) first try to call `__bool__` on the object. 
2) If the `__bool__` method is not present, check whether the object's len is != 0 by calling the objects `__len__` method.
3) If there is no `__len__` function Python just returns True. (a result from inheritance).

But suppose that we want to interpret vectors as boolean values differently. Say, it is True if any of the coordinates in self.coords is not 0

```Python
class Vector:
    def __init__(self,*args):
        self.coords = args

    def __len__(self):
        print('Calling __len__')
        return len(self.coords)

    def __bool__(self):
        print('Calling __bool__')
        return any( v!=0 for v in self.coords )
```

### Short circuit operators

The operators and/or are called short-circuit operators, because unlike other operators (which evaluate both of their operands before being applied), short- circuit operators evaluate only their left operand first, and sometimes don't need to evaluate their right operand.

- True or ... is always True
- False and ... is always False

This save execution time since the right operant need not be evaulated as a boolean value, but it can also save your program from certain death.

```Python
if k in d.keys() and d[k] == 0:
      ....
```

Short circuit operators will not evaluate `d[k] = 0` if `k in d.key()` is False. This prevents a `KeyError` from needing to be handled and gets rid of an extra try-except block.

Note that "not" has only one operand, so there is no way to short-circuit it.

## `__repr__` and `__str__`

Python can call two methods that should return string representations of an object.

The `__str__` method is called when the conversion function str is called. If there is no `__str__` method in the argument's class, Python tries calling the `__repr__ `method as a backup to produce the string.

If there is no `__repr__` method, Python reverts to its standard method for computing a string value for objects: `<__main__.Vector object at 0x027CE470>`

The convention for `__repr__` is that it returns a string, which if passed as the argument to the eval function, would produce an object with the same state. 

```Python
 def __repr__(self):
    return 'Vector('+','.join(str(c) for c in self.coords)+')'

def __repr__(self):
    return 'Vector({})'.format(','.join(str(c) for c in self.coords))
```

Similar to the `len` function, Python requires that the `str` function
always return a str value.

```Python
def str(x):
    answer = x.__str__()
    if type(answer) is not str:
        raise TypeError('__str__ returned non-string (type '+type_as_str(answer)+'))
    return answer
```

`__str__` should return a string that nicely formats interesting aspects (maybe
all attribute names, maybe not) of the object.

```Python
def __str__(self):
    return '('+str(len(self))+')'+str(list(self.coords))      # using +
    #return '({d}){c}'.format(d=len(self),c=list(self.coords)) # using format
    #return f'({len(self)}){list(self.coords)}'                # using f string
```

There is no convention for the result that `__str__` returns (except that it must be a string), we can use our judgement as to how best to show the string representation of objects

Finally, other conversion methods include

- `__int__`  
- `__float__`  
- `__complex__` 
- `__oct__`  
- `__hex__`
- `__trunc__`

They must return an object of the type they intend to convert our object from.

## Relational operators

The most important thing to know is that Python translates any occurrence of a relational operator into a call on the appropriate method for its LEFT operand.

### Comparing object of the same class

There is no built-in meaning for comparing an object of class/type Vector
with any object of any type.

But, by defining a `__lt__` method in Vector, there is a method for Python to call when it needs to compute the < operator on two operands, whose left/first operand is an instance of the Vector class

```Python
def distance(self):
    return math.sqrt( sum( v**2 for v in self.coords ) )

def __lt__(self,right):
    return self.distance() < right.distance()
```

The second parameter for `__lt__` can be any name. Also note that since we use < in `Vector.__lt__`, it is NOT recursive. Python will evaluate the left operand, and apply the `__lt__` from the left operand's type. 

With `__lt__` alone, Python is able to evaluate both < and > when the left operand is a Vector. For >, Python tried to call `Vector.__gt__(x,y)` but an exception is raised internally because `__gt__` is not defined in Vector.

Since x > y is true exactly when y < x is true, Python tries to evaluate y < x, which means
`Vector.__lt__(y,x)` which we defined above and successfully computes its answer

For the `__le__` and `__ge__`, the same principle applied. We only need to define one so Python can get the answer for both operators.

Finally, for the == operator, if we don't define an `__eq__` method, Python
substitutes the "is" operator.

Unlike the other pairs, in this pair, an undefined `__ne__` method calls `__eq__` but an undefined `__eq__` **WILL NOT CALL** `__ne__`, it uses the "is" operator.

Recall that the "is" operator is called the object-identity operator. It evaluates to True when its left operand refers to the **SAME OBJECT** as its right operand.

The == operator (when present) should compare objects by their state.

```Python
def __eq__(self,right):
    return self.coords == right.coords
```

To get all six relational operators to work correctly for comparing two objects of the same class, we can define all six or choose one of `__lt__`/`__gt__`, one of `__le__`/`__ge__`, and always `__eq__` to define

Note that although Python doesn't do it, we can implement all the relational
operators using only one of the methods and some logical operations.

| Relation |  < only + logical operators |
|----------|----------------------------|
| x <  y |  x <  y |
| x >  y | y <  x |
| x <= y | not (y < x) |
| x >= y | not (x < y) |
| x == y | not (x < y or y < x) |
| x != y | x < y or y < x |

### Comparing objects from different classes/types

Comparing a vector to something else, like an integer, won't work because we currently assume we can call the distance function on the right parameter.

If it makes sense to compare a vector to another type, we can use conditional statements to dictate what should be done for particular types of right operands

```Python
def __lt__(self,right):
	if type(right) is Vector:
		return self.distance() < right.distance()
	elif type(right) in (int,float):
		return self.distance() < right
	else:
		return NotImplemented
```

If the type of right object is Vector, we do the standard comparison we
did before. 

If the type is either int or float, we perform the necessary call (on the distance method only for the Vector) before doing the standard numeric comparison with the right, which we know is a numeric value

If `type(right) ` is neither Vector nor int nor float, we return the value NotImplemented, meaning trying to do the comparison is not valid (signalling Python to see if it can try to compute this relational operator another way)

If we extend `__lt__` to cover a right argument that is an int (as we did above) and do not define an explicit `__gt__` method similarly, then Python will try, but fail to compute `print(x > 15)` correctly.

This is because after the arguments are swapped, Python will be trying to compare the built-in int to a Vector, which is of course, not supported by the int class.

If we define a `__gt__` method as follows

```Python
def __gt__(self,right):
    return right < self # or right.__lt__(self) or Vector.__lt__(right,self)
```

We get an infinite loop....

If we define a `__gt__` method as follows

```Python
def __gt__(self,right):
	if type(right) is Vector:
		return self.distance() > right.distance()
	elif type(right) in (int,float):
		return self.distance() > right
	else:
		return NotImplemented
```

Then `x > 15` will work.

The int/float classes are built into Python and were written BEFORE we wrote the Vector class, so they know nothing about comparing ints/floats to objects constructed from the Vector class. And, we cannot change the int/float class to compare against objects constructed from the Vector class.

## Unary arithmetic operators

Continuing with overloading operators, when Python recognizes a unary arithmetic operator (or a binary arithmetic operator, see the next section) it translates it into the appropriate method call for the class/type of its argument

Suppose that we wanted the __neg__ operator for Vector to return a Vector object with all of its coords negated. Generally, as described above, `__neg__` **SHOULD NOT MUTATE ITS OPERAND** but should leave its operand unchanged and return a new Vector object

```Python
def __neg__(self):
    return Vector( *(-c for c in self.coords) )
```

In addition, while discussing arithmetic here, the following unary functions abs, round, floor, ceil, trunc work by calling one of these special methods on its argument (much like len, described above)

## Binary arithmetic operators

Binary arithmetic operators, like relational operators, are written in between their two operands. Python translates the call x + y into x.__add__(y) and then by FEOOP into `type(x).__add__(x,y).`

As with the relational operators and unary arithmetic operators, neither operand should be mutated, and the method should return a new object initialized with the correct state.

```Python
def __add__(self,right):
	if type(right) is not Vector:
		return NotImplemented
	assert len(self) == len(right), 'Vector.__add__: operand self('+str(self)+') has different dimension that operand right('+str(right)+')'
	return Vector( *(c1+c2 for c1,c2 in zip(self.coords,right.coords)) )
```

Two allow `+` to be used between vectors and other classes (like int/float)

```Python
def __add__(self,right):
	if type(right) not in (Vector,int,float):
		return NotImplemented
	if type(right) in (int,float):
		return Vector( *(c+right for c in self.coords) )
	else:
		assert len(self) == len(right), 'Vector.__add__: operand self('+str(self)+') has different dimension that operand right('+str(right)+')'
		return Vector( *(c1+c2 for c1,c2 in zip(self.coords,right.coords)) )
```

However, if we try to add a vector to say an integer, the above method won't work becuase Python calls `int.__add__(1,v)` and the int class has no clue about objects of the Vector class

For relational operator, Python was able to do some guess work to get this to work. This will not work for binary arithmetic operators becuase Python cannot always find an equivalent operator to transpose the operands.

For every binary arithmetic operator, Python also allows us to define a "right" (sometimes known as "reversed") version of it: where the method name is prefixed by an r

```Python
def __radd__(self,left):
	if type(left) not in (int,float):               # see note (1) below
		return NotImplemented
	return Vector( *(left+c for c in self.coords) ) # see note (2) below
```

When Python evaluates 1+v, it translates it into 1.__add__(v) and then by FEOOP into tries `int.__add(1,v)`; it doing so returns `NotImplmemented` or raises an exception because the int class doesn't know how to operate on Vector operands.

Python translates the + into `v.__radd_(1)` and into `type(v).__radd__(v,1)` using "right/reversed-operand dispatch". This methods determines what to do if the left operand is an int/float.

## Incrementing arithmetic delimiters

Here is an example of `__iadd__` for our vector class

```Python
def __iadd__(self,right):
	if type(right) not in (Vector,int,float):
		return NotImplemented
	if type(right) in (int,float):
		return Vector(*(c+right for c in self.coords))
	else:
		assert len(self) == len(right), 'Vector.__add__: operand self('+str(self)+') has different dimension that operand right('+str(right)+')'
		return Vector(*(c1+c2 for c1,c2 in zip(self.coords,right.coords)))
```

Because Vectors are immutable, this method goes through exactly the same code
as executing x = x + y. if x is mutable, like a list? The list class specifies the following `__iadd__`

```Python
def __iadd__(self,right):
	self.extend(right)
	return self
```

So for mutable objects, we might want to implement `__iadd__`to produce an
equivalent result more efficiently. 

If the object is immutable, or there is no faster way to compute it, we can omit defining `__iadd__` and let Python compute the result using the `__add__` method.
