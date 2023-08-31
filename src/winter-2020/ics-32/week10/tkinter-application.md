# Tkinter application

## Background

Setting up a tkinter application requires three basic tasks:

1) Creating the widgets we'll need in our window.
2) Specifying how those widgets will participate in a layout (i.e., Where should they be displayed, and how does that change as the size of the window changes?).
3) Decide what events we need to handle and set up our event handlers to be notified when they occur.

We should want to keep the "model" and the "view" separate. Even though we're using a different library for it, we're still writing a program with the same basic structural characteristics.

Model/view separation leads to all kinds of benefits, not the least of which is it also opens an avenue to using the [test-driven development techniques](../week7/test-driven-development.md) we learned previously.

The view can be built and tested the "old fashioned" way, which is to say that we'll build it and interact with it manually to make sure it's working properly.

## The implication of functions in Python objects

We've seen previously that functions in Python are objects. This allows us to store them in variables, pass them as parameters, and so on.

```Python
def square(n: 'number') -> 'number':  
    return n * n

def apply_to_all(f: 'one-argument function', elements: list) -> list:  
    results = []  
  
    for element in elements:  
        results.append(f(element))  
  
    return result
```

We could pass functions as parameters like so

```Python
>>> L = [1, 2, 3, 4, 5]  
>>> apply_to_all(square, L)  
[1, 4, 9, 16, 25]
```

When we passed the `square()` function as a parameter, we didn't follow it with parentheses; we simply named it.

We don't want to call the function and pass its result to `apply_to_all()`; instead, we wanted to pass the function itself, with the understanding that `apply_to_all()` was going to call it for us.

## Functions that build and return functions

1. You can pass objects as arguments to functions.
2. Functions are objects.

If functions are objects, then it stands to reason that we should be able to use them in other ways that objects are used.

So, if you can return objects from functions, can you return functions from functions? (Yes!)

If you wanted to automate the task of building functions — because you wanted to build lots of similar functions that were different in only a small way — you could do so by writing a function that takes whatever arguments are necessary to differentiate the functions from each other, build one of them, and return it to you.

```Python
def make_duplicate_printer(count: int) -> 'function(str) -> None':  
    def print_duplicates(s: str) -> None:  
        for i in range(count):  
            print(s)  
  
    return print_duplicates
```

- The `def` keyword creates a function and then stores it in (more or less) a variable. When we do that at the "top-level" of a module.
- So, the first thing `make_duplicate_printer` does when you call it is create a new function and store it in a local variable called `print_duplicates`
- At the time `make_duplicate_printer` is building `print_duplicates`, there will be a value of `count` — this only happens during a call to `make_duplicate_printer.` So any variable available to `make_duplicate_printer` is also available to `print_duplicates`.
- The newly defined function will then be returned to the caller of `make_duplicate_printer`.

```Python
>>> make_duplicate_printer(3)  
<function make_duplicate_printer..print_duplicates at 0x00000168A5171E18>  
>>> x = make_duplicate_printer(3)  
>>> type(x)  
<class 'function'>  
>>> x('Boo')  
Boo  
Boo  
Boo  
>>> make_duplicate_printer(4)('Boo')  
Boo  
Boo  
Boo  
Boo
```

Notice that if we ask its type, we see that it's a function. And, since it's a function, we can call it by following its name with parentheses and passing it an argument.

## Methods are functions, but can become bound methods

 Suppose we have this class, similar to one from a previous code example.

```Python
class Counter:  
    def __init__(self):  
        self._count = 0  
  
    def count(self) -> int:  
        self._count += 1  
        return self._count  
  
    def reset(self, new_count: int) -> None:  
        self._count = new_count
```

Given that class, we've seen before that we can call its methods in one of two ways:

```
>>> c = Counter()  
>>> c.reset(3)  
>>> Counter.reset(c, 3)
```

But what if we leave out the parentheses, like we did with the `square()` function previously? Then things get more interesting.

```Python
>>> Counter.reset  
<function Counter.reset at 0x02E23030>  
>>> c.reset  
<bound method Counter.reset of <__main__.Counter object at 0x02E21670>>
```

- `Counter.reset` returns a function object, just like `square` did.
- `c.reset` returns a bound method object instead.

```Python
>>> x = Counter.reset  
>>> x(c, 3)  
>>> y = c.reset  
>>> y(3)
```

The first two lines set a variable `x` to be the `Counter.reset` function and then call it. That function requires two arguments, so if we want to call it, we have to pass both `self` and `count`

The second two lines set a variable `y` to be the bound method `c.reset` instead. That bound method requires only one argument, since `self` has already been bound to `c`, to we call it by passing it the one argument

## Writing object oriented GUIs

Some kinds of event handler functions take no parameters; most take a single parameter, an event object that describes the event.

They might know something about the event that's occurring now, but won't have access to any other information about what's happened before.

We've seen before that classes are a way to bring together data and the operations that know how to manipulate that data. The objects you create from classes don't just store things; they know how to do things with the data they store.

So long as the necessary information is stored in the object's attributes, it will be available in event handler methods

## Using bound methods as event handlers

To use a method as an event handler, it needs to be a bounded method, where `self` is already defined.

This give the event handler the following information

- Information about the event that's happening now, in the form of an event object
- Any necessary information about things that have happened before, stored in the attributes of `self`

## The code

### calculator_app.py

```Python
# calculator_app.py
#
# ICS 32 Winter 2020
# Code Example
#
# This is a tkinter-based user interface for our calculator.
# It consists of a grid containing a label in the top row,
# then a few rows and columns of the calculator's buttons.

from calculator import Calculator
import tkinter


_DEFAULT_FONT = ('Helvetica', 20)


class CalculatorApp:
    def __init__(self):
        # First, we create the model for our calculator.  It knows
        # how to do the calculations, but knows nothing about the
        # user interface.
        self._calculator = Calculator()

        # Next, we create a Tk object for our application, which gives
        # us (among other things) a "root window" for it.
        self._root_window = tkinter.Tk()

        # Then, we create a label that we'll use to display the
        # calculator's result.  The "anchor" option is used to specify
        # that we want the text within the label to be (in this case)
        # right-justified.
        self._display_label = tkinter.Label(
            master = self._root_window,
            text = '', font = _DEFAULT_FONT,
            anchor = tkinter.E)

        # We'll have our display label span the entire top row of our
        # grid, and we'll set "sticky" so that it will stretch when the
        # size of the window stretches to become wider (or compress when
        # the window becomes narrower).
        self._display_label.grid(
            row = 0, column = 0, columnspan = 4,
            sticky = tkinter.W + tkinter.E)

        # Rather than set up sixteen separate buttons by hand, we realized
        # that what we need to do for each button is almost identical:
        # Decide what text should be in it, where it should be, and what
        # should be sent to the model when that button is pressed.
        # So we wrote a method that we could call to create and return
        # us each button.        
        button_7 = self._create_button('7', 1, 0)
        button_8 = self._create_button('8', 1, 1)
        button_9 = self._create_button('9', 1, 2)
        button_divide = self._create_button('/', 1, 3)
        button_4 = self._create_button('4', 2, 0)
        button_5 = self._create_button('5', 2, 1)
        button_6 = self._create_button('6', 2, 2)
        button_multiply = self._create_button('*', 2, 3)
        button_1 = self._create_button('1', 3, 0)
        button_2 = self._create_button('2', 3, 1)
        button_3 = self._create_button('3', 3, 2)
        button_subtract = self._create_button('-', 3, 3)
        button_clear = self._create_button_with_command('C', 4, 0, self._clear)
        button_0 = self._create_button('0', 4, 1)
        button_dot = self._create_button('=', 4, 2)
        button_plus = self._create_button('+', 4, 3)

        # This is where we configure how the widths and heights of the
        # rows and columns of the grid change as the size of the window
        # changes.  This, in turn, causes the widgets to either move or
        # resize within those rows and columns -- depending on the
        # "sticky" values given to them when we associated them with
        # the grid.
        self._root_window.rowconfigure(0, weight = 0)
        self._root_window.rowconfigure(1, weight = 1)
        self._root_window.rowconfigure(2, weight = 1)
        self._root_window.rowconfigure(3, weight = 1)
        self._root_window.rowconfigure(4, weight = 1)

        self._root_window.columnconfigure(0, weight = 1)
        self._root_window.columnconfigure(1, weight = 1)
        self._root_window.columnconfigure(2, weight = 1)
        self._root_window.columnconfigure(3, weight = 1)


    def run(self) -> None:
        # When we first start our application, we'll refresh the
        # display (ask the model "What should I show?" and then
        # show it).
        self._refresh_display()

        # Then we'll put Tkinter in charge by calling mainloop()
        # on our root window.
        self._root_window.mainloop()


    def _create_button(self, text, row, column) -> tkinter.Button:
        return self._create_button_with_command(
            text, row, column, self._make_command(text))


    def _create_button_with_command(self, text, row, column, command) -> tkinter.Button:
        button = tkinter.Button(
            master = self._root_window,
            text = text, font = _DEFAULT_FONT,
            command = command)

        button.grid(
            row = row, column = column,
            sticky = tkinter.N + tkinter.S + tkinter.W + tkinter.E)

        return button


    # Notice that the _make_command method is using the
    # function-that-builds-and-returns-function pattern
    # discussed in the notes, because each button needs a
    # slightly different function, but we didn't want to write
    # all sixteen of them by hand.

    def _make_command(self, key: str) -> 'function':
        def command_function() -> None:
            self._calculator.handle(key)
            self._refresh_display()

        return command_function


    def _refresh_display(self) -> None:
        # This sets the "text" option of the label, which causes
        # it to display different text.
        self._display_label['text'] = self._calculator.display()


    def _clear(self) -> None:
        self._calculator = Calculator()
        self._refresh_display()



if __name__ == '__main__':
    CalculatorApp().run()
```

### calculator.py

```Python
# calculator.py
#
# ICS 32 Winter 2020
# Code Example
#
# A partial implementation of the "model" for our calculator.
# What it supports is what is testing in "test_calculator.py",
# but it is not complete.  For example, it has no support
# for multiplication or division, even though these buttons
# exist in the user interface).
#
# How our model works is like this:
#
# * Keep track of the "current value", which is what would be
#   displayed on the calculator at any given time.
# * Keep track of the "remembered value", which is the value
#   that would be used as the first operand to any operation.
#   For example, if you press the '+' button, the remembered
#   value is the current value, the current value is 0, and
#   we can begin entering our second operation.
# * Starting an operation (like '+') or pressing the '=' key
#   performs any operation that's pending.
#
# Much about this remains skeletal, but it's a very nice start.


class Calculator:
    def __init__(self):
        self._current_value = 0
        self._remembered_value = 0
        self._last_operation = _no_operation

        
    def display(self) -> str:
        return str(self._current_value)


    def handle(self, key: str) -> None:
        if key.isdigit():
            self._current_value *= 10
            self._current_value += int(key[0])
        elif key in ['=', '+', '-']:
            result = self._last_operation(
                self._remembered_value, self._current_value)

            if key == '=':
                self._remembered_value = 0
                self._current_value = result
            else:
                self._remembered_value = result
                self._current_value = 0

            if key == '+':
                self._last_operation = _add
            elif key == '-':
                self._last_operation = _subtract
            else:
                self._last_operation = _no_operation


# These functions are the operations that can be performed.
# Note that we're storing these in our model in an attribute
# that keeps track of what function needs to be called to
# to perform the last operation someone asked for.

def _no_operation(remembered: int, current: int) -> int:
    return current


def _add(remembered: int, current: int) -> int:
    return remembered + current


def _subtract(remembered: int, current: int) -> int:
    return remembered - current
```

### test_calculator.py

```Python
# test_calculator.py
#
# ICS 32 Winter 2020
# Code Example
#
# These are the unit tests for our calculator.py module.  Note that
# there's nothing here that attempts to unit test the tkinter-based
# GUI.  Our only goal here is to test the "model", yet that's where
# most of the complexity lies in a completed calculator implementation,
# anyway.
#
# We're using the "unittest" module for our testing, as we did in the
# "Test-Driven Development" notes earlier in the quarter.  There
# aren't a lot of new techniques, though we are trying to do a slightly
# better job of factoring our commonalities among the tests.

from calculator import Calculator
import unittest


class CalculatorTests(unittest.TestCase):
    # We realized early on that most of our tests were going to follow
    # the same basic pattern: handle a sequence of keys being sent to
    # a calculator, then see what the display says.  So we wrote this
    # one method that can run that test for us.  You give it a string
    # containing the sequence of keys, as well as a string containing
    # the expected result.  It creates a calculator, asks it to
    # handle each key in the sequence, then asserts that the
    # calculator's display has the correct result.
    def _assert_sequence_result(self, keys: str, result: str) -> None:
        calculator = Calculator()
        
        for key in keys:
            calculator.handle(key)

        self.assertEqual(calculator.display(), result)


    # Now that we have _assert_sequence_result, the tests themselves
    # become a bunch of calls to _assert_sequence_result.  I still
    # think there's value in having these categorized as separate,
    # named test methods, because the names are communicating
    # something important: What are we actually trying to verify
    # with each of these cases?  This way, when the tests fail, we'll
    # see the name and it will tell us something about what kind
    # of problem we should be looking for.

        
    def test_initial_display_is_zero(self):
        self._assert_sequence_result('', '0')


    def test_initially_pressing_equals_gives_zero(self):
        self._assert_sequence_result('=', '0')


    def test_starting_with_digit_replaces_zero(self):
        self._assert_sequence_result('3', '3')
        self._assert_sequence_result('4', '4')


    def test_two_digits_concatenates_instead_of_replacing(self):
        self._assert_sequence_result('74', '74')
        self._assert_sequence_result('89', '89')


    def test_many_digits_concatenates_instead_of_replacing(self):
        self._assert_sequence_result('12579', '12579')
        self._assert_sequence_result('3704', '3704')


    def test_equals_without_operation_changes_nothing(self):
        self._assert_sequence_result('35=', '35')
        self._assert_sequence_result('35===', '35')


    def test_addition_and_equals(self):
        self._assert_sequence_result('5+6=', '11')


    def test_subtraction_and_equals(self):
        self._assert_sequence_result('5-6=', '-1')


    def test_sequence_of_operations(self):
        self._assert_sequence_result('5+6+3+4=', '18')

    

if __name__ == '__main__':
    unittest.main()
```