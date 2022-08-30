# Lecture 4

## Product of $A$ and $\overrightarrow{x}$

### Definitions

If $A$ is an $n \times m$ matrix, and $\overrightarrow{x}$ is in $\mathbb{R}^{n}$, then the product of $A$ and $\overrightarrow{x}$, denoted as $A\overrightarrow{x}$ is the **linear combinations of the columns of** $A$ **using the corresponding entries in** $\overrightarrow{x}$ **as weights.**

$$
	A\overrightarrow{x} = [a_{1} \, \, a_{2} \, ... \, a_{n}] 
	\begin{bmatrix}
		x_{1} \\ . \\ . \\ . \\ x_{n}
	\end{bmatrix} = 
	x_{1}a_{1} + x_{2}a_{2} + ... + x_{n}a_{n}
$$

$A\overrightarrow{x} = \overrightarrow{b}$ is called the **matrix equation**

#### Theorem

> If $A$ is an $m \times n$ matrix, with columns $a_{1} \,, a_{2} \,, ... \,, a_{n}$ and if $\overrightarrow{b}$ is in $\mathbb{R}^{m}$, the matrix equation $A\overrightarrow{x} = \overrightarrow{b}$ has the same solution set as the vector equation $x_{1}a_{1} + x_{2}a_{2} + ... + x_{n}a_{n} = \overrightarrow{b}$ which, in turn, has the same solution set as the system of linear equations whose augmented matrix is $\begin{bmatrix} a_{1} & a_{2} & ... & a_{n} & b \end{bmatrix}$ whose size is $m \times (n + 1)$.

### Examples

#### Example 1

$$
	\begin{bmatrix}
		2 & 3 & -1 \\
		-4 & 0 & 1
	\end{bmatrix}
	\begin{bmatrix}
		2 \\ 5 \\ -3
	\end{bmatrix} =
	2 \begin{bmatrix} 2 \\ -4 \end{bmatrix} +
	5 \begin{bmatrix} 3 \\ 0 \end{bmatrix} -
	3 \begin{bmatrix} -1 \\ 1 \end{bmatrix} 
$$

$$
	= \begin{bmatrix} 4 \\ -8 \end{bmatrix} + 
	\begin{bmatrix} 15 \\ 0 \end{bmatrix} + 
	\begin{bmatrix} 3 \\ -3 \end{bmatrix} =
	\begin{bmatrix} 22 \\ -11 \end{bmatrix}
$$

#### Example 2

For the system

$$
	\begin{cases}
		-x_{1} + 3x_{2} + 2x_{3} = 9 \\
		2x_{1} + x_{2} -3x_{3} = 2 \\
		4x_{1} - 5x_{2} = -3 
	\end{cases}
$$

we could write this as a linear combination of vectors in $\mathbb{R}^{n}$

$$
	x_{1} \begin{bmatrix} -1 \\ 2 \\ 4 \end{bmatrix} + 
	x_{2} \begin{bmatrix} 3 \\ 1 \\ -5 \end{bmatrix} +
	x_{3} \begin{bmatrix} 2 \\ -3 \\ 0 \end{bmatrix} =
	\begin{bmatrix} 9 \\ 2 \\ -3 \end{bmatrix}
$$

or

$$
	\begin{bmatrix}
		-1 & 3 & 2 \\
		2 & 1 & -3 \\
		4 & -5 & 0
	\end{bmatrix}
	\begin{bmatrix} x_{1} \\ x_{2} \\ x_{3} \end{bmatrix} =
	\begin{bmatrix} 9 \\ 2 \\ -3 \end{bmatrix}
$$

## Existence of solutions

The equation $A\overrightarrow{x} = \overrightarrow{b}$  a solution if and only if $\overrightarrow{b}$ is a linear combination of the columns of $A$

Alternatively, answer the question "Is $\overrightarrow{b}$ is Span$\{a_{1}\,, ... \,, a_{n}\}$?" This can be answered by solving the associated augmented matrix

It is more difficult to determine if $A\overrightarrow{x} = \overrightarrow{b}$ is consistent for *all* possible $\overrightarrow{b}$

$$
	\begin{bmatrix}
		1 & -3 & - 4 & b_{1} \\
		-3 & 2 & 6 & b_{2} \\
		5 & -1 & -8 & b_{3}
	\end{bmatrix}
$$

Row reducing the matrix yields

$$
	\begin{bmatrix}
		1 & -3 & -4 & b_{1} \\
		0 & -7 & -6 & b_{2} + 3b_{1} \\
		0 & 0 & 0 & b_{3} + 2b_{2} + b_{1}
	\end{bmatrix}
$$

The system is consistent if $b_{3} + 2b_{2} + b_{1} = 0$, which is a plane in $\mathbb{R}^{3}$. The plane is the set of all linear combinations of three columns in $A$

#### Theorem

> Let $A$ be an $m \times n$ matrix. The following statements are logically equivalent.
> 1) For each $\overrightarrow{b}$ in $\mathbb{R}^{m}$, the equation $A\overrightarrow{x} = \overrightarrow{b}$ has a solution
> 2) Each $\overrightarrow{b}$ in $\mathbb{R}^{m}$ is a linear combination of the columns of $A$
> 3) The columns of $A$ span $\mathbb{R}^{m}$
> 4) $A$ has a pivot position in every row

## Computation of $A\overrightarrow{x}$

**Row-vector rule for computing** $A\overrightarrow{x}$: If the product $A\overrightarrow{x}$ is defined, then the $i$th entry in $A\overrightarrow{x}$ is the sum of the products of corresponding entries from row $i$ of $A$ and from the vector $\overrightarrow{x}$

This is essentially the dot product between the rows of $A$ and the columns of $\overrightarrow{x}$

A matrix with $1$'s on the diagonal adn $0$'s elsewhere is called the **identity matrix** and is denoted by $I$. For any vector $\overrightarrow{x}$, $I\overrightarrow{x} = I$

## Properties of the Matrix-Vector Product $A\overrightarrow{x}$

### Thereom

> If $A$ is an $m \times n$, $\overrightarrow{u}$ and $\overrightarrow{v}$ are vectors in $\mathbb{R}^{n}$, and $c$ is a scalar, then:
> 1) $A(\overrightarrow{u} + \overrightarrow{v}) = A\overrightarrow{u} + A\overrightarrow{v}$
> 2) $A(c\overrightarrow{u}) = c(A\overrightarrow{u})$
