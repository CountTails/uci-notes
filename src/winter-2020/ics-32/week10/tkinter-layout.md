# Tkinter layout

## Background

Graphical user interfaces are comprised of many widgets — many buttons, text entry fields, canvases, menus, etc.

The problem of layout, which is fundamentally the problem of deciding where the various widgets will appear within their window, occurs when building a GUI application.

Tkinter provides tools called layout managers that solve this problem in a few common ways, along with ways to create one's own layout manager if needed

The most flexible is one called grid, which should address most straightforward GUI layout needs

## The grid layout manager

The grid layout manager arranges widgets by placing each one into one or more cells on an invisible grid.

When you create a GUI using the grid layout manager, you specify which widgets will appear in which cells, including the cell sizes and the window's size changes

- All of the cells in a particular row have the same height, and all of the cells in a particular column have the same width.
- The heights of different rows and the widths of different columns may be different.
- Additional space is allocated to the heights of the rows and the widths of the columns according to the weights specified on each.
- Widgets are arranged within grid cells based on an option called sticky.
	- By default, widgets float in the center of their cells.
	- If a widget is specified to stick to one side of a cell but not the opposing side (e.g., west but not east), it will be moved to the specified edge of the cell.
	- If a widget sticks to two opposite sides of a cell, its size will be stretched accordingly.
	- A widget can be made to fill an entire grid cell by sticking to all four sides
- Padding can be specified, which is empty horizontal and/or vertical space that will be preserved along the outer edge of a grid cell.
- A widget can span more than one row and/or more than one column, by setting the `rowspan` and/or `columnspan` options.
- A grid layout can be applied to the entire contents of a window or a frame widget

## The code

```Python
# layout_example.py
#
# ICS 32 Winter 2020
# Code Example
#
# This is an example that demonstrates how to use Tkinter's grid layout
# manager to control the positioning of widgets in a window.  Also included
# is the use of a nested layout with a Frame widget.
#
# The overall design of our application mirrors the design of a few recent
# code examples, in which there is an application class -- this time called
# SimpleLayoutApplication -- that represents an instance of our application.
#
# As an exercise to help you to understand how the grid layout works, try
# this: adjust one or more of the values (sticky, padding, row or column
# weight, etc.), make a guess about how you think the layout will change,
# then run the program to see if your guess was right.  If it wasn't,
# make sure you understand why.

import tkinter


# This is a font that we'll use on all of the buttons, so we'll define it
# as a global constant.
DEFAULT_FONT = ('Helvetica', 20)


class SimpleLayoutApplication:
    def __init__(self):
        self._root_window = tkinter.Tk()


        self._button1 = tkinter.Button(
            master = self._root_window, text = 'Button 1', font = DEFAULT_FONT)

        self._button1.grid(
            row = 0, column = 0, padx = 10, pady = 10,
            sticky = tkinter.W)


        self._button2 = tkinter.Button(
            master = self._root_window, text = 'Button 2', font = DEFAULT_FONT)

        self._button2.grid(
            row = 0, column = 1, padx = 10, pady = 10,
            sticky = tkinter.E + tkinter.S)


        self._canvas = tkinter.Canvas(
            master = self._root_window, background = '#600000')

        self._canvas.grid(
            row = 1, column = 0, columnspan = 2, padx = 10, pady = 10,
            sticky = tkinter.N + tkinter.S + tkinter.E + tkinter.W)


        # A Frame widget is one whose job is to contain other widgets.
        # It can have its own layout, separate from the one that places
        # it into its own master.  In this case, we use a Frame so that
        # we can separately align a column of buttons along the right-hand
        # edge of the window, regardless of the layout of the widgets
        # to their left.
        self._button_frame = tkinter.Frame(
            master = self._root_window, background = '#006000')

        self._button_frame.grid(
            row = 0, column = 2, rowspan = 2, padx = 10, pady = 10,
            sticky = tkinter.N + tkinter.S)

        for button_number in range(1, 6):
            numbered_button = tkinter.Button(
                master = self._button_frame, text = '{}'.format(button_number),
                font = DEFAULT_FONT)

            numbered_button.grid(
                row = button_number - 1, column = 0, padx = 0, pady = 0)


        # This is how you set weights on rows and columns, which controls
        # how the sizes of grid cells change as the size of the window
        # changes -- and, correspondingly, how the size and positioning of
        # the widgets in those grid cells change.
        self._root_window.rowconfigure(0, weight = 1)
        self._root_window.rowconfigure(1, weight = 3)
        self._root_window.columnconfigure(0, weight = 1)
        self._root_window.columnconfigure(1, weight = 1)
        self._root_window.columnconfigure(2, weight = 0)


    def run(self):
        self._root_window.mainloop()



if __name__ == '__main__':
    SimpleLayoutApplication().run()
```