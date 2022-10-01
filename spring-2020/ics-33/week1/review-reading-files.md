# Review: reading files

## Simple and efficient file reading

- various options for reading files exist
- can be characterized by simplicity and efficiency
- avoid the `read()` and `readlines()` methods
- iterate over the file object itself (using a `for` loop)

## Simple and space efficient code

The simplest and most efficient way to read a file is by iterating over the "open" file object

```Python
for line in open(file_name): 
	process(line)
```

Recall that there are no *mutator* methods with strings, so its methods produce new `str` objects.

- Correct

```Python
for line in open(file_name):
	line = line.rstrip('\n')
	process(line)
```

- Incorrect

```Python
for line in open(file_name):
	line.rstrip('\n') # LINE HAS NO EFFECT!
	process(line)
```

The code fragments are all space efficient because at any time Python stores only one line of the file in memory

We should **NOT** write code that stores all the lines of a file becuase it is not space efficient. 

If the lines can be processed *independently* of each other, iterating over the file object is better than storing the entire contents of the file.

Side note: context managers are nice. Use them

```Python
# the file will be closed even if 
# something goes wrong 
with open(file_name) as open_file:
	for line in open_file:
		process(line.rstrip('\n'))
```

## Less simple and less efficient

Consider the following contents to be part of a file

>Line 1
>Line 2
>Line 3

A less simple and less efficient way to process the file is

```Python
for line in open(file_name).readlines():
	process(line.rstrip('\n'))
```

Notice that this `for` loop is longer than the previous exampe. The code is more wordy, but achieve the same thing in both code fragments

This loop is also less efficient because the entire contents of the file are stored in memory.

If we use the `read()` method things get worse

```Python
for line in open(file_name).read().split('\n'):
	process(line)
```

This loop is even more complicated and achieve the exact same thing as the other loops.

## Reading files and parsing their contents

In many files, each line is a record: a fixed number of fields, with possibly different types, separated by a special character. 

To process each record, we need to do the following:

1) read its line
2) separate its field of values (each value is still a string)
3) call a conversion function for each string to get its value

The goody module contains a `parse_lines` function that easily supports reading records from files as specified above

```Python
def parse_lines(open_file, sep, conversions):
	for line in open_file:
		yield [
		conv(item) for conv, item in
		zip(
			conversions,
			line.rstrip('\n').split(sep)
			)
		]
```

- `sep` is the special character used to separate the fields in the record
- `conversions` is a tuple (or list) of function objects to be applied in sequence to the string values extracted from the separated fields
- `open_file` is the file to extract records from

## Text and binary files: pickling

Storing information as binary files is more space and time efficient than storing the same information as text

The standard library pickle modules provides tools for pickling between ASCII and binary

- `pickle.dump(object, open_file)` to binary
- `pickle.load(open_file)` from binary

Check the documentation for what is picklable. Attempting to picke unpicklable objects results in an exception.

## Question

### Question 1

Suppose that we want to process the lower case version of every word on every line (where the words on a line are separated by spaces) in a file named file.txt. Which of the following code fragments correctly does so? For those  
that don't, explain why they fail. For example, if the file contained the three lines:

>See spot  
 See spot run  
 Run spot run

```Python

for line in open('file.txt'):  
    for word in line.rstrip().lower().split():  
        process(word)  
```

- Succeeds

```Python
for line in open('file.txt'):  
    for word in line.rstrip().split().lower():  
        process(word)
```

- Fails. Raises Attribute Error because list has no attribute lower.

```Python
for line in open('file.txt'):  
    for word in line.lower().rstrip().split():  
        process(word)
```

- Succeeds  

```Python
for line in open('file.txt'):  
    for word in line.lower().split().rstrip():  
        process(word)  
```

- Fails. Raises Attribute Error because list has no attribute rstrip.

```Python
for line in open('file.txt'):  
    for word in line.split().rstrip().lower():  
        process(word) 
```

- Fails. Raises Attribute Error because list has no attribute rstrip.

```Python
for line in open('file.txt'):  
    for word in line.split().lower().rstrip():  
        process(word)  
```

- Fails. Raises Attribute Error because list has no attribute lower.

```Python
for word in open('file.txt').read().lower().split('\n'):  
    process(word)  
```

- Succeeds

```Python
for word in open('file.txt').read().split('\n').lower():  
    process(word)
```

- Fails. Raises Attribute Error because list has no attribute lower