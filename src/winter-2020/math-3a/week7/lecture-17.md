# Lecture 17

## Row operations

Let $A$ be a square matrix

- If a multiple of one row of $A$ is added to another row to produce a matrix $B$, then $det(A) = det(B)$
- If two rows of $A$ are interchanged to produce $B$, then $det(B) = -det(A)$
- If one row of $A$ is multiplied by $k$ to produce $B$, then $det(B) = k \cdot det(A)$

### Example 1

Find the determinant of 

$$
	A = \begin{bmatrix}
		1 & 5 & -4 \\
		-1 & -4 & 5 \\
		-2 & -8 & 7
	\end{bmatrix}
$$

To find the determinant, row reduce the matrix to an echelon form and use the fact that the determinant of a triangular matrix is the product of the diagonal entries

$$
	A = \begin{bmatrix}
		1 & 5 & -4 \\
		0 & 1 & 1 \\
		0 & 0 & -3
	\end{bmatrix}
$$

Thus $det(A) = 1 * 1 * -3 = -3$

## Determinants and IMT

A square matrix $A$ is invertible if and only if $det(A) \ne 0$

### Example 2

Determine if the following matrix is invertible

$$
	A = \begin{bmatrix}
		1 & 3 & 0 & 2 \\
		-2 & -5 & 7 & 4 \\
		3 & 5 & 2 & 1 \\
		1 & -1 & 2 & -3
	\end{bmatrix} 
	\to
	\begin{bmatrix}
		1 & 3 & 0 & 2 \\
		0 & 1 & 7 & 8 \\
		0 & -4 & 2 & -5 \\
		0 & 0 & 0 & 0
	\end{bmatrix}
$$

$det(A) = 1 * 1 * 2 * 0 = 0$, therefore $A$ is not invertible.

## Transposed determinants

If $A$ is a $n \times n$ matrix, then $det(A^{T}) = det(A)$

### Example 3

$$
	A = \begin{bmatrix}
		1 & 5 & -4 \\
		-1 & -4 & 5 \\
		-2 & -8 & 7
	\end{bmatrix}
$$

$$
	A^{T} = \begin{bmatrix}
		1 & -1 & 2 \\
		5 & -4 & -8 \\
		-4 & 5 & 7
	\end{bmatrix}
	\to
	\begin{bmatrix}
		1 & -1 & 2 \\
		0 & 1 & 2 \\
		0 & 0 & -3
	\end{bmatrix}
$$

From the previous example, $det(A) = -3$ is known, computing $det(A^{T}) = 1 * 1 * -3 = -3$ shows that the determinant of a matrix and its transpose are equal

## Multiplicative property

If $A$ and $B$ are $n \times n$ matrices, then $det(AB) = det(A) * det(B)$

### Example 4

Compute $det(B^{4})$ where 

$$
	B = \begin{bmatrix}
		1 & 0 & 1 \\
		1 & 1 & 2 \\
		1 & 2 & 1
	\end{bmatrix}
$$

Using the multiplicative property

- $det(B^{4}) = det(B \cdot B \cdot B \cdot B)$
- $det(B \cdot B \cdot B \cdot B) = det(B)^{4}$

Finding the determinant of $B$ with cofactor expansion

$$
	det(B) = (1 - 4) - 0 + (2 - 1) = -2
$$

Thus $det(B^{4}) = det(B)^{4} = (-2)^{4} = 16$

### Example 5

Determine if the set of vectors is linearly independent

$$
	\left\{ 
	\begin{bmatrix} 
		5 \\ 1 \\ 0
	\end{bmatrix} \,,
	\begin{bmatrix}
		1 \\ -3 \\ 5
	\end{bmatrix} \,,
	\begin{bmatrix}
		-1 \\ -2 \\ 3
	\end{bmatrix}
	\right\}
$$

Let th vecotors be the columns of matrix $A$

$$
	A = \begin{bmatrix}
		5 & 1 & -1 \\
		1 & -3 & -2 \\
		0 & 5 & 3
	\end{bmatrix}
$$

The invertible matrix theorem tells us that if $A$ is invertible, its columns are linearly independent

$$
	det(A) = 5(-9 + 10) - (3 + 5) + 0 = -3
$$

The determinant of $A$ is nonzero, meaning that $A$ is an invertible matrix.

Since $A$ is an invertible matrix, by the invertible matrix theorem, the columns of $A$ are linearly independent