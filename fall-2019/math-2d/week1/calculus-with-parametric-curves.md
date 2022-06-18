# Calculus with parametric curves

## Derivatives

### Traditional Derivatives

![Derivative at a point](./figures/traditional-derivative.png)

From Math 2A, $\dfrac{dy}{dx} = \lim_{\Delta x \to 0} \dfrac{\Delta y}{\Delta x}$

The slope of the tangent line at $A(a, f(a))$ is $f'(a) = \dfrac{df}{dx}(a)$

### Derivatives of Parametric Curves

Let a parametric curve be represented by

- $x = x(t)$
- $y = y(t)$

By eliminating the parameter, $y = y(x(t))$

Applying the chain rule to this representation reveals the first derivative of a parametric curve.

$\dfrac{dy}{dt} = \dfrac{dy}{dx} * \dfrac{dx}{dt}$

$\dfrac{dy}{dx} = \dfrac{dy/dt}{dx/dt}$

To obtain the second derivative, differentiate the first derivative of parametric curves

$\dfrac{d}{dx}(\dfrac{dy}{dx})$

$\dfrac{d^{2}y}{dx^{2}} = \dfrac{\dfrac{d}{dt}(\dfrac{dy/dt}{dx/dt})}{\dfrac{dx}{dt}}$

Note: $\dfrac{d^{2}y}{dx^{2}} \ne \dfrac{d^{2}y/dt^{2}}{d^{2}x/dt^{2}}$ is the incorrect second derivative.

Special cases for the first derivative

- $\dfrac{dy/dt}{dx/dt}$ if $\dfrac{dx}{dt} \ne 0$
- $\pm \infty$ if $\dfrac{dx}{dt} = 0$ and $\dfrac{dy}{dt} \ne 0$
- if $\dfrac{dx}{dt} = 0$ and $\dfrac{dy}{dt} \to$ Use L'Hopital's rule

### Example 1

Let a parametric curve be represented by

- $x = t^{2}$
- $y = t^{3} - t$

- There are two tangents at $(1, 0)$
	- $y = t^{3} - t = t(t^{2} - 1) = 0$
		- $y = t(t -1)(t+1) = 0$
		- $t = 0, 1, -1$
	- $x = t^{2} = 0$
		- $t = 1, -1$
	- The curve crosses itself at $(1, 0)$ at $t = -1$ and $t = 1$
		- $\dfrac{dy}{dx} = \dfrac{dy/dt}{dx/dt} = \dfrac{3t^{2} - 1}{2t} = \dfrac{3}{2}(t - \dfrac{1}{3t})$
		- At $t = -1$
			- $\dfrac{dy}{dx} = \dfrac{3(-1)^{2} - 1}{2(-1)} = \dfrac{2}{-2} = -1$
		- At $t = 1$
			- $\dfrac{dy}{dx} = \dfrac{3(1)^{2} - 1}{2(1)} = \dfrac{2}{2} = 1$
- Find the horizontal and vertical tangent lines
	- Horizontal ($\dfrac{dy}{dt} = 0$ and $\dfrac{dx}{dt} \ne 0$)
		- $3t^{2} - 1 = 0$
		- $t = \pm \sqrt{\dfrac{1}{3}}$
		- Plugging in t $\to (\dfrac{1}{3}, \pm \sqrt{\dfrac{1}{3}})$
	- Vertical ($\dfrac{dy}{dt} \ne 0$ and $\dfrac{dx}{dt} = 0$)
		- $2t = 0$
		- $t = 0$
		- Plugging in t $\to (0, 0)$
	- Determine curve's concavity
		- $\dfrac{d^{2}y}{dx^{2}} = \dfrac{\dfrac{d}{dt}(\dfrac{dy/dt}{dx/dt})}{\dfrac{dx}{dt}} = \dfrac{\dfrac{d}{dt}(\dfrac{3}{2}(t - \dfrac{1}{3t}))}{2t}$ 
		- $\dfrac{d^{2}y}{dx^{2}}$
			- $> 0$ for $t > 0$
			- $< 0$ for $t < 0$
## Integrals

### Traditionals Integrals

![Integrals on an interval](./figures/integral.png)

From Math 2A, the area under a curve $F(x)$ on $[a, b]$ is $A = \int_{a}^{b} F(x) \, dx$

### Integrals with parametric curves

### Example 2

### Example 3 (Arc Length)


