# Directional Derivatives and Gradient Vectors

## Directional Derivatives

### Definition

Let $z = f(x, y)$

- $f_{x}(x_{0}, y_{0}) = \lim_{h \to 0} \dfrac{f(x_{0} + h, y_{0}) - f(x_{0}, y_{0})}{h}$ is the rate of change in direction of the x-axis ($\overrightarrow{i}$)
- $f_{y}(x_{0}, y_{0}) = \lim_{h \to 0} \dfrac{f(x_{0}, y_{0} + h) - f(x_{0}, y_{0})}{h}$ is the rate of change in direction of the y-axis ($\overrightarrow{j}$)

Q: Can we obtain the rate of change in any arbitrary direction?

Let $z = f(x, y)$ with surface $S$

- $P(x_{0}, y_{0}, z_{0})$ is a point on surface $S$
- $P'(x_{0}, y_{0}, 0)$ and $Q'(x, y, 0)$
- $\overrightarrow{P'Q'} = h\overrightarrow{u} = \begin{bmatrix} ha \\ hb \end{bmatrix}$
	- $ha = x - x_{0}$
	- $hb = y - y_{0}$
	- $\dfrac{\Delta z}{h} = \dfrac{z - z_{0}}{h}$
- $\to \, \dfrac{f(x_{0} + ha, y_{0} + hb) - f(x_{0}, y_{0})}{h}$

The directional derivative of $f$ at $(x_{0}, y_{0})$ in the direction $\overrightarrow{u}$ is denoted by:

$D_{\overrightarrow{u}} \, f(x_{0}, y_{0}) = \lim_{h \to 0} \, \dfrac{f(x_{0} + ha, y_{0} + hb) - f(x_{0}, y_{0})}{h}$

- If the limit exists, $D_{\overrightarrow{u}}$ is the directional derivative in the direction of $\overrightarrow{u}$
- If the limit does not exists, there is no directional derivative

#### Theorem 1

> If $f$ is a differentiable function and $x$ and $y$, then $f$ has a directional derivative in the direction of the unit vector $\overrightarrow{u} = \begin{bmatrix} a \\ b \end{bmatrix}$
> That is:
> $D_{\overrightarrow{u}} \, f(x, y) = f_{x}(x, y)a + f_{y}(x, y)b = \overrightarrow{u} \cdot \begin{bmatrix} f_{x}(x, y) \\ f_{y}(x, y)\end{bmatrix}$

#### Proof 1

Let $g(h) = f(x + ha, y + hb)$

$D_{\overrightarrow{u}} \, f(x, y) = \lim_{h \to 0} \, \dfrac{f(x_{0} + ha, y_{0} + hb) - f(x_{0}, y_{0})}{h}$

$g'(0) = \lim_{h \to 0} \, \dfrac{g(h) - g(0)}{h}$

$g(h) = f(x_{0} + ha, y_{0} + hb)$

$g'(h) = \dfrac{\partial f}{\partial x} * \dfrac{\partial x}{\partial a} + \dfrac{\partial f}{\partial y} * \dfrac{\partial y}{\partial b} = f_{x}(x_{0} + ha, y_{0} + hb)a + f_{y}(x_{0} + ha, y_{0} + hb)a$
$g'(0) = f_{x}(x_{0}, y_{0})a + f_{y}(x_{0}, y_{0})b$    $\blacksquare$


If the direction $\overrightarrow{u}$ make angle $\theta$ with the positve x-axis, then $\overrightarrow{u} = \begin{bmatrix} cos(\theta) \\ sin(\theta) \end{bmatrix}$

$\to g'(0) = f_{x}(x_{0}, y_{0})cos(\theta) + f_{y}(x_{0}, y_{0})sin(\theta)$

### Examples

#### Example 1

$z = f(x, y) = x^{2} + xy - 3y^{2}$

find $D_{\overrightarrow{u}} \, f(x, y)$ if $\overrightarrow{u}$ is a unit vector with $\theta = \dfrac{\pi}{3}$

- $D_{\overrightarrow{u}} \, f(x, y) = f_{x}(x, y)cos(\dfrac{\pi}{3}) + f_{y}(x, y)sin(\dfrac{\pi}{3})$
- $D_{\overrightarrow{u}} \, f(x, y) = \dfrac{1}{2}(2x + y) + \dfrac{\sqrt{3}}{2}(x - 6y)$
- $D_{\overrightarrow{u}} \, f(-1, 2) = \dfrac{1}{2}(-2 + 2) + \dfrac{\sqrt{3}}{2}(-1 -12) = \dfrac{-13\sqrt{3}}{2}$

## Gradient Vectors

### Definition

If $f$ is a differential function of two variable $(x, y)$, then the **gradient vector of $f$** is the vector function $\triangledown f(x, y)$ defind by

$\triangledown f(x, y) = \begin{bmatrix} f_{x}(x, y) \\ f_{y}(x, y) \end{bmatrix} = f_{x}(x, y)\overrightarrow{i} + f_{y}(x, y) \overrightarrow{j}$

$D_{\overrightarrow{u}} \, f = \triangledown f \cdot \overrightarrow{u}$

#### Theroem 2

> Suppose $f$ is a differentiable function of two or more variables. The maximum value of the directional derivative $D_{\overrightarrow{u}} f$ is $\vert \triangledown f \vert$ when $\overrightarrow{u}$ has the same direction as $\triangledown f$

#### Proof 2

$D_{\overrightarrow{u}} \, f = \triangledown f \cdot \overrightarrow{u} = \vert \triangledown f \vert \, cos(\theta)$

The minimum: $\vert \triangledown f \vert$ when $\theta = 0$

The maximum: $-\vert \triangledown f \vert$ when $\theta  = \pi$

The minimum and maximum have opposing directions

### Examples

#### Example 2

$f(x, y) = 2cos(x) + xe^{y}$

$\triangledown f = \begin{bmatrix} f_{x} \\ f_{y} \end{bmatrix} = \begin{bmatrix} -2sin(x) + e^{y} \\ xe^{y} \end{bmatrix}$

$\triangledown f(\dfrac{\pi}{2}, 0) = \begin{bmatrix} -2sin(\dfrac{\pi}{2}) + e^{0} \\ \dfrac{\pi}{2}e^{0} \end{bmatrix} = \begin{bmatrix} -1 \\ \dfrac{\pi}{2} \end{bmatrix}$

Find the directional derivative at $(\dfrac{\pi}{2}, 0)$ in $\overrightarrow{v} = \overrightarrow{i} + 2\overrightarrow{j}$

$\overrightarrow{u} = \dfrac{1}{\sqrt{5}}\overrightarrow{i} + \dfrac{2}{\sqrt{5}}\overrightarrow{j}$

$D_{\overrightarrow{u}} \, f(\dfrac{\pi}{2}, 0) = \triangledown f(\dfrac{\pi}{2}, 0) \cdot \begin{bmatrix} \dfrac{1}{\sqrt{5}} \\ \dfrac{2}{\sqrt{5}} \end{bmatrix}$

$D_{\overrightarrow{u}} \, f(\dfrac{\pi}{2}, 0) = \begin{bmatrix} -1 \\ \dfrac{\pi}{2} \end{bmatrix} \cdot \begin{bmatrix} \dfrac{1}{\sqrt{5}} \\ \dfrac{2}{\sqrt{5}} \end{bmatrix} = \dfrac{-1}{\sqrt{5}} + \dfrac{\pi}{5} = \dfrac{\pi - 1}{\sqrt{5}}$

#### Example 3

$f(x, y) = 2cos(x) + xe^{y}$

$\triangledown f = \begin{bmatrix} f_{x} \\ f_{y} \end{bmatrix} = \begin{bmatrix} -2sin(x) + e^{y} \\ xe^{y} \end{bmatrix}$

$\triangledown f(\dfrac{\pi}{2}, 0) = \begin{bmatrix} -2sin(\dfrac{\pi}{2}) + e^{0} \\ \dfrac{\pi}{2}e^{0} \end{bmatrix} = \begin{bmatrix} -1 \\ \dfrac{\pi}{2} \end{bmatrix}$

Find the longest directional derivative in the direction of $\overrightarrow{-i} + \dfrac{\pi}{2}\overrightarrow{j}$

Max: $D_{\overrightarrow{u}} \, f(x, y) = \sqrt{(-1)^{2} + (\dfrac{\pi}{2})^{2}} = \sqrt{1 + \dfrac{\pi^{2}}{4}}$

Min: $D_{\overrightarrow{u}} \, f(x, y) = -\sqrt{1 + \dfrac{\pi^{2}}{4}}$

## Functions of 3 or more variables

$\overrightarrow{u} = \begin{bmatrix} a \\ b \\ c \end{bmatrix}$

$D_{\overrightarrow{u}} \, f(x, y, z) = \lim_{h \to 0} \, \dfrac{f(x_{0} + ha, y_{0} + hb, z_{0} + hc) - f(x_{0}, y_{0}, z_{0})}{h}$

If the limit exists, $\triangledown f(x, y, z) = \begin{bmatrix} f_{x}(x, y, z) \\ f_{y}(x, y, z) \\ f_{z}(x, y, z)\end{bmatrix} = f_{x}(x, y, z)\overrightarrow{i} + f_{y}(x, y, z) \overrightarrow{j} + f_{z}(x, y, z)\overrightarrow{k}$

### Example 4

$f(x, y, z) = x + zsin(y)$

Find $\triangledown f$, $D_{\overrightarrow{u}} \, f(1, \dfrac{\pi}{2}, 2)$ in $\overrightarrow{v} = \overrightarrow{i} + 2\overrightarrow{j} -2\overrightarrow{k}$

$\triangledown f(x, y, z) = 1\overrightarrow{i} + zcos(y)\overrightarrow{j} + sin(y)\overrightarrow{k}$

$\triangledown f(1, \dfrac{\pi}{2}, 2) = 1\overrightarrow{i} + 0\overrightarrow{j} + 1\overrightarrow{k}$

$D_{\overrightarrow{u}} \, f(1, \dfrac{\pi}{2}, 2) = \begin{bmatrix} 1/3 \\ 2/3 \\ -2/3 \end{bmatrix} \cdot \begin{bmatrix} 1 \\ 0 \\ 1 \end{bmatrix} = \dfrac{1}{3} + 0 - \dfrac{2}{3} = \dfrac{-1}{3}$
