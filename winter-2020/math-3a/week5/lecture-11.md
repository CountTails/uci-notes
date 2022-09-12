# Lecture 11

## The inverse of a matrix

A $n \times n$ matrix $A$ is invertible if there is a $n \times n$ matrix $C$ such that

$$
	CA = I \, \text{and} \, AC = I
$$

where $I$ is the $n \times n$ identity matrix and $C$ is the unique inverse of $A$, denoted as $A^{-1}$

An invertible matrix is called **nonsingular** while a matrix that is *not* invertible is called **singular**

### Example 1

Let

$$
	A = \begin{bmatrix}
		8 & 6 \\
		5 & 4
	\end{bmatrix}
	\,,
	C = \begin{bmatrix}
		2 & -3 \\
		\dfrac{-5}{2} & 4
	\end{bmatrix}
$$

Compute $AC$ and $CA$. Show that $C = A^{-1}$

$$
	AC = \begin{bmatrix}
		8 & 6 \\
		5 & 4
	\end{bmatrix}
	\begin{bmatrix}
		2 & -3 \\
		\dfrac{-5}{2} & 4
	\end{bmatrix}
	=
	\begin{bmatrix}
		16 - 15 & -24 + 24 \\
		10 - 10 & -15 + 16
	\end{bmatrix} =
	\begin{bmatrix}
		1 & 0 \\
		0 & 1
	\end{bmatrix}
$$

$$
	CA = \begin{bmatrix}
		2 & -3 \\
		\dfrac{-5}{2} & 4
	\end{bmatrix}
	\begin{bmatrix}
		8 & 6 \\
		5 & 4
	\end{bmatrix}
	=
	\begin{bmatrix}
		16 - 15 & 12 - 12 \\
		-20 + 20 & -15 + 16
	\end{bmatrix} =
	\begin{bmatrix}
		1 & 0 \\
		0 & 1
	\end{bmatrix}
$$

## Invertability of $2 \times 2$ matrices

### Theorem 4

Let $A = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$. If $ad - bc \ne 0$, then $A$ is invertible and 

$$
	A^{-1} = \dfrac{1}{ad - bc}
	\begin{bmatrix}
		d & -b \\
		-c & a
	\end{bmatrix}
$$

If $ad - bc = 0$, then $A$ is *not* invertible

The quantity $ad - bc$ is called the **determinant** and is denoted as $det(A) = ad - bc$

### Example 2

Find the inverse of 

$$
	A = \begin{bmatrix}
		3 & -4 \\
		7 & -8
	\end{bmatrix}
$$

$det(A) = 3(-8) - 7(-4) = -24 + 28 = 4$

$$
	A^{-1} = \dfrac{1}{4} 
	\begin{bmatrix}
		-8 & 4 \\
		-7 & 3
	\end{bmatrix} = 
	\begin{bmatrix}
		-2 & 1 \\
		\dfrac{-7}{4} & \dfrac{3}{4}
	\end{bmatrix}
$$

## Invertible matrix solution

### Theorem 5

If $A$ is an invertible $n \times n$ matrix, then for each $\overrightarrow{b}$ in $\mathbb{R}^{n}$, the equation $A\overrightarrow{x} = \overrightarrow{b}$ has the unique solution $\overrightarrow{x} = A^{-1}\overrightarrow{b}$

### Example 3

Solve the system

$$
	\begin{cases}
		3x_{1} - 4x_{2} = 4 \\
		7x_{1} - 8x_{2} = 8
	\end{cases}
$$

The system is equivalent to $A\overrightarrow{x} = \overrightarrow{b}$ where

$$
	A = \begin{bmatrix}
		3 & -4 \\
		7 & -8
	\end{bmatrix}
	\, \text{and} \,
	\overrightarrow{b} = \begin{bmatrix}
		4 \\ 8
	\end{bmatrix}
$$

The solution is $x = A^{-1}\overrightarrow{b}$ as follows

$$
	\overrightarrow{x} = \begin{bmatrix}
		-2 & 1 \\
		\dfrac{-7}{4} & \dfrac{3}{4}
	\end{bmatrix}
	\begin{bmatrix}
		4 \\ 8
	\end{bmatrix}
	=
	\begin{bmatrix}
		0 \\ -1
	\end{bmatrix}
$$

## Invertible matrix properties

Let $A$ and $B$ be invertible matrices

- $(A^{-1})^{-1} = A$
- $(AB)^{-1} = B^{-1}A^{-1}$
- $(A^{T})^{-1} = (A^{-1})^{T}$

These hold for prodcuts of two or more matrices

## Elementary matrices

An **elementary matrix** is one that is obtained by performing a single elementary row operation on an identity matrix

Each elementary matrix is invertible. The inverse of an elementary matrix is the elementar matrix of the same type that transforms it back into the identity matrix

## Finding the inverse matrix

Row reduce the augmented matrix $\begin{bmatrix} A & I\end{bmatrix}$. If $A$ is row equivalent to $I$, then $\begin{bmatrix} A & I\end{bmatrix}$ is row equivalent to $\begin{bmatrix}I & A^{-1} \end{bmatrix}$. Otherwise $A$ does not have an inverse

### Example 4

Find the inverse of 

$$
	A = \begin{bmatrix}
		1 & 0 & -3 \\
		2 & -2 & 1 \\
		0 & -1 & 3
	\end{bmatrix}
$$

$$
	\begin{bmatrix} A & I \end{bmatrix}
	= 
	\begin{bmatrix}
		1 & 0 & -3 & 1 & 0 & 0 \\
		2 & -2 & 1 & 0 & 1 & 0 \\
		0 & -1 & 3 & 0 & 0 & 1
	\end{bmatrix}
$$

Row reducing with the following steps

1) Replace $R_{2} = R_{2} - 2R_{1}$
2) Interchange $R_{2}$ and $R_{3}$
3) Scale $R_{2}$ by $-1$
4) Replace $R_{3} = R_{3} + 2R_{2}$
5) Replace $R_{2} = R_{2} + 3R_{3}$
6) Replace $R_{1} = R_{1} + 3R_{3}$

Yields the following matrix

$$
	\begin{bmatrix}
		1 & 0 & 0 &-5 & 3 & -6 \\
		0 & 1 & 0 & -6 & 3 & -7 \\
		0 & 0 & 1 & -2 & 1 & -2
	\end{bmatrix}
$$

The inverse matrix is the right half of the result

$$
	A^{-1} = \begin{bmatrix}
		-5 & 3 & -6 \\
		-6 & 3 & -7 \\
		-2 & 1 & -2
	\end{bmatrix}
$$
