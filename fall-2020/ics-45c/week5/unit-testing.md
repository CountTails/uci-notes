# Unit testing

## What is it?

- Testing of individual
    - Functions
    - Classes
    - Behaviors
- Tests separately form `main()`

## How to do it?

- Visualize function / method / class
- Use a new source file in `test` directory
- Write tests
    - Use names to describe tests
    - Keep tests small and simple
    - `TEST(suite_name, test_name){ ... }`
    - `OK` when expectations are met
    - `FAILED` when expectations are not met
    - Keep tests self-contained
        - Clear name
        - A single behavior
    - `ASSERT` vs `EXPECT`
        - Assert: stop testing if failure occurs
        - Expect: report failure, continue testing
- Tests that depend on baked in behaviors are bad
    - Move what is hidden to be visible
    - `static`: belongs to a class as a whole
    - `constexpr`: evaluated at compile time

## A word on namespaces

- Delimited by
    - Block statements
    - Explicitly placed in the unnamed namespace (hidden from the linker)

