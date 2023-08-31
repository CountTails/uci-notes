# Lecture 3

## Permutations and combinatorics

### Equally likely outcomes

- Say all events in a sample space are equally likely
- Let $\#(A)$ denote the number of ways event $A$ can occur
- Let $\#(S)$ denote the number of possible outcomes
- $P(A) = \dfrac{\#(A)}{\#(S)}$

### Example 1

- Say a coin is flipped 3 times
- All events in the sample space are equally likely to occur
    - $S = \{ HHH,\ HTH,\ HHT,\ THH,\ TTH,\ THT,\ HTT,\ TTT \}$
- Let event $A$ be such that at least 2 heads show up in the 3 flips
    - $\#(A) = 4$ because $A = \{ HHH,\ HHT,\ HTH,\ THH \}$
    - $\#(S) = 8$
    - $P(A) = \dfrac{\#(A)}{\#(S)} = \dfrac{4}{8} = \dfrac{1}{2}$

## Counting

### Counting methods

- Used to figure out the number of ways an event can occur
- Also used to figure out the size of the sample space

> Thm: Suppose an experiment comprises of $k$ many steps or parts ($k \ge 2$) and the $i$th part has $n_{i}$ many possible outcomes. The total number of ways this experiment can unfold is $\prod \limits_{i = 1}^{k} n_{i}$

- Say we create a 6 character password. 3 letters followed by 3 numbers
- There are 26 letters and 10 numbers to choose from. We can reuse letters and numbers
- The total number of passwords is $26 * 26* 26 * 10 * 10 * 10$
- Without repitition, the total number of passwords is $26 * 25 * 24 * 10 * 9 * 8$
- Note that order does matter when counting. These are called *permutations*

### Permutations

- A permutation is an ordered arrangement
- Say 5 employees need to be seated at a table
    - The total number of ways to arrange them is $5 * 4 * 3 * 2 * 1 = 120$
    - If only 3 of them need to be seated, the total arrangements becomes $5 * 4 * 3 = 60$
- Full permutations will use the multiplication theorem presented earlier
- Partial permutations, or k-permutations, use $P_{n,\ k} = n * n - 1 * \dots * (n - k + 1) = \dfrac{n!}{(n - k)!}$
    - where $n! = n * (n - 1) * \dots * 2 * 1$
    - And $1! = 0! = 1$

### Combinations

- A combination does not take order into account
- If we have $n$ object and pick $k$ items, collections with the same items (regardless of order) are counted once
- The formula is $C_{n,\ k} = \dfrac{P_{n,\ k}}{k!} = \dfrac{n!}{k! (n - k)!} = {n \choose k}$
- It is read as "$n$ choose $k$"
- Say we pick 2 letters out of $\{ A,\ B,\ C \}$
    - The number of permutations is $P_{3,\ 2} = \dfrac{3!}{1!} = 3 * 2 = 6$
    - The number of combinations is $C_{3,\ 2} = \dfrac{3!}{2!1!} = 3$

## Binomial coefficient

### Definition

- The choose formula is also known as the binomial coefficient
- It can be used to compute coefficients on the power terms of the expansion $(x + y)^{n}$

$$
    (x + y)^{n} = \sum \limits_{k = 0}^{n} {n \choose k}x^{k}y^{n - k}
$$

### Properties

- ${n \choose 0} = {n \choose n} = 1$
- ${n \choose k} = {n \choose n - k}$
- ${ n \choose k} + {n \choose k - 1} = { n + 1 \choose k}$
- ${n \choose 0} + {n \choose 1} + \dots + {n \choose n} = 2^{n}$

## Multinomial coefficient

### Definition

- Say we have $k$ groups to put $n$ objects into
- Let $n = n_{1} + n_{2} + \dots + n_{k}$ where $\forall_{i}\ n_{i} > 0$
- The multinomial coefficient is ${n \choose n_{1},\ n_{2},\ \dots ,\ n_{k}} = \dfrac{n!}{n_{1}!n_{2}! \dots n_{k}!}$

### Properties

- When $k = 2$, the multinomial coefficient reduces to the binomial coefficient
- The mulitnomial coefficient can compute the coefficient on the power terms in the expansion of $(x_{1} + x_{2} + \dots + x_{k})^{n}$

## Union of events

- Let $A$, $B$, and $C$ be events that are not assumed to be disjoint or mutually exclusive

$$
    P(A \cup B \cup C) = 
    P(A) + P(B) + P(C) - 
    \left[ P(A \cap B) + P(A \cap C) + P(B \cap C) \right] + 
    P(A \cap B \cap C)
$$

- In general

$$
    P(\bigcup \limits_{i = 1}^{n}) = 
    \sum \limits_{i = 1}^{n} P(A_{i}) -
    \sum \limits_{i < j} P(A_{i} \cap A_{j}) +
    \sum \limits_{i < j < k} P(A_{i} \cap A_{j} \cap A_{k}) -
    \dots + (-1)^{n + 1}P(A_{1} \cap A_{2} \cap \dots \cap A_{n})
$$
