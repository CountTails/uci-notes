# Divide and conquer (part 1)

## Warm-up exercise

> In a vector, a pair of elements $i$, $j$ are an *inverted* pair if $i < j$ and `A[i] > A[j]`.
> That is, the larger element appears earlier in the array

1) How many inverted pairs are there in the following vector? What are they?

```
+----+----+----+----+----+----+----+----+
| 85 | 24 | 63 | 45 | 17 | 31 | 96 | 50 |
+----+----+----+----+----+----+----+----+
```

There are $14$ inverted pairs in the vector. They are as follows

- (85, 24), (85, 63), (85, 45), (85, 17), (85, 31), (85, 50)
- (24, 17)
- (63, 45), (63, 17), (63, 31), (63, 50)
- (45, 17), (45, 31)
- (96, 50)

2) In a vector with $n$ distinct elements, what is the maximum number of inverted pairs possible, as a function of $n$?

$$
    \sum \limits_{i = 1}^{n -1} i = \frac{n(n-1)}{2} = {n \choose 2}
$$

## Counting inversions

### Brute force method

> The following is $\theta(n^{2})$ time way to count the inversions in an array

```
count = 0
for i = 1...n do
    for j = i + 1...n do
        if A[i] > A[j] then
            count++
return count
```

- This algorithm runs in what we call polynomial time
- If the brute force method runs in polynomial time, then there is a faster way to do it

### Divide and conquer algorithms

> The paradigm we will now cover is **divide and conquer** algorithms, whose associated problems can often be solved in polynomial time by brute force, but the technique can give use a more efficient solution

#### `MergeAndCount`

> Suppose you want to count the number of inverted pairs in an array $A$, but we also know that $A[1\dots\frac{n}{2}]$ is sorted, as is $A[\frac{n}{2} + 1 \dots n]$.
> Can we use this information to count inverted pairs faster?
> *Hint*: Note that, in this case, sometimes finding one inverted pair reveals that other inverted pairs exist. You don't have to list every inverted pair, merely count how many exist.

```
MergeAndCount(A, begin, end): 
    n := end - begin + 1
    i := 1
    j := n/2 + 1
    count := 0
    sorted := sort(A)
    k := 1
    while (j <= n and i <= n/2) do
        if A[i] > A[j] then
            count += /* Number of elements in A[i...n/2] */
            sorted[k] = A[j]
            j++
            k++
        else
            sorted[k] = A[i]
            i++
            k++
    while (i <= n/2) do
        sorted[k] = A[i]
        k++
        i++
    while (j <= n) do
        sorted[k] = A[j]
        k++
        j++
    /* copy sorted to A */
    return count
```

> How many iteration will this take?

- We use 3 `while` loops, each bounded by a value determined by $n$
- The loops are at the same indentation level (no nesting)
- Have a copy operation at the end
- Thus, we will perform a total of $n$ iterations -> $\theta(n)$

#### `CountInverted`

> Can we use the algorithm from the question section to count the number of inverted pairs in an *unsorted* array faster than $\theta(n^{2})$?
> Give the algorithm and demonstrate the running time.

```
CountInverted(A, begin, end):
    if |A| <= 300 then
        /*Use the brute force algorithm and return its result */
    else
        count_left := CountInverted(A, begin, begin + ((end-begin) / 2))
        count_right := CountInverted(A, begin + ((end-begin) / 2), end)
        count_merge := MergeAndCount(A, begin, end)
        return count_left + count_right + count_merge
```

#### Analysis

- The first branch of the `if` statement is simply $O(1)$ running time
    - But didn't we just agree that the brute force algorithm had a running time of $\theta(n^{2})$?
    - Yes, however, we are restricting when we use it to depend on $\vert A \vert \le 300$
    - Since the problem size is bounded by a constant, the running time is also constant
- The second branch of the `else` block is a little tricky
    - Consider $T(n)$ to be the time needed to solve the problem with a vector of size $n$
    - We make 2 recursive calls to `CountInverted` with the problem size cut in half: $2T(\frac{n}{2})$
    - We make 1 call to `MergeAndCount` with an established running time of $O(n)$
    - Using repeated substitution, we can see that

$$
    T(n) = 2T\left(\frac{n}{2}\right) + O(n)
    = 2\left(2T\left(\frac{n}{4}\right) + \frac{n}{2}\right) + n
    = 4\left(2T\left(\frac{n}{8}\right) + \frac{n}{4}\right) + 2n
$$

- We can generalize the pattern here as

$$
    T(n) = 2^{i}T\left(\frac{n}{2^{i}}\right) + i * n
$$

> This isn't the same as the clean functions of $n$ that we are used to seeing.
> However, this boils down to the following runtime complexity.
> We will explore how to get there next time

$$
    c * n + n\log n = \theta(n \log n)
$$

