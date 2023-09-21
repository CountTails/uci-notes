# Greedy algorithms (part 4)

## Fractional knapsack

### Problem statement

#### General knapsack

Consider the general knapsack problem: we have a set $S$ of $n$ items; each item has a positive benefit $b_{i}$ and a positive weight $w_{i}$. We can carry at most some bound $W$, and we wish to take some (or all) of the items to gain the maximum possible benefit, subject to the constraint that the total weight we take is at most $W$.

This is known as the **0-1 knapsack problem**. In this, each item had to either be taken or not taken. This represents that the items are things like a laptop, where having half a laptop is *not* worth half the value of a full laptop. There is a very straightforward dynamic programming solution for this problem

#### Allowing fractions

In today's problem, we can take a **fraction** of each item. That is, for each item, we decide some amount $x_{i}$ to take, up to $w_{i}$. That is, we take up to the full amount of each item, which are presumed to be infinitely divisible -- a not-perfect representation for things like food or beverage or the dust of valuable metals. This also assumes that the value is linear -- having half of the available material is worth half the total value, one-quarter of the available material is worth one-quarter of its total value, and so on

More formally, decide for each item a value $x_{i}$ with $0 \le x_{i} \le w_{i}$ such that $\sum_{i} x_{i} \le W$ with the goal of maximizing the sum $\sum_{i} b_{i}(\frac{x_{i}}{w_{i}})$.

### A greedy heuristic

Suppose we can carry $W = 10$ and have the following items available to us

| Item | Weight | Benefit |
|:----:|:------:|:-------:|
| 1 | 4 | 12 |
| 2 | 8 | 32 |
| 3 | 2 | 40 |
| 4 | 6 | 30 |
| 5 | 1 | 50 |

```
fractional_knapsack(items, w):
    /* Sort items by items[i].benefit / items[i].weight */
    foreach item in items do
        /* Take all (if possible) or remaining carrying capacity */
```

### Proof of correctness

Suppose for sake of comparison that a better solution exists. That solution must have taken less of what our solution has and an item that ours doesn't.

$$
    \exists_{(i, j)} x_{i} < w_{i} \, \vert \, x_{j} > 0 \land \frac{b_{i}}{w_{i}} > \frac{b_{j}}{w_{j}}
$$

It can be seen that such a swap would result in a solution that is no worse than ours.