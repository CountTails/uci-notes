# Divide and conquer (part 5)

## Separate tasks

Suppose you have an array of $n$ distinct numbers. In the ICS 30-series, you learned how to find the min or max of such an array. Suppose you wanted to find *both*.

One way to do this would be to find the min; this takes $n - 1$ comparisons. You could then output and delete the min element and find the max of what remains, taking $n - 2$ comparisons for a total of $2n - 3$ comparisons.

**Follow-up**: Can you find a way to find both using *strictly fewer* than $2n - 3$ comparisons? Note that we are measuring the actual number of comparisons, not the growth rate of your solution

## Concurrent tasks

### Brute force

```
min_max(A, start, end):
    min = /* Infinity */
    max = /* -Infinity */
    for i=0...end do
        if A[i] < min then
            min = A[i]
        if A[i] > max then
            max = A[i]
    return (min, max)
```

- For each element in the array, 2 comparisons are made
- Makes the total comparison count $2n - 2$
- Unfortunately, this is more than accomplishing the tasks separately

### Improvement

```
min_max(A):
    min = max = A[0] // cmp to A[1] if n is even
    for i=2...n by twos do // start i=3 if n even
        if A[i] < A[i+1] then
            if A[i] < min then 
                min = A[i]
            if A[i] > max then
                max = A[i + 1]
        else
            if A[i] > max then
                max = A[i]
            if A[i + 1] < min then
                min = A[i]
    return (min, max)
```

- For each iteration, 3 comparisons are made
- The solution will require $\frac{n - 1}{2}$ iterations
- If $n$ is odd, then $3(\frac{n-1}{2})$ comparisons are required
- If $n$ is even, then $3(\frac{n-2}{2}) + 1$ comparisons are required