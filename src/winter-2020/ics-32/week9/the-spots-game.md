# The spots game

## Game components

### model

- which is tasked with keeping track of the game's mechanics.
- understands how the game is played
- not concerned with how it looks or how the user interacts with it.

### view

- whose focus is how the game looks and how the user interacts with it
- remains ignorant of the game's mechanics.

Every problem we face in writing games like these can be characterized as either a model problem or a view problem; if it seems like both, that's probably because it's two problems, one a model problem and one a view problem.

## The spots game

Displays an empty window (i.e., a background color with nothing else drawn). Clicking the mouse in that window somewhere causes a spot (an ellipse) to be drawn, and it also begins moving in a randomly-chosen direction.

Clicking within an existing spot causes that spot to disppear, rather than creating a new one; if two spots overlap and the click occurs within both, the topmost spot (the one added most recently and, thus, drawn above the others) is removed.

### Designing the model

Focus on trying to build tools that can assist us, rather than doing boring, repetitive work on our own.

A `Spot` class could have operations like these:

- What is your center point?
- What is your radius?
- Here is another point: is it inside of you?
- Move yourself, given your current speed and direction.

Encapsulate the notion of the overall state of the Spots game in another kind of object, called a SpotsState.

### Designing the model

PyGame uses a Cartesian-like coordinate system, in which each pixel (i.e., each dot that you can draw) is represented by a unique (x, y) coordinate.

Just because PyGame expects us to draw our shapes using pixel coordinates (i.e., all distances are measured in terms of pixels) doesn't mean that we have to conceptualize our shapes that way throughout our program.

Fractional coordinates, which used floating-point numbers to specify coordinates as a fraction of the distance from the left to the right (horizontally, in the x direction) and from the top to the bottom (vertically, in the y direction).

- Know the fractional coordinates of the shapes you want to draw.
- In each iteration of your game loop, determine the size of the surface you're drawing on. Then, use this information to convert the fractional coordinates to pixel coordinates.
- So, for example, if we wanted to draw one ring bounded by the box (0.4, 0.3) - (0.6, 0.7) in fractional coordinates on a surface of width 600 and height 700, we would do this:
	- Convert the top-left fractional coordinate to a pixel coordinate. (0.4, 0.3) -> (0.4 * 600, 0.3 * 700) -> (240, 210).
	- Convert the bottom-right fractional coordinate to a pixel coordinate similarly. (0.6, 0.7) -> (0.6 * 600, 0.7 * 700) -> (360, 490)

PyGame's input arrives in our program in the form of events, which are generated behind the scenes whenever the user does things like press keys on the keyboard, click their mouse button, and so on.

- `pygame.VIDEORESIZE`, which occurs every time the size of the PyGame display window is changed.
- `pygame.MOUSEBUTTONDOWN`, which occurs every time the primary mouse button goes down while the mouse cursor is within the PyGame display window.

## The code

### spots_game.py

```Python
# spots_game.py
#
# ICS 32 Winter 2020
# Code Example
#
# This module implements the "view" for our Spots game.  The job of a
# view is to focus on how the game looks and feels -- how it's drawn and
# how the user interacts with it -- while ignoring the details about the
# game's mechanics.  It's not uncommon for the view to hold a reference
# back to the model, which we're doing here.  As the user does things,
# they'll generate events in the view, which will then be sent to the
# model as higher-level operations that affect the game's mechanics.
#
# Note, too, that we've taken a keener eye toward the design of this
# example, by doing a couple of additional things:
#
# * We implemented our game in a class, rather than in a function.  This
#   gives us a natural way to break it up into many functions, while
#   still preserving their ability to share the important information
#   between them (in the form of the "self" parameter that they all
#   share).
#
# * We broke up our game loop into calls to methods in this class.  This
#   took what would have been a long, complex method and made it much
#   shorter.  By giving names to these "helper" methods, we've made
#   clearer the pattern that shows up in our design.  Going forward,
#   if we were to add new features, they would have a place where they
#   belong.  For example, new user inputs would be dealt with in
#   _handle_events; changes to how things are drawn would be dealt with
#   in _redraw; and so on.

import pygame
import spots



class SpotsGame:
    def __init__(self):
        self._running = True
        self._state = spots.SpotsState()

        
    def run(self) -> None:
        pygame.init()

        self._resize_surface((600, 600))

        clock = pygame.time.Clock()

        while self._running:
            clock.tick(30)
            self._handle_events()
            self._redraw()

        pygame.quit()


    def _handle_events(self) -> None:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                self._end_game()
            elif event.type == pygame.VIDEORESIZE:
                self._resize_surface(event.size)
            elif event.type == pygame.MOUSEBUTTONDOWN:
                self._on_mouse_button(event.pos)

        self._move_spots()


    def _redraw(self) -> None:
        surface = pygame.display.get_surface()

        surface.fill(pygame.Color(255, 255, 0))
        self._draw_spots()

        pygame.display.flip()


    def _draw_spots(self) -> None:
        for spot in self._state.all_spots():
            self._draw_spot(spot)


    def _draw_spot(self, spot: spots.Spot) -> None:
        frac_x, frac_y = spot.center()
        
        topleft_frac_x = frac_x - spot.radius()
        topleft_frac_y = frac_y - spot.radius()

        frac_width = spot.radius() * 2
        frac_height = spot.radius() * 2

        surface = pygame.display.get_surface()
        width = surface.get_width()
        height = surface.get_height()

        topleft_pixel_x = topleft_frac_x * width
        topleft_pixel_y = topleft_frac_y * height

        pixel_width = frac_width * width
        pixel_height = frac_height * height

        pygame.draw.ellipse(
            surface, pygame.Color(0, 0, 0),
            pygame.Rect(
                topleft_pixel_x, topleft_pixel_y,
                pixel_width, pixel_height))


    def _end_game(self) -> None:
        self._running = False


    def _resize_surface(self, size: (int, int)) -> None:
        pygame.display.set_mode(size, pygame.RESIZABLE)


    def _on_mouse_button(self, pos: (int, int)) -> None:
        surface = pygame.display.get_surface()
        width = surface.get_width()
        height = surface.get_height()
        
        pixel_x, pixel_y = pos
        
        frac_x = pixel_x / width
        frac_y = pixel_y / height

        self._state.handle_click((frac_x, frac_y))


    def _move_spots(self) -> None:
        self._state.move_all_spots()


if __name__ == '__main__':
    SpotsGame().run()
```

### spots.py

```Python
# spots.py
#
# ICS 32 Winter 2020
# Code Example
#
# This module implements the "model" for our Spots game.  The job of a
# model is to encompass the details of how the game works, without
# regard to specifically what it looks like or specifically how the
# user will interact with it.  The overall "world" in our Spots game
# was a collection of spots that could be created and would move in
# random directions on their own.  We're implementing that concept
# here with two classes:
#
# * Spot, which encapsulates the idea of a single spot.  Each spot
#   knows what its center point, radius, and velocity is, where the
#   velocity is tracked as a "delta" (rate of change) in both the
#   x- and y-coordinates.
#
# * SpotsState, which encapsulates the entire state of the Spots
#   game.  Fundamentally, the state of our game is a list of the
#   spots that are currently displayed.  Additionally, SpotsState
#   can do things: add new spots or remove existing spots when
#   clicks happen, move all spots when we change from one frame
#   of animation to the next.

import math
import random



class Spot:
    def __init__(self, center: (float, float), radius: float):
        self._center = center
        self._radius = radius

        # random.random() returns a random float value between 0 and 1,
        # with an equal change of any particular value being returned.
        # By multiplying it by 0.01 and subtracting 0.005, we're changing
        # the range of possible results from -0.005 to 0.005 instead.
        # This has the effect of giving every spot a random direction
        # and speed.
        self._delta_x = (random.random() * 0.01) - 0.005
        self._delta_y = (random.random() * 0.01) - 0.005


    def center(self) -> (float, float):
        return self._center


    def radius(self) -> float:
        return self._radius


    def move(self) -> None:
        x, y = self._center
        self._center = (x + self._delta_x, y + self._delta_y)


    def contains(self, point: (float, float)) -> bool:
        # We can tell if a spot contains a point by seeing how far that
        # point is from the center of the spot.  If the distance is no more
        # than the radius, the point is inside the spot; otherwise, it's not.
        px, py = point
        cx, cy = self._center
        
        return math.sqrt((px - cx) * (px - cx) + (py - cy) * (py - cy)) <= self._radius
    


class SpotsState:
    def __init__(self):
        self._spots = []


    def all_spots(self) -> [Spot]:
        return self._spots


    def handle_click(self, click_point: (float, float)) -> None:
        # By writing the code to check if a spot contains a point inside the
        # Spot class, look how simple this loop becomes.  It reads almost
        # like English; that's no accident.
        #
        # The reason we're looping through the spots backward is because
        # we want to eliminate the most-recently-added match first, so
        # if two spots overlap, the one that disappears is the one on
        # top.
        for spot in reversed(self._spots):
            if spot.contains(click_point):
                self._spots.remove(spot)
                return
        
        self._spots.append(Spot(click_point, 0.05))


    def move_all_spots(self) -> None:
        for spot in self._spots:
            spot.move()
```