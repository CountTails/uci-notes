# Lecture 14: white-box testing

## Structural testing

- Using the source code to derive test cases
    - Build a graph to model the system
    - State test cases in terms of graph coverage
- Choose testing cases that guarantee different types of coverage

## Node coverage

- Select test cases such that every **node** in the graph is visited
- Selects the minimal number of test cases

## Edge coverage

- Select test cases such that every **edge** in the graph is visited
- More thorough than node coverage and more likely to reveal logical errors

## Other coverage criteria

- Loop coverage: Select test cases such that every loop *boundary* and *interior* is tested
- Condition coverage: Select test cases such that all conditions are tested
- Fault injection: Select test cases such that all possible exceptions are thrown
- Path coverage: Select test cases such that every **path** in the graph is visited

## Challenges with white-box testing

- Can be useful for identifying under-tested parts of the program
- Can cover all nodes or edges without revealing obvious faults
- Some nodes, edges, or loop combinations may be unfeasible

## Miscellaneous testing topics

### Inspections are reviews

- Humans read documents are look for defects (surprisingly effective)
- Benefits
    - Find defects
    - Improve code understandability
    - Improve code quality
    - Transfer knowledge
    - Avoid breaking builds
    - Share code ownership
    - Team assessment

### Formal methods

- Proofs of correctness
- Can only verify with the help of formal specifications

### Static analysis

- A computer program analyzes source code and finds defects
- Results are reviewed by a person because many "errors" are not real errors