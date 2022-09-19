# Midterm 2

## Matrix notation

A $m \times n$ matrix has $m$ rows and $n$ columns

The scalar entry in $A$ at the $i$th row and $j$th column is denoted as $a_{ij}$

The **diagonal entries** are $a_{11} \,, a_{22} \,, \dots$ and form the **main diagonal** of the matrix

A **diagonal matrix** is a square matrix whose non-diagonal entries are zero

A **zero matrix** is a matrix with all zero entries

Two matrices are **equal** if their sizes and corresponding entries are the same

$$
	\begin{bmatrix}
		a_{11} & a_{12} & a_{13} & \dots & a_{1n} \\
		a_{21} & a_{22} & a_{23} & \dots & a_{2n} \\
		\vdots & \vdots & \vdots & \ddots & \vdots \\
		a_{m1} & a_{m2} & a_{m3} & \dots & a_{mn}
	\end{bmatrix}
$$


## Matrix addition

If $A$ and $B$ are $m \times n$ matrices, the **sum** $A + B$ is the $m \times n$ matrix whose entries are the sum corresponding entries in $A$ and $B$

$$
	\begin{bmatrix}
		a_{11} & a_{12} \\
		a_{21} & a_{22}
	\end{bmatrix}
	+
	\begin{bmatrix}
		b_{11} & b_{12} \\
		b_{21} & b_{22}
	\end{bmatrix}
	=
	\begin{bmatrix}
		a_{11} + b_{11} & a_{12} + b_{12} \\
		a_{21} + b_{21} & a_{22} + b_{22}
	\end{bmatrix}
$$

If $A$ and $B$ are different sizes, then $A + B$ is not defined

### Properties

- $A + B = B + A$
- $(A + B) + C = A + (B + C)$
- $A + 0 = A = 0 + A$
- $r(A + B) = rA + rB$
- $(r + s)A = rA + sA$
- $r(sA) = (rs)A$

## Matrix multiplication

If $A$ is a $m \times n$ matrix and $B$ is a $n \times p$ matrix, then $AB$ is a $m \times p$ matrix

$$
	AB = A\begin{bmatrix}
		b_{1} & b_{2} & \dots & b_{p}
	\end{bmatrix}
	=
	\begin{bmatrix}
		Ab_{1} & Ab_{2} & \dots & Ab_{p}
	\end{bmatrix}
$$

### Properties

- $A(BC) = (AB)C$
- $A(B + C) = AB + AC$
- $(B + C)A = BA + CA$
- $r(AB) = (rA)B = A(rB)$
- $IA = A = AI$, where $I$ is the identity matrix

### Warnings

- Generally, $AB \ne BA$
- If $AB = AC$, then $B = C$ is generally untrue
- If $AB = 0$, then it cannot be concluded that
	- $A = 0$
	- $B = 0$

### Row-column rule for computing $AB$

$$
	(AB)_{ij} = a_{i1}b_{1j} + a_{i2}b_{2j} + \dots + a_{in}b_{nj}
$$

The individual entries of $AB$ are the dot product of the $i$th row and the $j$th column

## Transposed matrices

Given a matrix $A$, its transpose is the swapping of rows and columns of $A$

The transpose of a transposed matrix is the original matrix

$$
	\begin{bmatrix}
		a & b \\
		c & d
	\end{bmatrix}
	\to
	\begin{bmatrix}
		a & c \\
		b & d
	\end{bmatrix}
$$

### Properties

- $(A^{T})^{T} = A$
- $(A + B)^{T} = A^{T} + B^{T}$
- $r(A^{T}) = rA^{T}$
- $(AB)^{T} = B^{T}A^{T}$

## Matrix invertibility

Matrix $A$ is invertible if $A$ is a square matrix and a matrix $C$ exists such that $AC = CA = I$

The inverse of a matrix is unique, denoted by $A^{-1}$

A matrix that is not invertible is called a **singular matrix**

A matrix that is invertible is called a **nonsingular matrix**

### Determining invertibility

If $A = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$ and $ad - bc$ is nonzero, then 

$$
	A^{-1} = \dfrac{1}{ad - bc}
	\begin{bmatrix}
		d & -b \\
		-c & a
	\end{bmatrix}
$$

If $A$ is row equivalent to its appropriate identity matrix, $A$ is invertible

If any statements from the **Invertible Matrix Theorem** are true, then $A$ is invertible

### Properties of invertible matrices

- The equation $A\overrightarrow{x} = \overrightarrow{b}$ has the unique solution $\overrightarrow{x} = A^{-1}\overrightarrow{b}$
- The inverse of an inverse matrix is the orginal matrix
- $(AB)^{-1} = B^{-1}A^{-1}$
- $(A^{T})^{-1} = (A^{-1})^{T}$

## Elementary matrices

An elementary matrix is one row operation away from the identity matrix

Every elementary matrix is invertible

Reveals a method for determining the inverse of a matrix

## An algorithm for finding the inverse matrix

1) Make the augmented matrix $\begin{bmatrix} A & I\end{bmatrix}$
2) Row reduct the matrix
3) If $A$ is reducible to $I$, then $I$ becomes the inverse of $A$
4) If $A$ cannot be reduced to $I$, then $A$ is not invertible

## Invertible matrix theorem

1) $A$ is an invertible matrix
2) $A$ is row equivalent to the $n \times n$ identity matrix
3) $A$ has exactly $n$ pivot columns
4) The equation $A\overrightarrow{x} = \overrightarrow{0}$ has only the trivial solution
5) The columns of $A$ form a linearly independent set
6) The linear transformation $\overrightarrow{x} \to A\overrightarrow{x}$ is one-to-one
7) The equation $A\overrightarrow{x} = \overrightarrow{b}$ has at least one solution for each $\overrightarrow{b}$ in $\mathbb{R}^{n}$
8) The columns of $A$ span $\mathbb{R}^{n}$
9) The linear tranformation $\overrightarrow{x} \to A\overrightarrow{x}$ maps $\mathbb{R}^{n}$ onto $\mathbb{R}^{n}$
10) There is a matrix $C$ such that $CA = I$
11) There is a matrix $D$ such that $DA= I$
12) $A^{T}$ is an invertible matrix

## Invertible linear transformations

A linear transformation $T$ is invertible if and only if the standard matrix is invertible

The transformation $S(\overrightarrow{x}) = A^{-1}\overrightarrow{x} = T^{-1}(\overrightarrow{x})$ satisfies the following

- $S(T(\overrightarrow{x})) = \overrightarrow{x}$
- $T(S(\overrightarrow{x})) = \overrightarrow{x}$

## Subspaces

A **Subspace** of $\mathbb{R}^{n}$ is any set $H$ in $\mathbb{R}^{n}$ that has three properties

1) The zero vector is in $H$
2) For each vector $\overrightarrow{u}$ and $\overrightarrow{v}$ in $H$, the sum $\overrightarrow{u} + \overrightarrow{v}$ is in $H$
3) For each vector $\overrightarrow{u}$ in $H$, and each scalar $c$, the vector $c\overrightarrow{u}$ is in $H$

The **Column space** of a matrix $A$ is the set of all linear combinations of $Col. \, A$ 

- $Col. \, A$ has the same span as its columns
- Check for consistency to see if a vector $b$ is in the column space

The **Null space** of a matrix $A$ is the set of solutions to $A\overrightarrow{x} = \overrightarrow{0}$

- The set of solutions is a subspace of $\mathbb{R}^{n}$
- Check that $A\overrightarrow{u} = \overrightarrow{0}$ for a given $\overrightarrow{u}$ to see if it is in the null space

## Basis for subspaces

A **basis** for a subspace $H$ of $\mathbb{R}^{n}$

- linearly independent
- spans $H$

The pivot columns of $A$ form a basis for the column space of $A$

- Use columns of $A$ itself after row reducing

The parametric vector form of $A\overrightarrow{x} = \overrightarrow{0}$ forms the basis for the null space of $A$

- the vectors in the answer form the basis

## Coordinate systems

- Any vector in subspace H can be written as a unique linear combination of the basis vectors
- Suppose $\beta = \{ \overrightarrow{b_{1}} \,, \dots \,, \overrightarrow{b_{p}} \}$, then the coordinates of x relative to basis is $[\overrightarrow{x}]_{\beta} = \begin{bmatrix} c_{1} \\ \vdots \\ c_{p} \end{bmatrix}$
- This is also known as the beta-coordinate of x
- The vector x is a linear combination of beta and the beta-coordinate of x
- The basis vectors determine a coordinate system on the subspace H
- $\overrightarrow{x} \to [\overrightarrow{x}]_{\beta}$ is a one-to-one correspondence that preserves linear combinations

## Dimensions

- A space in $\mathbb{R}^{n}$ has dimension n; A zero subspace has dimension 0
- Rank is a fancy word for dimension of Col A
	- Dim Col A = number of pivot columns
	- Dim Null A = number of non-pivot columns
- Rank theorem:  Dim Col A + Dim Null A = n

Basis theorem: If $H$ is a p-dimensional subspace of $\mathbb{R}^{n}$, then any linearly independent set of exactly p-elements is automatically a basis for H

## Invertible matrix theorem (P. 2)

Let $A$ be an $n \times n$ invertible matrix, then the following statements are equivalent

13) The columns of $A$ form a basis for $\mathbb{R}^{n}$
14) Col $A$ = $\mathbb{R}^{n}$
15) Dim Col $A$/Rank $A$ = $A$
16) Null $A$ = $\{0\}$
17) Dim Null $A$ = $0$

## Determinants

Determinant of a $2 \times 2$ matrix

$$
	det\left(\begin{bmatrix}
		a & b \\
		c & d
	\end{bmatrix}\right)
	= ad - bc
$$

For bigger matrices, break them down into $2 \times 2$ matrices

### Cofactor expansion

Cofactor expansion across the $i$th row

$$
	det(A) = a_{i1}C_{i1} 
	+ a_{i2}C_{i2} 
	+ \dots 
	+ a_{in}C_{in}
$$

Cofactor expansion across the $j$th colunm

$$
	det(A) = a_{1j}C_{1j} 
	+ a_{2j}C_{2j} 
	+ \dots 
	+ a_{nj}C_{nj}
$$

The signs of each term are determined by $(-1)^{i + j}$

### By row reduction

- The determinant of a matrix in echelon form is the product of the diagonal entries  
- Row reduce a matrix to create more zeros in one column  
- Can be combined with co-factor expansion.

#### Effect of row reduction operations

| operation | effect |
| ---- | ---- |
| Replacement | Does not affect determinant |
| Interchange | Negates the determinant |
| Scaling | scales the determinant by $\dfrac{1}{k}$ |

### Properties of determinants\

- $A$ is invertible if its determinant is nonzero  
- The columns of $A$ form a linearly independent set
- The determinant of a transposed matrix is the determinant of the original
- $det(AB) = (det (A))(det (B))$