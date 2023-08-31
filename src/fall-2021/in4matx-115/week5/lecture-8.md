# Lecture 8

## Testing fundamentals

- Quality assurance
	- When do quality assurance activities happen in software development?
	- How has our view of this changed over time?
- Identify and differentiate validation and verfication
- Identify and differentiate mistakes, faults, and failures
- Define
	- Test case
	- Test suite
	- Oracle
	- Test plan
- Black box versus white box testing
- Why not exhaustively test or fully prove for correctness?
- What is the basic power of testing to find bugs? Why do we then test at all?
- Types of testing
- Testing at various granularities (thinking of a testing strategy)

## Functional testing

- Random testing versus systematic
- Identify boundary values
- Test driven development
- Behavior driven development
- Test doubles types (subs, fakes, mocks)

## Finite models

- Draw a FSM
- Check for completeness of FSM (state-transition table)

## Combinatorial testing

- What is the purpose of pairwise testing, n-wise testing?
- How is their strength related?
- Given a set of categories, present the requested combinations

### All combinations coverage

- Every possible combination of values of the parameters must be covered

### Each choice coverage

- Each parameter value must be covered in at least one test case

### Pairwise coverage

- Given any two parameters, every combination of values of these two parameters are covered in at least one test case

### Subsumption relation

> All combinations > T-wise > Pairwise > Each choice

## Structural testing

- What is statement, branch, and path coverage?
- What is the competent programmer hypothesis?
- What is a test charter?
- Differences between scripted and exploratory testing
- Challenges of regression testing
- What is MC/DC coverage?

## Tools