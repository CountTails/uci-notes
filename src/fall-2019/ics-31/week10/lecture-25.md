# Lecture 25

## Reading files

Reading from files can provide a convienient way to quickly provide input to a program

There are several methods available to read from files

- `readline()`: read and return the next line; empty string if already at end of file
- `read()`: read entire file into a single string
- `readlines()`: read entire file into a list of string, where each string is a single line

All lines read leave the newline (`\n`) character at the end of each string

## Writing files

A single `write` method is available to write data to a file

The `write` method does not append a newline (`\n`) character like the `print` function does, it will need to be added manually

## Interacting with files systems

### File modes

| Mode | Description | Allow read? | Allow write? | Create missing file? | Overwrite file? |
| --- | --- | --- | --- | --- | --- |
| `r` | Open file for reading | Yes | No | No | No |
| `w` |  Open file for writing. If the file does not exist then it is created. If the file exists, its contents are overwritten | No | Yes | Yes | Yes |
| `a` | Open file for appending. If the files does not exist then it is created. Writes are added to the end of the file | No | Yes | Yes | No |

### File safety

Files can be accessed with the `open()` function. It takes a string representing the path of the file to open. It returns an object that can interface with the file.

Open files need to be closed when we are done using them. This is done using the `close()` method.

Even if the Python interpreter will clean up open resources when it shuts down, long running Python programs should be mindful to close files to prevent resource leaks.