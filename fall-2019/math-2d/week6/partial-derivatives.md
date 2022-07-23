# Partial Derivatives

## Partial Derivatives of Functions of Two Variables

### Definition

Given $f(x, y)$, what is $f'(x, y)$?

If $z = f(x, y)$ is a function of two variables, its partial derivatives are also functions

$f_{x}$ and $f_{y}$ are defined as

- $f_{x}(x, y) = \lim_{h \to 0} \, \dfrac{f(x + h, y) - f(x, y)}{h}$
	- Other notations: $f_{1} ,\, Df_{1} ,\, D_{x}f ,\, \dfrac{\partial z}{\partial x} ,\, \dfrac{\partial f}{\partial x}$
- $f_{y}(x, y) = \lim_{h \to 0} \dfrac{f(x, y + h) - f(x, y)}{h}$
	- Other notations: $f_{2} ,\, Df_{2} ,\, D_{x}f ,\, \dfrac{\partial z}{\partial y} ,\, \dfrac{\partial f}{\partial x}$

Since there are infinitely many directions, we must find the derivative at a specified direction.

### Examples

#### Example 1

Let $f(x, y) = x^{3} - xy + y^{2}$

- $f_{x}(x, y) = 3x^{2} - y$
	- $f_{x}(1, 2) = 3(1)^{2} - 2 = 1$
- $f_{y}(x, y) = -x + 2y$
	- $f_{y}(2, 3) = -2 + 2(3) = 4$

#### Example 2

Let $f(x, y) = x^{2}e^{sin(y)}$

- $f_{x}(x, y) = 2xe^{sin(y)}$
- $f_{y} = x^{2}e^{sin(y)}cos(y)$

#### Example 3

Find $\dfrac{\partial z}{\partial y}$ and $\dfrac{\partial z}{\partial x}$ if $z$ is defined implicitly

$x^{3} + y^{3} + z^{3} + xyz = 1$ at $(0, 0, 1)$

- To find $\dfrac{\partial z}{\partial x}$, differentiate w.r.t x
	- $3x^{2} + 0 + 3z^{2}\dfrac{\partial z}{\partial x} + yz + xz\dfrac{\partial z}{\partial x} = 0$
	- $\dfrac{\partial z}{\partial x} = \dfrac{-3x^{2} + yz}{3z^{2} + xy}$
	- At $(0, 0, 1)$, $\dfrac{\partial z}{\partial x} = 0$
- To find $\dfrac{\partial z}{\partial y}$, differentiate w.r.t y
	- $0 + 3y^{2} + 3z^{2}\dfrac{\partial z}{\partial y} + xz + xy\dfrac{\partial z}{\partial y} = 0$
	- $\dfrac{\partial z}{\partial y} = \dfrac{-3y^{2} + xz}{3x^{2} + xy}$
	- At $(0, 0, 1)$, $\dfrac{\partial z}{\partial y}$ is undefined

### Theorem: Identical Partial Derivatives

If $f(x, y)$ is a two variable function, then $f_{x}$ and $f_{y}$ are two functions.

Consider their derivatives (the second partial derivative of $f$)

- $(f_{x})_{x}$
- $(f_{x})_{y}$
- $(f_{y})_{x}$
- $(f_{y})_y$

Statement: $(f_{y})_{x}$ and $(f_{x})_{y}$ are equal if $f_{xy}$ and $f_{yx}$ are both continuous on domain $D$

## Partial Derivatives of Functions of More Than Two Variables

$u = f(x_{1}, x_{2}, ..., x_{i})$

$\dfrac{\partial u}{\partial x_{i}} = \lim_{h \to 0} \, \dfrac{f(x_{1}, x_{2}, ..., x_{i} + h) - f(x_{1}, x_{2}, ..., x_{i})}{h}$

There are $u$ partial derivativess for a function of $n$ variables

### Example 4

Let $f(x, y, z) = sin(\dfrac{xy^{2}}{1 + z^{2}})$

This is a function of 3 variables, therefore it will have 3 partial derivatives

1. $\dfrac{\partial f}{\partial x} = cos(\dfrac{xy^{2}}{1 + z^{2}})(\dfrac{y^{2}}{1 + z^{2}})$
2. $\dfrac{\partial f}{\partial y} = cos(\dfrac{xy^{2}}{1 + z^{2}})(\dfrac{2xy}{1 + z^{2}})$
3. $\dfrac{\partial f}{\partial z} = cos(\dfrac{xy^{2}}{1 + z^{2}})(\dfrac{-2xy^{2}z}{1 + z^{2}})$
