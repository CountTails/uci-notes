# Lecture 10

## Matrix Notation

Suppose $A$ is a $m \times n$ matrix

- $A$ has m rows
- $A$ has n columns

$A_{ij}$ is the scalar entry in the $i$th row and $j$ column

$$
	\begin{bmatrix}
		a_{11} & a_{12} & a_{13} & \dots & a_{1n} \\
		a_{21} & a_{22} & a_{23} & \dots & a_{2n} \\
		\vdots & \vdots & \vdots & \ddots & \vdots \\
		a_{m1} & a_{m2} & a_{m3} & \dots & a_{mn}
	\end{bmatrix}
$$

Each entry in $A$ is a vector in $\mathbb{R}^{m}$

$$
	A = \begin{bmatrix}
		a_{1} & a_{2} & \dots & a_{n}
	\end{bmatrix}
$$

The **diagonal entries** of $A$ are the scalar entries where $i = j$, that if $a_{11} \,, a_{22} \,, \dots$ and they form the **main diagonal** of $A$

A **diagonal matrix** is a square matrix whose nondiagonal entries are zero

The **zero matrix** is a matrix whose entries are all zero

## Sums and Scalar Multiples

Two matrices are equal is they are the same size and all their corresponding entries are equal

If $A$ and $B$ are $m \times n$ matrices, the the **sum** $A + B$ is the $m \times n$ matrix whose entries are the sum of the corresponding entries in $A$ and $B$

If $r$ is a scalar and $A$ is a matrix, the **scalar multiple** $rA$ is the matrix whose entries are the product of the corresponding entry in $A$ are $r$

### Example 1

Let

$$
	A = \begin{bmatrix}
		3 & 2 & -5 \\
		-2 & 1 & 0
	\end{bmatrix}
	\,
	B = \begin{bmatrix}
		-3 & 2 & 4 \\
		0 & -6 & -3
	\end{bmatrix}
	\,
	C = \begin{bmatrix}
		-1 & 2 \\
		4 & 0
	\end{bmatrix}
$$

Find $A + B$ and $A + C$

$$
	A + B = \begin{bmatrix}
		0 & 4 & -1 \\
		-2 & -5 & -3
	\end{bmatrix}
$$

$A + C$ is undefind because the sizes do not match

## Matrix multiplication

If $A$ is an $m \times n$ matrix and $B$ is an $n \times p$ matrix with colums $b_{1} \,, \dots \,, b_{p}$, then $AB$ is the $m \times p$ whose columns are $Ab_{1} \,, \dots \,, Ab_{p}$

$$
	AB = A 
	\begin{bmatrix}
		b_{1} & b_{2} & \dots & b_{p}
	\end{bmatrix} = 
	\begin{bmatrix}
		Ab_{1} & Ab_{2} & \dots & Ab_{p}
	\end{bmatrix}
$$

## Example 2

Let

$$
	A = \begin{bmatrix}
		-1 & 2 \\
		3 & 1
	\end{bmatrix}
	\,
	B = \begin{bmatrix}
		1 & 3 & -4 \\
		-2 & 5 & 2
	\end{bmatrix}
$$

Compute $AB$

- $A\overrightarrow{b_{1}} = \begin{bmatrix} -5 \\ 1 \end{bmatrix}$
- $A\overrightarrow{b_{2}} = \begin{bmatrix} 7 \\ 14 \end{bmatrix}$
- $A\overrightarrow{b_{3}} = \begin{bmatrix} 8 \\ -10 \end{bmatrix}$

$AB$ will be $2 \times 3$

$$
	AB = \begin{bmatrix}
		-5 & 7 & 8 \\
		1 & 14 & -10
	\end{bmatrix}
$$

If $A$ is a $3 \times 4$ matrix and $B$ is a $4 \times 5$ matrix, what are the sizes of $AB$ and $BA$

- $AB$ will be a $3 \times 5$ matrix
- $BA$ is undefined because the number of columns in $B$ is not the same as the number of rows in $A$

### Row-column rule for computing $AB$

The entry $A_{ij}$ is the sum of the corresponding entries from row $i$ of $A$ and column $j$ of $B$

In other words, the entry $A_{ij}$ is the dot product of row $i$ in $A$ and column $j$ in $B$

#### Example 3

Let

$$
	A = \begin{bmatrix}
		-1 & 2 \\
		3 & 1
	\end{bmatrix} \,,
	B = \begin{bmatrix}
		1 & 3 & -4 \\
		-2 & 5 & 2
	\end{bmatrix}
$$

Compute $AB$ using the row-column rule rule

- $ab_{11} = -1(1) + 2(-2)$
- $ab_{12} = -1(3) + 2(5)$
- $ab_{13} = -1(-4) + 2(2)$
- $ab_{21} = 3(1) + 1(-2)$
- $ab_{22} = 3(3) + 1(5)$
- $ab_{23} = 3(-4) + 1(2)$

$$
	AB = \begin{bmatrix}
		-5 & 7 & 8 \\
		1 & 14 & -10
	\end{bmatrix}
$$

### Properties of matrix multiplication

The left-to-right order in products is critical because $AB$ and $BA$ are usually not the same

The positions of factors in the product $AB$ is emphasized by saying $A$ is **right multiplied** by $B$ or that $B$ is **left multiplied** by $A$

If $AB = BA$, we say the $A$ and $B$ **commute** with one another

Some notes about matrix multiplication

- In general, $AB \ne BA$
- The cancellation laws do *not* hold for matrix multiplication. That is if $AB = AC$, then it is *not* true, in general, that $B = C$
- If $AB = 0$, you *cannot* conclude in general that either $A = 0$ or $B = 0$

### Powers of a matrix

If $A$ is an $n \times n$ matrix, and if $k$ is a positive integer, then $A^{k}$ denotes the product of $k$ copies of $A$:

$$
	A^{k} = A \dots A
$$

## Algebraic properties of matrices

### Sums and differences

Let $A$, $B$, and $C$ be matrices of the same size, and let $r$ and $s$ be scalars

- $A + B = B + A$
- $(A + B) + C = A + (B + C)$
- $A + 0 = A = 0 + A$
- $r(A + B) = rA + rB$
- $(r + s)A = rA + sA$
- $r(sA) = (rs)A$

### Multiplication

Let $A$ be an $m \times n$ matrix, and let $B$ and $C$ has sizes for which the indicated sums and products are defined. Let $r$ be a scalar

- $A(BC) = (AB)C$
- $A(B + C) = AB + AC$
- $(B + C)A = BA + CA$
- $r(AB) = (rA)B = A(rB)$
- $I_{m}A = A = AI_{n}$

## The transpose of a Matrix

Given an $m \times n$ matrix $A$, the **transpose** of $A$ is the $n \times m$, denoted by $A^{T}$, whose columns are formed from the corresponding rows of $A$

### Example 4

Let

$$
	A = \begin{bmatrix}
		-1 & 2 \\
		3 & 1
	\end{bmatrix} \,,
	B = \begin{bmatrix}
		1 & 3 & -4 \\
		-2 & 5 & 2
	\end{bmatrix}
$$

Find $A^{T}$ and $B^{T}$

$$
	A^{T} = \begin{bmatrix}
		-1 & 3 \\
		2 & 1
	\end{bmatrix}
$$

$$
	B^{T} = \begin{bmatrix}
		1 & -2 \\
		3 & 5 \\
		-4 & 2
	\end{bmatrix}
$$

## Algebraic properties of transposed matrices

Let $A$ and $B$ denote matrices whose sizes are appropriate for the following sums and products

- $(A^{T})^{T} = A$
- $(A + B)^{T} =  A^{T} + B^{T}$
- For any scalar $r$, $(rA)^{T} = rA^{T}$
- $(AB)^{T} = B^{T}A^{T}$
	- $A^{T}B^{T}$ may not be defined if $AB$ is. But if $AB$ is defined, so is $B^{T}A^{T}$