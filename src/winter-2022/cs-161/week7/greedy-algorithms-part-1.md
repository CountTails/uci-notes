# Greedy algorithms (part 1)

## Warm-up exercises

We are given a set of $n$ intervals, each of which has a start time $s_{i}$ and a finish time $f_{i}$. Our goal is to select as large of a subset of the intervals such that no two selected intervals overlap

For each of the two numbered algorithms, give a counter-example to show that this **DOES NOT** achieve the optimal solution

1) Sign up for the class that begins earliest. Remove it and all overlapping classes from the set of available classes. Repeat this process until no classes remain

```
1) --------------------
2)         -------
3)                -----
```

- The algorithm above would select $\{ 1\}$, but a better result would be $\{2, 3 \}$

2) Sign up for the class that meets for the least amount of time. Remove it an all overlapping classes from the set of available classes. Repeat this process until no classes remain

```
1) --------
2)       -----
3)          --------
4)                  --------
```

- The algorithm above would select $\{2, 4\}$, but a better result would be $\{1, 3, 4\}$

## Unweighted interval scheduling

### Selecting a greedy heuristic

It's possible that a simpler algorithm exists than the dynamic programming solution we saw for a similar problem. In fact, **one of the following will get the correct answer**. Decide which ones don't work by providing counter examples. Don't worry (yet) about proving one is correct

- [x] **Sign up for the class that begins earliest. Remove it and all overlapping classes from the set of available classes. Repeat this process until no classes remain**
- [ ] ~~Sign up for the class that meets for the least amount of time. Remove it an all overlapping classes from the set of available classes. Repeat this process until no classes remain~~

```
1)    -----
2) -----
3)      -----
```

- Algorithm select $\{1\}$, better is $\{2, 3\}$

- [ ] ~~Sign up for the class that conflicts with the fewest classes. Remove it and all overlapping classes from the set of available classes. Repeat this process until no classes remain~~

```
1) ----
2)   ----
3)     ----
4)       ----
5)         ----
6)           ----
7)             ----
```

- Algorithm selects $\{2, 4, 6\}$, better is $\{1, 3, 5, 7\}$

- [ ] ~~Sign up for the class that ends earliest. Remove it and all overlapping classes from the set of available classes. Repeat this process until no classes remain~~

```
1) ----------
2) -----
3)      -----
```

- Algorithm select $\{1\}$, better is $\{2, 3\}$

### Proving correctness

Any of the above algorithms can be implemented in $O(n\log n)$ time. Unlike dynamic programming algorithms, the correctness of this algorithm isn't easy to see from the description. Right now, the "proof" that it is correct relies on that you were told that one of them is correct and you've seen the other three *aren't* correctness. However, such a proof isn't valid.

Once we have an algorithm we believe is correct, we need to prove that it is. Each of the above algorithms can be described as "select some interval, remove conflicting intervals, and recursively solve the problem on the rest". We would like to prove that there is an optimal solution that includes the first interval selected

**Claim**: There is an optimal solution that includes the first interval we choose

- $OPT' = OPT \cup \{x\} - \{y\}$
    - Where $x$ is the first ending interval in the input
    - Where $y$ is the first ending interval from $OPT$
- $OPT'$ has a net change of 0
- There is no overlap in $OPT - \{x, y\}$ and $\forall_z \in OPT - \{y\}$ $z$ begins after $y$ ends and $y$ ends after $x$ ends