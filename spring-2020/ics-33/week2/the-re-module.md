# The RE module

The functions discussed in this lecture operate on a regular
expression pattern (specified by a string) and text (also specified by a
string).

We will omit discussing/using the `[,flags]` option in this discussion.

## Workflow

1) define a regular expression
2) call a re function (match) on it and some text
3) check whether the pattern matches the text
4) do something with (print) the captured groups (by number or name)

## Functions

| name | action |
| --- | --- |
| compile | creates a compiled pattern object |
| match |  matches start at the text's beginning |
| search | matches start anywhere in the text |
| split | like the text.split(...) method,but using a regular expressions pattern to determine how to split the text |
| sub | If there is a match between pattern and text replace, otherwise return the text unchanged |
| findall | Returns a list of string/of tuples of string (the groups), specifying matches |
| finditer | Returns a iterable of the information returned by findall (ignore this one) |
| subn | same as sub but returns a tuple |
| escape | string with nonalphanumeric back-slashed |

## Pattern objects

regex (compiled pattern) object methods (see the compile method above, which produces regexes) are called like `c = re.compile(p)`. It is then efficient to call `c.match(...)` many times. 

Calling `re.match(p,...)` many times with the same pattern re-compiles and matches the pattern each time `re.match` is called.

Useful if the pattern will be matched against multiple times.

Each of the re functions above has an equivalent method using a compiled pattern to call the method

## Match objects

Match objects record information about which parts of a pattern match the text.

The functions and methods above will either return a match object(s) if there were matches found, or will return None if no matches were found

Match objects can also store information about groups. That information is accessible from the `.groups()` method.

## Loose ends

1) Use raw strings to write expression patterns as arguments
2) Can prepend `**` to a dictionary as pass the dict contents as named arguments
3) RE patterns are translated to non-deterministic finite automaton for matching. The exact algorithm is called Thompson's algorithm