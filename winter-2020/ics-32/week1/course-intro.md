# Course Intro

## Where we've been

### Information vs. Operation

Information is the data your program will work with

- inputs
- intermediate results (variables)
- outputs

Need to know how to take real-world information and map it into a form the Python can use

Operation is what does (with the data)

- writing your own functions
- calling built-in functions

Python only gives syntax errors, incorrect programs only give erroneous output

- order of instruction is important
- structure and organization of code can help

### Types

A data's type *governs* what you can and cannot do with it. It also defines what happens when you do something that is legal

#### Legal

```Python
>>> a = 5
>>> b = 3
>>> a - b
2
```

It is legal to subtract integers from one another

#### Illegal (generates an error)

```Python
>>> a = 'Alex'
>>> b = 'boo'
>>> a - b
Traceback (most recent call last):  
  File "<pyshell#2>", line 1, in <module>  
    a - b  
TypeError: unsupported operand type(s) for -: 'str' and 'str'
```

It simply doesn't make sense to substract one string from another, so Python disallows it

### Data structures

Python has the following built-in data types that you've likely seen

- lists
- tuples
- sets
- dictionaries

Each data structure has a "shape" and problems with that same "shape" can make good use of that data structure

### Control structures

You can achieve conditionality with `if` statements

You can achieve repetition with `for` and `while` loops

### Functions

Used to organize your program into small, relatively independent units of work

They accept *parameters* that control how they behave and always return a single result (`None` if not specified)

In this course, function should

- have a single responsibility
- be relatively short and simple
- functions 10's of lines long should be multiple, smaller functions

### Abstraction

Taking complexity and hiding it beneath a veil of simplicity

Focus on how something is used, rather than how something is implemented

```Python
>>> '{} {}'.format('Boo', 999)  
'Boo 999'  
>>> '{:.2f}'.format(3)  
'3.00'
```

Probably never though about how the format method is implemented (because you don't need to), only focused on how to use the format method

Abstractions like this allow for bigger and more complex software to exist

## Where we're going

### Software libraries

A software library is a collection of functions that are already implemented to solve a particular kind of problem. It's a set of operations (and maybe even some information).

Give access to functionality that might otherwise be hard or costly for you to build on your own.

That price is vastly lower than the price of building the same code from scratch

### Python's standard library

Most programming languages include some kind of standard library, which provide a range of features that are available to any program written in that language. Python is no exception to this

- Want to write a program that stores and operates on calendar dates and times of day, with appropriate handling for details like leap years, time zones, leap seconds, and so on?
- Want to write a program that generates seemingly random data or behavior, like a game in which non-player characters behave in unpredictable ways?
- Want to manipulate the files on a hard drive, moving them from one folder to another, deleting ones that are older than a certain date, or whatever else?
- Want to write a program that unzips a zip archive?
- Want to write a program that sends tweets via Twitter or pictures via Instagram? (This isn't built in directly, per se, but the raw materials you'd need to build this fairly easily are available.)
- Want to draw graphics or animations?
- Send emails?
- Build web pages?
- Manipulate sounds?
- Store information in a database and search for it later?

We will see how to recognize which parts of a problem have solutions in the standard library, as opposed to the parts we'll have to write ourselves.

### Extending your Python skills

Become more capable programmers, in general.

In previous coursework, that Python programs are built around interaction with *objects*. Objects have types, and their types determine what operations can be performed on them.

We introduce new types, new kinds of objects with new sets of operations that are specific to a particular problem. This is done by writing a *class*

Functions can fail, not just because they've been written incorrectly, but because their success depends on a factor beyond their control

- getting input that's in a particular format or in a particular range
- needing a hard drive to be operational
- requiring a wireless network connection to be active
- depending on a computer in another part of the world being up and running

To account for these kinds of scenarios, we'll learn more about exceptions in Python: how to handle them when we can do something sensible about them, and how to raise them when a function we've written encounters a failure.

As the programs you write get larger, it becomes more important to consider how to organize not just individual functions, but also how to organize collections of related functions into separate modules

Another thing that becomes more difficult as programs get larger is testing. How do you know if your program is correct? How do you ensure that changes to one part of your program don't render other parts incorrect, even if they used to work fine? Of course, there are ad hoc ways to try to solve this problem — repeatedly running your program and trying out various aspects of its functionality — but this is boring, repetitive work

### A word of warning

I'll be asking you to solve this quarter are quite a lot larger than the ones you solved in previous coursework. There are techniques for managing that complexity, and we'll talk about them early and often

Almost no one who has every detail of every library call memorized. In fact, I'd argue that you shouldn't even want that level of memorization, as it serves little purpose