# Dynamic programming (part 3)

## Subset sum

### Problem statement

> Given a set $S$ of $n$ positive integers, as well as a positive integer $T$, determine if there is a subset of $S$ that sums exactly to $T$

- Example 1: $S = \{ 2, 3, 4\} ,\ T= 6$ -> "yes"
- Example 2: $S = \{2, 3, 5 \} ,\, T = 6$ -> "no" (elements can only be used once)

### Initial recursive version

As with all other dynamic programming algorithms, we are going to start with a recursive case and transform it from there. Remember, *dynamic programming is about smart recursion*.

- Find a recursive algorithm to determine if a subset of the first $n$ values in the input field adds up to $T$

```
SubsetSum(s, n, t):
    if t == 0 then
        return true
    else if n == 0 then
        return false
    else then
        no_use_nth = SubsetSum(s, n - 1, t)
        yes_use_nth = t >= s[n] and SubsetSum(s, n - 1, t - s[n])
        return no_use_nth or yes_use_nth
```

### Progressing to dynamic programming

- Finish the process to make this a dynamic programming algorithm, including outputting the subset of the items for the case when the answer is "yes".

```
SubsetSum(s, n, t):
    memo := [[-1 for i=0...n] for j=0...t]
    for i=0...n do
        memo[i][0] = true
    for j=0...t do
        memo[0][j] = false

    for i=1...n do
        for j=1...t do
            memo[i][j] = memo[i-1][j] or (j - s[i] >= 0 and memo[i-1][j] - s[i])

    return memo[n][t]
```

- The running time of the algorithm above is $O(nt)$
- If we double the size of $S$, but leave $T$ alone, the algorithm will take twice as long
- If we double the size of $T$, but leave $S$ alone, the algorithm will scale by factor $T$ was increased by
- This term that describes the behavior of this algorithm as the input is scaled is called **psuedo-polynomial**