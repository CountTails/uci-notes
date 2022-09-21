# Modules

## Python programs that span multiple files

## What are modules?

We write our code as text and store that text in files. To differentiate these files easily from others, we use the extension .py on their filenames

As programs grow beyond a certain size, it becomes important to split them up into separate files of a practical size, rather than writing them as one giant file.

It becomes easier for more than one person to work on it simultaneously without one person's changes stomping on another's

A Python module is a file with a name ending in .py that contains a collection of definitions.

powers.py

```Python
def square(n: 'number') -> 'number':  
    return n * n  
  
def cube(n: 'number') -> 'number':  
    return n * n * n
```

If you load this particular module in IDLE and execute it (by pressing F5), it'll appear that nothing has happened; you'll simply see a standard Python interpreter prompt, but no other output. But you will be able to use the definitions you've just loaded

```Python
>>> square(3)  
9  
>>> cube(4)  
64
```

## Namespaces

A running Python program, particularly a large one, might have a very large number of names that it knows: the names of variables, functions, parameters, constants, classes, and so on.

In Python, there isn't just one big global set of names. And, in fact, you probably know that already, because you've no doubt already encountered the idea of scope in the context of functions.

Python must already provide a way to organize its names, so it can differentiate between the names that are local to one function and the names that are local to another.

When we ask to print the value of x, where is x? The answer is "It depends", and Python looks in a few places.

- Python looks in the local scope first. If there's a local variable or parameter in this function called x, that's the x that gets printed.
- Failing that, Python looks in the module's global scope next. In other words, it looks to see whether there is a global definition of x (e.g., a global variable) in this module; if so, that's the x that gets printed.
- Failing that, Python looks in the built-in scope next, which is to say that it checks whether there's a built-in definition — some functions, like len() and open() are "built-in" in this way. If so, that's the x that gets printed.
- Failing all of these, the attempt to print x fails by raising a NameError, since x is not defined anywhere that Python has looked.

## Importing modules

When you want one module's definitions to be available to another, it becomes necessary to import that module.

Importing a module causes the code in that module to execute — so, for example, if it contains five function definitions, those functions are now defined — and then makes its definitions available to the module that imported it.

example.py

```Python
import powers  
  
def read_and_square() -> None:  
    number = input('Number: ')  
    number_squared = powers.square(number)  
    print('The square of that number is {}'.format(number_squared))
```

The first place that Python looks when you import a module is the directory the file that has the import statement is in.

If it's not there, there are a few other places Python will look — and you can even configure this list, as it turns out.

Note that the only way we can access the functions in powers from within example is to qualify the name (e.g., `powers.square`)

There is a variant of the import statement, though, that dumps individual definitions from within one module into the global namespace of another.

example2.py

```Python
from powers import square  
  
def read_and_square() -> None:  
    number = input('Number: ')  
    number_squared = square(number)  
    print('The square of that number is {}'.format(number_squared))
```

This causes Python to add `square` directly to the global namespace of example2. This means that code in example2 can now simply refer to it as `square`, without having to qualify it as `powers.square`.

## Executable modules

The names of modules are indicated by their filenames; a module written in a file boo.py has the name boo.

When you execute a module in Python (i.e., by pressing F5 in IDLE), it's given the special name __main__ while it runs.

This little fact can be a useful way of differentiating between whether a module has been executed (i.e., is it the "entry point" of a program?) or whether it's been imported.

To facilitate this distinction, we can simply check the module's name by accessing the __name__ variable. If its value is `'__main__'`, the module has been executed; if not, the module has been imported.

## Public vs. private definitions

In a module that contains a collection of definitions, we can divide them clearly into two groups:

- Definitions that you expect other modules to need in order to solve their problems.
- Definitions that are only intended to be used as utilities within a module, to allow the writer of that module to break up what might otherwise be large, complex definitions (e.g., a complicated function) into smaller pieces.

The definitions in the former category are often called the public definitions; the definitions in the latter category are often called the private definitions.

They connote an idea of whether something is available from the perspective of code outside of the module.

One handy default is to think of everything as private unless it needs to be public, but this can be a bit of a nuanced distinction, and we'll see plenty of examples throughout the rest of this course that will make it easier for you to decide which is which.

### How to distinguish between public and public

Python does not make explicit the distinction between "public" and "private"; there's no special keyword or style you can use that will explicitly enforce a function's "privateness" within a module,

It turns out that there is a well-known naming convention that's long been in use.

Python programmers traditionally separate the "public" from the "private" by prefixing the names of "private" definitions with a single underscore ('\_') character.

### Some sensible style and design guidelines

The definitions in your modules should have what software engineers call high cohesion and low coupling.

- Cohesion refers to the extent to which the definitions in a module are related to one another; high cohesion means that they're highly related.

- Coupling is the extent to which one module's code relies on the details of others; low coupling means that each module relies on individual details of the others as little as possible

There are limitations on the names we can use for the files that contain our modules. In particular, the filenames have to be legal Python identifiers with .py appended to them

- Modules must be written in files whose names are made up entirely of lowercase letters and (optionally) underscores separating words, with the filenames having the extension .py.
- Your modules should not have code that has an observable effect when imported.
- For modules that you intend to be executable (i.e., the ones that comprise a program's "entry point"), you can put code into an if `__name__ == '__main__'`: block to get them started.
- Always distinguish properly between public and private definitions in your modules.
