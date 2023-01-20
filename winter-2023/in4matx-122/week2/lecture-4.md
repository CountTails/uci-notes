# Lecture 4

## Emphasis on changeability

### Purpose of implementation design

- An implementation design 
    - A road map
    - Describes a path from design to product
    - Describes what the implementers should do
    - A guide towards future change

### Changeability

- Subtle
- Requires foresight and careful balancing

### Basic principles

- Low coupling: reduce interdependency
- High cohesion: grouping functionality
- Information hiding

## Why emphasis changeability?

- Maintenance accounts for at least 50% of total lifetime costs
- Change abounds...

### During coding

- Refinement of high level design
- Need for refactoring
- Need to redesign as you code

### During use

- Customers have needs
- Customers have requests
- Operating environments change

### During reuse

- A change of context

## Designing for change

### A matter of

- Controlling dependency
- Proper encapsulation
- Generalizing where you can

### Choosing changes

- What are the biggest change risks?
- What kind of program is this, essentially?
- Where is "the line"? (How much is too much?)

### What do we know we will have?

- Put this in an interface

### What variations on that might we see?

- Hide this behind the interface

## Changes for practicality

### What are the core or invariants elements?

- What variations on that will we see?

### If something needs to be changed

- Can it be changed in one place?
- Does anything else need to be changed when change occurs
 
