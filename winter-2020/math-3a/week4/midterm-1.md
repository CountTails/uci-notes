# Midterm 1 Review

## Linear equation and linear systems

A linear equation is written as $a_{1}x_{1} + a_{2}x_{2} + ... + a_{n}x_{n} = b$ where

- $\{a_{1} ... a_{n}\}$ are coefficients
- $\{x_{1} ... x_{n}\}$ are variables
- and $b$ is a constant

A system of linear equations is a collection of linear equations

A system of linear equations has a solution set which is the set of all possible solutions

Two linear systems are equivalent if they have the same solution set

A linear system can have a 

- Unique solution
- Infinitely many solutions
- No solution

A linear system is called consistent if it has at least one solution and inconsistent if it has no solutions

## Matrix notation for linear systems

For the system:

$$
	\begin{cases}
		x_{1} - 2x_{2} + 3x_{3} = 7 \\
		2x_{1} + x_{2} + x_{3} = 4 \\
		-3x_{1} + 2x_{2} -2x_{3} = 10
	\end{cases}
$$

Has the coefficient matrix

$$
	\begin{bmatrix}
		1 & -2 & 3 \\
		2 & 1 & 1 \\
		-3 & 2 & -2
	\end{bmatrix}
$$

And augmented matrix

$$
	\begin{bmatrix}
		1 & -2 & 3 & 7 \\
		2 & 1 & 1 & 4 \\
		-3 & 2 & -2 & 10
	\end{bmatrix}
$$

## Elementary row operations

The elementary row operations used to reduce matrices are

- Replacement: replace one row by the sum of itself and a multiple of another
- Interchange: switch the positions of two rows
- Scale: multiply all entries in a row by a nonzero constant

Using elementary row operation does not change the solution set of the linear system it describes

Two matrices are row equivalent if row operations connect the two

Two matrices have the same solution set if the are row equivalent

## Echelon forms

A matrix is in echelon form if

- All zero rows are at the bottom
- The leading entry of each row has a 0 underneath
- All entries below a leading entry are 0

A matrix is in reduced echelon form if

- Each row has a leading entry of 1
- Each leading entry is the only nonzero term in its column

Each matrix is row equivalent to one and only one reduced echelon form

## Row reduction algorithm

All matrices can be reduced to echelon or reduced echelon form by doing the following

1. Begin with the leftmost nonzero column. (If it's not at the top, move it there with an interchange)
2. Use replacement operations to make all entries below zeros    
3. Repeat until there are no more nonzero entries to modify

To get to reduced echelon form

1. Repeat the algorithm in the reverse direction starting at the bottom
2. Scale each leading entry to be 1

## Pivots and solutions to linear systems

A leading coefficient is known as a pivot position

A column that has a pivot position is called a pivot column

A pivot column corresponds to basic variables

A column without a pivot corresponds to a free variable

Solve for the basic variables in terms of the free variables

A linear system has

- A unique solution if it has no free variables    
- Infinitely many solutions if there is at least one free variable

No solution if a row like $\begin{bmatrix} 0 & ... & 0 & b \end{bmatrix}$ with $b \ne 0$ exists in the system

## Linear combinations

 $y = c_{1}x_{1} + c_{1}x_{2} + ... + c_{p}x_{p}$ is called a linear combination of c and x where $\{c_{1},c_{2},...c_{p}\}$ are the weights

$b$ can be written as a linear combination $b = c_{1}a_{1} + c_{1}a_{2} + ... + c_{p}a_{p}$ if there are $\{c_{1},c_{2},...c_{p}\}$ that satisfy the equation

A vector equation $b = c_{1}a_{1} + c_{1}a_{2} + ... + c_{p}a_{p}$ is identical to solving $\begin{bmatrix} a_{1} & a_{2} & ... & a_{p} \end{bmatrix}$ and therefore has the same solution set

$b$ is a linear combination of $\begin{bmatrix} a_{1} & a_{2} & ... & a_{p} \end{bmatrix}$ if and only if there exists a solution to the linear system corresponding to its augmented matrix

## Span

If $v_{1}, v_{2}, ..., v_{p}$ are in $\mathbb{R}^{n}$, the set of all linear combinations of $v_{1}, v_{2}, ..., v_{p}$ is denoted by $span\{ v_{1}, v_{2}, ..., v_{p} \}$ and is called the subset of $\mathbb{R}^{n}$ spanned by $v_{1}, v_{2}, ..., v_{p}$

If $b = c_{1}a_{1} + c_{1}a_{2} + ... + c_{p}a_{p}$ is true, the b is in the $span\{  a_{1}, a_{2}, ..., a_{p}\}$

## The matrix equation $A\overrightarrow{x} = \overrightarrow{b}$

If $A$ is a $m \times n$ matrix and $x$ is in $\mathbb{R}^{n}$, then the product of A and x is a linear combination of the columns of A using corresponding entries in x as the weights

$$
	\begin{bmatrix}
		a_{1} & a_{2} & ... & a_{n}
	\end{bmatrix}
	\begin{bmatrix}
		x_{1} \\ x_{2} \\ ... \\ x_{n}
	\end{bmatrix} = 
	x_{1}a_{1} + x_{2}a_{2} + ... + x_{n}a_{n}
$$

Matrix-Vector multiplication is defined as long as the # columns in the matrix is equal to # entries in the column vector

Matrix-Vector multiplication can be calculated quickly using the notation of dot products

$$
	\begin{bmatrix}
		a_{1} & a_{2} & ... & a_{n}
	\end{bmatrix}
	\begin{bmatrix}
		b_{1} \\ b_{2} \\ ... \\ b_{m}
	\end{bmatrix} =
	\begin{bmatrix}
		a_{11}b_{1} + a_{21}b_{2} + ... + a+{n1}b_{m} \\
		a_{12}b_{1} + a_{22}b_{2} + ... + a+{n2}b_{m} \\
		... \\
		a_{1m}b_{1} + a_{2m}b_{2} + ... + a+{nm}b_{m} 
	\end{bmatrix}
$$

If matrix $A$ is an $m \times n$ matrix with columns $a_{1}, ..., a_{n}$ and if $\overrightarrow{b}$ is in $\mathbb{R}^{m}$, the matrix equation $A\overrightarrow{x} = \overrightarrow{b}$ has the same solution set as $x_{1}a_{1} + x_{2}a_{2} + ... + x_{n}a_{n} = b$ which also has the same solution set as the augmented matrix 
$$
	\begin{bmatrix} a_{1} & a_{2} & ... & a_{n} & b \end{bmatrix}
$$

$A\overrightarrow{x} = \overrightarrow{b}$ has a solution if and only if b is a linear combination of the columns of A

The same as asking "Is b in the span of $\{a_{1},...,a_{n}\}$?"

The following statements are logically equivalent. That is they are all true or none are true

- For each b  in $\mathbb{R}^{m}$, then $A\overrightarrow{x} = \overrightarrow{b}$ is consistent    
- Each b in $\mathbb{R}^{m}$ is a linear combination of columns of A
- The columns of A span $\mathbb{R}^{m}$
- A has a pivot position in every row 
	- A is a coefficient matrix

## Homogenous systems

A system is homogeneous if it can be written as $A\overrightarrow{x} = \overrightarrow{0}$ as shown: 

$$
		\begin{bmatrix} a_{1} & a_{2} & ... & a_{n} & 0 \end{bmatrix}
$$

A homogeneous system is always consistent when $\overrightarrow{x} = \overrightarrow{0}$. This is known as the trivial solution

There exist a nontrivial solution to a homogeneous system if there is at least one free variable

If there are no free variables, the unique solution is the trivial solution

## Parametrix vector forms

Parametric Vector Form: 

$$
	\overrightarrow{x} = 
	\begin{bmatrix}
		x_{1}(x_{free}) \\
		x_{2}(x_{free}) \\
		... \\
		x_{n}(x_{free})
	\end{bmatrix}
$$

If $A\overrightarrow{x} = \overrightarrow{b}$ is consistent with solution p. Then $A\overrightarrow{x} = \overrightarrow{b}$ has a solution set $w = p + v_{h}$ where $v_{h}$ is the solution to $A\overrightarrow{x} = \overrightarrow{0}$.

If $A\overrightarrow{x} = \overrightarrow{0}$ has only the trivial solution then $A\overrightarrow{x} = \overrightarrow{b}$ has a unique solution $p$

If $A\overrightarrow{x} = \overrightarrow{b}$ has a unique solution for some $b$ then $A\overrightarrow{x} = \overrightarrow{0}$ has only the trivial solution

## Applications of linear systems

Economics

- Construct a table of sector input = output(divided amongst sectors)  
- Construct a homogeneous system to represent the economy  
- Solve with row reduction  

Balancing Chemical Equations

- Construct vector to represent each element that exists in equation  
- Construct a system by counting elements in reactants and products   
- Create a homogeneous system and solve by row reduction  
- There should one free variable  
- Choose the smallest integer value that will yield positive integers for all unknowns  

Network Flow

- Construct a table to track flow in and out of each point  
- Set up a linear system  and solve by row reduction  

## Linear independence

An Indexed set of vectors is linearly independent if $x_{1}v_{1} + x_{2}v_{2} + ... + x_{p}v_{p} = 0$ has only the trivial solution

An Indexed set of vectors is linearly dependent if $x_{1}v_{1} + x_{2}v_{2} + ... + x_{p}v_{p} = 0$ has a nontrivial solution

Dependence relations come from one nontrivial solution

Suppose $A$ is a coefficient matrix. $A$ is linearly independent if and only if $A\overrightarrow{x} = \overrightarrow{0}$ has only the trivial solution

The columns of $A$ are linearly independent if there is no free variables/a unique solution that is the trivial solution

Set of one vector $\{v\}$ is linearly independent if and only if v is not the zero vector

Set of two vectors $\{v1,v2\}$ is linearly independent if and only if $v_{1} \ne cv_{2}$

An indexed set of two or more vectors is linearly dependent if at least one vector in the set is a linear combination of the rest. *This does not imply that all vectors in the set are linear combinations of the rest*

If a set of vectors contains more vectors than each vector has entries, then it is linearly dependent

If # rows < # columns, the matrix is linearly dependent

*Nothing can be determined if  # rows > # columns*

If a set of vectors contains the zero vector, then the set is linearly dependent

## Linear transformations

A transformation of T from $\mathbb{R}^{n}$ to $\mathbb{R}^{m}$ is a rule that assigns each vector $\overrightarrow{x}$ in $\mathbb{R}^{n}$ to a vector $T(\overrightarrow{x})$ in $\mathbb{R}^{m}$

The set $\mathbb{R}^{n}$ is the domain of T

The set $\mathbb{R}^{m}$ is the codomain of T

For each $\overrightarrow{x}$ in $\mathbb{R}^{n}$,  the vector $T(\overrightarrow{x})$ in $\mathbb{R}^{m}$ is the image of $\overrightarrow{x}$

The set of all images is the range of $T(\overrightarrow{x})$

The domain of T is $\mathbb{R}^{n}$ (number of columns in A)

The codomain of T is $\mathbb{R}^{m}$ (number of rows in A)

The range of T is the set of all linear combinations of the columns of $A$ or the span of $A$

A transformation is linear if 

- $T(u+v)=T(u)+T(v)$ for all vectors u and v in the domain of T
- $T(cu)=cT(u)$ for all scalars c and vectors u in the domain of T
- Every matrix transformation is a linear transformation

If T is a linear transformation
- $T(0)=0$ (The origin stays fixed)
- $T(cu+dv)=cT(u)+dT(v)$ for all scalars c, d and all vectors u, v

## The matrix of linear transformations

Let T from $\mathbb{R}^{n}$ to $\mathbb{R}^{m}$ be a linear transformation

- A unique matrix A exists such that $T(x) = Ax$ for all $x$ in $\mathbb{R}^{m}$
- A=$\begin{bmatrix} T(e_{1}) & ... & T(e_{n}) \end{bmatrix}$

A is called the standard matrix for the linear transformation 

Given T from $\mathbb{R}^{n}$ to $\mathbb{R}^{m}$ be a linear transformation:

- The dimensions of the standard matrix will be m by n
- (swap the domain and codomain)

A transformation T is said to be "onto $\mathbb{R}^{m}$"

- if each b in $\mathbb{R}^{m}$ is the image of at least one x in $\mathbb{R}^{n}$
- (The range and codomain of T  are the same)

A transformation T  is not "onto $\mathbb{R}^{m}$" 

- when there is some b in $\mathbb{R}^{m}$ such that T(x) = b has no solution

A transformation T is "one-to-one" 

- if each b in $\mathbb{R}^{m}$ is the image of at most one x in $\mathbb{R}^{n}$
- T(x) = b has either a unique solution or none at all

A transformation T is not "one-to-one"

- if some b in $\mathbb{R}^{m}$ is the image of more than one vector in $\mathbb{R}^{n}$

Let T from $\mathbb{R}^{n}$ to $\mathbb{R}^{m}$ be a linear transformation. T is "one-to-one" if and only if T(x) = 0 has only the trivial solution

Let T from $\mathbb{R}^{n}$ to $\mathbb{R}^{m}$ be a linear transformation, and let A be the standard matrix for T.

- T maps $\mathbb{R}^{n}$ onto $\mathbb{R}^{m}$ if and only if the columns of A span $\mathbb{R}^{m}$
- T is "one-to-one" if and only if the columns of A are linearly independent