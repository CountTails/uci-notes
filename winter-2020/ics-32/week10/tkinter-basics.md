# Tkinter basics

## Background

We interact with software on our own computers and mobile devices, more often than not, we interact with graphical user interfaces (GUIs).

This is quite the contrast to the command line program that we have built this term. How can we build GUI programs like the ones that we are so used to using?

Python can help: Among other things in its standard library, it includes a module called tkinter — technically, an interface to a GUI toolkit called Tk, which is where it gets its name — that allows us to build GUIs using Python.

## Where to find info on tkinter?

The [tkinter 8.5 Reference](https://web.archive.org/web/20190524140835/https:/infohost.nmt.edu/tcc/help/pubs/tkinter/web/index.html) from New Mexico Tech Computer Center is a comprehensive reference book.

The one thing to be cautious about is that its Python code examples use an older version of the Python language (Python 2) that differs from the version we're using (Python 3)

## Creating an empty GUI window

This is super easy and can be done with the following 3 commands

```Python
>>> import tkinter  
>>> window = tkinter.Tk()  
>>> window.mainloop()
```

Creating a `tkinter.Tk` object creates a tkinter-based GUI, which causes a window to pop up on your screen.

A call the `mainloop()` method on the window, the Python interpreter becomes inactive — you aren't given another prompt to enter your next statement or expression.

Closing the window (the normal way) will make the prompt reappear. 

Tkinter GUIs are built using event-based programming, which is similar to what we did when we used PyGame. The main difference is that the main loop is written for us.

## Event based programming

While tkinter "runs the show," so to speak, you tell it what events your code would be interested in being told about.

1) We don't handle all of the control flow in the program; instead, we create the GUI, "wire up" a set of event handlers, and our code is inactive until one of those event handlers is called.
2) If we were to write an event-handling function or method that ran for a long time — say, one that downloaded a large file via the Internet — the entire GUI will be unresponsive until our event handler returned.

## Widgets and options

A window in a tkinter GUI contains a collection of building blocks called widgets. tkinter includes a variety of built-in widgets that will sound familiar when you think about GUI-based programs you've used.

Each widget has a set of options that can be configured when the widget is first created, by passing keyword arguments to its constructor.

```Python
button = tkinter.Button(master = window, text = 'Hello!', font = ('Helvetica', 20))
```

- master: which is the widget in which the button will be placed
- text: which is the text that will be displayed inside of the button.
- font: which specifies the font in which the button's text should be displayed.

## Layout

A layout manager (also called a geometry manager) decides how to arrange widgets within an area and how that arrangement should change as the area's size changes

You can specify the layout rules for each widget by calling one of three methods on it: 

- `pack()`: stuff it where it will fit
- `grid()`: place it in a section of a bigger space
- `place()`: place it based on a custom layout manager

## Behaviors and events

Your code can register an interest in events by specifying functions or methods that tkinter will call each time one of those events occur.

```Python
def hello_button_pressed() -> None:  
    # Do whatever you want to do when the button is pressed  
    ...  
  
...  
  
button = tkinter.Button(  
    master = window, text = 'Hello!', font = ('Helvetica', 20),  
    command = hello_button_pressed)
```

Notice that we're not setting the command option to be the result of calling the `hello_button_pressed `function. Instead, we're setting it to the function itself, literally asking tkinter to call this function later, when the button is pressed.

## Event binding

When a widget doesn't expose exactly the behavior you need, you can achieve what you need by instead doing what's called event binding.

Binding to an event on some widget is done by calling the `bind()` method on that widget.

```Python
def cursor_entered_button(event: tkinter.Event) -> None:  
    # Do whatever you want to do when the button is entered  
    ...  
  
...  
  
button.bind('<Enter>', cursor_entered_button)
```

The first parameter to bind() is the description of the event (or sequence of events) you're interested in.

The second parameter is an event handler function; event handler functions are required to take a single parameter, into which will be passed an event object that describes the event.

## The code

```Python
# simple_window.py
#
# ICS 32 Winter 2020
# Code Example
#
# This example demonstrates a graphical user interface that contains only
# a single, large button.  The text displayed in the button changes when
# the mouse cursor enters it, and changes back when the mouse cursor exits
# it.  Clicking the button causes a message to be printed to the console.

import tkinter



# In general, global variables are to be avoided in Python, except for
# global constants like these.  It's not a bad idea to store values like
# these into global constants, though, especially if they appear in more
# than one place in your code.
#
# I've declared these particular constants with names that begin with
# underscores, because they're private details of this module; we don't
# expect code outside of this module to care what text is displayed in
# the buttons or what message is printed to the console.

_NORMAL_BUTTON_TEXT = 'Hello There!'
_ENTERED_BUTTON_TEXT = 'Click Me!'
_BUTTON_CLICK_MESSAGE = 'Hi there!  How are you today?'



def show_gui() -> None:
    # Create an empty window, into which we'll place widgets
    root_window = tkinter.Tk()

    # Create a button and place it into the window (that's what the
    # "master" option does).  We also set the text to be displayed in
    # the button (the "text" option), the font that the text should be
    # displayed with (the "font" option), and the command handler
    # function that should be called when the button is pressed
    # (the "command" option).  There are other options you can specify
    # on a button; they are listed exhaustively in the New Mexico Tech
    # Computer Center documentation on "tkinter".
    button = tkinter.Button(
        master = root_window, text = _NORMAL_BUTTON_TEXT,
        font = ('Helvetica', 20),
        command = _on_button_pressed)

    # Here, we're binding to two events on the button.  The first
    # parameter to each bind() call specifies the event that we're
    # interested in binding:
    #
    #     <Enter>, which means that the mouse cursor has entered the
    #              button's area
    #     <Leave>, which means that the mouse cursor has exited the
    #              button's area
    #
    # The second parameter to bind() is the event handler function
    # that will be called when the bound event occurs.  Event handler
    # functions take a single parameter, an event object that describes
    # the event that occurred.
    button.bind('<Enter>', _on_mouse_entered_button)
    button.bind('<Leave>', _on_mouse_exited_button)

    # Since there's only one widget in our window, we can call pack()
    # on it to say "Whatever size this widget needs to be, resize the
    # window so it's that size, so that the widget fills the entire
    # available space in the window."  We'll see more flexible layout
    # management in later examples.
    button.pack()

    # Turn control over to "tkinter", who will run the show for us until
    # the window is closed.  Meanwhile, whenever an event occurs for which
    # we've registered interest -- the button is entered or exited, or
    # the button is clicked -- our code will be called.
    root_window.mainloop()



# Button command function that is called when the GUI's single button
# is clicked.  Button command functions take no parameters.  In our
# case here, that's no impediment, because we only plan to print a
# hard-coded message to the console.  In general, though, this is one of
# many reasons why using classes to implement GUIs makes a lot more sense,
# because we can use methods instead of functions to implement our command
# handlers and event handlers; since these methods will have a "self"
# parameter that will provide access to any attributes we store in our
# object, they will then have access to the information we need.
def _on_button_pressed() -> None:
    print(_BUTTON_CLICK_MESSAGE)



# Event handler function that is called when the mouse cursor enters
# the GUI's single button.  Event handler functions take one parameter:
# an event object describing the event.  Event objects have different
# attributes depending on what kinds of events they are.  In this case,
# the only thing we care about is the "widget" attribute, which specifies
# the widget that the event affected.  That gives us the ability to get
# access to the button, so we can change its text.
def _on_mouse_entered_button(event: tkinter.Event) -> None:
    # Widgets have what are called "options" (the things you set with
    # keyword arguments when you construct them).  A widget's options are
    # accessible by using the indexing operator on the widget, using the
    # name of the option as the index.  In this case, we want to set the
    # 'text' option (which specifies the text displayed in the button).
    event.widget['text'] = _ENTERED_BUTTON_TEXT



# Event handler function that is called when the mouse cursor exits the
# GUI's single button.
def _on_mouse_exited_button(event: tkinter.Event) -> None:
    event.widget['text'] = _NORMAL_BUTTON_TEXT



if __name__ == '__main__':
    # If we execute this module, we want to show the GUI.
    show_gui()
```

