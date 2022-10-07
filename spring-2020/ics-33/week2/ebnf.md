# EBNF: A notation to describe syntax

## Introduction

EBNF is a notation for formally describing syntax: how to write the linguistic features in a language.

Writing EBNF descriptions is similar to writing programs

## Language and Syntax

Higher level languages started showing up in the mid-1950s

Backus invented a notation (based on the work of logician Emil Post) that was simple, precise, and powerful enough to describe the syntax of any program- ming language.

The linguist Noam Chomsky worked on describing the syntactic structure of natural languages.

## Rules and descriptions

An EBNF description is an unordered list of EBNF rules. Each EBNF rule has three parts: a left–hand side (LHS), a right-hand side (RHS), and the $\Leftarrow$ character separating these two sides; read this symbol as “is defined as”.

| Rule | Description |
| ---- | ---- |
| Sequence | Items appear left-to-right; their order is important |
| Choice | Alternative items separated by $\vert$; their order is unimportant |
| Option | The optional item is enclosed between $\left[ \text{and} \right]$; the item can be included or discarded |
| Repetition | The repeatable item is enclosed between $\left\{ \text{and} \right\}$; the item can be repeated **0** or more times |

## Matches

To prove that a symbol is legal according to some EBNF rule, we must match all its characters with all the items in the EBNF rule, according to that rule’s description.

This can be done in the following ways

- Verbal proofs (english)
- Tabular proofs
- Derivation Trees

## Equivalent descriptions

Two EBNF descriptions are equivalent if they recognize exactly the same legal and illegal symbols.

This is not necessarily a binary relationship. One rule can be equivalent to another rule, the the inverse relationship is not necessary true

## Syntax vs. Semantics

EBNF descriptions specify only syntax: the form in which something is written. They do not specify semantics: the meaning of what is written.

Two semantic issues are important in programming languages:

- Can different symbols have the same meaning?
- Can one symbol have different meanings?

Different symbols can have the same meaning and one symbol can have different meanings depending on its context

## Recursive EBNF

Recursive EBNF descriptions can contain rules that are “directly recursive” or “mutually” recursive: such rules use their names in a special way

A directly recursive EBNF rule uses its own name in its definition: the RHS of the EBNF rule refers to the name of its LHS

Recursion can always replace repetition, but the converse is not true, because recursion is more powerful than repetition.

## EBNF in Python documentation

There are a few different typographic conventions used in the EBNF lecture, compared to the EBNF used in actual Python Documentation.

1. Write <= (separating LHS from RHS) as ::=
2. Italicized names (of rules) are just written as names
3. Boxed characters (which stand for themselves) are written within quotes
4. () do not stand for themselves; they are used for grouping (see rule 5)
   write "(" and ")" for parentheses in the EBNF used for Python Documentation
5. {item} is written as item*; {item1 ... itemN} is written (item1 ... itemN)*
6. Writing + superscript means repeat 1 or more times


