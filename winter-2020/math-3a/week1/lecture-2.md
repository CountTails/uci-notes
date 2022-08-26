# Lecture 2

## Echelon forms

### Definitions

A **nonzero** row or column means that a row or columns contains at least one *nonzero* entry

A **leading entry** of a row refers to the leftmost entry in a nonzero row

A rectangular matrix is in **echelon form**, or **row echelon form** if the following apply

- All nonzero rows are above any rows of all zeros
- Each leading entry of a row is in a column to the right of the leading entry of the row above it
- All entries in a column below a leading entry are zeros

In addition to the conditions above, if the following also apply, then the matrix is in **reduced echelon form** or **reduced row echelon form**

- The leading entry in each nonzero row is 1
- Each leading entry 1 is the only nonzero entry in its column

Theorem (uniqueness of the reduced echelon form)

> Each matrix is row equivalent to one and only one reduced echelon matrix

$U$ is an **echelon form** of $A$ is $U$ is row equivalent to $U$. If $U$ is a reduced echelon form, then $U$ is the reduced echelon form of $A$

A **pivot position** in $A$ is a location in $A$ that corresponds to a leading 1 in the reduced echelon form of $A$. A **pivot column** is a column of $A$ that contains a pivot

### Examples

#### Echelon form

$$
	\begin{bmatrix}
		-2 & 2 & 3 & 5 \\
		0 & 1 & -3 & 2 \\
		0 & 0 & 1 & -2
	\end{bmatrix}
$$

#### Reduced echelon form

$$
	\begin{bmatrix}
		1 & 0 & 0 & 4 \\
		0 & 1 & 0 & -1 \\
		0 & 0 & 1 & 3 \\
		0 & 0 & 0 & 0
	\end{bmatrix}
$$

## The row reduction algorithm

1) Begin with the leftmost nonzero column. This is the pivot column. The pivot position in at the top
2) Select a nonzero entity in the pivot column as a pivot. If necessary, interchange rows to move this entry into the pivot position
3) Use row replacement operations to create zeros in all positions below the pivot
4) Cover (or ignore) the row containing the pivot position and cover all rows, if any, above it. Applys steps 1 through 3 to the submatrix that remains. Repeat the process until there are no more nonzero rows to modify
5) Beginning with the rightmost pivot and working upward and to the left, create zeros above each pivot. If a pivot is not 1, make it 1 by a scaling operation

### Example

Row reduce the matrix $A$ to reduced echelon form

$$
	A = \begin{bmatrix}
		1 & 3 & 5 & 7 \\
		3 & 5 & 7 & 9 \\
		5 & 7 & 9 & 1		
	\end{bmatrix}
$$

$$
	\begin{bmatrix}
		1 & 3 & 5 & 7 \\
		3 & 5 & 7 & 9 \\
		5 & 7 & 9 & 1		
	\end{bmatrix} \ \underrightarrow{R_{2} - 3R_{3}} 
	\begin{bmatrix}
		1 & 3 & 5 & 7 \\
		0 & -4 & -8 & - 12 \\
		5 & 7 & 9 & 1
	 \end{bmatrix}
$$

$$
\underrightarrow{R_{3} - 5R_{1}}
	\begin{bmatrix}
		1 & 3 & 5 & 7 \\
		0 & -4 & -8 & -12 \\
		0 & -8 & -16 & -34
	\end{bmatrix}
$$

$$
\underrightarrow{\dfrac{-1}{4}R_{2}}
\begin{bmatrix}
	1 & 3 & 5 & 7 \\
	0 & 1 & 2 & 3 \\
	0 & -8 & -16 & -34 
\end{bmatrix}

\underrightarrow{R_{3} + 8R_{2}}
\begin{bmatrix}
	1 & 3 & 5 & 7 \\
	0 & 1 & 2 & 3 \\
	0 & 0 & 0 & -10
\end{bmatrix}
$$

$$
\underrightarrow{\dfrac{-1}{10}R_{3}}
\begin{bmatrix}
	1 & 3 & 5 & 7 \\
	0 & 1 & 2 & 3 \\
	0 & 0 & 0 & 1
\end{bmatrix}
\underrightarrow{R_{1} - 3R_{2}}
\begin{bmatrix}
	1 & 0 & -1 & -2 \\
	0 & 1 & 2 & 3 \\
	0 & 0 & 0 & 1
\end{bmatrix}
$$

$$
\underrightarrow{R_{1} + 2R_{3}}
\begin{bmatrix}
	1 & 0 & -1 & 0 \\
	0 & 1 & 2 & 3 \\
	0 & 0 & 0 & 1
\end{bmatrix}
\underrightarrow{R_{2} - R_{3}}
\begin{bmatrix}
	1 & 0 & -1 & 0 \\
	0 & 1 & 2 & 0 \\
	0 & 0 & 0 & 1
\end{bmatrix}
$$

## Solutions of linear systems

The row reduction algorithm leads directly to an explicit description of the solution set of a linear system when applied to the augmented matrix of a system

### Example
$$
\begin{bmatrix}
	1x_{1} & 0x_{2} & -2x_{3} & 0x_{4} & 5 \\
	0x_{1} & 1x_{2} & 3x_{3} & 0x_{4} & -1 \\
	0x_{1} & 0x_{2} & 0x_{3} & 1x_{4} & 2
\end{bmatrix}
$$

In this matrix, $x_{1}, x_{2}, x_{4}$ correspond to the pivot columns in the matrix are called **basic variables**. The other variable $x_{3}$ is called a **free variable**.

Since the system in consistent, the solution set can be described explicitly with the basic variables in terms of the free variables

The solution set of the matrix above can be expressed as

$$
S = \begin{cases}
	x_{1} = 5 + 2x_{3} \\
	x_{2} = -1 - 3x_{3} \\
	x_{3} \ is \ free \\
	x_{4} = 2
\end{cases}
$$

$x_{3}$ is free, meaning any value can be substituted for $x_{3}$ and the result is part of the solution set

## Existence and uniqueness theorem

> A linear system is consistent if and only if the rightmost column of the augmented matrix is not a pivot column. That is, if and only if an echelon form of the augmented matrix has no row of the form $[0, ..., 0, b]$ with nonzero $b$.
> If a linear system is consistent, then the solution set contains either a unique solution, when there are no free variables, or infinitely many solutions, when there is at least one free variable