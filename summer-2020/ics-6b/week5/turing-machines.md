# Turing machines

## Problems with FSMs

- Have no memory or RAM
- Can only encode a finite number of states
- It is possible to build a FSM that can recognize strings of the form $0^{k}1^{k}$, but $k$ is bounded beforehand
- No machine can recognize strings of the form $0^{n}1^{n}$ if $n$ is unbounded

## Turing machines

- An idealized, simple computer
- Consists of
    - A head that can read or write into a cell
    - A tape that consists of an array of cells
- A turing machine $T = \{ S,\ I,\ f,\ s_{0},\ A \}$
    - $S$ is the set of states from the FSM
    - $I$ is the input alphabet (must include a characte to represent blank)
    - $f: (S \times I) \to (S \times I \times \{ L,\ R\})$
    - $s_{0} \subseteq S$ is the set of starting states
    - $A \subseteq S$ is the set of accepting states
- At each step
    1) Find a new state based on current state and the character under the head
    2) Write new character to the tape
    3) Move left or right

> $T$ recognizes input string $x$ (exists on the tape before starting) if and only if $T$, starting in state $s_{0}$, halts in an accepting state

> A language $L$ is recognized by $T$ if $x$ is recognized by $T$, $\forall_{x \in L}$

## Computing functions

- Given $x$ "input" on paper tape
    - Say $T$ halts and accepts $x$
    - But $y$ is on the tape
    - $T(x) = y$
- If $T$ halts in a non-accepting state (or doesn't halt)
    - $T(x)$ is undefined

## Extensions

- Multiple tapes
- Read and write head

### Universal turing machines

> Given any function $T(x)$, and input $x$, there exists a UTM that can compute $T(x)$

### Church-Turing thesis

> Anything computable is computable by an UTM

- Basic idea
    1) start on the far left
    2) move right until you find a blank cell
    3) ensure that far right nonblank is 1, then nuke it with the blank character
    4) move left until you find a blank cell
    5) ensure thar far left nonblank is 0, then nuke it witht he blank character

## Computability, Decidability, Complexity

> A "decision problem" is one with a yes/no answer.

- Decidability
    - Some decision problems are undecidable (or unsolveable)
    - Formally unsolvable if $\nexists$ an algorithm to solve in finite time
- Computability
    - Some question have a correct yes/no answer
    - Not undecideable, the $\nexists$ an algorithm to decide conclusively

## P vs NP

- A problem is in the set $P$ if
    - Its solution can be computed in polynomial time
- A problem is in the set $NP$ if
    - It can be solved by a nondeterministic turing machine in polynomial time
- An open question
    - Does $P = NP$?
    - Proposed in (1971), and nobody knows
- You get a million bucks if you can prove
    1) There is no given algorithm to solve $NP$ problems with a deterministic turing machine in polynomial time
    2) That there is no such proof that such a machine exists