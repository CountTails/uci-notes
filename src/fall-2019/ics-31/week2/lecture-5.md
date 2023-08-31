# Lecture 5

## Modules

> Python modules are toolboxes for programming lumberjacks

They make coding much easier

Make it so that the entire program does not have to be written from scratch (save time)

Python comes with a set of modules called **the Standard Library**

Each module is loaded with values, objects, and functions related to a specific task

### Import statement and the dot operator

Import a module with an import statement `import <module>`

To use a specific tool from a specific module, you'll need to tell the interpreter where to find it using the dot operator

`math.sqrt(169)`

- text before the dot specifies the module
- text after the dot specifies the variable, function, or object

Alternatively, if you know what specific tools that you'll need you can import them specifically to avoid using the dot operator

`from math import pi, sqrt`

`pi` and `sqrt()` can be used with the math prefix

### Module summary

Modules are used to group functions

Import a module to make its functions available

Any file ending in `.py` can act as a module

`import` runs all the code in the file (only the first time)

if we import a module by name (`import module`), we can access its functions using `module_name.function_name`

if we import parts of a module (`from module_name import function_name`), we can access those parts as `function_name`

### `__name__`

Every module has a name (usually the name of the file without the `.py` part)

Python sets a special **dunder** variable (double under score) `__name__` to the name of the module if it is import or to `'__main__'` if it is executed from the command line

### `'__main__'`

Helps control which statements are run when a module is imported

```python
# code in this branch will only be executed
# if this python file was executed from the 
# command line
if __name__ == '__main__':
	main()
```

### Module initialization

On the first import, a module is initialized by executing the code in the module once

On subsequent imports, the module is not executed again

## Modules - Math and Text

### Math

Collection of commonly used math functions. Full listing [here](http://docs.python.org/3.3/library/math.html)

#### Built in functions

statements with function calls get replaced by the value **return**ed by the function

imagine the the function call disappears and in it's place is the return value

### Text

#### Unicode characters

a unicode string is a sequence of code points

code points can have the values in $[0, 1114111]$

unicode is just an integer representation of what the device should render

rules for translating a unicode string to a sequence of bytes is called an **encoding**

#### Escape sequences

A sequence of characters that does not represent itself

Translated into another character or a sequence of character

#### Raw strings

String literals that ignore escape sequences

Created by prefixing a string literal with an `r`

```python
my_raw_string = r'This is a \n \'raw\' string'
```

