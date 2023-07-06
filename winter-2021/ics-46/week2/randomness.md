# Randomness

## What is it?

### Definition

- No deductible pattern
- Varied and unpredictable

### Uses

- Encryption
- Computer games (NPC behavior)
- Simulations
	- Running multiple simulations
	- Each one is varied slightly

## How to generate randomness

### A source of entropy

- Something unpredictable
- Limited availability

### Pseudorandom generators

- The appearance of randomness is enough
- Take bits from a source of entropy
- Use bits as a "seed value"
- Run a *deterministic* algorithm that
	1) Takes the seed
	2) Computes a new values
	3) Returns the new value **AND** updates the seed with the new value
- Result
	- Outputs is a sequence of bits
	- Consists of 50 zeroes, 50 ones with no pattern
- Distribution
	- Take sequence of bits and turn it into a sequence of usable values
	- Modding is flawed distribution

## `<random>`

- Taps into a source of entropy
	- Use `std::random_device`
	- This only need to be done **once**
- Pseudorandom generator
	- Use `std::default_random_engine`
	- Generates a sequence of random bits
	- Calls the source of entropy to create
	- Only done **once**
- Distributions
	- Creating a distribution
		- Use `std::uniform_in_distribution<IntType>`
		- Other distributions available
	- Call the distribution object, passing an engine as the arguments
	- Can be done more than once