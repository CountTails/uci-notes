# Comparison based sorting

## Total orderings

> For any two items $i$ and $j$ at least one of the following must be true
> 	- $i \le j$ or $j \le i$
> 	- If $i \le j$ and $j \le i$ then $i = j$
> 	- If $i \le j$ and $j \le k$ then $i \le k$

## Insertion sort

- Divide sequence into two parts
	- One part is sorted
	- Other part is unsorted
- Compare each element with the element before
- Swap to correct ordering
- The unsorted section shrinks and is absorbed into the sorted sequence

```C++
void insertionSort(std::vector<int>& v)  
{  
    for (int i = 1; i < v.size(); ++i)  
        for (int j = i; j > 0 && v[j] < v[j - 1]; --j)  
            std::swap(v[j], v[j - 1]);  
}
```

### Analysis

#### Best case

- Array is already sorted
- Requires $n - 1$ steps to compare all elements
- $\theta(n)$ runtime

#### Worst case

- Array is *reverse* sorted
- Requires $\frac{n(n - 1)}{2}$ steps to compare all elements
- $\theta(n^{2})$ runtime

#### Average case

- Array is "half" sorted
- Requires $\frac{n(n - 1)}{4}$ steps to compare all elements
- $\theta(n^{2})$ runtime
- Useful for sorting arrays when they are almost sorted

### Binary optimization attempt

#### Best case

- Binary search takes longer to decide no work is needed
- $\theta(n \log_{2}(n))$ runtime
- Base case is a loss

#### Worst case

- Binary search is quick
- Still have to move over elements
- $\theta(n^{2})$ runtime
- No improvements made

## Selection sort

- Starts like insertion sort, but assumes everything is unsorted
- Pick the largest element and swaps it with the element at the end of the unsorted zone
- Repeat until the unsorted zone contains zero elements

### Analysis

- Finding the largest requires a linear search
- Requires $\frac{n(n + 1)}{2}$ comparisons
- $\theta(n^{2})$ runtime

## Properties of sorting algorithms

### In-place algorithms

- Requires a constant amount of memory
- Insertion sort, Binary insertion sort, and Selection sort are in-place
- Can spend more memory to use less time

### Stable sorting algorithms

- Equivalent elements remain in relative order
- Insertion and binary insertion sort are stable
- Selection sort is not stable because equivalent elements are swapped

## Tree sort

- Use a binary search tree
- Perform an inorder traversal
- Visit the nodes in ascending order

```
Treesort(items):  
    let t be an empty binary search tree  
  
    for each item in items:  
        insert the item into t  
  
    perform an inorder traversal of t
```

### Analysis

#### Worst case

- Tree is degenerate (Elements are sorted or reversed sorted)
- $\theta(n^{2})$ time to build tree
- $\theta(n)$ memory
- Can use an AVL tree to avoid

#### Best case

- Balanced tree
- $\theta(n \log_{2}(n))$ time to build tree
- $\theta(n)$ to store tree

#### Properties

- Not in-place
- Stability not a factor since equivalent elements not allowed in tree

## Heap sort

- Heapify array
- Repeated dequeue and swap operations
- Unsorted section is a max heap
- Heapify takes $\theta(n)$ time
- Dequeue and swaps
	- Each element takes a logarithmic amount of work
	- Takes $\theta(n \log_{2}(n))$ time
- Total: $\theta(n) + \theta(n \log_{2}(n)) = \theta(n \log_{2}(n))$
- In-place algorithm with proper heapification
- Max heaps do not maintain order, so not stable

## Divide and conquer

### General technique

1) Divide problem into subproblems
2) Separately solve subproblems recursively
3) Combine subproblems solutions into one big solution

### Quicksort

- Dividing into subproblems
	- Pick one element to be a pivot
	- Swap pivot with the last element
	- Move smaller elements to the left of the pivot
	- Move larger elements to the right of the pivot
	- Swap pivot into middle of subsections

```
Partition(Array a):
    pivot = _choose the index of the pivot; see below_

    last = a.length - 1

    i = 0
    j = last - 1

    swap(a[pivot], a[last])                    _swap the pivot to the end temporarily_

    loop:
        while i ≤ last and a[i] < a[last]:     _move i forward until it reaches an element ≥ the pivot_
            i++

        while j ≥ i and a[j] ≥ a[last]:        _move j backward until it reaches an element < the pivot_
            j--

        if i ≥ j:                              _if i has reached j, we're done_
            break

        swap(a[i], a[j])                       _swap mismatched elements_
        i++
        j--

    swap(a[end], a[j])                         _put pivot in between the partitions_
```

- Recursively sort paritions
- Spends time carefully dividing so no work required to combine solutions

#### Analysis

- worst case
	- pivots ends up on one end
		- one partition of size $n-1$
		- one partition of size $0$
	- if occurs repeatedly
		- $T(1) = 0$
		- $T(n) = n + T(n-1)$
		- repeated substitution
		- $T(n) = n^2$
- best case
	- pivot lands exactly in the middle
		- $n/2$ elements in each partition
	- if occurs repeatedly
		- $T(1) = n$
		- $T(n) = n + 2T(n/2)$
		- repeated substitution
		- $T(n) = jn +2^jT(n/2^j)$
		- let $j = log_{2} (n)$
		- $n log_{2}(n) + nT(n/n)$
		- $\theta(n log n)$
- in-place
	- certainly sorted within array
	- technicality: uses recursion
		- best case: logarithmic
		- worst case: linear
- stable
	- partitioning swaps elements
	- duplicate elements swapped as they occur
	- not stable
- choosing pivots
	- don’t grab first or last element
		- hurts if array sorted or reverse sorted
	- choose randomly
		- unlikely worst case occur
	- median of 3
		- first element, last element, middle element of partition
		- choose the median of the values
		- can’t be worst because something worse exists

### Mergesort

- Divide array down the middle
- Recursively sort two halves
- Combine two sorted halves
- Copy smallest to new array, move counter forward
- Continue until all subsection exhausted

#### Analysis

- Dividing the array: $\theta(1)$
- Recursion
	- $T(1) = 0$
	- $T(n) = n + 2T(n/2)$
	- Same recurrence as best case of quicksort
	- For every case: $n \log_{2}(n)$
- In place
	- Recursion on run-time stack is logarithmic
	- Extra array is linear
	- Not in place
- Stable
	- Only when carefully combining
	- Take equivalent elements from left array first

## Limits

- Best seen was $\theta(n \log_{2}(n))$
- Does a better runtime exist?