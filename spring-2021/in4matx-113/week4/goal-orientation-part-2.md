# Goal orientation (part 2)

## Building goal models: heuristic rules

- H1: analyze current objectives
	- Preserve strategic, organization-specific objectives and policies -> high level goals for system-to-be
		- Achieve effective access to state-of-the-art knowledge
		- Reduce operational costs
	- Preserve domain/application specific objectives to be found in any system version
	- Analyze problems and deficiencies in system-as-is -> goals of system-to-be
- H2: search for goal-related keywords
	- **Intentional**: in order to, so as to, so that, purpose, etc.
	- **Prescriptive**: shall, should, must, has to, etc.
	- **Amelioration**: improve, increase, decrease, reduce, etc.
- H3: instantiate goal categories
- H4: ask how and why questions
- H5: split responsibilities
- H6: identify soft goals

## Goal types and categories

### Behavioral goals

> Behavioral goals *prescribe* behaviors

- Achieve goals: target condition must eventually hold
- Maintain goal: good condition that must always hold
- Avoid goal: bad condition that must never hold
- Can be satisfied in a clear-cut sense (YES or NO)

### Soft goals

> Soft goals capture preferences among alternatives

- Cannot be satisfied in a clear-cut sense
- Used for comparing alternatives, to select preferred option

### Goal categories

- Functional goals: prescribe intended services to be provided by the system
- Non-functional goals
	- Quality goals (not to be confused with soft goals)
		- Security: info about other patrons kept confidential
		- Safety: worst-case stopping distance maintained
		- Accuracy: book displayed as available *iff* there is a copy on shelves
		- Performance: acceleration command sent every 3 seconds
	- Development goals
		- Costs
		- Deadline
		- Maintainability

### Using categories

- Elicit missing goals: find out what is missing
- Detecting goal conflicts: more usability typically means less security
- Conflict resolution: prioritize goals
- Confidentiality: avoid constraints disclosure to other participants
- Safety: maintain doors closed while train is moving
- Timeliness: participants shall return their constraints within a week at most after request