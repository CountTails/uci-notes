# Lecture 4

## Project development life cycle models

All products go through a life cycle. A process or guide for managing the phases of a project

- starting the project
- organizing and preparing
- carrying out the work
- finishing the project

Models give us a clear, consistent and reusable approach to product development

### Waterfall model

- Rigid and linear process (don't move on until current phase is complete)
- depends on stabile, largely immutable requirements
- changes take more time and effort to incorporate (adds risks)
- Analysis -> Design -> Construction -> Testing -> Support

### Spiral model

- adds iteration to waterfall model
- refine and re-implement as needed

```
Implementation <---- Design
  |                     ^
  |                     |
  |                     |
  V                     |
Testing ------------> Analysis
```

### Prototyping model

- Dependent upon end user feedback
- Prototypes are mutable

```
--> Analyis ---------> Rapid Design --> Build Prototype
                            ^                 |
                            |?                V
*-- Build Product <-- Refine Prototype <-- User Eval
```

### Agile / Scrum

- Individual and interactions over processes and tools
- Working software over comprehensive documentation
- Customer collaboration over contract negotiation
- Responding to change over following a plan

Scrum model

- Sprints typically last 2-4 weeks
- Teams evaluate and iterate daily
- Product shipped in stages

## Applying the agile model

### Epic

- Consists of 1-many sprints required to reach goal

### Sprint

- 2-4 week period
- consists of planning, executing, testing, and review phases
- items from product backlog added as cards to a sprint board
- cards are moved as progress is made

### Roles

- Product Owner
	- responsible for project success
	- Oversees backlog and assignments
- Scrum Master
	- Responsible for day to day progress
	- Leads daily standups
	- In charge of process, not team
- Development Team
	- Responsible for implementing backlog items
	- work with scrum master to implement user stories

### User stories (allow nonexperts to participate)

- short descriptions developed with stakeholders
- About 2-3 sentences describing what the system should do
- As a [ROLE], I want [PRODUCT] to [DO SOMETHING] so that [OUTCOME]
- Development team interprets each user story into the tasks required to fulfill the state stakeholder need