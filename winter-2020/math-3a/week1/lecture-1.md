# Lecture 1

## Systems of linear equations

### Definitions

A **linear equation** of the variables $x_{1}, ..., x_{n}$ is an equation that can be written in the form: 

$$
a_{1}x_{n} + a_{2}x_{2} + ... + a_{n}x_{n} = b
$$

where $b$ and the **coefficients** $a_{1}, ..., a_{n}$ are real or complex numbers

A **system of linear equations** is a collection of one or more linear equations involving the same variables

A **solution** of the system is a list $(s_{1}, ..., s_{n})$ of numbers that makes each equation a true statement

The set of all solutions is called the **solution set** of the linear system

Two linear systems are **equivalent** if they share the same solution set

A system of linear equations hase 

1) no solution
2) exactly one solution
3) infinitely many solution

A linear system with at least one solution is **consistent** and is **inconsistent** if a linear system has no solution

### Examples

$$
System =\begin{cases}
3x_{1} - x_{2} = 7 \\
2x_{1} + 3x_{2} = 1
\end{cases}
$$

This system has one solution $(2, -1)$, where the two lines intersect

$$
System = \begin{cases}
x_{1} - x_{2} = 3 \\
-2x_{1} + 2x_{2} = 1
\end{cases}
$$

This system has no solutions

$$
System = \begin{cases}
3x_{1} + 5x_{2} = -1 \\
-15x_{1} - 25x_{2} = 5
\end{cases}
$$

This system has infinitely many solutions

## Matrix notation

### Definitions

A **coefficient matrix** contains the coefficients of each variable aligned in columns

A **augmented matrix** includes the constants on the right side to the last colum of a coefficient matrix

The **size** of a matrix tells how many rows and columns it has (rows x columns)

### Examples

Consider the following system

$$
\begin{cases}
x_{1} - 2x_{2} + 3x_{3} = 7 \\
2x_{1} + x_{2} + x_{3} = 4 \\
-3x_{1} + 2x_{2} - 2x_{3} = -10
\end{cases}
$$

The coefficient matrix would be

$$
\begin{bmatrix}
1 & -2 & 3 \\
2 & 1 & 1 \\
-3 & 2 & -2
\end{bmatrix}
$$

The augmented matrix would be

$$
\begin{bmatrix}
1 & -2 & 3 & 7\\
2 & 1 & 1 & 4\\
-3 & 2 & -2 & -10
\end{bmatrix}
$$

## Solving a linear system

To solve a linear system, use **elementary row operations**

1) *Replacement*: replace one row by the sum of itself and a multiple of another row
2) *Interchange*: interchange two rows
3) *Scaling*: multiply all entries in a row by a non-zero constant

Two matrices are called **row equivalent** if there is a sequence of elementary row operations that transform one matrix into the other

>Theorem 1
>If the augmented matrices of two linear systems are row equivalent, then the two systems have the same solution set
