# Tangent Planes and Linear Approximations

## Tangent Planes

### Definition

- Let $z = f(x, y)$ have a graph $S$
- Let $P$ be a point on $S$
	- $P(a, b, f(a, b))$
- $C_{1}$ is the intersection of $S$ and the plane $y = b$
- $C_{2}$ is the intersection of $S$ and the plane $x = a$
- $T_{1}$ is the tangent line of $C_{1}$ has the slope $m = f_{x}(a, b)$
- $T_{2}$ is the tangent line of $C_{2}$ has the slope $m = f_{y}(a, b)$
- The tangent plane to $S$ at $P$ is the plane containing $T_{1}$ and $T_{2}$
- Equations of a tangent plane at $(a, b, f(a, b))$
	- $A(x - a) + B(y - b) + C(z - f(a, b)) = 0$
	- $z = f(a, b) - \dfrac{A}{C}(x - a) - \dfrac{B}{C}(y - b)$
	- $z = f(a, b) + f_{x}(a, b)(x - a) + f_{y}(a, b)(y - b)$
	- $f$ must havve continuous partial derivatives
- Intersection with the plane $y = b$
	- $z = f(a, b) - \dfrac{A}{C}(x - a)$
	- $f_{x}(a, b) = \dfrac{-A}{C}$
- Intersection with the plane $x = a$
	- $z = f(a, b) - \dfrac{B}{C}(y - b)$
	- $f_{y}(a, b) = \dfrac{-B}{C}$

### Examples

#### Example 1

Find the tangent plane at $(1, 2, 3)$ if $z = x^{2} + y^{2} - y$

$\dfrac{\partial z}{\partial x} = 2x \to \dfrac{\partial (3)}{\partial (1)} = 2$

$\dfrac{\partial z}{\partial y} = 2y - 1 \to \dfrac{\partial (3)}{\partial (2)} = 3$

Tangent plane: $z - 3 = 2(x - 1) + 3(y -2)$

## Linear Approximations

### Definition

$L(x, y) \approx f(a, b) + f_{x}(a, b)(x - a) + f_{y}(a, b)(y - b)$

$L(x, y)$ is the linearization of $f(x, y)$ at $(a, b$)

$L(x, y) \approx f(x, y)$ only if $f_{x}(x, y)$ and $f_{y}(x, y)$ are continuous

If $f_{x}(x, y)$ and $f_{y}(x, y)$ are not continuous, the approximation may not be good.

### Examples

#### Example 2

Approximate $f(1.01, 1.99)$ where $f$ is the function from example 1

$f(1.01, 1.99) \approx 3 + 2(1.01 - 1) + 3(1.99 - 2) \approx 2.99$

$f(1.01, 1.99) = 2.9902$

#### Example 3

$f(x, y) = \begin{cases} \dfrac{xy}{x^{2} + y^{2}} \, \text{, if } (x, y) \ne (0, 0) \\ 0 \, \text{, if } (x, y) = (0, 0) \end{cases}$

$f_{x}(x, y) = \dfrac{y^{3} - x^{2}y}{(x^{2} + y^{2})^{2}}$

$f_{y}(x, y) = \dfrac{x^{3} - xy^{2}}{(x^{2} + y^{2})^{2}}$

The tangent plane of $f$ at $(0, 0)$ is $z = 0$

This is not a good approximation because $f(x, y) = f(x, x) = \dfrac{1}{2}$ along the line $y = x$

A function of two variables can behave badly even though both partial derivatives exists

## Differentials

### Definition

- $\Delta x$ : increment of x
- $\Delta y$ : increment of y
- $\Delta z$ : increment of z = $f(x + \Delta x, y + \Delta) - f(x, y)$

If $z = f(x, y)$, then $f$ is differentiable at $(x_{0}, y_{0})$

If $\Delta z = f_{x}(x_{0}, y_{0})\Delta x + f_{y}(x_{0}, y_{0})\Delta y + \epsilon_{1}\Delta x + \epsilon_{2}\Delta y$

$(\epsilon_{1}, \epsilon_{2}) \to (0, 0)$ as $(\Delta x, \Delta y) \to (0, 0)$

#### Theorem #1

> If the partial derivatives both exists near $f(a, b)$ and are continuous at $(a, b)$, then $f(x, y)$ is differentiable at $(a, b)$.
> A differentiable function can be approximated by a tangent plane.


#### 1 Dimension Differentials

If $y = f(x)$

The differential is $dy = f'(x) \, dx$

$dx$ is an independent variable

#### 2 Dimension Differentials

If $z = f(x, y)$

The differential is $dz = f_{x}(x, y) \, dx + f_{y}(x, y) \, dy$

$dx$ and $dy$ are independent variables

### Examples

#### Example 4

$f(x, y) = xe^{xy}$ is differentiable at $(1, 0)$

$f_{x}(x, y) = e^{xy} + xye^{xy}$

$f_{y}(x, y) = x^{2}e^{xy}$

$f_{x}$ and $f_{y}$ are both differentiable. By **Theorem #1**, $f$ is differentiable

Tangent Plane: $z = x + y$

$f(1.01, -0.01) = (1.01)e^{(1.01)(-0.01)} \approx 1$

#### Example 5

$z = f(x, y) = x^{2} + y^{2} - y$

$f_{x}(x, y) = 2x$

$f_{y}(x, y) = 2y - 1$

So, $dz = 2x \, dx + (2y - 1) \, dy$

If $x = 1 \to 1.01$, then $dx = 0.01$

If $y = 2 \to 1.99$, then $dy = -0.01$

Thus, $dz = 2(0.01) + 3(-0.01) = -0.01$ and $\Delta z = -0.0098$
