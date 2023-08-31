# Lecture 9

## The matrix of linear tranformation

In this lecture we will show every linear transformation from $\mathbb{R}^{n}$ to $\mathbb{R}^{m}$ is a matrix transformation

The columns of $I_{2}$ are $e_{1} = \begin{bmatrix} 1 \\ 0 \end{bmatrix}$ and $e_{2} = \begin{bmatrix} 0 \\ 1 \end{bmatrix}$ 

Define $T$ to be a linear transformation from $\mathbb{R}^{2}$ to $\mathbb{R}^{3}$ such that

$$
	T(e_{1}) = 
	\begin{bmatrix}
		2 \\ -3 \\ 5
	\end{bmatrix}
	\text{and} \,
	T(e_{2}) = 
	\begin{bmatrix}
		-1 \\ 0 \\ 1
	\end{bmatrix}
$$

Find a formula for the image of an arbitrary $\overrightarrow{x}$ in $\mathbb{R}^{2}$

$$
	\overrightarrow{x} = 
	\begin{bmatrix}
		a \\ b
	\end{bmatrix}
	= a\overrightarrow{e_{1}} + b\overrightarrow{e_{2}}
$$

$$
	T(\overrightarrow{x}) = 
	T(a\overrightarrow{e_{1}} + 
	b\overrightarrow{e_{2}}) =
	aT(\overrightarrow{e_{1}}) +
	bT(\overrightarrow{e_{2}}) 
$$

$$
	= a \begin{bmatrix}
		2 \\ -3 \\ 5
	\end{bmatrix} + b \begin{bmatrix}
		-1 \\ 0 \\ 1
	\end{bmatrix}
$$

$$
	\begin{bmatrix}
		2 & -1 \\
		-3 & 0 \\
		5 & 1
	\end{bmatrix}
	\begin{bmatrix}
		a \\ b
	\end{bmatrix}
	=
	\begin{bmatrix}
		2 & -1 \\
		-3 & 0 \\
		5 & 1
	\end{bmatrix} \overrightarrow{x}
$$

This is also a matrix transformation

$$
	\begin{bmatrix}
		T(e_{1}) & T(e_{2})
	\end{bmatrix}
	\begin{bmatrix}
		x_{1} \\ x_{2}
	\end{bmatrix}
	= A\overrightarrow{x}
$$

### Theorem 10

Let $T: \mathbb{R}^{n} \to \mathbb{R}^{m}$ be a linear tranformation. Then there exists a unique matrix $A$ such that

$$
	T(\overrightarrow{x}) = A\overrightarrow{x} \, 
	\text{for all x in} \, \mathbb{R}^{n}
$$

In fact, $A$ is the $m \times n$ matrix whost $j$th column is the vector $T(e_{j})$, where $e_{j}$ is the $j$th column of the identity matrix in $\mathbb{R}^{n}$

The matrix $A$ is called the **standard matrix for the linear tranformation** $T$

### Example 1

$$
	T\left(\begin{bmatrix} x_{1} \\ x_{2} \end{bmatrix}\right)
	=
	\begin{bmatrix}
		2x_{1} - x_{2} \\
		3x_{1} + 2x_{2}
	\end{bmatrix}
$$

$$
	T\left( \begin{bmatrix} x_{1} \\ x_{2} \end{bmatrix}\right) =
	x_{1} \begin{bmatrix} 2 \\ 3 \end{bmatrix}
	+ x_{2} \begin{bmatrix} -1 \\ 2 \end{bmatrix}
$$

$$
	= \begin{bmatrix}
		2 & -1 \\
		3 & 2
	\end{bmatrix}
$$

## Geometrix transformation of $\mathbb{R}^{2}$

| Transformation | Standard matrix |
| ---- | ---- |
| Reflection through the $x_{1}$ axis | $\begin{bmatrix} 1 & 0 \\ 0 & -1 \end{bmatrix}$ |
| Reflection through the $x_{2}$ axis | $\begin{bmatrix} -1 & 0 \\ 0 & 1 \end{bmatrix}$|
| Reflection through the line $x_{2} = x_{1}$ | $\begin{bmatrix} 0 & 1 \\ 1 & 0 \end{bmatrix}$ |
| Reflection through the line $x_{2} = -x_{1}$ | $\begin{bmatrix} 0 & -1 \\ -1 & 0 \end{bmatrix}$ |
| Reflection through the origin | $\begin{bmatrix} -1 & 0 \\ 0 & -1 \end{bmatrix}$ |
| Horizontal contraction and expansion | $\begin{bmatrix} k & 0 \\ 0 & 1 \end{bmatrix}$
| Vertical contraction and expansion | $\begin{bmatrix} 1 & 0 \\ 0 & k \end{bmatrix}$|
| Horizontal shear | $\begin{bmatrix} 1 & k \\ 0 & 1 \end{bmatrix}$
| Vertical shear | $\begin{bmatrix} 1 & 0 \\ k & 1 \end{bmatrix}$
| Projection onto $x_{1}$ axis | $\begin{bmatrix} 1 & 0 \\ 0 & 0 \end{bmatrix}$
| Projection onto $x_{2}$ axis | $\begin{bmatrix} 0 & 0 \\ 0 & 1 \end{bmatrix}$

## Onto and one-to-one

A mapping $T: \mathbb{R}^{n} \to \mathbb{R}^{m}$ is said to be **onto** $\mathbb{R}^{m}$ if each $\overrightarrow{b}$ in $\mathbb{R}^{m}$ is the image of at least one $\overrightarrow{x}$. In other words, the range and codomain of $T$ are the same. This means $T(\overrightarrow{x}) = \overrightarrow{b}$ is consistent for all $\overrightarrow{b}$ in $\mathbb{R}^{m}$

The mapping $T$ is *not* onto when there is some $\overrightarrow{b}$ in $\mathbb{R}^{m}$ for which the equation $T(\overrightarrow{x}) = \overrightarrow{b}$

A mapping $T: \mathbb{R}^{n} \to \mathbb{R}^{m}$ is said to be **one-to-one** if each $\overrightarrow{b}$ in $\mathbb{R}^{m}$ is the image of at most one $\overrightarrow{x}$ in $\mathbb{R}^{n}$

$T$ is one-to-one if, for each $\overrightarrow{b}$ in $\mathbb{R}^{m}$, the equation $T(\overrightarrow{x}) = \overrightarrow{b}$ has either a unique solution or none at all

$T$ is not one-to-one when some $\overrightarrow{b}$ in $\mathbb{R}^{m}$ is the image of more than one vector in $\mathbb{R}^{n}$


### Example 2

$$
	T \left(
	\begin{bmatrix} 
		x_{1} \\ x_{2} \\ x_{3}
	\end{bmatrix}
	\right) = 
	\begin{bmatrix}
		x_{1} -5x_{2} + 4x_{3} \\
		x_{2} - 6x_{3}
	\end{bmatrix}
$$

Is $T$ a one-to-one transformation? Does $T$ map $\mathbb{R}^{3}$ onto $\mathbb{R}^{2}$

$$
	A = \begin{bmatrix}
		1 & -5 & 4 \\
		0 & 1 & -6
	\end{bmatrix}
$$

$T$ is not one-to-one because the columns of $A$ are linearly dependent. This is because any set of three vectors in $\mathbb{R}^{2}$ are linearly dependent

$T$ is onto $\mathbb{R}^{n}$ because $A$ contains two pivots, one in each row, and using [Theorem 4](../week2/lecture-2.md), the columns of $A$ span $\mathbb{R}^{2}$

### Theorem 11

Let $T: \mathbb{R}^{n} \to \mathbb{R}^{m}$ be a linear transformation. Then $T$ is one-to-one if and only if the equation $T(\overrightarrow{x}) = \overrightarrow{0}$ has only the trivial solution

### Theorem 12

Let $T: \mathbb{R}^{n} \to \mathbb{R}^{m}$ be a linear transformation, and let $A$ be the standard matrix for $T$. Then 

- $T$ maps $\mathbb{R}^{n}$ onto $\mathbb{R}^{m}$ if and only if the columns of $A$ span $\mathbb{R}^{m}$
- $T$ is one-to-one if and only if the columns of $A$ are linearly independent