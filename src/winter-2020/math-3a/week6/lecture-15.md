# Lecture 15

## Dimension

The **dimension** of a nonzero subspace $H$, denoted by $dim \, H$ is the number of vectors in any basis for $H$

The dimension of the zero subspace is, by definition, zero

The space $\mathbb{R}^{n}$ has a dimension of $n$

### Example 1

Find the dimension of the column space of $A$

$$
	A = \begin{bmatrix}
		1 & 4 & 8 & -3 & -7 \\
		-1 & 2 & 7 & 3 & 4 \\
		-2 & 2 & 9 & 5 & 5 \\
		3 & 6 & 9 & -5 & -2
	\end{bmatrix}
$$

From [lecture 14](./lecture-14.md), $Col. A$ has the basis $\{ a_{1} \,, a_{2} \,, a_{4} \}$. Since the basis has 3 vectors, the dimension of $Col.\, A = 3$


The **rank** of a matrix $A$ is the dimension of the column space of $A$

### Example 2

Find the dimension of the null space of $A$

$$
	A = \begin{bmatrix}
		1 & 4 & 8 & -3 & -7 \\
		-1 & 2 & 7 & 3 & 4 \\
		-2 & 2 & 9 & 5 & 5 \\
		3 & 6 & 9 & -5 & -2
	\end{bmatrix}
$$

- Each non pivot column gives a free variable in the solution set of the homogenous equation
- Each free variable gives a basis vector for $Nul. \, A$

$$
	\overrightarrow{u} = \begin{bmatrix}
		2 \\ -2.5 \\ 1 \\ 0 \\ 0
	\end{bmatrix}
	\,,
	\overrightarrow{v} = \begin{bmatrix}
		-7 \\ 0.5 \\ 0 \\ -4 \\ 1
	\end{bmatrix}
$$

Since the basis has 2 vectors, $dim \, Nul. \, A = 2$



## The rank theorem

If a matrix $A$ ha $n$ columns, then rank $A$ + $dim \, Nul. A$ is equal to the number of columns in $A$

### Example 3

Find rank $A$ and $dim \, Nul. \, A$ for the matrix $A$

$$
	A = \begin{bmatrix}
		1 & 2 & -5 & 0 & -1 \\
		2 & 5 & -8 & 4 & 3 \\
		-3 & -9 & 9 & -7 & -2 \\
		3 & 10 & -7 & 11 & 7
	\end{bmatrix}
$$

1) Find the echelon form
2) The number of pivots is the rank $A$
3) User rank theorem to find $dim \, Nul. \, A$

$$
	A = \begin{bmatrix}
		1 & 2 & -5 & 0 & -1 \\
		2 & 5 & -8 & 4 & 3 \\
		-3 & -9 & 9 & -7 & -2 \\
		3 & 10 & -7 & 11 & 7
	\end{bmatrix}
	\to
	\begin{bmatrix}
		1 & 2 & -5 & 0 & -1 \\
		0 & 1 & 2 & 4 & 5 \\
		0 & 0 & 0 & 1 & 2 \\
		0 & 0 & 0 & 0 & 0
	\end{bmatrix}
$$

$A$ has 3 pivot columns, thus the rank $A$ is 3

Using rank theorem

- $rank \, A + dim \, Nul. \, A = n$
- $dim \, Nul. \, A = 5 - 3 = 2$

## The basis theorem

Let $H$ be a p-dimenional subspace $\mathbb{R}^{n}$. Any linearly independent set of exactly $p$ elements in $H$ is automatically a basis for $H$. Also, any set of $p$ elements of $H$ is automatically a basis for $H$

## The invertible matrix theorem (part 2)

Let $A$ be an $n \times n$ matrix. Then the following statements are each equivalent to the statement that $A$ is an [invertible matrix](../week5/lecture-12.md)

13) The columns of $A$ form a basis of $\mathbb{R}^{n}$
14) Col $A$ = $\mathbb{R}^{n}$
15) dim Col $A = n$
16) rank $A = n$
17) Nul $A = \{ \overrightarrow{0} \}$
18) dim Nul $A = 0$

### Proof

- Statement 13 is logically equivalent to statements 5 and 8
- The other 5 statements are linked to the previous statements in the theorem by the chain of implications
- $6 \to 14 \to 15 \to 16 \to 18 \to 17 \to 4$