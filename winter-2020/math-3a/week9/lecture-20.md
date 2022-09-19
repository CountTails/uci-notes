# Lecture 20

## The diagonalization theorem

### Example 1

Find a formula for $D^{k}$ where $D = \begin{bmatrix} 5 & 0 \\ 0 & -3 \end{bmatrix}$

$$
	D^{2} = \begin{bmatrix}
		(5)^{2} & 0 \\
		0 & (-3)^{2}
	\end{bmatrix}
$$

$$
	D^{3} = D^{2}D = \begin{bmatrix}
		(5)^{3} & 0 \\
		0 & (-3)^{3}
	\end{bmatrix}
$$

In general,

$$
	D^{k} = \begin{bmatrix}
		5^{k} & 0 \\
		0 & (-3)^{k}
	\end{bmatrix}
$$

### Example 2

Let $A = \begin{bmatrix} 13 & 16 \\ -8 & -11 \end{bmatrix}$. Find a formula for $A^{k}$ given that $A = PDP^{1}$ where 

$$
	P = \begin{bmatrix}
		2 & -1 \\
		-1 & 1
	\end{bmatrix}
	\,,
	D = \begin{bmatrix}
		5 & 0 \\ 
		0 & -3
	\end{bmatrix}
	\,,
	P^{-1} = \begin{bmatrix}
		1 & 1 \\
		1 & 2
	\end{bmatrix}
$$

By using the associativity of matrix multiplication

$$
	A^{2} = (PDP^{-1})(PDP^{-1}) = PD^{2}P^{-1}
$$

$$
	A^{3} = A^{2}A = (PDP^{-1})(PD^{2}P^{-1}) = PD^{3}P^{-1}
$$

We can generalize this to $A^{k} = PD^{k}P^{-1}$

### Diagonalization 

A square matrix $A$ is said to be **diagonalizable** if $A$ is similar to a diagonal matrix, that is, if $A = PDP^{-1}$ for some invertible matrix, $P$ and some diagonal matrix $D$

> An $n \times n$ matrix is diagonalizable if and only if $A$ has $n$ linearly independent eigenvectors
> In fact, $A = PDP^{-1}$, with $D$ a diagonal matrix, if and only if the columns of $P$ are linearly independent eigenvectors of $A$. In this case, the diagonal entries of $D$ are eigenvalues of $A$ that correspond, respectively, to the eigenvectors of $P$
> That is , if $A$ is $n \times n$ with (not necessarily distinct) eigenvalues $\lambda_{1} \,, \dots \,, \lambda_{n}$ with linearly independent corresponding eigenvectors $v_{1} \,, \dots \,, v_{n}$ then $A = PDP^{-1}$ where 

$$
	D = \begin{bmatrix}
		\lambda_{1} & 0 & \dots & 0 \\
		0 & \lambda_{2} & \dots & 0 \\
		\vdots & \vdots & \ddots & \vdots \\
		0 & 0 & \dots & \lambda_{n}
	\end{bmatrix}
	\,,
	P = \begin{bmatrix}
		v_{1} & v_{2} & \dots & v_{n}
	\end{bmatrix}
$$

> Both $D$ and $P$ are $n \times n$
> Another way to state this theorem is that $A$ is diagonalizable if and only if there are enough eigenvectors to form a basis of $\mathbb{R}^{n}$. We call such a basis an **eigenvector basis** for $\mathbb{R}^{n}$

To determine of a matrix is diagonizable

1) Find the eigenvalues of the matrix.
2) Find the linearly independent eigenvectors of the matrix
3) Construct $P$ from the eigenvectors found in step 2
4) Construct $D$ from the corresponding eigenvalues.
5) Check if $AP = PD$

> An $n \times n$ matrix with $n$ distinct eigenvalues is diagonalizable

### Example 3

Determine if the following matrix is diagonalizable

$$
	A = \begin{bmatrix}
		2 & 1 & -3 \\
		0 & 1 & -2 \\
		0 & 0 & -3
	\end{bmatrix}
$$

Since $A$ is triangular, the eigenvalues are 2, 1, and -3. Since $A$ is a $3 \times 3$ matrix with 3 distinct eigenvalues, $A$ is diagonalizable.

> Let $A$ be an $n \times n$ matrix whose distinct eigenvalues $\lambda_{1} \,, \dots \,, \lambda_{n}$ 
> 	For $1 \le k \le p$, the dimension of the eigenspace (typically called the geometric multiplicity of $\lambda$) for $\lambda){k}$ is less than or equal to the (algebraic) multiplicity of th eigenvalue $\lambda_{k}$
> 	The matrix $A$ is diagonalizable if and only if the sum of the dimensions of the eigenspace equals $n$, and this happens if and only if the characteristic polynomial factors completely into linear factors and the dimension of the eigenspace for each $\lambda_{k}$ equals the multiplicity of $\lambda_{k}$
> 	If $A$ is diagonalizable and $\beta_{k}$ is a basis for the eigenspace corresponding to $\lambda_{k}$ for each $k$, then the total collection of vectors in the sets $\beta_{1} \,, \dots \,, \beta_{p}$ forms an eigenvectors basis for $\mathbb{R}^{n}$

### Example 4

Diagonalize the matrix, if possible

$$
	A = \begin{bmatrix}
		3 & 0 & 0 & 0 \\
		0 & 3 & 5 & -5 \\
		0 & 0 & -2 & 0 \\
		0 & 0 & 0 & -2
	\end{bmatrix}
$$

The eigenvalues of $A$ are

- 3 with multiplicity of 2
- -2 with multiplicity of 2

Basis for $\lambda = 3$: $v_{1} = \begin{bmatrix} 1 \\ 0 \\ 0 \\ 0\end{bmatrix}$ and $v_{2} = \begin{bmatrix} 0 \\ 1 \\ 0 \\ 0 \end{bmatrix}$

Basis for $\lambda = -2$: $v_{3} = \begin{bmatrix} 0 \\ 1 \\ -1 \\ 0 \end{bmatrix}$ and $v_{4} = \begin{bmatrix} 0 \\ 1 \\ 0 \\ 1  \end{bmatrix}$

$\{ v_{1} \,, v_{2} \,, v_{3} \,, v_{4} \}$ is linearly independent.

Thus, $P = \begin{bmatrix} v_{1} & v_{2} & v_{3} & v_{4} \end{bmatrix}$ is invertible and $A = PDP^{-1}$, where

$$
	P = \begin{bmatrix}
		1 & 0 & 0 & 0 \\
		0 & 1 & 1 & 1 \\
		0 & 0 & -1 & 0 \\
		0 & 0 & 0 & 1
	\end{bmatrix}
	\,,
	D = \begin{bmatrix}
		3 & 0 & 0 & 0 \\
		0 & 3 & 0 & 0 \\
		0 & 0 & -2 & 0 \\
		0 & 0 & 0 & -2
	\end{bmatrix}
$$