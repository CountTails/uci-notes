# Counting by complement

## 5 card hand (revisited)

### Exactly 1 club

- There are ${13 \choose 1} {39 \choose 4}$ hands with *exactly* one club

### No clubs

- There are ${39 \choose 5}$ hands with **no** clubs

### At least one club

- Could figure out 1, 2, 3, 4, 5 clubs independently and sum up the results
- But we know how many hands have no clubs (which is an easier problem)
- Thus, by subtracting away the number of hands with no clubs, we get the number of hands with *at least* one club

$$
	{52 \choose 5} - {39 \choose 5}
$$

## Counting by complement

- Given set $S$ of items
- Let $P \subset S$ be the set of items in $S$ that have some particular property

$$
	\vert S \vert - \vert \overline{P} \vert = \vert P \vert
$$

## Example

- How many length 8 strings over the alphabet $\{a,\, b,\, c \}$ have **at least** one `a`?
	1) Find the total number of strings: $3^{8}$
	2) Find the string that have no `a`'s: $2^{8}$
	3) Find the strings with *at least* 1 `a`: $3^{8} - 2^{8}$