# The Chain Rule

## 1 Dimension Chain Rule

Let $y = f(x)$ and $x = g(t)$

We can define $y$ as the composite function $y = f(g(t))$

The derivative can be determined using the chain rule as follows: 

- $f'(g(t)) * g'(t)$
- $\dfrac{dy}{dt} = \dfrac{dy}{dx} * \dfrac{dx}{dt}$

## 2 Dimension Chain Rule 

### Case 1

Let $z = f(x, y)$ be a differentiable function where $x = g(t)$ and $y = h(t)$ adn $x$ and $y$ are differentiable. Then $z$ is a differentiable function of $t$

$\dfrac{dz}{dt} = \dfrac{\partial f}{\partial x} * \dfrac{dx}{dt} + \dfrac{\partial f}{\partial y} * \dfrac{dy}{dt}$

### Case 2

Let $z = f(x, y)$ be a differentiable function where $x = g(s, t)$ and $y = h(s, t)$ are differentiable functions

$\dfrac{\partial z}{\partial s} = \dfrac{\partial z}{\partial x} * \dfrac{\partial x}{\partial s} + \dfrac{\partial z}{\partial y} * \dfrac{\partial y}{\partial s}$

$\dfrac{\partial z}{\partial t} = \dfrac{\partial z}{\partial x} * \dfrac{\partial x}{\partial t} + \dfrac{\partial z}{\partial y} * \dfrac{\partial y}{\partial t}$

## Chain rule in higher dimensions

Let $f$ be a differentiable function of $n$ variables and $x_{i}$ is a differentiable function of $m$ variables

Then $f$ is a function of $t_{1}, t_{2}, ..., t_{m}$

$\dfrac{\partial f}{\partial t_{i}} = \dfrac{\partial f}{\partial x_{1}} * \dfrac{\partial x_{1}}{\partial t_{i}} + \dfrac{\partial f}{\partial x_{2}} * \dfrac{\partial x_{2}}{\partial t_{i}} + ... + \dfrac{\partial f}{\partial x_{n}} * \dfrac{\partial x_{n}}{\partial t_{i}}$

## Chain rule in implicit differentiation

If $z = f(x, y)$ is given implicitly by $F(x, y, z) = 0$, $F(x, y, f(x, y)) = 0$

If $F$ and $f$ are differentiable, then $\dfrac{\partial F}{\partial x} + \dfrac{\partial F}{\partial z} * \dfrac{\partial z}{\partial x} = 0$

$\dfrac{\partial z}{\partial x} = \dfrac{-\partial F / \partial x}{\partial F / \partial z}$

$\dfrac{\partial z}{\partial y} = \dfrac{- \partial F / \partial y}{\partial F / \partial z}$

## Examples

### Example 1

$f(x, y) = x^{2}y + y^{2}x$

Let $x = sin(t)$ and $y = cos(t)$

This is a case 1 chain rule

$\dfrac{dz}{dt} = (2xy + y^{2})(cos(t)) + (x^{2} + 2yx)(-sin(t))$

If $t = 0$, $y = 0$, and $x = 1$, then $\dfrac{dz}{dt} = (1)(1) + 0 = 1$

### Example 2

Let $z = xe^{y}$ where $x = st$ and $y = 2s + 3t$

$\dfrac{\partial z}{\partial s} = e^{x}t + xe^{y}z$

$\dfrac{\partial z}{\partial t} = e^{y}s + 3xe^{y}$

If $s = 1$, $t = 2$, $x = 2$, and $y = 8$

$\dfrac{\partial z}{\partial s} = 2e^{8} + 4e^{8} = 6e^{8}$

$\dfrac{\partial z}{\partial t} = e^{8} + 6e^{8} = 7e^{8}$


### Example 3

$f(x, y, z) = x^{2}y + y^{2}x$

- $x = rse^{t}$
- $y = r^{2}st$
- $z = rs(sin(t))$

$\dfrac{\partial f}{\partial s} = (2xy)(re^{t}) + (x^{2} + 2yz)(r^{2}t) + (y^{2})(rsin(t))$

If $x = 2e^{\pi}$, $y = 4\pi$, and $z = 0$, then $\dfrac{\partial f}{\partial s} = 48\pi e^{2\pi}$

### Example 4

$x^{2} + y^{2} + z^{2} + xyz = 4$

$\dfrac{\partial z}{\partial x} = \dfrac{-2x + yz}{2z + xy}$

$\dfrac{\partial z}{\partial x} \, \vert_{(x, y, z) = (1, 1, 1)} = -1$

$\dfrac{\partial z}{\partial y} = \dfrac{2y + xz}{2x + xy}$

$\dfrac{\partial z}{\partial x} \, \vert_{(x, y, z) = (1, 1, 1)} = -1$
