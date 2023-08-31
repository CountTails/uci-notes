# Lecture 12

## The invertible matrix theorem (IMT)

Let $A$ be a $n \times n$ matrix. The following statements are equivalent, that is they are all true, or none are

1) $A$ is an invertible matrix
2) $A$ is row equivalent to the $n \times n$ identity matrix
3) $A$ has $n$ pivot positions
4) The equation $A\overrightarrow{x} = \overrightarrow{0}$ has only the trivial solution
5) The columns of $A$ form a linearly independent set
6) The linear transformation $\overrightarrow{x} \to A\overrightarrow{x}$ is one-to-one
7) The equation $A\overrightarrow{x} = \overrightarrow{b}$ has at least one solution for each $\overrightarrow{b}$ in $\mathbb{R}^{n}$
8) The columns of $A$ span $\mathbb{R}^{n}$
9) The linear transformation $\overrightarrow{x} \to A\overrightarrow{x}$ maps $\mathbb{R}^{n}$ onto $\mathbb{R}^{n}$
10) There is an $n \times n$ matrix $C$ such that $CA = I$
11) There is an $n \times n$ matrix $D$ such that $AD = I$
12) $A^{T}$ is an invertible matrix

## Proof of  IMT

If statement 1 is true, then so is statement 10

If statement 10 is true, then so is statement 4

If statement 4 is true, then so is statement 3

If statement 3 is true, then so is statement 2

Statement 2 implies that statement 1 is true

Statement 1 implies statement 11 is true, which implies statement 7 is also true

Statement 7 and statement 8 depend on each other being true

Statement 8 and statement 9 also depend on each other being true

Similarly, statements 4, 5, 6 also depend on each other being true

Lastly, statement 1 implies statement 12 is true

## Meaning of IMT

Divides the set of $n \times n$ matrices into two disjoint classes

- invertible (nonsingular) matrices
- noninvertible (singular) matrices

Every statement in IMT is true for invertible matrices and is false of noninvertible matrices

### Example 1

Determine if $A$ is invertible using IMT

$$
	A = \begin{bmatrix}
		1 & -5 & -4 \\
		0 & 3 & 4 \\
		-3 & 6 & 0
	\end{bmatrix}
	\to
	\begin{bmatrix}
		1 & -5 & -4 \\
		0 & 3 & 4 \\
		0 & 0 & 0
	\end{bmatrix}
$$

Since $A$ only has two pivot points, statement 3 is false and is therefore not invertible

### Example 2

If the columns of a $7 \times 7$ matrix $D$ are linearly independent, what can you infer about the equation $D\overrightarrow{x} = \overrightarrow{b}$

Because the columns of $D$ are linearly independent, statement 5 of IMT is true. Thus, any other statement of IMT is also true, Therefore, we can infer $D\overrightarrow{x} = \overrightarrow{b}$ has a unique solution

## Invertible linear transformations

Matrix multiplication is like a composition of linear transformations

When matrix $A$ is invertible, $A^{-1}A\overrightarrow{x} = \overrightarrow{x}$

A linear tranformation is **invertible** if there exists a function $S: \mathbb{R}^{n} \to \mathbb{R}^{n}$ such that

- $S(T(\overrightarrow{x})) = \overrightarrow{x}$ for all $\overrightarrow{x}$ in $\mathbb{R}^{n}$
- $T(S(\overrightarrow{x})) = \overrightarrow{x}$ for all $\overrightarrow{x}$ in $\mathbb{R}^{n}$

If such an $S$ exists, it is called the **inverse** of $T$ and is denoted as $T^{-1}$

### Theorem 9

> Let $T: \mathbb{R}^{n} \to \mathbb{R}^{n}$ be a linear transformation and let $A$ be the standard matrix for $T$. Then $T$ is invertible if and only if $A$ is an invertible matrix
