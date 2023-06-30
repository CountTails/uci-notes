# Counting subsets with repetition

## Multisets

- A multiset can have more than one copy of an item
	- Order does not matter
	- The number of elements of each type does not matter
	- All elements are **not** unique

### Counting

- You are putting together a pile of money; you want to put there 12 banknotes altogether
- There are 4 varieties of banknotes
	- $1
	- $2
	- $5
	- $10
- Banknotes of the same variety are the same
- There is an unlimited supply of each variety
- How many ways to select the banknotes
	- Order does not matther
	- All that matters is how many of each variety you have in the wallet when you are done

### Markers

- Sample selection in $
	- 1 1 1 2 5 5 5 5 5 A A
- Can put markers between different denominations for separation
	- 1 1 1 / 2 / 5 5 5 5 5 5 / A A
- Only markers position are relevant

## Bijection to binary

- Binary encoding that uniquely specifies a selection of banknotes
	- Selection of banknotes <-> Binary code word
	- The code word will count the number of valid binary code words

### Encoding selection

- $ $ $ / $ / $ $ $ $ $ $ / $ $
- `111010111111011`: binary encoding for this selection where ones stand for a banknote and 0 stands for a separator
- Now we have a bijection from choosing banknotes to creating binary strings with **exactly** 3 zeros
- Every code word has 12 1's and 3 0's: totaling 15 bits
	- ${15 \choose 3}$

### Binary code for bills

- Bijection
	- Ways to select $12$ banknotes from $4$ varieties
	- Binary strings with $12$ 1's and $(4-1)$ 0's
- The number of ways to select 12 banknotes from 4 varieties
	- ${12 + 4 - 1 \choose 4 - 1} = {15 \choose 3}$

## Selecting from varieties

- The number of ways to select $n$ items from a set of $m$ varieties
	- Items from the same variety are identical
	- There is at least $n$ items from each variety

$$
	= {n + m - 1 \choose m - 1}
$$

- This holds for
	- $n > m$
	- $m < n$
	- $m = n$

### Sums of variables

- How many solutions are there to the following equation, where each variable $x_{i}$ is a non-negative integer
	- $x_{1} + x_{2} + x_{3} + x_{4} = 12$
- The binary code for the equations
	- `110111101111101`
- The number of solution is the number of length 15 strings with 3 0's 
	- ${ 15 \choose 3}$

### Lower bounds

- How many ways to select 12 donuts from 4 varieties with the added constraint that there are at least 2 chocolate donuts
	- First pick the 2 chocolate donuts
	- Then select the remaining 10 donuts with no restrictions

$$
	= {10 + 4 - 1 \choose 4 - 1} = {13 \choose 3}
$$

### Upper bounds

- How many ways to select 12 donuts from 4 varieties with the added constraint that there are only 5 chocolate donuts available?
	1) Find the number of ways to select 12 donuts from 4 varieties with *no constraints*
	2) Subtract the number of ways to select 12 donuts from 4 varieties from NOT($\le 5$ chocolates)