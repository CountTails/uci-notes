# Lecture 13: Modeling human performance

## Fitt's Law (1954)

- Models time to acquire targets in aimed movement
    - Reaching for control in a cockpit
    - Moving across a dashboard
    - Pulling defective items from a conveyor belt
    - Clicking on icons using a mouse
- Very powerful, widely used
    - Holds for many circumstances (e.g under water)
    - Allows  for comparison among different experiments
    - Used both to measure and predict
- $MT = a + b*log_{2}(A/W + 1)$
    - Looks like the slope intercept form of a line ($y=mx + b$)
    - $MT = a + bx$, where $x = log_{2}(A/W + 1)$
        - $x$ is called the Index of Difficulty (ID)
        - $A$, amplitude, goes up with ID
        - $W$, width, goes up when ID goes down

### Movement time

- Yields time, in seconds, to acquire that target

### Index of difficulty

- Fitt's law claims that the time to acquire a target increases linearly with the log of the ratio of the movement distance or amplitude (A) to target width (W)
- Units of amplitude and width do not matter
- Allows for comparison across experiments
- ID units is typically bits because of association with information capacity and somewhat arbitrary use of base-2 logarithm

### Index of performance

- The slope $b$
- $\dfrac{1}{b}$ is called the index of performance in bits/second
- Also called throughput or bandwidth
- $a$ and $b$ depend on the input device

## Beating Fitt's law

- Reduce movement time by
    - Reduce amplitude
    - Increase width
- Put targets closer together
- Make targets bigger
- Make cursor bigger
- Make impenetrable edges

### Fitt's law in windowing

- Windows 95: missed by a pixel
- Windows XP: good to the end
- Corners and edges make great targets
    - Do not have to move precisely to trigger them
    - They have "infinite" width

### Fitt's law in other domains

- How would Fitt's law apply to using touch input on a phone?
    - Shorter distances (smaller screen)
    - Movement times *should* be lower because your finger is faster than a mouse
- In practices, touchscreens on mobile tend not to be much faster
    - Buttons are smaller
    - People tend to be slower near the edges of touchscreens

## Modeling input

### Modeling mouse position

- Mouse pointer is relatively small
- We model it via X, Y position on the screen
- See whether that X, Y overlaps with a button, for example
- Targets are usually large enough that exact position does not matter

### Modeling touch position

- One interpretation of the problem: *Our fingers are fat*
    - We should use tiny styluses to make selection more accurate
- Another interpretation: *Our model of touch position is inaccurate*
    - We should make our model better
- How to improve?
    - Make the hardware view more closely match the user view
    - Hypothesis: yaw, pitch, and roll all impact touch position
        - Yaw: angle of touch device
        - Pitch: angle of finger
        - Roll: rotation of finger
    - Additionally, for each person, finger size/shape and mental model impact touch position
- Case study
    - 12 participants touched 600 points each
    - Varied yaw (0-180), pitch (15-90), and roll (-15 - 90)
    - Improving the model means that buttons can be 3x smaller and not by any harder to click
    - Study was *very controlled*, may not reflect how people use their phones

### Modeling phone grip

- People grip their phones in different ways
- Grip changes with phone size and hand size
    - Situational changes (e.g., walking or holding something)
- Case study
    - Tap all keys with left thumb, right thumb, and index finger only
    - Tap all keys with both thumbs

## Summary

- Modeling helps us measure and predict whether a tool or approach is beneficial for a task
- Fitt's law models time taken to click on target
    - Demonstrates that larger, nearer buttons reduce time taken
- Improved models lead to higher accuracy
    - Adjust for finger angle and rotation rather than assuming that a user intends to touch with the center of their finger
    - Infer grip using sensors to improve typing accuracy