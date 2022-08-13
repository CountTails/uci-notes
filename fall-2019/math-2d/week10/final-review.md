# Final Review

## Before Mid-Term

- 1 - 2 problems
	- Ch. 10
	- Ch. 11
	- Ch. 12
- Focus on Ch. 12
	- 3D spaces
		- distances
		- lines
		- planes
	- vectors
		- dot product
		- cross product
	- Quadric surfaces

## After Mid-Term

- 6 - 7 problems
	- Ch. 14
	- Ch. 15
- details on canvas

## Total # of Problems

- Need to complete 8 problems (9 problems available)
- Total score is out of 80 points
	- Time: 12/11/2019 @ 1:30 - 3:30 pm
	- Location: ELH (in-class)
	- 8 + 1 problems
	- Closed book; No calculator
- Score distribution
	- A: 20%
	- B: 25%
	- C: 30%
	- D: 15%
	- F: 10%

## Chapter 10

A plane curve described by $x = f(t)$ and $y = g(t)$ is a parametric curve described by parametric equations

A parametric curve has first derivative $\dfrac{dy}{dx} = \dfrac{dy / dt}{dx / dt}$ and second derivative $\dfrac{d^{2}y}{dx^{2}} = \dfrac{\dfrac{d}{dt} \left(\dfrac{dy}{dx} \right)}{dx / dt}$

The area bounded by a parametric curve is $A = \int \limits_{\alpha}^{\beta} g(t) * f'(t) \, dt$ or $A = \int \limits_{\alpha}^{\beta} g'(t) * f(t) \, dt$

The length of a parametric curve is $L = \int \limits_{t_{1}}^{t_{2}} \sqrt{\left(\dfrac{dy}{dt}\right)^{2} + \left(\dfrac{dx}{dt}\right)^{2}} \, dt$

Polar coordinates and curves follow the equations above as well. Convert between cartesian and polar points with

- $x = rcos(\theta)$
- $y = rsin(\theta)$
- $x^{2} + y^{2} = r^{2}$
- $tan(\theta) = \dfrac{y}{x}$

## Chapter 12.1 - 12.2

Three coordinate axis perpendicular to each other. Divides space into eight octants.

Distance formula in 3 dimensions: $d = \sqrt{(x_{2} - x_{1})^{2} + (y_{2} - y_{1})^{2} + (z_{2} - z_{1})^{2}}$

Equation of a sphere with center $(h, k, l)$ with radius $r$: $(x - h)^{2} + (y - k)^{2} + (z - l)^{2} = r^{2}$

Vectors formulas

| Formula Name | Formula |
| --- | --- |
| Sum Rule | $\langle a, b, c \rangle + \langle d, e, f \rangle = \langle a + d, b + e, c + f \rangle$ |
| Difference Rule | $\langle a, b, c \rangle - \langle d, e, f \rangle = \langle a - d, b - e, c - f \rangle$ |
| Constant Multiplier Rule | $k * \langle a, b, c \rangle = \langle ka, kb, kc \rangle$ |
|  Magnitude | $\vert \langle a, b, c \rangle \vert = \sqrt{a^{2} + b^{2} + c^{2}}$ |
| Unit Vector | $\overrightarrow{u} = \dfrac{\langle a, b, c \rangle}{\vert \langle a, b, c \rangle \vert}= \dfrac{\overrightarrow{v}}{\vert \overrightarrow{v} \vert}$ |

## Chapter 12.3 - 12.4

Let $\overrightarrow{a} = \langle a_{1}, a_{2}, a_{3} \rangle$ and $\overrightarrow{b} = \langle b_{1}, b_{2}, b_{3} \rangle$

The dot product is: $a \cdot b = a_{1}b_{1} + a_{2}b_{2} + a_{3}b_{3}$

The angle between $\overrightarrow{a}$ and $\overrightarrow{b}$ is: $cos(\theta) = \dfrac{\overrightarrow{a} \cdot \overrightarrow{b}}{\overrightarrow{\vert a \vert} \overrightarrow{\vert b \vert}}$

$\overrightarrow{a}$ is perpendicular to $\overrightarrow{b}$ if and only if $\overrightarrow{a} \cdot \overrightarrow{b} = 0$

$\overrightarrow{a}$ is parallel to $\overrightarrow{b}$ if $cos(\theta) = \dfrac{\overrightarrow{a} \cdot \overrightarrow{b}}{\overrightarrow{\vert a \vert} \overrightarrow{\vert b \vert}} = 1$ or $cos(\theta) = \dfrac{\overrightarrow{a} \cdot \overrightarrow{b}}{\overrightarrow{\vert a \vert} \overrightarrow{\vert b \vert}} = -1$

Scalar projection of $\overrightarrow{b}$ onto $\overrightarrow{a}$: $comp_{a}(b) = \dfrac{\overrightarrow{a} \cdot \overrightarrow{b}}{\overrightarrow{\vert a \vert}}$

Vector projection of $\overrightarrow{b}$ onto $\overrightarrow{a}$: $proj_{a}(b) = (comp_{a}(b) = \left(\dfrac{\overrightarrow{a} \cdot \overrightarrow{b}}{\overrightarrow{\vert a \vert}} \right)\dfrac{\overrightarrow{a}}{\overrightarrow{\vert a \vert}}$

The cross product of $\overrightarrow{a}$ and $\overrightarrow{b}$ is $\overrightarrow{a} \times \overrightarrow{b} = \begin{bmatrix} i & j & k \\ a_{1} & a_{2} & a_{3} \\ b_{1} & b_{2}  & b_{3} \end{bmatrix}$

$\overrightarrow{a} \times \overrightarrow{b}$ is perpendicular to $\overrightarrow{a}$ and $\overrightarrow{b}$

$\vert \overrightarrow{a} \times \overrightarrow{b} \vert = \overrightarrow{\vert a \vert} \overrightarrow{\vert b \vert} sin(\theta)$  if $0 \le \theta \le \pi$

$\overrightarrow{a}$ is parallel to $\overrightarrow{b}$ if and only if $\overrightarrow{a} \times \overrightarrow{b} = 0$

$\vert \overrightarrow{a} \times \overrightarrow{b} \vert$ represents the area of the parallelogram defined by $\overrightarrow{a}$ and $\overrightarrow{b}$

$\dfrac{1}{2}\vert \overrightarrow{a} \times \overrightarrow{b} \vert$ represents the area of the triangle defined by $\overrightarrow{a}$ and $\overrightarrow{b}$

$\overrightarrow{a} \cdot \left( \overrightarrow{b} \times \overrightarrow{c} \right)$ represents the volume of the parallelopiped defined by $\overrightarrow{a}$, $\overrightarrow{b}$, and $\overrightarrow{c}$

## Chapter 12.5

Equations for lines in 3d space: $a$, $b$, and $c$ are the directional numbers of the vector that describes the line.

| Equation Type | Form |
| --- | --- |
| Vector | $\overrightarrow{r}(t) = \langle x_{0}, y_{0}, z_{0} \rangle + \langle a, b, c \rangle t$
| Parametric | $\begin{cases} x = x_{0} + at \\ y = y_{0} + bt \\ z = z_{0} + bt\end{cases}$ |
| Symmetric | $\dfrac{x - x_{0}}{a} = \dfrac{y - y_{0}}{b} = \dfrac{z - z_{0}}{c}$ |

Equation for a plane: a, b, and c are the directional numbers of the vector normal to the plane. They take the form of $a(x-x_{0})+b(y-y_{0})+c(z-z_{0})=0$

### Intersections

| Step | Between 2 lines | Between 2 planes | Between a line and a plane |
| --- | --- | --- | --- |
| 1 | Obtain parametric equations for both lines | Direction of line is $n_{1} \times n_{2}$ (cross product of the planes' normal vectors) | Obtain the parametric equations for the line |
| 2 | fix one variable | Obtain a point on the line by fixing one variable and solving for the remaining two using the plane equations | Substitute parametric equations into the plane equations |
| 3 | solve for the remaining two | | solve for $t$ and plug $t$ into parmetric equations to obtain a point |
| 4 | check that the resulting point satisfies both equations | | |

### Angles

$cos(\theta) = \dfrac{n_{1} \cdot n_{2}}{\vert n_{1} \vert \vert n_{2} \vert}$ is the angle between planes. Lines will use directional vectors instead

### Distances

$d = \dfrac{\vert a(x_{1} - x_{0}) + b(y_{1} - y_{0}) + c(z_{1} - z_{0}) \vert}{\sqrt{a^{b} + b^{2} + c^{2}}}$ is the distance from a point to a plane. Lines can be viewed as parallel planes and the normal vector is the cross product of the directional vectors

## Chapter 12.6

| Surface name | Form | Extra info |
| --- | --- | --- |
| Cylinders | $z = x^{2}$ or $x^{2} + y^{2} = 1$ | 3D equation that does not contain 3 variables. Not dependent on missing variable
| Ellipsoid | $\dfrac{x^{2}}{a^{2}} + \dfrac{y^{2}}{b^{2}} + \dfrac{z^{2}}{c^{2}} = 1$ | Becomes a sphere if $a = b = c$ |
| Elliptic Paraboloid | $\dfrac{z}{c} = \dfrac{x^{2}}{a^{2}} + \dfrac{y^{2}}{b^{2}}$ | |
| Hyperbolic Parabloloid | $\dfrac{z}{c} = \dfrac{x^{2}}{a^{2}} - \dfrac{y^{2}}{b^{2}}$ | | 
| Cone | $\dfrac{z^{2}}{c^{2}} = \dfrac{x^{2}}{a^{2}} + \dfrac{y^{2}}{b^{2}}$ | |
| Hyperboloid of one sheet | $\dfrac{x^{2}}{a^{2}} + \dfrac{y^{2}}{b^{2}} - \dfrac{z^{2}}{c^{2}} = 1$ | One term is negative, the rest positive |
| Hyperboloid of two sheets | $-\dfrac{x^{2}}{a^{2}}  \dfrac{y^{2}}{b^{2}} + \dfrac{z^{2}}{c^{2}} = 1$ | One term is positive, the rest negative |

## Chapter 13

## Chapter 14

## Chapter 15