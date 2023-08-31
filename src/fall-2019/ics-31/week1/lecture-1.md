# Lecture 1

## Programming (General)

### Terms and definitions

| Term | Definition |
|---|---|
| Algorithm | A finite series of well defined steps or instructions that solve a class of problems |
| Input | A source of data for a program. Perhaps a file, keyboard, or network |
| Process | A statement that performs a computation on data, like adding two numbers |
| Output | A destination for a program to place resulting data, such as a screen or file |
| Variable | Used by programs to refer to data, which can vary throughout the program's lifetime |

### Programming is like a recipe

> **Baking chocolate chip cookie from a recipe**
> 1) Mix 1 stick of butter and 1 cup of sugar
> 2) Add egg and mix until combined
> 3) Stir in flour and chocolate chips
> 4) Bake at 350F for 8 minutes

- What inputs does the recipe require?
	- 1 stick of butter
	- 1 cup of sugar
	- an egg
	- flour
	- chocolate chips
- What is the output of the recipe?
	- cookies!!!
- What processes are taking place?
	- Mixing
	- Stirring
	- Baking

## Programming using Python

### The interpreter

- a computer program that executes code written in the Python programming language

## Basic input and output

### Input

Use the `input()` function to get input from the user

`input()` always returns a string, conversion to the appropriate data type is needed.

#### CONVERSION... HOW REALISTIC/USEFUL IS THIS? 
  
> NASA lost a $125 million Mars orbiter   
because a Lockheed Martin engineering team   
used English units of measurement while the   
agency's team used the more conventional metric   
system for a key spacecraft operation.
>
> The units mismatch prevented navigation   
information from transferring between the Mars   
Climate Orbiter spacecraft team in at Lockheed   
Martin in Denver and the flight team at NASA's   
Jet Propulsion Laboratory in Pasadena,   
California.

### Output

```python
print() #blank line
print(3) #print an integer to the monitor
print('hello world') #print a string to the monitor
print(3 * 3) #print an expression's value to the monitor

variable = 3 #assign a value to a variable
print(variable) #print a variable's value to the monitor
print(variable * 3) #print the expression's value to the monitor
print("variable's value is: ", variable)
```

## Errors

Avoid encountering errors by running (and rerunning) the code every few lines that are added. Fix errors as they appear.

