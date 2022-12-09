# Lecture 2

## Probability examples

### Law of total probabilities

- If the events $A_{1},\ A_{2},\ \dots,\ A_{M}$ form a partition of sample space $S$, then
    - $A_{1} \cup A_{2} \cup \dots \cup A_{M} = S$
    - $\forall_{A_{i} \in S}$ the partitions as mutually exclusive
- $P(B) = P(B \cap A_{1}) + P(B \cap A_{2}) + \dots + P(B \cap A_{M}) = \sum \limits_{i = 1}^{M} P(B \cap A_{i})$
### Example 1

- Let 
    - $A_{1}$ be the event that someone with blood type A
    - $A_{2}$ be the event that someone with blood type B
    - $A_{3}$ be the event that someone with blood type AB
    - $A_{4}$ be the event that someone with blood type O
    - $B$ be the event that someone right handed
- To find $P(B)$
    - $P(B) = \sum \limits_{i = 1}^{4} P(B \cap A_{1})$

### Example 2

- Let 
    - $B$ be the event that a flipped coin lands on heads
    - $A_{1 \dots 6}$ be the events that a rolled dice lands on $\{1 \dots 6 \}$
- Given that $P(A_{i} \cap B) = \dfrac{1}{12}$ (will be shown later)
    - $P(B) = P(A_{1} \cap B) + P(A_{2} \cap B) + \dots + P(A_{6} \cap B) = \dfrac{6}{12} = 0.5$

### Example 3

|   | $D_{A}$ | $D_{B}$ | $D_{C}$ | $D_{D}$ | $D_{E}$ | $D_{F}$ | Total |
|---|----|----|----|----|----|----|----|
| $G_{M}$ | 0.182 | 0.124 | 0.072 | 0.092 | 0.042 | 0.082 | 0.595 |
| $G_{F}$ | 0.024 | 0.006 | 0.131 | 0.083 | 0.087 | 0.075 | 0.405 |
| Total | 0.206 | 0.129 | 0.203 | 0.175 | 0.129 | 0.158 | 1.000 |

- This is the *contigency* table of gender and department. $G$ denotes the gender, $D$ denotes the department
- The table would read $P(G_{M} \cap D_{A}) = 0.182$ and $P(G_{F} \cap D_{F} = 0.075$
- The probability of being a male is $P(G_{M}) = \sum \limits_{i \in \{ A,\ B,\ C,\ D,\ E,\ F, \} } P(D_{i} \cap G_{M})$
- The probability of applying to department A is $P(D_{A}) = \sum \limits_{i \in \{ M,\ F \}} P(D_{A} \cap D_{i})$

## Conditional probability

### Definition

- This is the probability of an event occuring given that another event has already occurred
- Denoted as $A\vert B$ and means event $A$ occurs conditionally on event $B$ having already occurred
- Event $B$ has already been observed, only event $A$ remains random
- $P(A \vert B)$ signifies the probability of $A$ occuring on the condition that $B$ has already occurred

### Baye's theorem

- Used to compute conditional probabilities
- $P(A \vert B) = \dfrac{P(A \cap B)}{P(B)} \iff P(A \cap B) = P(A \vert B)P(B) = P(B \vert A)P(A)$
- If $A$ has two outcomes: $P(B) = P(A \cap B) + P(A^{c} \cap B)$
- In general: $P(B) = \sum \limits_{i = 1}^{M} P(B \cap A_{i})$

### Independent events

- Events $A$ and $B$ are *independent* if
    - Dnowledge that $B$ occurred has no bearing on the likelihood that $A$ will occur
    - Denoted as $P(A \vert B) = P(A)$ or $P(B \vert A) = P(B)$
- As a result
    - $P(A \cap B) = P(A)P(B)$
    - The probability of $A$ and $B$ occurring is equal to the product of the individual probabilities
- If the events are not *independent*
    - We must use Baye's theorem
    - $P(A \cap B) = P(A)P(B\vert A)$

### Complements

- Complements still hold for conditional probabilities. Let $A$ and $B$ be events
    - $P(A) = 1 - P(A^{c})$ is known
    - We can infer that $P(A \vert B) = 1 - P(A^{c} \vert B)$
    - We **cannot** infer that $P(A \vert B) = 1 - P(A \vert B^{c})$

### Examples

- Say a coin is flipped twice. Let
    - $A$ be the event that the first flip lands on heads
    - $B$ be the event that the second flip also lands on heads
    - The probability of getting two heads is as follows
        - $P(B \vert A) = \dfrac{P(HH)}{P(HH) + P(TH)} = 0.5$
        - The events $A$ and $B$ are independent
- Consider the gender/department table from earlier
    - The probability someone applied to department C **given** that they were female is as follows
        - $P(D_{C}\vert G_{F}) = \dfrac{P(D_{C} \cap G_{F})}{P(G_{F})}$
        - $P(D_{C} \cap G_{F}) = 0.131$
        - $P(G_{F}) = \sum \limits_{i \in \{ A,\ B,\ C,\ D,\ E,\ F, \} } P(D_{i} \cap G_{F}) = 0.405$
        - $P(D_{C} \vert G_{F}) = \dfrac{0.131}{0.405} = 0.323$
    - The events gender and department are **NOT** indepedent
- Suppose an exam can test for the presence of a certain type of disease that occasionally returns false positives
    - The exam returns the correct result with a probability of 0.95 ($P(+ \vert D)$)
    - The exam returns the incorrect result with a probability of 0.02 ($P(D^{c})$)
    - The prevalence of the disease is 0.01 (this is $P(D)$)
    - The probability of someone having the disease is as follows
        - $P(+) = P(+ \cap D) + P(+ \cap D^{c})$
        - $P(+) = P(+ \vert D)P(D) + P(+ \vert D^{c})P(D^{c})$ by Baye's theorem
        - $P(+) = 0.95 * 0.01 + 0.02 * 0.99 = 0.0293$
    - The probability of someone having the disease given a positive test result is as follows
        - $P(D \vert +) = \dfrac{P(D \cap +)}{P(+)}$
        - $P(D \vert +) = \dfrac{P(+ \vert D)P(D)}{P(+)}$
        - $P(D \vert +) = \dfrac{0.95 * 0.01}{0.95 * 0.01 + 0.02 * 0.99} = 0.3242$
    - The events are **NOT** independent