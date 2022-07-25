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

## Differentials