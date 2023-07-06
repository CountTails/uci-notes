# Multidimensional data

## Single dimensional data

- Arrays can be used to represent single dimensional data
- Created statically with `int a[10]`
	- Size must be known at **compile time**
	- Not always feasible
- Created dynamically with `int* b = new int[size]`
	- `size` can be a variable
	- Get back a pointer that points to the first element of the array
- Element access
	- Use brackets `[i]` to retrieve a specific element
	- Arrays are a bunch of things of the same type and size living next to each other
	- The address of any element is given by `a[i] = address of a + (i * sizeof(element))`

## Multidimensional data

### Statically allocated multidimensional array

- Can be done with `int a[3][3]`
- Element access is done with a double index: `a[0][0]`

$$
	\begin{bmatrix}
		(0,\, 0) & (0,\, 1) & (0,\, 2) \\
		(1,\, 0) & (1,\, 1) & (1,\, 2) \\
		(2,\, 0) & (2,\, 1) & (2,\, 2) \\
	\end{bmatrix}
$$

```C++
a[0] = {0, 1, 2}
a[1] = {0, 1, 2}
a[2] = {0, 1, 2}
```

- C++ stores them in first-dimension order (aka row-major-order)
- `a[i][j] = a + (i*sizeof(a[i]) + j`
- Compiler needs to know `j`
- As long as all except the first is known

```C++
void fillTwoDArray(int* a, int rows, int columns) {
	for (int i = 0; i < rows; ++i) {
		for (int j = 0; j < columns; ++j) {
				a[i][j] = i*j
		}
	}
}
```

- The code snippet above will fail to compile because the second dimension is not known

### Dynamically allocated multidimensional array

- Pointer to a single dimension array of pointers
- Each pointer is another single dimension array

```C++
void blah(int rows, int columns) {
	int** a = new int*[rows];
	for (int i = 0; i < rows; ++i) {
		a[i] = new int[columns];
	}
	for (int i = 0; i < rows; ++i) {
		for (int j = 0; j < columns; ++j) {
			a[i][j] = i * j;
		}
	}
	// Needs to be deleted
	// Results in 2D array, but is not contiguous
}
```

```C++
void singleDasMultiD(int rows, int columns) {
	int* a = new int[rows * columns];
	for (int i = 0; i < rows; ++i) {
		for (int j = 0; j < columns; ++j) {
			// do this right every time (function/class)
			a[i * columns * j] = i * j;
		}
	}
	// Don't forget to deallocate
}
```

```C++
void vectorOfVectors(int rows, int columns) {
	std::vector<std::vector<int>> a(rows, std::vector<int>(columns));
	for (int i = 0; i < rows; ++i) {
		for (int j = 0; j < columns; ++j) {
			a[i][j] = i * j;
			//a.at(i).at(j) = i * j
		}
	}
}
```