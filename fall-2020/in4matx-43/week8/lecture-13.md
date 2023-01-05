# Lecture 13: Black box testing

## Specification-based testing

- Use specification to derive test cases
- Choose cases that guarantee a wide range of coverage
    - Typical values
    - Boundary values
    - Special cases
    - Invalid input values

## Equivalence class partitioning

- Divide input into several classes
- Members of a class of considers *equivalent* for the purpose of finding errors
- If it fail/passes for one member, it fail/passes for all members of the class
- Classes are determined by
    - Requirement specification
    - Tester's intuition
- Classes
    - **should cover the complete input domain**
    - **should never overlap**

## Boundary value analysis

- Many errors occur at the "boundaries" rather than under normal conditions
- Can use boundaries of your equivalence classes to cover these situations

## Approach

1) Identify the set of all possible inputs
2) Identify a basis for subdividing the set of inputs
3) Use the basis to divide the set of all inputs into classes/subdomains
4) Select a representative to be a test case input
5) Test for each subdomain (both normal and boundary values)