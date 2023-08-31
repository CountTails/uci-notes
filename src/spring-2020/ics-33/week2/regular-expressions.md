# Regular Expressions

Regular Expressions are patterns that we can specify (as strings) and use to
search for and replace text in other strings (often the sequence of strings that
makes up the lines in a file).

## Matching

Characters generally match themselves, except for the following...

- `.`	Matches any single character (except newline: `\n`)
- `[]`	Matches one character specified inside square brackets `[]`; e.g., `[aeiou]`
- `-` Matches one character in range inside `[]`: e.g., `[0-9]` matches any digit. To match any letter (upper/lower case) or digit we write `[A-Za-z0-9]`
- `^` Matches any one character NOT specified inside `[^]`; e.g., `[^aeiou]`. We can use ranges here too, to specify the characters NOT to match
- `^` matches beginning of line (except when used in `[^]`)
- `$`	matches end of line (except when used in `[]` or `[^]`)

## Parenthesis

Parentheses are used for 
   
1) Grouping (as they are in arithmetic expressions/formulas)
2) Remembering the text matching sub-patterns (called a "Capturing Group"). These capturing groups are mostly relevant when we examine the functions in the Python re module.

## Context

1) `-` matches itself if not in `[]` between two characters: e.g., `[-+]` vs. `[a-z]`
2) Special characters (except `\`) are treated literally in `[]`: e.g, `[.]` matches only ".". To match the \ special character write `[\\]`. Writing `[a-z]` matches all lower-case characters; `[a\-z]` matches a, -, or z.
3) Generally, if interpreting a character makes no sense one way, try to find another way to interpret it that fits the context

## Escape Characters with Special Meanings

| Symbol | Meaning |
| --- | --- |
| \ | Used to specify a special character |
| \\t | tab |
| \\n | newline |
| \\r | carriage returns |
| \\f | form feed |
| \\v | vertical tab |
| \\d | digit |
| \\D | non-digit |
| \\s | white space |
| \\S | non-white space |
| \\w | alphanumeric (or underscore) |
| \\W | non-alphanumeric |



