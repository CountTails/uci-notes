# Inclusion-exclusion principle

## The sum rule (review)

- For finite sets $A_{1}$, $A_{2}$, ..., $A_{n}$
	- If the sets are pairwise disjoint then $\vert A_{1} \cup A_{2} \cup \dots \cup A_{n} \vert = \vert A_{1} \vert + \vert A_{2} \vert + \dots + \vert A_{n} \vert$
- What if the set are **not** pairwise disjoint

## Inclusion/Exclusion

- How many strings of length 6 over the alphabet $\{ A,\, B,\, C \}$ start with a $C$ or $B$
	- The sets are pairwise disjoint, the normal sum rule applies
- How many strings of length 6 over the alphabet $\{ A,\, B,\, C \}$ start or end with a $C$
	- The sets are **not** pairwise disjoint, the inclusion-exclusion principle applies
	- Strings that start **and** end with a $C$ are *double counted*
	- The extra counts will need to be subtracted from the normal sum rule

### 2 sets

$$
	\vert A \cup B \vert = \vert A \vert + \vert B \vert - \vert A \cup B \vert
$$

- $S$ is a general population of elements
- $A$ is the set of elements with property 1
- $B$ is the set of elements with property 2
- $A \cup B$ is the set of elements with both properties

> How many binary strings of length 10 start with a 0 or have exactly 5 1's or both?

- Number of strings that start with a 0: $2^{9}$
- Number of strings with exactly 5 1's: ${ 10 \choose 5}$
- Number of strings with both properties: ${9 \choose 5}$
- Number of strings in the defined set: $2^{9} + {10 \choose 5} - {9 \choose 5}$

> How many strings of length 6 over the alphabet $\{ A,\, B,\, C \}$ have at least 5 consecutive A's?

- Number of strings where the first 5 characters are A: $3$
- Number of strings where the last 5 characters are A: $3$
- Number of strings where all characters are A: $1$
- Number of strings in the defined set: $3 + 3 - 1 = 5$

### 3 sets

$$
	\vert A \cup B \cup C \vert
	 = \vert A \vert + \vert B \vert + \vert C \vert
	 - \vert A \cap B \vert - \vert A \cap C \vert - \vert B \cap C \vert
	 + \vert A \cap B \cap C \vert
$$

> Drug test on a population of 1000 people
> 	- 122 people develop symptom A
> 	- 88 people develop symptom B
> 	- 112 people develop symptom C
> 	- 27 people develop symptom A and B
> 	- 29 people develop symptom A and C
> 	- 32 people develop symptom B and C
> 	- 10 people develop all symptoms
> How many people get at least one symptom?

- $122 + 88 + 112 - 27 - 29 - 32 + 10 = 244$

> How many strings of length 6 over the alphabet $\{ A,\, B,\, C,\, D,\, E\}$ have at least 4 consecutive A's?

 - AAAA** -> $5^{2}$ strings
 - \*AAAA\* -> $5^{2}$ string
 - \*\*AAAA -> $5^{2}$ strings
 - AAAAA* -> $5$ strings
 - \*AAAAA -> $5$ strings
 - AAAAAA -> $1$ string
 - AAAAAA -> $1$ string
 - Strings in the set: $3 * 25 - 2 * 5 - 1 + 1 = 65$

### 4 sets

$$
	\vert A \cup B \cup C \cup D \vert 
	= \vert A \vert + \vert B \vert + \vert C \vert + \vert D \vert
	- \vert A \cap B \vert - \vert A \cap C \vert - \vert B \cap C \vert - \vert A \cap D \vert - \vert B \cap D \vert - \vert C \cap D \vert
	+ \vert A \cap B \cap C \vert + \vert A \cap B \cap D \vert + \vert A \cap C \cap D \vert + \vert B \cap C \cap D \vert
	- \vert A \cap B \cap C \cap D \vert
$$

> How many strings of length 10 over the alphabet $\{ A,\, B,\, C \}$ six occurrences of A or six occurrences of B or six occurrences of C?

- ${10 \choose 6}2^{4}$

## Inclusion/Exclusion and counting by complement

> How many 5 card hands have at least one ace or at least one queen?

- No aces: ${52 \choose 5} - {48 \choose 5}$
- No queen: ${52 \choose 5} - {48 \choose 5}$
- No aces and queen: ${52 \choose 5} - {44 \choose 5}$
- Hands in the complementing set: $\left( {52 \choose 5} - {48 \choose 5}\right) + \left( {52 \choose 5} - {48 \choose 5} \right) - \left( {52 \choose 5} - {44 \choose 5} \right)$
- Hands in the specified set: $\left( {52 \choose 5}\right) - \left[ \left( {52 \choose 5} - {48 \choose 5}\right) + \left( {52 \choose 5} - {48 \choose 5} \right) - \left( {52 \choose 5} - {44 \choose 5} \right) \right]$