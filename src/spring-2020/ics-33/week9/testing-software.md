# Testing software

## Testing

Testing is the process of running software looking for errors (meaning actively trying to make the program fail by testing it in many -even unexpected- ways)

Professional software testers acquire great skill and intuition at thinking-up "good" inputs on which to test programs. They are valued members of a product team.

It is better to have the mistake pointed out by your coworker than by your boss (or a customer). No programmer wants to believe that his/her code contains errors; but they all do contain errors.

In black-box testing, testers write test-cases based only on the specifications for what the code is supposed to accomplish

In white-box testing (maybe it would be better to call it transparent-box testing), testers
write test-cases based both on knowledge of the specifications and the code itself

Industry testers often write/use long scripts when they regression test programs: each time a program is changed, the tester executes the same script to ensure that no new bugs were introduced (the code must still work as it always has)

Integration tests determine whether software components, written and tested separately (in unit tests), work together correctly in a program. It is much easier to test/debug each component by itself, than in a system comprising many components.

## Correctness by Testing

To show you the weakness of testing (when students know the tests), imagine I
wrote the following tests for a student-written "sort" function (not using
Python's sort function to test the students' code).

```Python
e-->sort([])-->[]
e-->sort([4, 1, 2, 3])-->[1, 2, 3, 4]
e-->sort([8, 5, 3, 1, 4])-->[1, 3, 4, 5, 8]
```

Knowing these three tests, a student could write his/her sort function as

```Python
def sort(alist):
    if alist == []:
        return []
    if alist == [4, 1, 2, 3]:
        return [1, 2, 3, 5]
    if alist == [8, 5, 3, 1, 4]:
        return [1, 3, 4, 5, 8]
```

Which obviously isn't a valid sort function, but passes all the tests!

Probably the best test would use a special function; the 1-line nature of
bsc-files would make this function difficult to write in a bsc file.

```Python
def build_random_sorted(n):
    if n == 0:
        return []
    x = [random.random()]
    for _ in range(n-1):
        x.append(x[-1] + random.random())
    return x
```

Then I could write the batch self-check test

```Python
c-->original = build_random_sorted(100)
c-->shuffled = list(original)
c-->random.shuffle(shuffled))
==-->sort(shuffled)-->original
```

which finally would be difficult to "spoof" in the ways shown above.

## The `unittest` class

To test software, we must write both the tests and the software. Typically a programmer should understand the problem first, and then write the tests based on this understanding of the problem, and then write the code.

```Python
import unittest

class Sorting(unittest.TestCase):
    
    def setUp(self):
        self.original = [4, 1, 2, 5, 3] # Could build randomly ordered list
        self.sorted   = list(self.original)
        list.sort(self.sorted)          # test whether this sort function works
                                        # same as self.sorted.sort()
    def test_order(self):
        self.assertTrue(self._is_ordered(), 'List is not in order')
    
    def test_permutation(self):
        self.assertCountEqual(self.original,self.sorted,
                              'List is not a permutation of the original')
    
    def _is_ordered(self):
        for i in range(len(self.sorted)-1):
            if self.sorted[i] > self.sorted[i+1]:
                return False
        return True
```

The standard form of a typically unittest is a setUp method (we can omit this method, but if it appears it must appear with exactly this name, in the correct case -upper case "U", lower case everything else): it overrides a setUp method that is defined in TestCase that does nothing)

Tests are a series of methods whose names start with "test" (test_order, test_permutation)

When run, Python calls `unittest.main()` automatically. This function finds all the methods in the class whose names start with "test" and calls those methods, but first, before calling each method, it calls setUp.

Here is a table of the most useful assertions and what they test. A last string
argument can be added to each, which will be printed if there is a failure).

| Assertion | Test |
|----------|------|
| `assertTrue(x)` | `bool(x) is True`   |
| `assertFalse(x)` | `bool(x) is False`   |
| `assertEqual(a, b)` | `a == b`  |
| `assertNotEqual(a, b)`| `a != b ` |
| `assertCountEqual(a, b)`| a and b have the same elements and the same number of e ach, regardless of their order |
| `assertIs(a, b)`	| `a is b` |
| `assertIsNot(a, b)	` | `a is not b` |
| `assertIsNone(x)`	| `x is None` |
| `assertIsNotNone(x)`| `x is not None` |
| `assertIn(a, b)`	 | `a in b` |
| `assertNotIn(a, b)`| `a not in b` |
| `assertIsInstance(a, b)`| `isinstance(a, b)` |
| `assertNotIsInstance(a, b)` | `not isinstance(a, b)` |
| `assertMultiLineEqual(a, b)` | strings |
| `assertSequenceEqual(a, b)` | sequences, and are equal |
| `assertListEqual(a, b)` | lists, and are equal |
| `assertTupleEqual(a, b) ` | tuples, and and equal |
| `assertSetEqual(a, b) `  | sets/frozensets, and are equal |
| `assertDictEqual(a, b) ` | dicts, and are equal |
| `assertRaises(exception,f,*args,**kargs)` | checks if a required exception was raised |
| `assertAlmostEqual(a, b)`	    | `round(a-b, 7) == 0`   (the same to the 7th decimal) |
| `assertNotAlmostEqual(a, b)`  | `round(a-b, 7) != 0 `  |
| `assertGreater(a, b)`	| `a > b` |
| `assertGreaterEqual(a, b)` | `a >= b` |
| `assertLess(a, b)` | `a < b` |
| `assertLessEqual(a, b)` | `a <= b` |

