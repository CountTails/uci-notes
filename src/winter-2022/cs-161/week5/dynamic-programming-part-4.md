# Dynamic programming (part 4)

## Edit distance

### Problem statement

The **edit distance** follows is as follows: we are given 2 strings (not necessarily of equal length). We want to convert the first string to the other by a sequence of insertions, deletions, and substitutions. The **cost** is the number of operations we perform

For example, if we want to convert `FOOD` into `MONEY` we could to this

$$
    \text{FOOD} \implies \text{MODD} \implies \text{MOND} \implies \text{MONED} \implies \text{MONEY}
$$

### Approaching the problem

We **define** `Edit(i, j)` to be the *minimum cost* to convert `X[1...i]` to `Y[1...j]`. Consider what happens in the last column

- Insertion: `Y[j]` was added -> `ins = 1 + Edit(i, j - 1)`
- Deletion: `X[i]` was added -> `del = 1 + Edit(i - 1, j)`
- Substitution(or not): `sub = Edit(i - 1, j - 1) + (X[i] != Y[j])`

### The recursive approach

```
Edit(X, Y, i, j):
    if i == 0 or j == 0 then
        return i or j
    else then
        ins = 1 + Edit(i, j - 1)
        del = 1 + Edit(i - 1, j)
        sub = Edit(i - 1, j - 1) + (X[i] != Y[j])
        return min(sub, ins, del)
```

### The dynamic programming approach

```
Edit(X, Y, i, j):
    memo := [[-1 for a=0...i] for b=0...j]
    for a=0...i do
        memo[0][a] = j
    for b=0...j do
        memo[b][0] = i

    for a=1...i do
        for b=1...j do
            memo[a][b] = min(
                memo[a][b-1] + 1,
                memo[a-1][b] + 1,
                memo[a-1][b-1] + X[a] != Y[b]
            )

    return memo[i][j]
```