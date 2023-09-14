# Divide and conquer (part 2)

## The master theorem

### Definition

> It is common for a divide-and-conquer algorithm's running time to have a recurrence relation of the following form:

$$
    T(n) = aT(n/b) + f(N), \text{ for some } a \ge 1, \, b > 1, \text{ and } f(n) \text{ is asymptotically positive.}
$$

1) If there is a small constant $\epsilon > 0$ such that $f(n)$ is $O(n^{\log_{b} a - \epsilon})$ then $T(n)$ is $\theta(n^{\log_{b} a})$
2) If there is a constant $k \ge 0$, such that $f(n)$ is $\theta(n^{\log_{b} a} \log^{k} n)$, then $T(n)$ is $\theta(n^{\log_{b} a} \log^{k+1} n)$
3) If there is a small constant $\epsilon > 0$ such that $f(n)$ is $\Omega(n^{\log_{b} a + \epsilon})$, then $T(n)$ is $\theta(f(n))$

### Examples

1) $T(n) = 4T\left(\frac{n}{2}\right)  + n$
    - $a = 4$
    - $b = 2$
    - case: $\log_{b} a = 2$ -> $n = O(n^{2})$ -> case 1
    - $T(n) = \theta(n^{2})$
2) $T(n) = 2T\left(\frac{n}{2}\right) + n \log n$
    - $a =2$
    - $b = 2$
    - case: $\log_{b} a = 1$ -> $n \log n = \theta(n \log^{k - 1}n)$ -> case 2
    - $T(n) = \theta(n \log^{2} n)$
3) $T(n) = 9T\left(\frac{n}{3}\right) + n^{2.5}$
    - $a = 9$
    - $b = 3$
    - case: $\log_{b} a = 2$ -> $n^{2.5} = \Omega(n^{2})$ -> case 3
    - $T(n) = \theta(n^{2.5})$
4) $T(n) = 2T(\sqrt{n}) + \log n$
    - $k = \log n$
    - $n = 2^{k}$
    - $T(2^{k}) = 2T(2^{k/2}) + k$
    - $S(k) = T(2^{k}) = 2T(2^{k/2}) + k = 2S\left(\frac{k}{2}\right) + k$
        - $a = 2$
        - $b = 2$
        - case: $\log_{b} a = 1$ -> $k = \theta(k \log^{0} k)$ -> case 2
        - $S(k) = \theta(k \log k)$
        - $S(\log n) = \theta(\log n * \log(\log n))$
5) $T(n) = 2T(\frac{n}{4}) + \sqrt{n}$
    - $a = 2$
    - $b = 4$
    - case: $\log_{b} a = \frac{1}{2}$ -> $\sqrt{n} = \theta(\sqrt{n} \log^{0} n)$
    - $T(n) = \theta(\sqrt{n} \log n)$

## Quicksort

```
QuickSort(A, start, end)
    if start < end then
        q = partition(A, start, end)
        QuickSort(A, start, q - 1)
        QuickSort(A, q + 1, end)
```

At a glance

- Choose a pivot: $O(1)$
- Place pivot in the right spot
- Pivot the rest of the array

Recurrence relation: $T(n) = T(\text{lower}) + T(\text{upper}) + \theta(n)$

- $T(n) = 2T\left( \frac{n}{2} \right) + \theta(n)$
- case: $\log_{2} 2 = 1$
- $T(n) = \theta(n \log n)$

### Average case analysis

- All permutations are likely
- Define $S_{1} \dots S_{n}$ as the sorted order

$$
    P_{ij} = \frac{\text{\# yes}}{\text{\# total}} = \frac{2}{j - i + 1}
$$

- What is the expected number of comparisons made?
- Let $X_{ij}$: be a random variable indicating the $i$ and $j$ were compared

$$
    E(\sum \limits_{i = 1}^{n} \sum \limits_{j = i + 1}^{n} X_{ij}) = 
    \sum \limits_{i = 1}^{n} \sum \limits_{j = i + 1}^{n} E(X_{ij})
$$

- By linearity of expectations

$$
     = \sum \limits_{i = 1}^{n} \sum \limits_{j = i + 1}^{n} \frac{2}{j - i + 1}
     = \sum \limits_{i = 1}^{n} \sum \limits_{k = 2}^{n - 1 + 1} \frac{2}{k}
     = 2\sum \limits_{i = 1}^{n} \sum \limits_{k = 2}^{n} \frac{1}{k}
     = 2n \log n = \theta(n \log n)
$$

## Reinforcement

> Sort the following array by `QuickSort`

```
+----+----+----+----+----+----+----+----+
| 85 | 24 | 63 | 45 | 17 | 31 | 96 | 50 |
+----+----+----+----+----+----+----+----+
```

| 85 | 24 | 63 | 45 | 17 | 31 | 96 | 50 |
|----|----|----|----|----|----|----|----|
| 17 | 24 | 31 | 45 | **50** | 63 | 96 | 85 |
| 17 | 24 | 31 | **45** | 50 | 63 | 96 | 85 |
| 17 | 24 | 31 | 45 | 50 | 63 | **85** | 96 |

## Selection algorithms

> Let's take a look at *selection* algorithms: the goal is to find the $k$th smallest element in an unsorted list
> That is, the element that would be $S_{k}$ when sorted.

### Non-deterministic

```
Select(S, k)
    if /* n is small */ then
        /* brute force and return */ // Sort and lookup
    /* Pick a random x in S and put rest into
        L, elements smaller than x
        G, elements greater than x
    */
    if k <= |L| then
        return Select(L, k)
    else if k == |L| + 1 then
        return x
    else
        return Select(G, k -(|L| + 1))
```

$$
    T(n) = T(n/2) + \theta(n) \implies \theta(n)
$$

### Deterministic

1) Divide $S$ into $g = \lceil \frac{n}{5} \rceil$ groups
2) Each group has 5 elements (except maybe the last)
3) Find median of each group of 5
4) Find median of those medians
5) Use that median as **pivot value** $x$