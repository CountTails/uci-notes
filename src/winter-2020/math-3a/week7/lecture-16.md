# Lecture 16

## Determinants

Recall from [lecture 11](../week5/lecture-11.md) that a $2 \times 2$ matrix is invertible if and only if its determinant is nonzero

$$
	det \left(\begin{bmatrix}
		a & b \\
		c & d
	\end{bmatrix}\right)
	= ad - bc
$$

For a $3 \times 3$ matrix

$$
	A = \begin{bmatrix}
		a_{11} & a_{12} & a_{13} \\
		a_{21} & a_{22} & a_{23} \\
		a_{31} & a_{32} & a_{33}
	\end{bmatrix}
$$

the determinant can be found as follows

$$
	det (A) = a_{11} \cdot det \left(\begin{bmatrix}
		a_{22} & a_{23} \\
		a_{32} & a_{33}
	\end{bmatrix}\right) - a_{12} \cdot det
	\left(\begin{bmatrix}
		a_{21} & a_{23} \\
		a_{31} & a_{33}
	\end{bmatrix}\right) + a_{13} \cdot det
	\left(\begin{bmatrix}
		a_{21} & a_{22} \\
		a_{31} & a_{32}
	\end{bmatrix}\right)
$$

For brevity: $det(A) = a_{11} \cdot det(A_{11}) - a_{12} \cdot det(A_{12}) + a_{13} \cdot det(A_{13})$

Where $A_{11} \,, A_{12} \,, A_{13}$ are obtained from $A$ by deleting the first row and one of each column

For any square matrix $A$, let $A_{ij}$ denote the submatrix formed by deleting the $i$th row and $j$th column of $A$

### Example 1

If

$$
	A = \begin{bmatrix}
		-2 & 3 & 0 & 5 \\
		7 & -3 & 4 & 1 \\
		3 & 1 & -4 & 3 \\
		2 & 0 & 5 & -1
	\end{bmatrix}
$$

then $A_{23}$ is obtained by crossing out row 2 and column 3 

$$
	A_{23} = \begin{bmatrix}
		-2 & 3 & 5 \\
		3 & 1 & 3 \\
		2 & 0 & -1
	\end{bmatrix}
$$

Fo4 $n \ge 2$, the **determinant** of an $n \times n$ matrix $A = [A_{ij}]$ is the sum of $n$ terms of the form $\pm a_{1j} \cdot det(A_{1j})$ with plus and minus signs alternating, where the entries $a_{1} \,, a_{12} \,, \dots \,, a_{1n}$ are from the first row of $A$

$$
	det(A) = a_{11} \cdot det(A_{11}) 
	- a_{12} \cdot det(A_{12})
	+ \dots +
	+ (-1)^{1 + n}a_{1n} \cdot det(A_{1n})
$$

$$
	= \sum \limits_{j = 1}^{n}
	(-1)^{j + 1}a_{1j} \cdot det(A_{1j})
$$

### Example 2

Find the determinant of 

$$
	A = \begin{bmatrix}
		5 & -2 & 2 \\
		0 & 3 & -3 \\
		2 & -4 & 7
	\end{bmatrix}
$$

$$
	det(A) = 
	5 \cdot det \begin{bmatrix}
				3 & -3 \\
				-4 & 7
			\end{bmatrix}
	- (-2) \cdot det \begin{bmatrix}
						0 & -3 \\
						2 & 7	
					\end{bmatrix}
	+ 2 \cdot det \begin{bmatrix}
						0 & 3 \\
						2 & -4
					\end{bmatrix}
$$

$$
	det(A) = 5(21 -12) - (-2)(0 - (-6)) + 2(0 - 6) = 45
$$

## Cofactor expansion

The definition of the determinent of a matrix $A$ can be written in a different form

Given $A = [a_{ij}]$, the (i, j)-**cofactor** of $A$ is the number $C_{ij}$ given by $C_{ij} = (-1)^{i + j} \cdot det(A_{ij})$

Then $det(A) = a_{11} \cdot C_{11} + a_{12} \cdot C_{12} + \dots + a_{1n} \cdot C_{1n}$, which is called a **cofactor expansion accross the first row** of $A$ 

## Theorem 1

The determinant of an $n \times n$ matrix $A$ can be computed by a cofactor expansion across any row or down any column

The cofactor expansion across the $i$th row is 

$$
	det(A) = a_{i1} \cdot C_{i1} + a_{i2} \cdot C_{i2} + \dots + a_{in} \cdot C_{in}
$$

The cofactor expansion down the $j$th column is 

$$
		det(A) = a_{1j} \cdot C_{1j} + a_{2j} \cdot C_{2j} + \dots + a_{nj} \cdot C_{nj}
$$

### Example 3

Find the determinant of 

$$
	A = \begin{bmatrix}
		4 & 0 & -7 & 3 & -5 \\
		0 & 0 & 2 & 0 & 0 \\
		7 & 3 & -6 & 4 & -8 \\
		5 & 0 & 5 & 2 & -3 \\
		0 & 0 & 9 & -1 & 2
	\end{bmatrix}
$$

Find the cofactor expansion down the second column

$$
	det(A) = -0 \cdot det(A_{12}) 
	+ 0 \cdot det(A_{22}) 
	-3 \cdot det(A_{32}) 
	+ 0 \cdot det(A_{42})
	- 0 \cdot det(A_{52})
$$
Most terms cancel out and now we find the determinant of

$$
	\begin{bmatrix}
		4 & -7 & 3 & -5 \\
		0 & 2 & 0 & 0 \\
		7 & -6 & 4 & -8 \\
		5 & 5 & 2 & -3 \\
		0 & 9 & -1 & 2
	\end{bmatrix}
$$

By finding the cofactor expanion across the second row

$$
	det(A) -3 \cdot 2 \cdot \begin{bmatrix}
		4 & 3 & -5 \\
		5 & 2 & -3 \\
		0 & -1 & 2
	\end{bmatrix}
$$

The determinant of the $3 \times 3$ matrix is $-1$, thus the determinant of the original matrix is $6$

## Tips and tricks

The plus or minus sign in the (i, j)-cofactor depends on the position of $a_{ij}$ in the matrix, regardless of the sign of $a_{ij}$ itself. To determine the plus of minus sign, use the following matrix

$$
	\begin{bmatrix}
		+ & - & + & \dots \\
		- & + & - & \dots \\
		+ & - & + & \dots \\
		\vdots & \vdots & \vdots & \ddots
	\end{bmatrix}
$$

For triangular matrices, the determinant is the product of entries on the main diagonal

$$
	det(A) = \left| \begin{bmatrix}
		-2 & 5 & -3 \\
		0 & 3 & 1 \\
		0 & 0 & -1
	 \end{bmatrix} \right|
	 = -2 * 3 * -1 = 6
$$

