# Evaluating interactive systems

## Why evaluate?

- To find and fix issues with our designs
	- What you cannot evaluate, you cannot improve
	- Data helps unify teams around changes
	- Mitigate our blindspots and uncover unexpected user behavior
- Results sometimes drive innovation
- Determine/measure whether goals are met, targets achieved, requirement fulfilled
	- Help compare alternative designs

### Types of evaluation

- Expert evaluation
	- Heuristic evaluation
	- Cognitive walkthrough
	- User modeling
- Testing with users
	- Usability testing
	- Observation
	- Interview/focus groups
	- Surveys
	- Remote testing
	- Eye tracking
	- A/B testing

## Evaluation methods

### Heuristic evaluation

- Pros
	- Fast, cheap, easy
		- (Almost) anyone can do it
		- Use at any time during development cycle
		- Can involve the whole team
		- Resource light
	- Good at identifying obvious issues
	- Method counteracts individual bias (checklist + multiple experts)
- Cons
	- Less good at identifying deep usability issues
	- Doesn't involve actual users
		- Susceptible to assumptions about users
		- Use of static prototypes might miss interactive aspects
	- Heuristics don't always apply equally to all designs

### Cognitive walkthroughs

- Pros
	- Fast and cheap
		- Use at any time during development cycle
		- Resource light
	- Good at identifying specific, basic issues
		- Focuses on non-experts
	- Focused on dynamic tasks and content (unlike heuristics)
- Cons
	- More difficult that heuristic evaluation
	- Doesn't involve real users
		- Susceptible to assumptions (especially if not closely tied to a persona)
	- Doesn't as readily analyze expert use
	- Strict task focus can miss more general issues
		- Difficult to apply to less linear tasks

### GOMS/KLM (user modeling)

- Pros
	- Inexpensive
	- Use at anytime during development cycle
	- Engineering models like this are prized in some organizations
	- Clear focus on expert use
	- Can precisely identify which interface components are causing loss of efficiency
- Cons
	- Requires skilled analyst
	- Cannot explain novice or infrequent use
	- Predictions are dependent on specific tasks and interfaces
	- Only focuses on efficiency

### Usability testing

- Pros
	- Actual humans
	- Actual use of the system
	- Can gain deep insight about specific tasks and questions
	- Rich and detailed data
	- Comparability of different people or systems
	- Can be most rigorous methods
- Cons
	- Most expensive methods
	- Slow (although some lightweight/faster versions exist)
	- Still somewhat artificial situation despite users
	-  Task choice is crucial
	- Requires skill and training to facilitate well

### A/B testing

- Pros
	- Lots of real users
	- Actual use of the system
	- Comparability of different people or systems
	- Often quick turnaround
	- Relatively inexpensive
	- Quantitive data is very convincing
- Cons
	- Need lots of real users
	- Need to have system already in place or very late in development
	- Data tends to be narrowly focused
	- Tends to how what happens, not why
	- Can cause us to get bogged down in tiny changes

## Comparing methods

| Method | Relative cost | Speed |
| ------ |:-------------:|:-----:|
| Heuristic evaluations | 1 | 1 |
| Cognitive walkthrough | 2 | 2 |
| User modeling | 3 | 3 | | |
| Usability testing | 5 | 4 |
| A/B testing | 4 | 5 |
