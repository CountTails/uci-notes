# Concurrency (part 1)

## Concurrent programming

- Natural expression of many algorithms
    - GUI event handling vs. fetching from network
    - Work going on inside a fast-food restaurant
- More efficient program execution
    - Particularly on multi-processor machines
    - Realtime 3D graphics

### Levels of concurrency

- Instruction level (very common)
    - Two (or more) machine instructions may be executed simultaneously
    - Usually handled by an optimizing compiler
    - Accomplished by superscalar architecture with hyper-threading
- Statement level
    - Two (or more) statements may be executed simultaneously
- Unit level
    - Two (or more) subroutines may be run simultaneously
    - Usually provides the most payoff
- Program level
    - Two (or more) programs may be executed simultaneously
    - Usually handled by the operating system

### Symmetric units

- Also known as coroutines
- Requires explicit activation of other units
- When control resumes, it does so at place last terminated
- Units run in interleaved fashion as determined by the program
- May only be a single thread of control (parallelism is only simulated)

### Concurrent units

- Also known as threads or tasks
- May be multiple threads of control
- Units can execute simultaneously if possible
- Synchronization must prevent unintended simultaneous update/access to data

## Synchronization

### Mechanisms

- Semaphores (AKA mutex)
- Message passing
- Monitors
- Rendezvous (sync -> exchange data -> unsync)
- Threads with synchronized threads

### Support for concurrency

- In the language
    - Standardized, portable and integrated into the language
    - Complicates the language and may require fixes
- Not in the language
    - Usually done via an API library
    - Can improve with technology, dynamically implemented
    - May not be standardized, meaning non-portable or non-integrated