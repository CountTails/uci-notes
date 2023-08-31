# Lecture 6

## A homogenous system in economics

Suppose a nation's economy is divided into many sectors.

Suppose that for each sector we know its total output for one year and we know exactly how this output is divided among the other sectors of the economy

Let the dollar value of each sector's output be called the **price** of that output

There exists an equilibrium prices that can be assigned to the total outputs of the various sectors in such a way that the income of each sector exactly balances its expenses

### Example 1

Suppose an economy consists of energy, material, and technology sectors as follows

- Energy receives: 
	- 10% of energy's output
	- 30% of material's output
	- 40% of technology's output
- Material receives:
	- 40% of enery's output
	- 20% of material's output
	- 20% of technology's output
- Technology receives:
	- 50% of energy's output
	- 50% of material's output
	- 40% of technology's output

Denote the prices of the total annual outputs of Energy, Material, and Technology sectors as $P_{E}$, $P_{M}$, and $P_{T}$ respectively

$$
	\begin{cases}
		P_{E} = .1P_{E} + .3P_{M} + .4P_{T}\\
		P_{M} = .4P_{E} + .2P_{M} + .2P_{T}\\
		P_{T} = .5P_{E} + .5P_{M} + .4P_{T}\\
	\end{cases}
$$

Move all unknowns to one side and combine like terms

$$
	\begin{cases}
		.9P_{E} - .3P_{M} - .4P_{T} = 0\\
		-4P_{E} + .8P_{M} - .2P_{T} = 0\\
		-.5P_{E} - .5P_{M} + .6P_{T} = 0\\
	\end{cases}
$$

Write the augmented matrix and row reduce

$$
	\begin{bmatrix}
		.9 & -.3 & -.4 & 0 \\
		-.4 & .8 & .2 & 0 \\
		-.5 & -.5 & .6 & 0
	\end{bmatrix}
	\to
	\begin{bmatrix}
		1 & 0 & \dfrac{-19}{30} & 0 \\
		0 & 1 & \dfrac{-17}{30} & 0 \\
		0 & 0 & 0 & 0
	\end{bmatrix}
$$

The general solution is $P_{E} = \dfrac{19}{30}P_{T}$, $P_{M} = \dfrac{17}{30}P_{T}$ and $P_{T}$ is free. The equilibrium price vector for the economy is 

$$
	\overrightarrow{x} = 
	\begin{bmatrix} P_{E} \\ P_{M} \\ P_{T} \end{bmatrix} = P_{T}
	\begin{bmatrix} \dfrac{19}{30} \\ \dfrac{17}{30} \\ 1 \end{bmatrix}
$$

A non-negative choice of $P_{T}$ results in a choice of equilibrium prices.

## Balancing chemical equations

To balance an equation, a chemist must find whole numbers such that the total number of elemental atoms of one side of the equation is equal to the number of elemental atoms on the other side of the equation.

### Example 2

Balance the following equation

$$
	B_{2}S_{3} + H_{2}O \to H_{3}BO_{3} + H_{2}S
$$

To balance this equation, create a vector equation that describes the number of atoms of each element present in the reaction. Each row in the vector equation represents the number of each element in each term

$$
	x_{1} \begin{bmatrix} 2 \\ 3 \\ 0 \\ 0 \end{bmatrix} + 
	x_{2} \begin{bmatrix} 0 \\ 0 \\ 2 \\ 1 \end{bmatrix} =
	x_{3} \begin{bmatrix} 1 \\ 0 \\ 3 \\ 3 \end{bmatrix} +
	x_{4} \begin{bmatrix} 0 \\ 1 \\ 2 \\ 0 \end{bmatrix}	
$$

To balance the equation, the coefficients $x_{1}, x_{2}, x_{3}, x_{4}$ must satisfy

$$
	x_{1} \begin{bmatrix} 2 \\ 3 \\ 0 \\ 0 \end{bmatrix} + 
	x_{2} \begin{bmatrix} 0 \\ 0 \\ 2 \\ 1 \end{bmatrix} -
	x_{3} \begin{bmatrix} 1 \\ 0 \\ 3 \\ 3 \end{bmatrix} -
	x_{4} \begin{bmatrix} 0 \\ 1 \\ 2 \\ 0 \end{bmatrix} =
	\begin{bmatrix} 0 \\ 0 \\ 0 \\ 0 \end{bmatrix}	
$$

Writing the augmented matrix and row reducing yields the following equilibrium vector

$$
	\overrightarrow{x} = x_{4} 
	\begin{bmatrix}
		\dfrac{1}{3} \\ 2 \\ \dfrac{2}{3} \\ 1
	\end{bmatrix}
$$

Any non-negative choice of $x_{4}$ results in a balanced chemical equation. Thus the balanced equation is

$$
	B_{2}S_{3} + 6H_{2}O \to 2H_{3}BO_{3} + 3H_{2}S
$$

## Network flow

Systems of linear equations arise from the study of the flow of some quantity through a network

A **network** consists of a set of points called **junctions** or **nodes**, with lines or arcs called **branches** connecting some or all of the junctions. The direction of flow in each branch is indicated, and the flow amount is either shown or denoted by a variable

The basic assumption of network flow is that the total flow into a network equals the total flow out of the network, and that the total flow into a junction equals the total flow out of the junction

### Example 3

| Junction | Flow in | Flow out |
| ---- | ---- | ---- |
| A | $x_{1} + x_{3}$ | 20 |
| B | $x_{2}$ | $x_{3} + x_{4}$ |
| C | 80 | $x_{1} + x_{2}$ |

Since flow in = flow out, we get the followin system

$$
	\begin{cases}
		x_{1} + x_{3} = 20 \\
		x_{2} = x_{3} + x_{4} \\
		80 = x_{1} + x_{2}
	\end{cases}
$$

Moving all unknowns to one side and simplifying

$$
	\begin{cases}
		x_{1} + x_{3} = 20 \\
		x_{2} - x_{3} - x_{4} = 0 \\
		x_{1} + x_{2} = 80
	\end{cases}
$$

Writing the augmented matrix and row reducing

$$
	\begin{bmatrix}
		1 & 0 & 1 & 0 & 20 \\
		0 & 1 & -1 & -1 & 0 \\
		1 & 1 & 0 & 0 & 80
	\end{bmatrix}
	\to
	\begin{bmatrix}
		1 & 0 & 1 & 0 & 20 \\
		0 & 1 & -1 & 0 & 60 \\
		0 & 0 & 0 & 1 & 60
	\end{bmatrix}
$$

The equilibrium vector for this network is 

$$
	\overrightarrow{x} = x_{3}
	\begin{bmatrix} 
		-1 \\ 1 \\ 1 \\ 0
	\end{bmatrix}
	+
	\begin{bmatrix}
		20 \\ 60 \\ 0 \\ 60
	\end{bmatrix}
$$

A non-negative choice of $x_{3}$ results in a balanced network flow. To guarantee that all flows are non-negative, $x_{3}$ must be less than or equal to 20