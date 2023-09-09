# Lecture 7

## Role of the software designer

- Problem solver
- Creative
- Scavenger
- Maker
- Collaborator
- Skeptic
- Pragmatist

> All of the above, at the **same time**!

## Why software design

- To develop the *right software*
    - For now
    - For later
- To develop the *software right*
    - On time
    - Within budget
    - On target

## Some software blunders

- Soviet gas pipeline (1982): the largest non-nuclear explosion in the planet's history
- Therac-25 medical accelerator (1985-1987): race conditions in the OS lead to a replacement of electromechanical safety interlocks by software control is transforms a device into a lethal engine delivering lethal radiation doses
- AT&T long distance network crash (January 15, 1990): Switching system would cause a message to be sent to nearby switching units to tell them that there was a problem, but by receiving that message the other systems crashed as will
- F22 raptors (1999 & 2007): Crash when crossing 180 longitude; flight control software fighting against the pilots
- Unix systems (**coming soon in 2038**): by design, Unix stores time in seconds since `1970-01-01` as a 32-bit signed integer, for which the maximum possible value is $2^{31}$