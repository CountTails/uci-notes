# Intro to probability

## What is probability?

### Meaning

> It is a measurement of how often something will occur

### Applications

- Analyzing the behavior of algorithms that make random choices
	- Running time, performance
- Testing computer systems
	- Generating input/demand to test a system
- Modeling discrete structures
	- Understanding the structure of the internet or social networks

## Definitions

### Basics

- **Experiment**: a *repeatable* process that results in one out of a possible set of outcomes
- **Sample space**: the set of all possible outcomes of an experiment
- Examples
	- 5-card hand from a standard deck
	- Roll of a blue and red die
	- Flip a coin 3 times

### Events

> An **event** is a subset of the sample space

| Experiment | Event |
| ----------- | ----- |
| 5-card hand from a standard deck | The hand has a pair of 8's |
| Roll of a red and blue die | The two dice have the same numbers |
| Flip a coin 3 times | There are more heads than tails |

### Informal

- Elementary (atomic) event: contains only a single outcome in the sample space
- Mutually exclusive events: can't happen at the same time (intersection is empty)
- Impossible event: can't happen at all (probability is 0)
- Certain event: occurs for sure (probability is 1)
- Complementary event: event $\overline{A}$ is an event that occurs exactly when $A$ does not

## Probabilities

- Probability over the outcomes of an experiment with sample space $S$
	- $p: S \to \mathbb{R}$ such that
	- For every $x \in S$, $0 \le p(x) \le 1$
	- $\sum \limits_{x \in S} p(x) = 1$
- Example: roll of a single die
	- $S = \{ 1,\, 2,\, 3,\, 4,\, 5,\, 6 \}$
	- $p(1) = p(2) = p(3) = p(4) = p(5) = p(6) = \frac{1}{6}$
	- $\sum \limits_{x \in S} p(x) = 1$

### Of an event

- $P(E) = \sum \limits_{x \in E} p(x)$
- Event: outcome is even
- $p(2) + p(4) + p(6) = \frac{3}{6}$

### Uniform distribution

- Experiment with sample space $S$
- The uniform distribution over $S$ is $p(x) = \frac{1}{\vert S \vert}$
- If the distribution is uniform then: $p(E) = \frac{\vert E \vert}{\vert S \vert}$

### Probabilities under a distribution

> A coin is flipped 3 times. What is the event that the first two flips come up heads?

- First two flips fixed as heads
- Third flip could be heads or tails

$$
	\{ HHH,\, HHT \}
$$

> Deal a 5 card hand from a perfectly shuffled deck. What is $\vert S \vert$

$$
	\vert S \vert = {52 \choose 5}
$$

### Probabilities and counting by complement

- Experiment with sample space $S$ consisting of 5 card hands from a standard deck
- Event $P$ is the event the hand has at least one ace
- Event $\overline{P}$ is the event the hand has no aces

$$
	Prob(P) = \frac{\vert P \vert}{\vert S \vert} = \frac{\vert S \vert - \vert \overline{P} \vert}{\vert S \vert} = \frac{\vert S \vert}{ \vert S \vert} - \frac{\vert \overline{P} \vert}{\vert S \vert} = 1 - Prob(\vert \overline{P} \vert)
$$

> A 5 card hand is dealt from a perfectly shuffled deck. What is the probability that the hand has at least one ace?

$$
	1 -  \frac{{48 \choose 5}}{{52 \choose 5}}
$$