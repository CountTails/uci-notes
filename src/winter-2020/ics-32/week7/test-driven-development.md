# Test driven development

## What is test driven development?

Test-driven development encourages you to build a program one small feature at a time, taking small steps from one piece of stable ground to another.

It involves using the test as a guide to indicate when you're done. At this point, you'll have a feature that is complete and tested, which means you've taken a step on to stable ground

You'll be able to run repeatedly to ensure that your feature still works as you make other changes and add new features to your program.

Because it's so different from the programming style we're accustomed to, it takes a little time to adjust and get into the rhythm of test-driven development.

It doesn't take long to get adjusted, and the benefits are higher-quality code and the ability to make changes to your program with confidence.

## The steps

1) Pick a new feature that you want to implement
2) Write a test
3) Run the test, even though you know it will fail when you do.
4) Write the *mimimum* amount of code that will make the test pass
5) Run the test again. Hopefully, it will pass
6) Now that you have your new feature implemented, see whether there are any ways to improve the design of the code
7) Now start this process again with another feature

## What is unit testing?

Unit testing is one kind of testing that you might perform on a program you're writing, with the goal of verifying that small, individual pieces of its behavior are correct.

We focus our attention not just on individual modules in a Python program, but on individual behaviors; moreso than just individual functions, we focus on each way that the functions may behave.

## What tools do we need?

Performing unit testing is a valuable thing to be able to do; with it, we can gain a level of confidence in the quality of code we write that is harder to achieve without it.

It's boring, tedious work — typing in some expressions, then verifying that the output is what we expected. There must be some way to help with the following

- Reduce the chance of making an error while testing
- Re-run every single test each time we test

Boring, tedious work is that it tends to be the kind of work that is most amenable to automation. So, perhaps we can write a program that can test my other program.

A unit testing framework is a library that helps us to write programs like this.

- Individual tests are simply methods in a class.
- Kinds of tests can be grouped into modules.
- If we use unittest's tools for comparing our output to what is expected, unittest will print its output in a way that makes clear the most important things about each failure

## What if I still discover a bug?

Naturally, using a test-driven development process does not guarantee that a program will work, for a variety of reasons, even if you have no failing unit tests.

Unfortunately, there will still be bugs. The question is what should be done when you discover one.

1) Write a test that reproduces the bug and asserts that the unintended behavior
2) Run the test to verify that it fails because of the bug. If it doesn't, go back to step 1
3) Find and fix the bug as you would normally.
4) Run all of the tests to verify that the bug is fixed and that all of the other tests still pass, as well.

## Testing side effects

Where test-driven development excels most is in testing functions that are pure. Pure functions are those take inputs and give outputs that are calculated only from those inputs; they're like mathematical functions.

However, functions do quite often have side effects, so it's reasonable to wonder how you might test them.

We can't avoid writing functions with side effects, which means we need to consider how we might write unit tests for them.

- Isolate the part of the problem that requires side effects as best you can
- When you have a side effect that you want to test, you can often test it by checking what happened afterward.
