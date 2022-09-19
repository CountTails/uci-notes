# Lecture 18

## Eigenvectors and eigenvalues

An **eigenvector** of an $n \times n$ matrix $A$ is a nonzero vector $\overrightarrow{x}$ such that $A\overrightarrow{x} = \lambda\overrightarrow{x}$ fro some scalar $\lambda$

A scalar $\lambda$ is called an **eigenvalue**. of $A$ if there is a nontrivial solution $\overrightarrow{x}$ of $A\overrightarrow{x} = \lambda\overrightarrow{x}$; such an $\overrightarrow{x}$ is called an eigenvector corresponding to $\lambda$ 

### Example 1

Let 

$$
	A = \begin{bmatrix}
		2 & -1 \\
		-2 & 3
	\end{bmatrix}
	\,,
	\overrightarrow{u} = \begin{bmatrix}
		-1 \\ 2
	\end{bmatrix}
	\,,
	\overrightarrow{v} = \begin{bmatrix}
		2 \\ -3
	\end{bmatrix}
$$

Are $\overrightarrow{u}$ and $\overrightarrow{v}$ eigenvectors of $A$?

$$
	A\overrightarrow{u} = \begin{bmatrix}
		2 & -1 \\
		-2 & 3
	\end{bmatrix}
	\begin{bmatrix}
		-1 \\ 2
	\end{bmatrix}
	= \begin{bmatrix}
		-4 \\ 8
	\end{bmatrix} = 4\overrightarrow{u}
$$

$\overrightarrow{u}$ is an eigenvector

$$
	A\overrightarrow{v} = \begin{bmatrix}
		2 & -1 \\
		-2 & 3
	\end{bmatrix}
	\begin{bmatrix}
		2 \\ -3
	\end{bmatrix}
	= \begin{bmatrix}
		7 \\ -13
	\end{bmatrix}
	\ne \lambda\overrightarrow{v}
$$

There is no such $\lambda$ that satisfies $A\overrightarrow{x} = \lambda\overrightarrow{v}$. Thus, $\overrightarrow{v}$ is not an eigenvector


### Note

The echelon form is used to find the eigenvectors of $A$ but not the eigenvalues

The eigenvalues of a echelon form of a matrix $A$ usually are not the same as the eigenvalues $A$

$\lambda$ is an eigenvalue of an $n \times n$ matrix $A$ if and only if the equation 

$$
	(A - \lambda I)\overrightarrow{x} = \overrightarrow{0}
$$

has a nontrivial solution. The set of all solutions of this equation is just the null space of the matrix $A - \lambda I$

This set is a subspace of $\mathbb{R}^{n}$ and is called the **eigenspace** of $A$ corresponding the $\lambda$

The eigenspace consists of the zero vector and all eigenvectors corresponding to $\lambda$

### Example 2

Let

$$
	A = \begin{bmatrix}
		-2 & -4 & 2 \\
		-2 & 1 & 2 \\
		4 & 2 & 5
	\end{bmatrix}
$$

An eigenvalue of $A$ is 3. Find the basis for the corresponding eigenspace

$$
	A - 3I = \begin{bmatrix}
		-5 & -4 & 2 \\
		-2 & -2 & 2 \\
		4 & 2 & 2
	\end{bmatrix}
$$

Solving the equation $(A - 3I)\overrightarrow{x} = \overrightarrow{0}$ 

$$
	\begin{bmatrix}
		-5 & -4 & 2 & 0\\
		-2 & -2 & 2 & 0\\
		4 & 2 & 2 & 0
	\end{bmatrix}
	\to
	\begin{bmatrix}
		1 & 0 & 2 & 0 \\
		0 & 1 & -3 & 0 \\
		0 & 0 & 0 & 0
	\end{bmatrix}
$$

There are free variables. The general solution is

$$
	\overrightarrow{x} = x_{3} \begin{bmatrix}
		-2 \\ 3 \\ 1
	\end{bmatrix}
$$

The basis for the eigenspace is 

$$
	\left\{
		\begin{bmatrix}
			-2 \\ 3 \\ 1
		\end{bmatrix}
	\right\}
$$


## Theorem 1

> The eigenvalues of a trianglular matrix are the entries on its main diagonal

### Proof

For the $3 \times 3$ case

By the invertible matrix theorem, $(A - \lambda I)\overrightarrow{x} = \overrightarrow{0}$ has a nontrivial solution if and only if $A - \lambda I$ is not invertible, or equivalently, the determinant $A - \lambda I$ is zero

Since $A - \lambda I$ is upper triangular, the determinant of $A - \lambda I$ is the product of the entries on its main diagonal

$$
	det(A - \lambda I) = 
	(a_{11} - \lambda)
	(a_{22} - \lambda)
	(a_{33} - \lambda) 
	= 0
$$

The equation above holds true only if $\lambda$ is one of the entries $a_{11} \,, a_{22} \,, a_{33}$ in $A$

### Example 3

Find the eigenvalues of $A$

$$
	A = \begin{bmatrix}
		3 & 0 & 0 \\
		1 & 0 & 0 \\
		-2 & 0 & -2
	\end{bmatrix}
$$

The eigenvalues are 3, 0, and -2 since $A$ is a triangular

## Theorem 2

> If $v_{1} \,, \dots \,, v_{r}$ are eigenvectors that correspond to distinct eigenvalues $\lambda_{1}\,, \dots \,, \lambda_{r}$ of an $n \times n$ matrix $A$, then the set $\{v_{1} \,, \dots \,, v_{r} \}$ is linearly independent

