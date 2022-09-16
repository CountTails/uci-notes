# Lecture 13

## Subspaces of $\mathbb{R}^{n}$

A subspace of $\mathbb{R}^{n}$ is any set $H$ in $\mathbb{R}^{n}$ that has the following three properties

- The zero vector is in $H$
- for each $\overrightarrow{u}$ and $\overrightarrow{v}$ in $H$, the sum $\overrightarrow{u} + \overrightarrow{v}$ is in $H$
- for each $\overrightarrow{u}$ in $H$ and each scalar $c$, the vector $c\overrightarrow{u}$ is in $H$

A subspace is *closed* under addition and scalar multiplication

Any plane through the origin is a subspace of $\mathbb{R}^{n}$

Any line through the origin is a subspace of $\mathbb{R}^{n}$

$\mathbb{R}^{n}$ is a subspace of itself

$H = \{\overrightarrow{0}\}$ (the zero subspace) is a subspace of $\mathbb{R}^{n}$

### Example 1

Show that $H = \{\overrightarrow{v_{1}}, \overrightarrow{v_{2}}\}$ is a subspace of $\mathbb{R}^{n}$

- $\overrightarrow{0}$ is in $H$ because $0 = 0\overrightarrow{v_{1}} + 0\overrightarrow{v_{2}}$
- take two arbitrary vectors in $H$
	- $\overrightarrow{u} = s_{1}\overrightarrow{v_{1}} + s_{2}\overrightarrow{v_{2}}$
	- $\overrightarrow{v} = t_{1}\overrightarrow{v_{1}} + t_{2}\overrightarrow{v_{2}}$
	- $\overrightarrow{u} + \overrightarrow{v}$ is a linear combination of $v_{1} \,, v_{2}$ and is in $H$
- $c\overrightarrow{u} = c(s_{1}\overrightarrow{v_{1}} + s_{2}\overrightarrow{v_{2}})$ is a linear combination of $v_{1} \,, v_{2}$ and is in $H$

## Column space

The **column space** of a matrix $A$ is the set $Col. \, A$ of all linear combinations of the columns of $A$

The column space of an $m \times n$ matrix is a subspace of $\mathbb{R}^{n}$

The column space of $A$ is the set of all $\overrightarrow{b}$ for which the equation $A\overrightarrow{x} = \overrightarrow{b}$ has a solution

### Example 2

Let 

$$
	A = \begin{bmatrix}
		-3 & -2 & 0 \\
		0 & 2 & -6 \\
		6 & 3 & 3
	\end{bmatrix}
	\text{ and }
	b = \begin{bmatrix}
		1 \\ 14 \\ -9
	\end{bmatrix}
$$

Determine if $\overrightarrow{b}$ is in $Col. \, A$. This can be solved by row reducting the augmented matrix $\begin{bmatrix} A & b \end{bmatrix}$ 

$$
	\begin{bmatrix}
		-3 & -2 & 0 & 1\\
		0 & 2 & -6 & 14 \\
		6 & 3 & 3 & -9
	\end{bmatrix}
	\to
	\begin{bmatrix}
		-3 & -2 & 0 & 1 \\
		0 & 1 & -3 & 7 \\
		0 & 0 & 0 & 0
	\end{bmatrix}
$$

$A\overrightarrow{x} = \overrightarrow{b}$ is consistent, thus $\overrightarrow{b}$ is in $Col. \, A$

## Null Space

The **null space** of matrix $A$ is the set $Nul. \, A$ of all solutions of the homogenous equation $A\overrightarrow{x} = \overrightarrow{0}$

The null space of a $m \times n$ matrix $A$ is a subspace $\mathbb{R}^{n}$

- The zero vector is in $Nul. A$
- The sum of two arbitrary vectors in the null space is in $Nul. A$ because $\overrightarrow{0} + \overrightarrow{0} = \overrightarrow{0}$
- The scalar multiple an an arbitrary vector in the null space is in $Nul. \, A$ because $c\overrightarrow{0} = \overrightarrow{0}$

### Example 3

Let

$$
	A = \begin{bmatrix} 
		-3 & -2 & 0 \\
		0 & 2 & -6 \\
		6 & 3 & 3
	\end{bmatrix}
	\text{ and }
	p = \begin{bmatrix} 2 \\ -3 \\ -1 \end{bmatrix}
$$

Determine if $\overrightarrow{p}$ is in $Nul. A$

To show $\overrightarrow{p}$ is in $Nul. A$, check if $A\overrightarrow{p} = \overrightarrow{0}$

$$
	A\overrightarrow{p} = \begin{bmatrix}
		-3 & -2 & 0 \\
		0 & 2 & -6 \\
		6 & 3 & 3
	\end{bmatrix}
	\begin{bmatrix} 2 \\ -3 \\ -1 \end{bmatrix} =
	\begin{bmatrix} 0 \\ 0 \\ 0 \end{bmatrix}
$$

$\to \overrightarrow{p}$ is in $Nul. A$