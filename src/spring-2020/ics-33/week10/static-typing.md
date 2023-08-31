# Static typing

Static typing in a programming language means that the translator can determine the type of any variable/parameter/expression/return-type at the time the code is translated from the higher-level programming language.

## A simple example

### Python

When we define names we do not specify their types, likewise in function definitions we do not specify the types of parameters or their return types.

We can annotate these (even name defintions, such as x : int = 3), but the Python translator does not automatically use these annotations for any purpose

```Python
x = 1	  # could write x : int = 1    	  
y = 'a'	  # could write y : str = 'a'  	   
if x < y
```

The Python translator

1) Translates this code to run on the Python Virtual Machine
2) The Python run-time system runs it

If, Python discovers that it cannot compare an int and a str with the < operator (it tries and fails using the dunder methods for both types) and raises an exception.

### Java

```Java
int x = 1
String y = "a"
if x < y ...
```

The Java translator

1) Translates this code and discovers that there is no way that x should be rebound to 'b' because that would violate the type specification

## Syntax errors

Syntax errors are discovered identically in both languages. If we had mispelled the keyword `if` as `iff`, Python would discover the error while translating the code and report it by showing that line of code; Java would likewise discover and report the error.

## Unexecuted code will never fail

Examine the following code. Assume that block1 in both languages contains perfectly legal code. Note that the print statements in the else part of the if are illegal, because neither language can add an int to a str.

### Python

```Python
x = 1	  # could write x : int = 1
y = 'a'	  # could write y : str = 'a'
if x == 1   	  	    	  	   
  block1 - any code 			     
else:					   
  print(x+y)
```

The Python translator

1) translates this code
2) the Python run-time system runs it: because `x == 1 is True`, block1 is executed (and the print is not), so there are no errors.

### Java

```Java
int x = 1
String y = "a"
if (x == 1) {
  block1 - any code
}else{
  System.out.println(x+y)
}
```

The Java translator

1) Translates this code and discovers that trying to add and int and String is not legal (whether or not it will execute the code: it doesn't know at compile-time; OK, here it knows x == 1, but what if we prompted the user for x instead). So, Java specifies a compile-time error.

## Some runtime errors are not type errors

Note that both language would raise an exception if we indexed a list illegally or tried to divide by 0. Static typing cannot detect those kinds of errors. So, some errors at run-time can occur in both Java and Python.

## General expressions

Because Java knows the types of all variables (and it knows the types of constants) and the types of all function parameters/return types at compile-time, it knows the types of all values computed

## Lists in Python, Arrays in Java

Lists in Python are heterogeneous: they can contain different types, e.g., `[1, 'a']`

But in Java, arrays (the closest thing to lists) are homogenous: they contains the same type.

Homogenity is required required. Python lists are thus more general.

> In Java we can define an array using a base class; the array can store any
  classes derived from the base class. But as far a type-checking is concerned,
  all Java can guarantee is that each element in the list is an instance of the
  base class. So this approach helps, but not a lot.

## Python in the future

Python is moving more towards using/checking static typing wherever it can (it already has the syntax to allow annotatations of everything), but will never implement fully static typing.

The concept of static-typing can be absent, be checked  at some level, or be checked completely depdending on the programming language.