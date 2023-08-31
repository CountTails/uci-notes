# Lecture 19

## The invertible theorem (p. 3)

18) The number $0$ is not an eigenvalue of $A$
19) The determinant of $A$ is not zero

## Properties of determinants

Let $A$ and $B$ be $n \times n$ matrices

- $A$ is invertible if and only if $det(A) \ne 0$
- $det(AB) = (det(A))(det(B)) = det(BA)$
- $det(A^{T}) = det(A)$
- If $A$ is triangular, the $det(A)$ is the product of the entries on the main diagonal of $A$
- A row replacement operation on $A$ does not change the determinant. A row interchange changes the sign of the determinant. A row scaling also scales the determinant by the same scale factor

## Characteristic equation

The scalar equation $det(A - \lambda I) = 0$ is called the **characteristic equation** of $A$

A scalar $\lambda$ is an eigenvalue of an $n \times n$ matrix if and only if $\lambda$ satisfies the characteristics equation 

### Example 1

Find the characteristic equation of 

$$
	A = \begin{bmatrix}
		2 & -1 & 5 & 0 \\
		0 & -1 & 5 & 2 \\
		0 & 0 & 5 & 0 \\
		0 & 0 & 0 & 2
	\end{bmatrix}
$$

$$
	det(A - \lambda I) = \begin{bmatrix}
		2 - \lambda & -1 & 5 & 0 \\
		0 & -1 - \lambda & 5 & 2 \\
		0 & 0 & 5 - \lambda & 0 \\
		0 & 0 & 0 & 2 - \lambda
	\end{bmatrix}
$$

The characteristic equation is 

$$
	(2 - \lambda)^{2}(-1 - \lambda)(5 - \lambda) = 0
$$

## Characteristic polynomial

In general, if $A$ is an $n \times n$ matrix, then $det(A - \lambda I)$ is a polynomial of degree $n$ called the **characteristic polynomial** of $A$

The eigenvalue $2$ in the previous example has multiplicity $2$ because $(2 - \lambda)$ occurs twice as a factor of the characteristic polynomial

In general, the **(algebraic) multiplicity** of an eigenvalue $\lambda$ is its multiplicity as a root of the characteristic equation

### Example 2

The characteristic polynomial of a $4 \times 4$ matrix is $\lambda^{4} -6\lambda^{3} + 9\lambda^{2}$. Find the eigenvalues and their multiplicities

$$
	\lambda^{4} -6\lambda^{3} + 9\lambda^{2} = \lambda^{2}(\lambda - 3)^{2}
$$

- $0$ with multiplicity $2$
- $3$ with multiplicity $2$

Because the characteristic polynomial for an $n \times n$ matrix involves an $n$th degree polynomial, there are exactly $n$ roots, counting multiplicities, provided complex roots are allowed as well

Complex roots result in complex eigenvalues, which won't be discussed in this course. 

### Example 3

Find the characteristic equation of 

$$
	A = \begin{bmatrix}
		-5 & -2 & -1 \\
		0 & 1 & 0 \\
		1 & 7 & -3
	\end{bmatrix}
$$

Then find the eigenvalues of $A$ and their multiplicities

$$
	det(A - \lambda I) = \begin{bmatrix}
		-5 - \lambda & -2 & -1 \\
		0 & 1 - \lambda & 0 \\
		1 & 7 & -3 - \lambda
	\end{bmatrix}
$$

$$
	= (1 - \lambda) \begin{bmatrix}
		-5 - \lambda & -1 \\
		1 & -3 - \lambda
	\end{bmatrix}
$$

$$
	(1 - \lambda)[(-5 - \lambda)(-3 - \lambda) + 1] 
	= (1 - \lambda)(\lambda + 4)^{2}
$$

The eigenvalues are

- $1$ with multiplicity of $1$
- $-4$ with multiplicity of $2$

## Similarity

If $A$ and $B$ are $n \times n$ matrices, then $A$ is **similar** to $B$ if there is an invertible matrix $P$ such that $P^{-1}AP = B$, or equivalently, $A = PBP^{-1}$

Writing $Q$ for $P^{-1}$, we have $Q^{-1}BQ = A$. So $B$ is also similar to $A$

We say that $A$ and $B$ are **similar**

Changing $A$ into $P^{-1}AP$ is called a **similarity transformation**

> If $n \times n$ matrices $A$ and $B$ are similar. then they have the same characteristic polynomial and hence the same eigenvalues (witht the same multiplicities)

### Notes of similarity

- Two matrices can be not similar but have the same eigenvalues
- Similarity is not the same as row equivalence. Row operations on a matrix usually change its eigenvalues