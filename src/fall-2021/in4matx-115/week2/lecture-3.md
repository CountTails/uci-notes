# Lecture 3

## Classification of testing approaches

### Manual

- A human being sets at a program and enters inputs into a program to test it
- Beta testing or user testing
- Sometimes means a human writes out tests that run automatically, but usually means a person *does the testing*

### Automated

- One meaning is that humans design tests, but use scripts or other methods to have the computer execute the tests without help
- Another meaning is that humans write programs that produce tests
- Essential for speed, automatic checks when a program is compiled, etc.

### Black box

- Treats a program or system as opaque
- Sends a program a stream of inputs, observe the outputs to decide if the system passed or failed the test
- Abstracts away the internals -- a useful perspective for integration and system testing
- Sometimes you don't have access to source code, and can make little use of object code

### White box

- Testing that takes into account the internal mechanism of a system or component
- Also known as structural testing or glass box testing

## Common coverage criteria

### Statement coverage

- Test every statement of code (line coverage)
- A statement is a line in the source code that can be executed
- Remember that not all lines can be executed: comments, whitespace, delimiters

### Branch coverage

- Test every statement, *and* every branch on multi-branch statements (predicates

### N-length subpath coverage

- Test every subpath of length $N$

### Path coverage

- Test every path through the program, from entry to exit
- Often infeasible in general, yet still not exhaustive

### Coverage reports

- Presents a table of elements (method, module, function) and the number of lines executed and missed
- Missed shows the number of unexecuted lines
- If nonzero, indicates, the tests have not achieved full statement coverage

## Types of testing

### Why so many strategies?

- Competent programmer hypothesis
	- Programmers tend to write code that is mostly correct
	- The more faults exposed, the harder it is to find more
- Different strategies used to ...
	- Achieve different testing goals
	- Capture different kinds of faults

### Exploratory testing

- Name given to the type of testing the is inherently done
- Unscripted, not automated, not repeatable
- Involves simultaneous test design and execution
- Uses human intelligence to guide testing and provide a nuanced assessment of behavior
- Exploratory test sessions
	- Often starts with a test charter (the mission of the session)
	- Can be chosen by the tester, or assigned by a test lead
	- Can explicit or implicit
	- Often vague on purpose
- Characteristics of exploratory testers
	- Creative and astute test designer
	- Careful observation
	- Critical thinking
	- Diverse ideas
	- Collect rich resources

### Scripted testing

- Type of testing that involves a predetermined goal
- Usually done to ensure a specified behavior is correct
- Often automated with the use of scripts and testing tools
- Disadvantages
	- May leave interesting details of expected behavior as unspecified
	- Removes decision making from the tester
- Often used with exploratory testing to repeat discovered test with little expense

### Acceptance testing

- Assessment of whether agreed-upon requirements are met
- Often employ checking of the business contract between client and contractor
- Encompasses many things (ambiguity of natural language)

### Smoke testing

- Not unlike exploratory testing
- Exercise most major functionality to ensure that everything still looks OK
- Often performed before even starting the main testing process
- Answers questions such as
	- Does the program compile?
	- Does it run?
	- Does the main window appear?
	- Does it execute on the client's hardware and environment?
- Consists of
	- System tests or unit tests
	- Can re required before checking in any code
	- One category of smoke testing is "build verification testing"

### User acceptance testing

- A form of testing that bridges the gap between verification and validation
- Intended to be performed by people, not automated scripts or computers
- Check to see if the requirements of the system are met, and that the requirements match the need
- Should be done by someone other than the developer who wrote the code
- Goals
	- Verify man-machine interactions
	- Validate the required functionality of the system
	- Verify that the system operates with the specified constraints
	- Check the system's external interfaces

### Alpha and beta testing

- Another form of acceptance testing
- Terms are ambiguous, but generally refer to different levels of maturity of early non-developer actual use of early versions of the software

## Stages of testing

### Unit testing

- First phase, done by developer who wrote the code
- Focuses on testing individual elements (functions, methods, classes, modules) of a program

### Integration testing

- Combines unit tested modules and tests how they interact
- Can be done by black-boxing the module whose interactions are being tested from within another module

### System testing

- Tests a whole program to make sure it meets requirements
- In multi-system programs, may involve end-to-end testing

### Regression testing

- Changes can break code or reintroduce old bugs
- Things that used to work may stop working
- Usually a set of cases that have failed and then succeeded in the past
- Finding small regressions is an ongoing research area
- Managing a regression suite
	- Test suites accumulate new tests over time
	- Test suites are usually run in a fixed, short, period of time
	- At some point, the number of tests can become unmanageable
	- It may take too long to re-run all tests
- Policies for updating test suites
	- Add a new test for every problem report
	- Remove tests that do not contribute to satisfying coverage
	- Remove tests that have never found a fault or found the same fault as other tests (risky)
	- Reorder execution so that the same coverage criterion is met in fewer tests
- Regression failure
	- Evaluated based on whether the result on the new program $P$ is equivalent to the result on the previous version $P - 1$
	- Regression test failures represent 3 possibilities
		1) The software has a fault (must fix the fix)
		2) The test values are no longer valid on the new version
		3) The expected output is no longer valid
- Rerunning tests
	- Conservative approach: rerun all tests
	- Cheap approach: run only tests whose test requirements relate to the statement that were changed
	- Realistic approach: consider how the changes propagate through the software
