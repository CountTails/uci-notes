# Lecture 8

## Project time management

- Clients asks for reduced timeline
- Task resource fails, in unavailable, or access is delayed
- Team member quits
- Task underestimated, taking longer than planned

### Critical path

#### What is it?

- Critical path is the **longest duration** of activities from start to finish
- Critical path represents the **shortest** time to project completion
- To find, recursively travel along the most expensive path in a network diagram

#### Why does it matter?

- Makes it possible to assess and maintain project scope
- Gives project manager a focal point
- Allow monitoring of critical path highlights (when and where to apply control)
- Assess and decide on trade-offs when critical path changes
- Identify where and when to shorten a project schedule

#### Addressing change in the critical path

- Identify weak task links (tasks that are likely not to go as plan)
- Protect the task with a task buffer
- Protect the project with a project buffer
- Adding buffers is generally not risky

> work expands so as to fill the time available for its completion
>  - Parkinson's law

#### Theory of constraints and critical chain scheduling

- Eliminate activity due dates and milestones
- Rely of buffers to drive schedule
- If buffer time is consumed, raise warning **and** address it
- If activity completes early, expand the buffer

> Do not complete work where there is none, 
> and do not obscure the question of how
> much capacity is available
>  - PMI

#### Program evaluation and review technique

Application of a formula for estimating project duration using **probabilistic time estimates** to a Critical Path Method

Let

- $ot$ be the optimistic time
- $lt$ be the likely time
- $pt$ be the pessimistic time

$$
	PERT_{avg} = \dfrac{ot + 4 * lt + pt}{6}
$$
## Project cost management

### Cost management process

```
+----------+      +------------+      +--------+      +---------+
| Planning | ---> | Estimating | ---> | Budget | ---> | Control |
+----------+      +------------+      +--------+      +---------+
```

| Stage | Definition |
| ---- | ---- |
| Planning | Policies, procedures, and documentation for managing the cost of a project |
| Estimating | Approximating the costs of all resources required to complete a project |
| Budget | Allocation of estimated cost to individual work items |
| Control | Controlling performance and changes to the project budget |

Cost management reveals insights to the expenses and revenue of a project

$$
	P = R - E
$$

### Types of estimates

- Rough order of magnitude
	- Very early, before project completion
	- Aids selection
	- Estimates range from 50% under to 100% over
- Budgetary
	- Early, before project completion
	- Assign actual amounts to budget
	- Estimates range from 10% under to 25% over
- Definitive
	- During the project
	- Includes purchases, estimates of actual cost
	- Estimates range from 5% under to 10% over

### Estimating costs

- Analogous of top-down estimates apply what is already known
- Buttom-up estimates calculate upward from the smallest work items
- Probabilistic or three-point use a PERT-like weighted average formula
- Parametric estimates rely on analogous data paired with quantifiable parameters like expertise, environments and tools (e.g. cost per line of code)

### Importance of accurate estimates

Whover holds the purse strings will always remember the initial estimate

1) It is natural to underestimate
2) Accurate estimation comes with experience
3) Track and manage project data to build better estimates
4) Know the abilities of your project team

### Earned value management

Review currently *and* cumulatively

- $PV$ is the planned value
- $AC$ is the actual cost
- $EV$ is the earned value

Combine scope, time, and cost data to measure project performance

#### Example

Let 

- $PV = 4000$
- $AC = 5000$
- $EV = 4000$

##### Cost variance

$$
	CV = EV - AC = 4000 - 5000 = -1000
$$

Evaluating the current system cost more than planned. We are over budget

##### Schedule variance

$$
	SV = EV - PV = 4000 - 4000 = 0
$$

Indication that activity took longer or shorter than planned. We are on track, met estimate

##### Cost performance index

$$
	CPI = \dfrac{EV}{AC} = \dfrac{4000}{5000} = 0.8 = 80\%
$$

When less than 100%, the project is over budget. When greater than 100%, the project is under budget. We are over budget by 20%!

##### Schedule performance index

$$
	SPI = \dfrac{EV}{PV} = \dfrac{4000}{4000} = 1 = 100\%
$$

When less than 100%, the project is late. When greater than 100%, the project is early. We are on schedule!


