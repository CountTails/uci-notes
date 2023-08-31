# Lagrange Multipliers

## Problem

How to find extreme values of a function subject to a constraint?

- $w = f(x, y, z)$
- constraint: $g(x, y, z) = k$

## Methods

### One Constraint

To find the extreme values of $f(x, y, z)$ subject to constriant $g(x, y, z) = k$, assuming the extreme values exists and $\triangledown g(x, y, z) \ne 0$ on $g$

1. Find all values $x, y, z,$ and $\lambda$ such that
	- $\triangledown f(x, y, z) = \lambda \, \triangledown g(x, y, z)$
	- where $g(x, y, z) = k$
2. Evaluate $f$ at all points $(x, y, z)$ that
	- result from step 1
	- The largest is the max
	- The smallest is the min

### Proof

Let $C$ be a curve on $g$ that passes through the extreme point$P(x_{0}, y_{0}, z_{0})$

Equation of $C$ is $\overrightarrow{r}(t) = \begin{bmatrix} x(t) \\ y(t) \\ z(t) \end{bmatrix}$

$h(t) = f(\overrightarrow{r}(t)) = f(x(t), y(t), z(t))$

Assume that $\overrightarrow{r}(t_{0}) = P(x_{0}, y_{0}, z_{0})$

$h(t)$ has an extreme values at $t_{0}$
$h'(t_{0}) = 0 \to h'(t_{0}) = f_{x}(x_{0}, y_{0}, z_{0}) x'(t) + f_{y}(x_{0}, y_{0}, z_{0}) y'(t) + f_{z}(x_{0}, y_{0}, z_{0}) z'(t)$
$0 = \begin{bmatrix} f_{x} \\ f_{y} \\ f_{z} \end{bmatrix} \cdot \begin{bmatrix} x'(t) \\ y'(t) \\ z'(t) \end{bmatrix}$

$\triangledown f(x_{0}, y_{0}, z_{0})$ is normal to $\overrightarrow{r'}(t)$ because $\overrightarrow{r'}(t)$ is arbitrary $\triangledown f$ is normal to $g$

$\triangledown g$ is normal to $g$, so $\triangledown f$ is parallel $\triangledown g$

$\therefore \triangledown f = \lambda \triangledown g$

### Two Constraints

To find the extreme values of $f(x, y, z)$ subject to constraints $g(x, y, z) = k$ and $h(x, y, z) = c$, assuming the extreme values exists and $\triangledown g(x, y, z) \ne 0$ on $g$ and $\triangledown h(x, y, z) \ne 0$ on $h$

1. Find all values $x, y, z, \lambda$, and $\mu$ such that
	- $\triangledown f(x, y, z) = \lambda \triangledown g(x, y, z) + \mu \triangledown h(x, y, z)$
	- where $g(x, y, z) = 0$ and $h(x, y, z) = c$
2. Evaluate $f$ at all points $(x, y, z)$ that 	
	- result from step 1
	- The largest is the max
	- The smallest is the min

## Examples

### Example 1

A rectangular box without a lid is made of $12m^{2}$ of cardboard. Find the maximum volume.

Boundary: Surface Area $= 12m^{2}$

$g(x, y, z) = 2xz + 2yz + xy = 12$

Volume: $f(x, y, z) = xyz$

$\triangledown f(x, y, z) = \lambda \triangledown g(x, y, z)$

- $\triangledown f = \begin{bmatrix} yz \\ xz \\ xy \end{bmatrix}$
- $\triangledown g = \begin{bmatrix} 2x + y \\ 2z + x \\ 2x + 2y \end{bmatrix}$

$\lambda$ is called the lagrange multiplier

- $yz = \lambda(2z + y) \to x(yx = \lambda(2z + y))$
- $xz = \lambda(2z + x) \to y(xz = \lambda(2z + x))$
- $xy = \lambda(2x + 2y) \to z(xy = \lambda(2x + 2y))$
- $2xz + 2yz + xy = 12$

Solve the system of equations

- $\lambda(2xz + xy) = \lambda(2zy + xy)$
	- $x = y$
- $\lambda(2yz + yz) = \lambda(2xz + 2yz)$
	- $y = 2z$
- $2xz + 2yz + xy = 12$
	- $2yz + 2yz + y^{2} = 12$
	- $4z^{2} + 4z^{2} + 4z^{2} = 12$
	- $z^{2} = 1 \to z = 1$
		- $z = 1$
		- $y = 2(1) = 2$
		- $x = (2) = 2$

$f(2, 2, 1)$ is the max volume

### Example 2

Find the max value $f(x, y, z) = 2x + y - z$ on the intersection $x + y - z = 1$ and the cylinder $x^{2} + y^{2} = 1$

Solve

- $\triangledown f(x, y, z) = \begin{bmatrix} 2 \\ 1 \\ -1 \end{bmatrix}$
- $\triangledown g(x, y, z) = \begin{bmatrix} 1 \\ 1 \\ -1 \end{bmatrix}$
- $\triangledown h(x, y, z) = \begin{bmatrix} 2x \\ 2y \\ 0 \end{bmatrix}$

Creates the following system of equations

- $2 = \lambda + 2\mu x$
- $1 = \lambda + 2\mu y$
- $-1 = -\lambda$
- $x + y - z = 1$
- $x^{2} + y^{2} = 1$

Solving the system of equations

- Equations (1) and (2)
	- $2 = 1 + 2\mu x \to x = \dfrac{1}{2\mu}$
	- $1 = 1 + 2\mu y \to y = 0$
- Equation (3)
	- $-1 = -\lambda \to \lambda = 1$
- Equation (5)
	- $x^{2} + 0 = 1 \to \dfrac{1}{4\mu^{2}} \to \mu = \pm \dfrac{1}{2}$
- if $\mu = \dfrac{1}{2}$
	- $(x, y, z) = (1, 0, 0)$
- if $\mu = \dfrac{1}{2}$
	- $(x, y, z) = (-1, 0, -2)$

For $(1, 0, 0) \to f(1, 0, 0) = 2$ (max)

For $(-1, 0, -2) \to f(-1, 0, -2) = 0$ (min)