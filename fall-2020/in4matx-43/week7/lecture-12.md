# Lecture 12: Testing (part 2)

## How to choose test cases?

- There is usually an infinite amount, so we must select a small sample

### Ways to choose

- Intuition
- Specification (black box testing) -- know how it behaves
    - Equivalence class partitioning
    - Boundary value analysis
- Code (white box testing) -- can see the code
    - Path analysis
- Existing test case (regression testing)
- Faults

### Test oracles

- A mechanism for deciding whether a test case execution succeeds or fails
- Difficult to automate

## Bugs

- All software has bugs
- If it is nontrivial, a formal proof likely cannot be written -> it **has** defects
- Defects increase with code size
- Some bugs are bizzare (open office won't print of *Tuesdays*)
- Some bugs are long-lived (Error message mistake from 1974 in windows 10)

## How do we know when we are done testing?

- Aim to reveal as many faults as possible in a fixed period of time with a fixed budget
- Target specific areas of a system
- Aim to meet the quality requirements established by the project
- Pepper the code with defects and see how many are discovered by current tests