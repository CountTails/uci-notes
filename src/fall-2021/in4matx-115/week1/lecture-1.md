# Lecture 1

## Topics covered in this course

- Testing fundamentals
	- Exploratory testing
	- Acceptance testing
	- Functional testing
	- Combinatorial testing
	- Structural testing
	- Regression testing
- Testing driven development (TDD)
- Behavior driven development (BDD)
- Testing processes
	- Debugging
	- Static analysis
	- Testing for accessibility

## Course expectations

- Describe several techniques for validating and measuring the quality of software
- Apply testing techniques, including block-box and white-box techniques, automatic testing activities, and regression testing
- Use appropriate techniques and tools, including a debugger, to locate program faults
- Participate effectively in a software inspection

## Why test?

### Arian rocket disaster (1996)

- Caused due to numeric overflow error
	- Attempted to fit a 64-bit formate data in 16-bit space
- Cost
	- $100 million for loss of mission
	- Multi-year setback of the program

### Program invariants

- An invariant is a program fact that is true in every run of the program
- An invariant for this program is that `z == c` for some constant `c`

```C
int p(int x) { return x * x; }

void main() {
	int z;
	if (getc() == 'a')
		z = prodcut(6 * 6) + 6;
	else
		z = product(-7 * -7) - 7;
}
```

- `z` is the number 42 after every run

### Cost of software failures

- Failures have cost companies over a trillion dollars in lost assets
- Failures have affected hundreds of companies
- Failures have affected billions of customers
- Failures have costed hundreds of years of lost time