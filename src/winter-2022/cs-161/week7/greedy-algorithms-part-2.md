# Greedy algorithms (part 2)

## Warm-up exercises

Let's examine a different algorithm for scheduling intervals. In the last lecture, each interval had predesignated start and end times. Instead, let's consider a problem where each interval $i$ is a task to be completed.; each has a designated time $t_{i}$, but we can designated any start time to it. Each interval also has a deadline $d_{i}$, which can be different for each interval.

We must assign each interval a start time in such a way that no two intervals overlap. Ideally, we would like to schedule everything to be finished before its deadline, but this is not always possible.
We say the lateness $l_{i}$ of a job is how late it is finished compared to its deadline: $s_{i} + t_{i} - d_{i}$ or 0 if it has been completed by the deadline. Our goal is to minimize the *maximum lateness*

For each of the tow given algorithms, give a complete counter-example to show that this **DOES NOT** achieve the optimal solution.

1) Sort the jobs by increasing time $t_{i}$; schedule them in that order.
    - Let $I = \{ (5, 5000), (2000, 2000\}$
    - They would be scheduled as `I[0] -> I[1]`, with a total lateness of 5
    - Scheduling as `I[1] -> I[0]`, eliminates all lateness
2) Sort the jobs by $d_{i} - t_{i}$; schedule them in that order
    - Let $I = \{ (50, 100),\, (60, 100),\, (70, 100)\}$
    - They would be scheduled as `I[2] -> I[1] -> I[0]`, with a total lateness of 110
    - Scheduling as `I[0] -> I[1] -> I[2]`, reduces lateness by 20 (90 total)

## Scheduling with deadlines

### Choosing a greedy heuristic

**Some possible algorithms**: One of the following algorithms will correctly schedule the tasks. Decide which one you think it is, and show that the other two *do not* correctly schedule these

- [ ] ~~Sort the jobs be increasing time $t_{i}$; schedule them in that order~~
    - Let $I = \{(100, 100),\, (6, 10) \}$
    - They would be scheduled as `I[1] -> I[0]`, with a total lateness of 2
    - Scheduling as `I[0] -> I[1]`, eliminates all lateness
- [ ] ~~Sort the jobs by $d_{i} - t_{i}$; schedule them in that order~~
    - Let $I = \{(100, 101),\, (6, 10) \}$
    - They would be scheduled as `I[0] -> I[1]`, with a total lateness of 96
    - Scheduling as `I[1] -> I[0]` reduces lateness by 91 (5 total)
- [x] Sort the jobs by deadline $d_{i}$; schedule them in that order

### Proving correctness

Since every schedule (optimal or otherwise) includes every task, we cannot follow the same model proof as the covering/packing problems from last time. Instead, we will first cover two *lemmas* and then use them to prove the overall theorem

#### Lemma 1

> When deciding start times, don't leave any gaps; $s_{i+1} = s_{i} + t_{i}$

```
+--------+------------+
| Task i | Task i + 1 |
+--------+------------+
```

- Switching tasks has no overhead, and thus no effect on the result

```
+-----------------+------------+-----------------+
| Task i (part 1) | Task i + 1 | Task i (part 2) |
+-----------------+------------+-----------------+
```

- The two schedules above would take the same amount of time

#### Lemma 2

> Any schedule that doesn't agree with our algorithm has at least one pair of *consecutive* intervals $i,\, i+1$ that are *inverted* relative to our order

```
+-----+---+---+-----+
| ... | j | i | ... |
+-----+---+---+-----+
```

- But if we have $i < j$

```
+-----+---+---+-----+---+-----+
| ... | j | k | ... | i | ... |
+-----+---+---+-----+---+-----+
```

- If $j + 1 = i$, we're done
- If $j < k$ are inverted, we're done
- Otherwise $A_{j} < A_{k} \land A_{i} < A_{j} \implies i,\, k$ are inverted

#### Overall proof

**Claim**: Any schedule with an inversion (relative to our output) can be modified to be more like our algorithm's output without making it worse

- From lemma 2: $\exists_{(i, j)} \in d \, \vert \, j = i + 1 \land d_{i} > d_{j}$
    1) $f_{i} = s_{i} + t_{i}$
    2) $f_{j} = s_{i} + t_{i} + t_{j}$
    3) swap $i$ and $j$
    4) $f_{i}' = s_{i} + t_{j} + t_{i}$ -> a penalty is same or less
    5) $f_{j}' = s_{i} + t_{j}$ -> penalty is decreased
- Therefore, our output is the is optimal because it cannot get any worse