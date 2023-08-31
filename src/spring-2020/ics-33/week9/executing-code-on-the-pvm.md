# Executing code on the PVM

## The Python Virtual Machine (PVM)

The main data structure in the PVM is the "regular" stack (which is like a restricted a list, allowing only the operations push=append and pop=pop

A stack's primary operations are load/push and store/pop. We load/push a value on the top of an upwardly-growing stack; we store/pop a values from the top of a stack

There is a secondarily important block stack that is used to store information about nested loops, try/except, and with statements.

Here is an example of a simple sequence of stack operations to perform the calculation $d = a+b*c$

We will see in more detail below the meaning of 
| Macro | Meaning |
| ------ | -------- |
| LOAD_FAST N | load/push onto the stack the value stored in `co_varnames[N]`, written `stackp += 1`, `stack[stackp] = co_varnames[N]` |
| STORE_FAST N | store/pop the value on the top of the stack into `co_varnames[N]`, written `co_varnames[N] = stack[stackp]`, and `stackp -= 1` |
| BINARY_MULTIPLY | load/push onto the stack the product of the two values on the top, written `stack[stackp-1] = stack[stackp-1] * stack[stackp]`; `stackp -= 1`  (turns the two values on the top of the stack into their product) |
| BINARY_ADD | load/push onto the stack the sum of the two values on the top written `stack[stackp-1] = stack[stackp-1] + stack[stackp]`; `stackp -= 1` (turns the two values on the top of the stack into their sum) |

## A simple calculation

The PVM code for $d = a+b*c$ is

```Assembly
  LOAD_FAST 0
  LOAD_FAST 1
  LOAD_FAST 2
  BINARY_MULTIPLY
  BINARY_ADD
  STORE_FAST 3
```

Initially

```
   +--------------------+
 3 |                    |
   +--------------------+
 2 |                    |
   +--------------------+
 1 |                    |
   +--------------------+
 0 |                    |
   +--------------------+
stack (with stackp = -1, meaning is empty stack)
```

Execute `LOAD_FAST 0`

```
   +--------------------+
 3 |                    |
   +--------------------+
 2 |                    |
   +--------------------+
 1 |                    |
   +--------------------+
 0 | 1: value of a      |
   +--------------------+
stack (with stackp = 0)
```

Execute `LOAD_FAST 1`

```
   +--------------------+
 3 |                    |
   +--------------------+
 2 |                    |
   +--------------------+
 1 | 2: value of b      |
   +--------------------+
 0 | 1: value of a      |
   +--------------------+
stack (with stackp = 1)
```

Execute `LOAD_FAST 2`

```
   +--------------------+
 3 |                    |
   +--------------------+
 2 | 3: value of c      |
   +--------------------+
 1 | 2: value of b      |
   +--------------------+
 0 | 1: value of a      |
   +--------------------+
stack (with stackp = 2)
```

Execute `BINARY_MULTIPLY`

```
   +--------------------+
 3 |                    |
   +--------------------+
 2 |                    |
   +--------------------+
 1 | 6: value of b*c    |
   +--------------------+
 0 | 1: value of a      |
   +--------------------+
stack (with stackp = 1)
```

Execute `BINARY_ADD`

```
   +--------------------+
 3 |                    |
   +--------------------+
 2 |                    |
   +--------------------+
 1 |                    |
   +--------------------+
 0 |7: value of a+b*c   |
   +--------------------+
stack (with stackp = 0)
```

Execute `STORE_FAST 3`

```
   +--------------------+
 3 |                    |
   +--------------------+
 2 |                    |
   +--------------------+
 1 |                    |
   +--------------------+
 0 |                    |
   +--------------------+
stack (with stackp = -1)
```

## Control (The fetch/execute cycle)

Each instruction (some of which are shown above) in the PVM consists of 1 or 3 bytes of information (a byte is 8 bits, and can represent numbers from 0 to 2\*\*8 = 255).

The instructions are stored in memory: think of memory too as a kind of list of bytes, named m, which stores sequential data (bytes) in one location after the other.

Note that the first instruction is stored in `m[0]`, and each subsequent instruction is stored in a location that is 3 higher or 1 higher

Once a program (instruction sequence) is loaded into memory, the PVM executes it according to the following simple rules.

  1) Fetch the operation and its operand (if present) starting at `m[pc]`
  2) pc += 3 (if operator 2-byte operand) or pc += 1 (if no operand is present)
  3) Execute the operation code (maybe change its operand, stack, stackp, or pc)
  4) Go to step 1

## Operation/Byte Codes

Below is a list of many important operations and how they manipulate the PVM. The complete list is available in section 31.12 of the Python documentation.

### Loading and storing

| Macro | byte code |
| ------ | --------- |
| `LOAD_CONST   N`  | `stackp += 1, stack[stackp] = co_consts[N]` |
| `LOAD_FAST    N` | `stackp += 1, stack[stackp] = co_varnames[N]` |
| `LOAD_GLOBAL  N` | `stackp += 1, stack[stackp] = co_names[N]` |
| `STORE_CONST  N` | `co_consts[N] = stack[stackp], and stackp -= 1` |
| `STORE_FAST   N` | `co_varnames[N] = stack[stackp], and stackp -= 1` |
| `STORE_GLOBAL N` | `co_names[N] = stack[stackp], and stackp -= 1` |

### Operators

| Macro | byte code |
| ------ | --------- |
| `UNARY_POSITIVE` | `stack[stackp] = +stack[stackp]` |
| `UNARY_NEGATIVE` | `stack[stackp] = -stack[stackp]`
| `UNARY_NOT` | `stack[stackp] = not stack[stackp]` (for bool values) |
| `UNARY_INVERT` | `stack[stackp] = ~stack[stackp]` |
| `BINARY_ADD` | `stack[stackp-1] = stack[stackp-1] + stack[stackp]; stackp -= 1` |
| `BINARY_SUBTRACT` | `stack[stackp-1] = stack[stackp-1] - stack[stackp]; stackp -= 1` |
| `BINARY_MULTIPLY` | `stack[stackp-1] = stack[stackp-1] * stack[stackp]; stackp -= 1` |
| `BINARY_TRUE_DIVIDE` | `stack[stackp-1] = stack[stackp-1] / stack[stackp]; stackp -= 1` |
| `BINARY_FLOOR_DIVIDE` | `stack[stackp-1] = stack[stackp-1] // stack[stackp]; stackp -= 1` |
| `BINARY_MODULO` | `stack[stackp-1] = stack[stackp-1] % stack[stackp]; stackp -= 1` |
| `BINARY_POWER` | `stack[stackp-1] = stack[stackp-1] ** stack[stackp]; stackp -= 1` |
| `BINARY_SUBSCR` (indexing/subscripting) | `stack[stackp-1] = stack[stackp-1] [ stack[stackp] ]; stackp -= 1` |
| `BINARY_LSHIFT` | `stack[stackp-1] = stack[stackp-1] << stack[stackp]; stackp -= 1` |
| `BINARY_RSHIFT` | `stack[stackp-1] = stack[stackp-1] >> stack[stackp]; stackp -= 1` |
| `BINARY_AND` | `stack[stackp-1] = stack[stackp-1] & stack[stackp]; stackp -= 1` |
| `BINARY_OR` | `stack[stackp-1] = stack[stackp-1] `\|` stack[stackp]; stackp -= 1` |
| `BINARY_XOR` | `stack[stackp-1] = stack[stackp-1] ^ stack[stackp]; stackp -= 1` |

### Iteration

| Macro | byte code |
| ------ | --------- |
| `GET_ITER` | `stack[stackp] = iter(stack[stackp])` |
| `FOR_ITER N` | `stackp += 1; stack[stackp] = next(stack[stackp-1])` but if StopIteration exception is raised in part 2: pc += N |

### Jumping

| Macro | byte code |
| ------ | --------- |
| `JUMP_ABSOLUTE     N` | `pc = N` |
| `JUMP_FORWARD      N` | `pc += N` |
| `POP_JUMP_IF_TRUE  N` | `if stack[stackp] is True, pc = N` (always stackp -= 1) |
| `POP_JUMP_IF_FALSE N` | `if stack[stackp] is False, pc = N` (always stackp -= 1) |

### Calling functions

| Macro | byte code |
| ------ | --------- |
| `CALL_FUNCTION N` | first operand byte is a count of the position arguments; second operand byte is a count of the keyword arguments; pops all function arguments off the stack to store them into the co_varnames tuple, and pops off the the function itself; The function should leave its answer on the top of the stack |
| `RETURN_VALUE` | Return to the location that called this function |
| `YIELD_VALUE` | Yield to the location that called this function | 
