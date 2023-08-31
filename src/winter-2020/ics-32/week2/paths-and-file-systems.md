# Paths and file systems

## What is a file system?

A file system is software that manages how information is stored on a storage device such as a hard drive or a USB stick.

The file system itself is mostly unconcerned with what's in each file, except for the metadata associated with the file.

Metadata includes

- file owner
- file access
- last modified time

## Paths

The filename is one piece of metadata associated with each file. But there's more to identifying a file than its name.

File systems are quite often a hierarchy of directories, with each directory containing both files and other directories.

We have to specify not only the file's name, but also where the file is stored in that hierarchy; without knowing more about the location of the file, the file system won't easily be able to find it. The location of a file is identified uniquely using a path.

| Path Style | Example |
| ---- | ---- |
| Windows | `D:\Examples\32\data\myfile.txt` |
| Unix | `/home/thornton/Examples/32/data/myfile.txt` |

## Finding what you need in the Python standard library

If we want to write Python programs that work with file systems correctly regardless of operating system, as you're doing in Project #1, you're best off using the right kinds of tools for the job, so that you won't find yourself making assumptions.

There are several modules in the Python Standard Library that should stand out as you look through the list. One whole section of the library contains tools used for **File and Directory Access**

## Manipulating paths using Python's `pathlib`

Don't worry if you don't understand everything you're seeing, and don't worry if you feel like a fish out of water because you've never read documentation like this before. See what things resonate and just get a broad mental picture of what's available.

### Creating a path object

Path objects represent paths on a file system. They aren't files and they aren't strings; they're paths, which means they are explicitly intended to represent the way that a file system keeps track of where a file is.

```Python
>>> from pathlib import Path
>>> p = Path('D:\\Examples\\data')  
>>> p  
WindowsPath('D:/Examples/data')
>>>
>>> type(p)  
<class 'pathlib.WindowsPath'>
```

Creating a Path object automatically gives you the right kind of Path object depending on what operating system you're running.

The various Path types endeavor to hide as many of the differences between file systems as possible

### What can you do with path objects?

To manipulate paths, you often find yourself combining them together. That's easily done using the Path type; the `/` operator, when used between two Paths, combines the two paths together into a single one

```Python
>>> p = Path('D:\\Examples\\data')  
>>> q = p / Path('myfile.txt')  
>>> q  
WindowsPath('D:/Examples/data/myfile.txt')
>>>
>>> r = p / 'test.txt'  # can be done with str too
>>> r  
WindowsPath('D:/Examples/data/test.txt')
```

If you want to know if a Path object represents something that actually exists on your hard drive, you could just ask it.

```Python
>>> p.exists()  
True
```

If you want to know if it's a directory or a file, you can ask it those things, as well.

```Python
>>> p.is_file()  
False  
>>> p.is_dir()  
True
```

If it's a file, you might like to open it; that's supported, too.

```Python
>>> f = q.open('r')  
>>> f.readlines()  
['Alex\n', 'is\n', 'happy\n', 'today']  
>>> f.close()
```

If it's a directory, you might like to know what's in it.

```Python
>>> list(p.iterdir())  
[WindowsPath('D:/Examples/data/myfile.txt'), WindowsPath('D:/Examples/data/test.txt')]
>>> for x in p.iterdir():  
       print(x)  
  
D:\Examples\data\myfile.txt  
D:\Examples\data\test.txt
```

## Why use `pathlib` and not `os.path`?

The pathlib library is a relatively recent addition to the Python Standard Library, having been added in version 3.4. Prior to that, there was a library — which still exists, but is a lot less useful — called os.path, which provides functions that manipulate strings instead of Path objects

But using strings and manipulating them with os.path nonetheless leaves you with a lot of room to make mistakes. Strings are simply text; you can store any text you want in a string, whether it's a valid path or not.

Use a tool that was built for the job at hand.

