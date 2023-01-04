# Lecture 11: Testing (part 1)

## Failures: a second look

### Boeing 737

- Prioritized saving money
- Disallowed human intervention

### Toyata "unintended acceleration"

- Code was messy
- Made it difficult to test
- Was unmaintainable; applying fixes introduced more bugs

### Apollo 8

- Incorrect assumption about the user

### Genesis mission

- Don't skip testing; it can reveal obvious bugs in routines

### Y2K

- Date formats used 2 digits to store the year
- Does 00 mean 1900 or 2000>
- Relatively minor effects, but costed billions

### Cardinal rules for safety

- No single event or action shall be allowed to initiate a potentially hazardous event
- When an unsafe condition or command is detected, the system shall
    - Inhibit the potentially hazardous event sequence
    - Initiate procedures of functions to bring the system to a predetermined "safe" state

### 10 rules for writing safety critical code

1) Restrict to simple control flow constructs
2) Give all loops a fixed upper bound
3) Do not use dynamic memory allocation after initialization
4) Limit functions to no more than 60 lines of text
5) Use minimally two assertions per function on average
6) Declare data objects at the smallest possible level of scope
7) Check the return value of non-void functions, and check the validity of function parameters
8) Limit the use of the preprocessor to file inclusion and simple macros
9) Limit the use of pointers. Use no more than two levels of dereferencing per expression
10) Complie with all warning enabled, and use one or more source code analyzers

## Quality assurance

- All activities designed to measure and improve quality of a product
- **Verification**: does it conform to specifications?
- **Validation**: does it serve its purpose?

### Techniques

- Formal methods (proofs)
- Static analysis of program properties
- Reviews and inspections
- **Testing**

> Use a mixture, there is no silver bullet to testing



## Testing

### Basic process

- Detect and correct errors in a software product
- Exercise a module, collection of modules, or system
    - Devise a test case (input)
    - Create expected output
    - Run the test case
    - Capture actual output
    - Compare actual to expected
        - If equal, test succeeds
        - If not, test fails
- Much of this process in automated

### Terminology

- **Error**: human mistake in programmer's mind
- **Fault**: discrepancy in code
- **Failure**: external behavior/execution/output is incorrect

### Goals

- Find and fix failures/faults/errors
- Improve confidence that the system performs as specified and as desired
- All in a manner that is
    - Accurate
    - Thorough
    - Repeatable
    - Systematic

> Program testing can be used to *show the presence* of bugs, but never *show their absence* [Dijkstra]

### Who does the testing?

- Programmers (self test)
- Testers 
- Users
    - Acceptance testing
    - Alpha testing (within organization)
    - Beta testing (outside of organization)
    - Crowdsourcing / bug bounties

### Levels of testing

- Unit testing: testing of a single code unit (function, class, module)
- Functional / integration testing: testing of interfaces among intergrated units
- System / acceptance testing: testing of complete system for **satisfaction of requirements**