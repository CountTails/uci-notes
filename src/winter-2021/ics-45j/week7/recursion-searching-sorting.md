# Recursion, searching, sorting

## Recursion

### Triangle numbers

- **Recursion**: the same computation occurs repeatedly
- Problem: compute the area of a triangle of with $n$
- Assume each `[]` square has an area of $1$
- Also called the $n$th *triangle number*
- The third triangle number is $6$

```
[]
[][]
[][][]
```

#### Outline of `Triangle` class

```Java
public class Triangle {
	private int width;
	
	public Triangle(int aWidth) {
		width = aWidth;
	}
	
	public int getArea() {
		...
	}
}
```

- The triangle consists of a single square
- Its area is $1$
- Add the code to `getArea` for width $1$

```java
public int getArea() {
	if (width == 1) { return 1; }
}
```

- Area of larger triangle can be calculated as: `smallerArea + width`
- To get the area of the smaller triangle: Make a smaller triangle and ask it for its area

```Java
Triangle smallerTriangle = new Triangle(width - 1);
int smallerArea = smallerTriangle.getArea();
```

#### Completed `getArea` method

```Java
public int getArea() {
	if (width == 1) { return 1; }
	Triangle smallerTriangle = new Triangle(width. - 1);
	int smallerArea = smallerTriangle.getArea();
	return smallerArea + width;
}
```

- A recursive computation solves a problem by using the solution to the same problem with simpler inputs

#### Computing the area of a triangle with width 4

- `getArea` method makes a smaller triangle of width 3
- It calls `getArea` on that triangle
	- That method makes a smaller triangle of width 2
	- It calls `getArea` on that triangle
		- That method makes a smaller triangle of width 1
		- It calls `getArea` on that triangle
			- That method returns 1
		- The method returns `smallerArea + wdith = 1 + 2 = 3`
	- The method returns `smallerArea + width = 3 + 3 = 6`
- The method returns `smallerArea + width = 6 + 4 = 10`

### Recursion

- A recursive computation solves a problem by using the solution of the same problem with simpler values
- Two key requirements for successful recursion
	- Every recursive call must simplify the computation in some way
	- There must be special cases to handle the simplest computations directly
- To complete our Triangle example, we must handle `width <= 0`

#### Tracing through recursion

- Function call takes a "break" go get an answer from another function
- Answers are moved back up the chain (runtime stack)
- Thank of it like a stack

### Tracing example

```Java
public int factorial(int x) {
	if (x == 0) return 1;
	return x * factorial(x - 1);
}
```

- Tracing of $5!$

```
factorial(5)
|
+-- 5 * factorial(4)
|	|	|
|	|	+-- 4 * factorial(3)
|	|		|	|
|	|		|	+-- 3 * factorial(2)
|	|		|		|	|
|	|		|		|	+-- 2 * factorial(1)
|	|		|		|		|	|
|	|		|		|		|	+-- 1 * factorial(0)
|	|		|		|		|		|	|
|	|		|		|		|		|	+ -- 1
|	|		|		|		|		|		  
|	|		|		|		|		+ -- 1 * 1
|	|		|		|		|
|	|		|		|		+ -- 2 * 1
|	|		|		|
|	|		|		+ -- 3 * 2
|	|		|
|	|		+ -- 4 * 6
|	|
|	+ -- 5 * 24
|
+ -- 120
```

### The efficiency of recursion

- In most cases, the iterative and recursive approaches have comparable efficiency
- Occasionally, a recursive solution runs much slower than its iterative counterpart
	- In most cases the recursive solution is only slightly slower
- In many cases, a recursive solution is easier to understand and implement correctly than iterative solution

## Sorting

### Selection sort

- Pick the smallest element and swap it with the first one
- Pick the smaller element of the remaining ones and swap it with the next one, and so on
- Slow: $O(n^{2})$

### Insertion sort

- The method many people use to sort playing cards
- Pick up one card at a time and insert it so that the cards stay sorted
- Slow: $O(n^{2})$

### Merge sort

- Sorts an array by:
	- Cutting the array in half
	- Recursively sorting each half
	- Merging the sorted halves

### Quicksort

- No temporary arrays are required
- Divide and conquer
	1) Partition the elements into two groups, holding the smaller and larger elements
	2) Sort each partition

### Sorting in java

- The `Arrays` and `Collections` classes have sorting methods
	- `Arrays.parallelSort(...)`
		- Uses a multi-threaded merge sort
		- Faster when you have many elements
	- `Arrays.sort(...)`
		- Uses quicksort for primitives, merge sort for objects
	- `Collections.sort(...)`
		- Uses merge sort
	- All of these require that the objects being sorted implement the `Comparable` interface

## Searching

### Linear search

- Examines all values in an array until it finds a match or reaches the end
- Also called **sequential search**

### Binary search

- Locates a values in a **sorted** array by:
	- Determining whether the value occurs in the first of second half
	- Repeating the search in on of the halves
- The size of the search is cut in half with each step

### Searching in java

- The `Arrays` and `Collections` classes contain static `bainarySearch` methods
	- **The array/collection must be sorted before calling this method**
	- If the element is not found, returns `-k - 1`
	- Where $k$ is the position before which the element should be inserted
- Example

```Java
int[] a = { 1, 4, 9 };
int v = 7;
int pos = Arrys.binarySearch(a, v);
// Returns -3; v should be inserted before position 2
```