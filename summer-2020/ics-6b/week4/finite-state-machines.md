# Finite state machines

## FSM or automatas

- Take an input string
- Read it from left to right
- Stops automatically after last character
- Can automatically answer question like: Given a bit string, interpreted as an integer, is it even or odd?
    - If the lowest order bit is 0 -> the number is even
    - If the lowest order bit is 1 -> the number is odd

### State diagrams

- Given the input string: "10100101"
- State `a` is we just read a "0"
- State `b` is we just read a "1"
- State `s[0]` is the initial state
- If we stop in state `a` the process was successful, or we just read an even number
- If we stop in state `b` the process was unsuccessful, or we just read an odd number

```                
  0                              1
+----+                        +-----+
|    V           1            V     |
|  +---+------------------->+---+   |
+--| a |                    | b |---+
   +---+<-------------------+---+
     ^           0            ^
     |                        |
     |   0               1    |
     +--------+------+--------+
              | s[0] |    
              +------+
```

### Transition tables

- Define the transitions at each state, for each possible input

| State | Input | Next state |
|-------|-------|------------|
| `s[0]` | `0` | `a` |
| `s[0]` | `1` | `b` |
| `a` | `0` | `a` |
| `a` | `1` | `b` |
| `b` | `1` | `b` |
| `b` | `0` | `a` |

## String/sentence/phrase/word

- $x_{0}x_{1}\dots x_{n}$ is **recognized** by a finite state machine if
    - With $x$ as input, the machine starts and state `s[0]`
    - Ends in the success state of the machine
- A language is **recognized by a finite state machine if
    - All possible sentences in the language are recognized by the machine
- Two finite state machines are equivalent if they both recognize the same language

## Non-deterministic FSM vs. deterministic FSM

- Deterministic
    - Given current state and next input character, the next state is uniquely determined
- Non-deterministice
    - Given current state and next input character, the next "state" is a set of possible states
    - There may be more than one success state

> Thm: If a language $L$ is recognized by a non-deterministic finiste state machine $M_{0}$, then there exists a finite state machine $M_{1}$ that also recognizes $L$

- Basic idea of proof
    - $M_{0}$ has some set of current states
        - $s_{0} \to \{ s_{0},\ s_{1} \}$
        - $s_{1} \to \{ s_{1},\ s_{3} \}$
    - Possible states after 1 step are: $\{ s_{0},\ s_{1} \}$
    - After 2 steps: $\{ s_{0},\ s_{1},\ s_{3} \} = f(s_{0}) \cup f(\{ s_{0},\ s_{1} \})$
    - The set of current states is a subset of $P(s)$
    - The deterministic finite state machine whose states represent all members of $P(s)$
        - $2^{k} \times \text{number of rows in NDFSM transition table}$, where $k = \vert s \vert$
