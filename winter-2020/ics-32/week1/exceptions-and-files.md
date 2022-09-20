# Exceptions and files

## What are exceptions?

Some python code fails with an error message instead of producing the result we wanted.

```Python
>>> x = int(input('Enter a number: '))
Enter a number: This is not an integer!  
Traceback (most recent call last):  
  File "<pyshell#0>", line 1, in <module>  
    x = int(input('Hello: '))  
ValueError: invalid literal for int() with base 10: 'This is not an integer!'
```

Why "panic" and give up so quickly?

- In the example above, we wrote a statement that was intended to read an integer from the keyboard and then store it in the variable `x`. If the user types something other than an integer, there's nothing to store in that variable.
- It turns out that Python doesn't just panic and give up immediately. By default, failures cascade and programs crash with a traceback, as we're seeing in this example here.
- The goal, in general, is to differentiate between things that are mistakes in the program — which we can't often do a lot about, other than fix them — as opposed to problems that lie outside of the scope of the program. The latter we can potentially handle, as long as we realize they might happen.

## Understanding the differences between success and failure

When a function is called in Python, that function is being asked to do some kind of job. The function does the job and returns a result.

Many functions accept parameters, which allow the function to do a slightly different job each time it's called

Even assuming that the function is perfectly written, can anything go wrong there? Yes

There are two possible outcomes, even assuming the function has no bugs

- The function will complete its job successfully and return an object of a type you expect.
- The function will fail to complete its job. Functions fail differently than they succeed in Python. Rather than just returning an object that indicates failure, they don't return an object at all, but instead raise an exception.

There's nothing exceptional about exceptions. They're not rare, they're not necessarily indicative of bugs, and they don't cause well-written programs to crash when we can reasonably anticipate them. An exception just means a function failed to complete its job.

## What happens when an exceptions is raised?

An exception that is not handled anywhere in a program will cause a crash and you'll see a traceback, which specifies information about the unhandled exception and where the program was in its execution at the time the exception was raised

```Python
def f():  
    x = 3  
    g(x)  
  
def g(n):  
    print(len(n))  
  
if __name__ == '__main__':  
    f()
```

Running this modules gives the following output

```Python
Traceback (most recent call last):  
  File "C:\Example\oops.py", line 11, in  
    f()  
  File "C:\Example\oops.py", line 3, in f  
    g(x)  
  File "C:\Example\oops.py", line 7, in g  
    print(len(n))  
TypeError: object of type 'int' has no len()
```

Pay attentions to tracbacks, they can tell *what* adn *where* an error occurred

- The type of exception is `TypeError`
- Description of the problem: `object of type 'int' has no len()`
- Exception was actually raised on line 7 in `g`
- `g` was called from `f` on line 3
- `f` was called from line 11

Take that evidence and determine the underlying cause. Given all the information here, it doesn't take long to figure out what happened

- `f()` was called.
- `f()` initialized a local variable `x` to the integer value 3. So `x` had the type int.
- `f()` called `g()` and passed `x` to `g()`'s parameter `n`. So, within `g()`, `n` also had type int.
- `g()` attempted to get the length of `n`. But `n` was an int and ints have no length! The call to `len()` failed — it couldn't do what we asked — so it raised an exception.

If a function raises an exception, control is given back to whatever function called it, which has two options:

1) Handle the exception
2) Not handle the exception and control is given back to whatever function called the caller, who will have the same two options

The cascading failure of functions continues until a function handles the exception, or until all active functions fail, at which point the program will crash and you'll see a traceback

## Catching an exception

Specify what should happen in a function when exceptions are raised by writing a try statement. A try statement is built out of clauses and is structured like this:

```Python
try:  
    statements that will be attempted once  
    if any exception is raised, control leaves the "try" clause immediately  
except:  
    statements that will execute after any statement in the "try" clause raises an exception  
else:  
    statements that will execute after leaving the "try", but only if no exception was raised  
finally:  
    statements that will always execute after leaving the "try", whether an exception was raised or not  
    note that these statements will happen after any in the "except" or "else" that also need to execute
```

Exceptions are Python objects; like all objects, they have a type. An exception's type classifies what kind of failure occurred

You can also define new types of exceptions, which classify kinds of failures that are specific to the programs you write, as opposed to the ones built into Python, which are more general and could apply to many programs.

## Catching only one type of exception

`except` clauses can optionally — and, more often than not, they do — specify a type of exception that they handle. Python only executes except clauses when the type of exception matches the type that the except clause can handle.

Broad `except` statements are generally a bad idea.

```Python
def read_number_and_print_square() -> None:  
    try:  
        number = int(input())  
        print('The square of the number you entered is', (number * number))  
    except ValueError:  
        print('That is not a number')
```

The example aboove will only handle `ValueError` exceptions. Other exceptions are not handled here

## Understanding how and when to  handle exceptions

If `f` fails whenever `g` fails, you won't want to catch the exception in `f`; if `f` could reasonably continue, `f` should catch the exception and then continue its work.

It's more common for a function not to catch an exception than it is to catch it. This is especially true when you tend to write relatively short, simple functions, and break larger, more complex functions into smaller ones

The `finally` clause is primarily used for what you might call cleanup. There is also context managers that do this as well. The cleanup in the finally will always be done.

### Lecture example

```Python
# line_count.py
#
# ICS 32 Winter 2020
# Code Example
#
# This module demonstrates a function that raises an exception and another
# function that catches it.  The program, overall, counts the number of
# lines of text in a text file, by separating the program's functionality
# into self-contained parts:
#
# * A function that takes the path to a file and returns the number of
#   lines of text in it.
#
# * A function that acts as a user interface, both taking input from the
#   user and printing output.  All user interaction happens there.
#
# * A "main" block that makes the module executable as a program.
#
# It also makes a conscious, good choice about the use of memory: rather
# than reading the entire file into memory just so we can count the number
# of lines, we instead read the file one line at a time and count the lines
# as we go.  Even though we've written more code, the program, overall, is
# probably doing roughly the same amount of work; it's just that we're doing
# a little more and the Python library is doing a little less.  But the end
# result is much better, because our program is capable of handling files of
# any size, no matter how little memory we have available to us -- unless the
# entire contents of a very large file are all on a single line (and if we
# were worried about that, we could read the file even more carefully, a
# reasonable number of characters at a time, and count newline characters).



# count_lines_in_file() takes the path to a file and returns an
# integer specifiying the number of lines of text in that file.
#
# Notice that this function does not catch any exceptions, but that it
# still has a "try" statement with a "finally" clause.  That's because
# we're using the "finally" clause to ensure that the file is closed, if
# it was successfully opened, no matter what happens.  For example,
# any of the loop iterations -- each of which reads one line from the
# file -- could raise an exception.  If so, the file will nonetheless
# have been opened, so we'll want to ensure it gets closed.  On the other
# hand, no exception might have been raised, in which case we still want
# to be sure the file gets closed.  A "finally" clause ensures both.

def count_lines_in_file(file_path: str) -> int:
    '''
    Given the path to a file, returns the number of lines of text in
    that file, or raises exceptions in a couple of different
    circumstances:

    * An OSError if the file could not be opened successfully.
    * A ValueError if the file could not be read (e.g., it was not
      a text file, but was instead something else).
    '''

    the_file = None

    try:
        the_file = open(file_path, 'r')
        line_count = 0

        # A "for" loop, when used to iterate over a file, runs one loop
        # iteration for each line of text in the file.
        for _ in the_file:
            line_count += 1

        return line_count

    finally:
        if the_file != None:
            the_file.close()


# You might wonder about the docstring, which specifies that either an
# OSError or ValueError might be raised, yet the names "OSError" and
# "ValueError" do not appear in the function anywhere.  This is because
# these are the errors raised by two things that we're asking Python to
# do for us:
#
# * The built-in open() function raises an OSError whenever it's unable
#   to open the file.  (It may raise a slightly different error instead,
#   but only ones that are more specific versions of OSError.)
# * When we read from the file (in this case, when we iterate over the
#   lines using a "for" loop), that may fail if the file contains
#   something other than text.  Per the Python documentation, this will
#   always raise a ValueError (or, again, something that is a more
#   specific version of a ValueError, such as a UnicodeDecodeError).
#
# An interesting question to ask at this point is why count_lines_in_file
# doesn't catch exceptions, but instead steps aside and lets its caller
# handle them instead.  Wouldn't this function be more resilient if it
# caught the exceptions?  Shouldn't we want our functions to be more
# resilient?
#
# Think about the function's job: It takes the path to a file and returns
# the number of lines of text in that file.  And here's the important
# thing: It can't possibly know where that path came from.  This function
# might be called by the run_user_interface() function below.  But it might
# also be called from the shell, or from code in another module.  There
# might have been a human user, but there might not.  This function's role
# is best kept simple, so it shouldn't make any assumptions about what its
# callers do.
#
# Given that, now we have to ask ourselves another question.  If this
# function doesn't assume anything about where its parameter came from,
# what can it possibly do if the parameter is the path to a file that
# doesn't exist or can't otherwise be opened?  It can't ask the user for
# another path, because there may not be a user.  It can't guess about
# what other file it might try, because there's no reasonable guess.
# All it can do is say "Well, I tried, but I failed!"  Failure to open
# the file is failure to count the number of lines in it, pure and
# simple.  In Python, that means it should step aside and let any
# exception propagate to its caller, who might be more aware of the
# broader context (e.g., is there a user?) and can, therefore, take
# appropriate action.




# This run_user_interface() function provides a simple, console-mode
# user interface that allows the user to choose a file and then
# prints how many lines of text are in the file.
#
# Here, we'll catch an exception raised by count_lines_in_file(),
# because this function is aware of the broader context.  There is a
# user and interaction is being done via the console.  So an appropriate
# thing to do might be to print an error message.

def run_user_interface() -> None:
    '''
    Repeatedly asks the user to specify a file; each time, the number of
    lines of text in the file are printed, unless the file could not be
    opened, in which case a brief error message is displayed instead.
    '''

    while True:
        file_path = input('What file? ').strip()

        if file_path == '':
            break

        try:
            lines_in_file = count_lines_in_file(file_path)
            print(f'{lines_in_file} line(s) in {file_path}')
        except OSError:
            print('Failed to open the file successfully')
        except ValueError:
            print('Failed to read from the file successfully; it is not a text file')


# I should point out here that printing an error message to the console
# is not always what you do when you catch an exception, though it turned
# out to be reasonable enough in this example.  We'll see plenty of examples
# where something else is more appropriate.
#
# Note, too, that we've only caught the two kinds of exceptions we expect
# will be raised by count_lines_in_file: OSError and ValueError.  If anything
# else goes wrong, we're better off not catching *everything*, because then
# a bug in that function (such as misspelling the name of a variable) will
# be hidden from us beneath an opaque error message that just says "Failed".
# Better for those kinds of problems to reveal themselves with full error
# messages that tell us what's wrong, especially while we're still in the
# process of developing our program.



if __name__ == '__main__':
    run_user_interface()
```

