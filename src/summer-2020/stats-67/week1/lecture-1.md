# Lecture 1

## Statistics

### Definition

- The mathematical science of learning from data
- Methods for collecting and analyzing empirical data
- Empirical data naturally has variability and randomness
- Probability theory is used to describe this variability and randomness

### Events

#### Frequency

- The probability of an event $P$ is the proportion of times it is observed under repeated observation
- Say we flip a coin $n$ times and the number of heads, $X$ is recorded
- The probability of getting a head is $P = \lim \limits_{n \to \infty} \dfrac{X}{n}$
- Can be viewed as the long run average of the number of "successes"
- The proportion of successes will converge to its true probability. (*law of large numbers*)

#### Bayesian interpretation

- Events that cannot be repeated make it difficult to view probability from a frequency standpoint
- In the bayesion interpretation, probability of an event is the degree on one's belief it will occur

## Probability

- The set of all possible outcomes in a random expirament is the sample space $S$
    - Flip a coin. $S = \{H,\ T \}$
    - Roll a die once. $S = \{1,\ 2,\ 3,\ 4,\ 5,\ 6\}$
- An event $A$ is a subset of the sample space
    - Event $A$ is that a die lands on a even number. $A = \{2,\ 4,\ 6 \}$
    - The empty set $\emptyset$ is also an event (the impossible event)
- A *probability distribution* assigns a number to each possible outcome in the sample space
    - $0 \le P(s) \le 1 \ \forall_{s \in S}$
    - $\sum \limits_{s \in S} P(s) = 1$
    - $\int \limits_{s \in S} P(s)\ ds = 1$
- Valid probability distributions must sum up to exactly $1$

## Set theory basics

- Let $A$ and $B$ be sets

### Empty sets

- $\emptyset$ is the emptyset. It is the set that contains no elements
- $\emptyset = \{ \}$

### Subsets

- $A$ is a *subset* of $B$ if $s \in A \implies s \in B$
- Whatever is in set $A$ is also in set $B$
- Denoted as $A \subset B$

### Union

- Denoted as $A \cup B$
- Essentially combines the sets $A$ and $B$
- If $s \in A$ or $s \in B$, then $s \in A \cup B$

### Intersection

- Denoted as $A \cap B$
- Essentially the overlap of two sets

### Complement

- $A^{c}$ denotes the *complement* of $A$
- Represents the collection of elements that are not in $A$
- Note: $(A^{c})^{c} = A$ and $A \cup A^{c} = S$

### With respect to events and sample spaces

- $A \cup B$: The event that either $A$ or $B$ happens
- $A \cap B$: The event that both $A$ and $B$ happens
- $A^{c}$: The event that $A$ does not happen

### Complements for unions and intersections

- $(A \cup B)^{c} = A^{c} \cap B^{c}$
- $(A \cap B)^{c} = A^{c} \cup B^{c}$

### Mutual exclusivity

- Two sets (or events) are mutually exclusive if they cannot occur at the same time
- Denoted as $A \cap B = \emptyset$
- It is easy to check for mutually exclusivity if $A$ and $B$ come from the same sample space $S$
- This cannot be done if $A$ and $B$ come from differnet sample spaces

### Viewing multiple sample spaces

- Say events $A$ and $B$ are the outcomes of a single die roll
- The combined sample space would be $S = \{ (1, 1),\ (1, 2),\ \dots (6, 5),\ (6, 6) \}$

## Probability theory basics

### Axioms

- $P(\emptyset) = 0$
- If $A$ and $B$ are mutually exclusive events, then $P(A \cap B) = 0$
- If sets $A$ and $A^{c}$ partition their respective sample space, then $P(B) = P(B \cap A) + P(B \cap A^{c})$

### Example 

- Say $P(A) = 0.8$ and $P(B) = 0.8$ and $P(A \cap B) = 0.7$
    - $P(A^{c}) = 1 - 0.8 = 0.2$
    - $P(A^{c} \cap A) = P(A) + P(A^{c}) - P(A \cap A^{c}) = 0.8 + 0.2 - 0 = 1$
    - $P(A \cup B) = P(A) + P(B) - P(A \cap B) = 0.8 + 0.8 + 0.7 = 0.9$

### Multiple mutually exclusive events

- Say we have $M$ mutually exclusive sets
    - $P(A_{1} \cup A_{2} \cup \dots \cup A_{M}) = P(A_{1}) + P(A_{2}) + \dots + P(A_{M})$
    - If the sets partition a sample space $P(A_{1} \cup A_{2} \cup \dots \cup A_{M}) = P(S) = 1$