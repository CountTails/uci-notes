# Divide and conquer (part 5)

## Warm-up exercise

We are given a set $S$ of $n$ points in a plane, we want to find the set of *minima points*. That is, if we include $(x, y)$ in our output, we want to ensure that there is no point $(x', y')$ in the output such that $x \ge x'$ and $y \ge y'$.

One way to think about the problem is as follows: suppose we have a database of hotels in which we can book rooms for customers. A customer has, as their top priorities, a hotel that is close to the beach and inexpensive in cost. We can think of $x$ as "proximity to the beach" and $y$ as "the cost of the room". We need to present a menu to choose from, since we don't know how the customer weighs these two objectives, but we know when choosing between $A$ and $B$, if $A$ is further from the beach *and* is more expensive then $B$, the customer won't pick $A$.

**The warm-up**: Give an example input with $n = 3$ hotels where we would want to return *all three* hotels. That is, each hotel must be such that neither of the other two is both less expensive and closer to the beach.

You can (and should) make up numbers for the distances to the beach and prices; you do not need to find numbers for three real hotels that fit this requirement, nor do the numbers need to be realistic, as long as they fit the requirement. You do not need to give the hotels "fancy" names -- "hotel 1, hotel 2, hotel 3" is fine

| Hotel | Distance to the beach | Cost per night |
| ----- | --------------------- | -------------- |
| Hotel 1 | 1 mi | $300 |
| Hotel 2 | 5 mi | $250 |
| Hotel 3 | 10 mi | $150 |

## The minima set problem

### A brute force solution

```
FindMinimaSet(S):
    /* Sort points along any dimension */
    for i=1...|S|-1 do
        for j=i+1...|S| do
            if S[i].x < S[j].x and S[i].y < S[j].y then
                /* Remove S[j] from S */
    return S
```

- The solution above is undoubtedly $O(n^{2})$

### The initial improvement

```
FindMinimaSet(S):
    if |S| <= 1 then
        return S
    p := /* The median point in S by x-coordinate */
    L := /* Points less than p */
    G := /* Points greater than or equal to p */
    M_1 := MinimaSet(L)
    M_2 := MinimaSet(G)
```

> Is $M_{1} \cup M_{2}$ the correct return set? 

No, let $S = \{ (1, 4),\, (2, 6),\, (3, 2),\, (4, 5),\, (5, 7),\, (6, 9),\, (7, 1),\, (8, 6) \}$

- The proposed improvement would leave out: $\{ (1, 4),\, (3, 2),\, (7, 1) \}$
- The proposed improvement would incorrectly include: $\{ (5, 7) \}$

How can we correctly merge to two sub-solutions into a correct full solution?

```
FindMinimaSet(S):
    ...
    for a in M_1 do
        for b in M_2 do
             if a.x < b.x and a.y < b.y then
                 /* Remove b from M_2 */
    return M_1 U M_2
```

- The merge of sub-solution is $O(n^{2})$
- The overall recurrence would be $T(n) = 2T(n/2) + n^{2}$, which reduces to a complexity of $O(n^{2})$
- This is unfortunately not any better than the brute force solution

### Efficient merging

```
FindMinimaSet(S):
    ...
    a := /* Minimum x-coordinate in M_1 */
    for b in M_2 do
        if b.x >= a.x then
            /* Remove b from M_2 */
    return M_1 U M_2
```

- The merge of sub-solution is now $O(n)$
- The resulting running time for the algorithm is now $T(n) = 2T(n/2) + n = \theta(n \log n)$