# Duck typing and interfaces

## Background

Python is happy to allow us to store any kind of value in any variable we'd like.

```Python
x = 3  
y = 'Boo'  
z = [1, 2, 3]
```

We can potentially change the type of a variable any time we'd like by simply assigning a value of a different type into it.

```Python
x = (1, 2)      # x is now a tuple  
y = 9.5         # y is now a float  
z = 'Alex'      # z is now a str
```

Variables themselves don't have types at all in Python; only the values of those variables have types. If we use a variable after assigning it a value, what we're allowed to do with it

```Python
w = 'Alex'  
print(len(w))   # prints 4  
q = 57  
print(len(q))   # raises an exception, because ints don't have a length
```

In general, Python uses a technique that is sometimes called duck typing when deciding what we can and can't do with the values stored in variables.

If you try to call a method on an object, it's legal so long as that object's class has such a method; it's illegal if it doesn't.

```Python
s = 'Hello'  
print(s.upper())   # no problem, because the str class has an upper() method  
  
class XYZ:  
    def upper(self):  
        return 'Argh!'  
  
x = XYZ()  
print(x.upper())   # also legal, prints Argh!  
  
i = 19  
print(i.upper())   # not legal, because ints have no upper() method
```

Based on the type of the object, the "right thing" will happen automatically.

The same method or the same operator will behave in wildly different ways depending on the type of objects it's called on, but the behavior will always be the "right" behavior for that type, without you having to do anything special to ensure that.

## How duck typing affects the way we write functions

We can write functions and methods that are more flexible than we could before.

```Python
def foo(x, y):  
    return x.bar(y) * 2
```

What must be true about the types of `x` and `y` in order to successfully evaluate a call to `foo(x, y)`?

- `x` must be an object of some class that has a method called `bar` that takes one parameter (in addition to `self`).
- `y` must have a type that is compatible as an argument to `bar`.
- The type of value returned from the `bar` method must be something that can be multiplied by 2

It is legal to call a method on an object and pass it parameters if and only if the object's class has such a method that can accept those parameters.

We can write multiple classes and intentionally give them the same **interface** and then use objects of these classes interchangeably.

## Using duck typing to our advantage

Suppose we wanted to write a function makelist, which is intended to do the same thing that Python's built-in list function does.

```Python
>>> list([1, 2, 3])          # you can pass it a list  
[1, 2, 3]  
>>> list((1, 2, 3))          # you can also pass it a tuple  
[1, 2, 3]  
>>> list({'a', 'b', 'c'})    # or even a set  
['b', 'a', 'c']              # (remember that sets are not ordered)
>>> list(range(5))  
[0, 1, 2, 3, 4]
```

Seeing all of this, you might conclude that makelist would be a difficult function to write, since it needs to take such a wide variety of types of input.

However, all the types share an interface, namely that they are meant to be iterated over. (Can be used in a `for` loop)

```Python
>>> for x in [1, 2, 3]:  
        print(x)  
  
1  
2  
3  
>>> for x in (1, 2, 3):  
        print(x)  
  
1  
2  
3  
>>> for x in range(5):  
        print(x)  
  
0  
1  
2  
3  
4
```

The reason this works is that iteration is always done using the same interface. What makes an object iterable is that it has particular methods with particular names, and these are the methods used for iteration.

Not all object have them, which is why some cannot be iterated over

```Python
>>> for x in 3:  
        print(x)  
  
Traceback (most recent call last):  
  File "<pyshell#28>", line 1, in <module>  
    for x in 3:  
TypeError: 'int' object is not iterable
```

Knowing all of this, we can rely on the same approach to write our makelist function. If something is iterable, we can use it in a for loop.

```Python
def makelist(items):  
    the_list = []  
  
    for x in items:  
        the_list.append(x)  
  
    return the_list
```

```Python
>>> makelist([1, 2, 3])  
[1, 2, 3]  
>>> makelist((1, 2, 3))  
[1, 2, 3]  
>>> makelist({'a', 'b', 'c'})  
['b', 'a', 'c']  
>>> makelist(range(5))  
[0, 1, 2, 3, 4]
```

The key is that our function says `for x in items`, and how Python handles the iteration is by asking to iterate `items`

Depending on the type of `items`, the iteration will be done in the appropriate way automatically, so our function can be blissfully unaware of what types of input it can handle.

