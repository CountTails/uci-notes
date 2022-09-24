# PyGame basics

## Visuals games in Python

How you might go about building your own game. So-called "Triple-A" games with their huge teams of artists and software developers (and the giant budgets to pay all of them) are obviously out of our reach at this point, but there is still something to be said for games that are small and simple.

## What do we need?

- Generate graphical output, instead of just text.
- Animation will be necessary, though this isn't much different from the graphical output we already mentioned.
- Generate audible output
- Receive input from the keyboard, but not one line at a time.
- Receive input from other devices, such as the mouse, a joystick, or a game pad.
- Generate random data, which is one way to make a game behave differently each time you play it.

Some of these can be done with the standard library fairly well. Others may be more difficult.

If we unconstrain ourselves from the standard library, then there is a fairly full-featured library called PyGame that can do the rest of the things we're looking for

## Getting started with PyGame

Like any library, it can seem daunting to start learning about PyGame, but the best way to do it is to start with something simple and work your way up.

The PyGame library is extensive enough that it is actually divided into various sections, with each of those sections focused on one kind of functionality you'd need to write a game.

### Initialization and shutdown

PyGame requires initialization at the beginning of your program and shutdown at the end.

- The function `pygame.init()` initializes the PyGame library.
- The function `pygame.quit()` shuts the PyGame library down.

All of these facts give rise to the simplest imaginable PyGame-based program you could write.

```Python
import pygame  
  
  
def run() -> None:  
    pygame.init()  
    pygame.quit()  
  
  
if __name__ == '__main__':  
    run()
```

Running this will yield no visual indication that it's doing anything, except it may take a couple of seconds to perform the initialization.

### Creating a display with a surface

The pygame.display module contains functions that let you control how PyGame displays graphical output.

The first of these functions that we'll need is called `pygame.display.set_mode()`, which is how you create a new window. It takes a tuple as an argument that specifies the size in pixels

```Python
import pygame  
  
  
def run() -> None:  
    pygame.init()  
  
    # Creates a window containing a surface that is  
    # 700 pixels wide and 600 pixels tall.  
    surface = pygame.display.set_mode((700, 600))  
  
    pygame.quit()  
  
  
if __name__ == '__main__':  
    run()
```

Now a window should appear briefly and then disappear before the program finishes.

The `pygame.display.set_mode()` function doesn't just cause a window to pop up; it also returns an object called a surface.

By manipulating the surface we control control the graphics being displayed.

### The game loop and events

Games tend to have to do multiple things simultaneously.

- react to inputs such a keypresses, mouse movements, or the window being resized.
- draw pictures fairly often, many times per second, to achieve smooth animation.

PyGame provides tools to help with the tasks above. They will be grouped together into a single game loop to do the following

- Check if we received any input since the last time we asked.
- Draw the next "frame" of our animation and display it.

It should be understood that it's our loop; we're the ones who will need to write it. PyGame provides the tools to help us build our game, but we're still the ones fundamentally structuring it.

Since our game loop is one that runs for as long as our game runs, it won't be a for loop; it should be a while loop

```Python
def run() -> None:  
    pygame.init()  
  
    surface = pygame.display.set_mode((700, 600))  
  
    running = True  
  
    while running:  
        for event in pygame.event.get():  
            if event.type == pygame.QUIT:  
                running = False  
  
        pygame.display.flip()  
  
    pygame.quit()  
  
  
if __name__ == '__main__':  
    run()
```

What is happening here:

- The `running` variable is a boolean value that keeps track of whether we should continue running.
- The `pygame.event.get()` function returns a collection of the input events that have happened since the last time you called it.
- The `pygame.display.flip()` function means that we want to re-draw the display's surface in our window

Running this program should show a black window until you close out of it.

### Colors

Colors are represented in PyGame as pygame.Color objects, each of which stores three values:

- An amount of red
- An amount of green
- An amount of blue

Constructing a color in PyGame is a simple matter of constructing a pygame.Color object and passing three arguments to its constructor: the amount of red, green, and blue, respectively.

### Drawing on our surface

To change what graphics are being displayed, we'll need to change our surface during our game loop.

The `surface.fill()` fills an entire surface with one color. The color is a `pygame.Color` object that is passed in as a parameter.

```Python
color_amount = 0  
  
while running:  
    for event in pygame.event.get():  
        if event.type == pygame.QUIT:  
            running = False  
  
    color_amount = (color_amount + 1) % 64  
    surface.fill(pygame.Color(color_amount, color_amount, color_amount))  
  
    pygame.display.flip()
```

Running this program should show a window that traverses from black -> gray -> white over and over again.

### Clocks

PyGame provides a kind of object called a clock, which can help you to limit your game loop's frequency.

The constructor `pygame.time.Clock()` is used to construct a clock. The `tick()` method can be called on the resulting object to insert the appropriate delay.

```Python
color_amount = 0  
clock = pygame.time.Clock()  
  
while running:  
    clock.tick(30)  
  
    for event in pygame.event.get():  
        if event.type == pygame.QUIT:  
            running = False  
  
    color_amount = (color_amount + 1) % 256  
    surface.fill(pygame.Color(color_amount, color_amount, color_amount))  
  
    pygame.display.flip()
```

Running this program should yield the same visuals and before, but it will be much slower and easily noticeable.

### Drawing shapes on our surface

The `pygame.draw` library allows us to draw lines and shapes on our surface. If we draw different shapes, or the same different shapes in different places, in each frame of our animation

### Coordinates

How do we describe positions within our window?

Each pixel is effectively a tiny rectangle, and each can be filled with a single color. Depending on your machine (and how it's configured), there might be millions of them available to work with.

PyGame uses the same coordinate system that has long been typical in two-dimensional computer graphics, which differs slightly from a cartesion plane

The `pygame.draw.circle()` function will draw a circle on a given surface, with a specified color, a center and a radius.

```Python
color_amount = 0  
clock = pygame.time.Clock()  
circle_center_x = 350  
circle_center_y = 300  
  
while running:  
    clock.tick(30)  
  
    for event in pygame.event.get():  
        if event.type == pygame.QUIT:  
            running = False  
  
    color_amount = (color_amount + 1) % 256  
    circle_center_x -= 1  
    circle_center_y += 1  
  
    surface.fill(pygame.Color(color_amount, color_amount, color_amount))  
  
    pygame.draw.circle(  
        surface, pygame.Color(255, 255, 0),  
        (circle_center_x, circle_center_y), 100)  
  
    pygame.display.flip()
```

## The code

```Python
# pygame_basics.py
#
# ICS 32 Winter 2020
# Code Example
#
# Below is a complete version of the example from the PyGame Basics notes.

import pygame


def run() -> None:
    pygame.init()

    surface = pygame.display.set_mode((700, 600))

    running = True
    color_amount = 0
    circle_center_x = 350
    circle_center_y = 300
    clock = pygame.time.Clock()

    while running:
        clock.tick(30)
        
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

        color_amount = (color_amount + 1) % 256
        circle_center_x -= 1
        circle_center_y += 1
        
        surface.fill(pygame.Color(color_amount, color_amount, color_amount))

        pygame.draw.circle(
            surface, pygame.Color(255, 255, 0),
            (circle_center_x, circle_center_y), 100)

        pygame.display.flip()

    pygame.quit()


if __name__ == '__main__':
    run()
```