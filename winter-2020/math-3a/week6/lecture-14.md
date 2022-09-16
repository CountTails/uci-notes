# Lecture 14

## Basis of a subspace

A **basis** of a subspace $H$ of $\mathbb{R}^{n}$ is a linearly independent set in $H$ that spans $H$

The columns of an invertible $n \times n$ form a basis for all $\mathbb{R}^{n}$ because

- they are linearly independent
- span $\mathbb{R}^{n}$

The identity matrix is one such matrix. Its columns also form the **standard basis** for $\mathbb{R}^{n}$

### Example 1

Determine if the following set of vectors form a basis for $\mathbb{R}^{n}$

$$
	\begin{bmatrix}
		1 \\ 1 \\ -2
	\end{bmatrix}
	\,,
	\begin{bmatrix}
		-5 \\ -1 \\ 2
	\end{bmatrix}
	\,,
	\begin{bmatrix}
		7 \\ 0 \\ -5
	\end{bmatrix}
$$

To determine if the above set of vectors is a basis for $\mathbb{R}^{n}$, determine the set is linearly independent and spans $\mathbb{R}^{n}$

Writing the column vectors as a single matrix and row reducing ...

$$
	A = \begin{bmatrix}
		1 & -5 & 7 \\
		1 & -1 & 0 \\
		-2 & 2 & -5
	\end{bmatrix}
	\to
	\begin{bmatrix}
		1 & -5 & 7 \\
		0 & 4 & -7 \\
		0 & 0 & -5
	\end{bmatrix}
$$

$A$ has 3 pivot columns. By the invertible matrix theorem, the columns of $A$ are linearly independent and they span $\mathbb{R}^{n}$

## Basis of the null space

To find a basis for the null space of $A$, write the solution of the homogenous equation $A\overrightarrow{x} = \overrightarrow{0}$ in parametrix vector form

### Example 2
$$
	\begin{bmatrix} A & 0 \end{bmatrix}
	=
	\begin{bmatrix}
		1 & 4 & 8 & -3 & -7 & 0 \\
		-1 & 2 & 7 & 3 & 4 & 0 \\
		-2 & 2 & 9 & 5 & 5 & 0 \\
		3 & 6 & 9 & -5 & -2 0
	\end{bmatrix}
	\to
	\begin{bmatrix}
		1 & 0 & -2 & 0 & 7 & 0 \\
		0 & 1 & 2.5 & 0 & -0.5 & 0 \\
		0 & 0 & 0 & 1 & 4 & 0 \\
		0 & 0 & 0 & 0 & 0 & 0
	\end{bmatrix}
$$

$$
	\overrightarrow{x} = \begin{bmatrix}
		2x_{3} - 7x_{5} \\
		-2.5x_{3} + 0.5x_{5} \\
		x_{3} \\
		-4x_{5} \\
		x_{5} 
	\end{bmatrix}
	=
	x_{3}\begin{bmatrix}
		2 \\ -2.5 \\ 1 \\ 0 \\ 0
	\end{bmatrix}
	+
	x_{5}\begin{bmatrix}
		-7 \\ 0.5 \\ 0 \\ -4 \\ 1
	\end{bmatrix}
$$

This shows that $Nul. A$ coincides with the set of all linear combinations of $x_{3}$ and $x_{5}$. Thus $Nul. A = Span\{ x_{3} \,, x_{5}\}$

$x_{3}$ and $x_{5}$ are linearly independent, thus $\{ x_{3} \,, x_{5} \}$ is a basis for $Nul. A$

## Basis of a column space

To find the basis for the column space of $A$, write $A$ in reduced echelon form

$$
	\begin{bmatrix}
		a_{1} & \dots & a_{n}
	\end{bmatrix}
	\to
	\begin{bmatrix}
		b_{1} & \dots & b_{n}
	\end{bmatrix}
$$

Any vector $\overrightarrow{v}$ in $Col. B$ is a linear combination of the columns of $B$

$$
	v = c_{1}b_{1} + \dots + c_{n}b_{n}
$$

can be rewritten as a linear combination of the pivot columns exclusively

- The pivot columns are linearly independent
- The pivot columns of $B$ form a basis for $Col. B$

Row operations do not affect linear dependence relations among the columns of a matrix

## Theorem 13

> The pivot columns of $A$ form a basis for the column space  of $A$

## Coordinate systems

Selecting a basis for a subspac $H$ allows every vector in $H$ to be written as a linear combination of the basis vectors

Suppose $\beta = \{ b_{1} \,, \dots \,, b_{p} \}$ is a basis for subspace $H$

**Coordinates of x relative to the basis** are weights $c_{1} \,, \dots \,, c_{p}$ such that x is a linear combination of the basis and weights

$$
	x_{[\beta]} = \begin{bmatrix}
		c_{1} \\ \vdots \\ c_{p}
	\end{bmatrix}
$$

is called the **coordinate of vector x** relative to basis $\beta$

### Example 1

Let

$$
	\beta = \left\{ \begin{bmatrix}
		 -4 \\ 5 \\ 1
	 \end{bmatrix} \,, \begin{bmatrix}
		 2 \\ 1 \\ -4
	 \end{bmatrix}\right\}
$$
be a basis for subspace $H$. Find the vector $\overrightarrow{x}$ determined by the coordinate vector $x_{[\beta]} = \begin{bmatrix} 4 \\ -2 \end{bmatrix}$ 

To find $\overrightarrow{x}$, compute $\overrightarrow{x} = 4b_{1} -2b_{2}$

$$
	\overrightarrow{x} = 4\begin{bmatrix}
		-4 \\ 5 \\ 1
	\end{bmatrix} - 2\begin{bmatrix}
		2 \\ 1 \\ -4
	\end{bmatrix} = \begin{bmatrix}
		-20 \\ 18 \\ 12
	\end{bmatrix}
$$

### Example 2

Let 

$$
	v_{1} = \begin{bmatrix}
		2 \\ -1 \\ 6
	\end{bmatrix}
	\,, 
	v_{2} = \begin{bmatrix}
		5 \\ 0 \\ -3	
	\end{bmatrix}
	\,,
	x = \begin{bmatrix}
		13 \\ 1 \\ -15
	\end{bmatrix}
	\text{ and }
	\beta = \{ v_{1} \,, v_{2}\}
$$

> Show that $\beta$ is a basis for $H$ = Span$\{ v_{1} \,, v_{2} \}$

$\beta$ is a basis for $H$ because $v_{1}$ and $v_{2}$ are linearly independent

> Determine if $x$ is in $H$

Solve the linear system $\begin{bmatrix} v_{1} & v_{2} & x \end{bmatrix}$

$$
	\begin{bmatrix}
		2 & 5 & 13 \\
		-1 & 0 & 1 \\
		6 & -3 & 15
	\end{bmatrix}
	\to
	\begin{bmatrix}
		1 & 0 & -1 \\
		0 & 1 & 3 \\
		0 & 0 & 0
	\end{bmatrix}
$$

The system is consistent, thus $x$ is in the subspace $H$

> Find the coordinate vector of $x$

The coordinate vector of $x$ is $x_{[\beta]} = \begin{bmatrix} -1 \\ 3 \end{bmatrix}$ 