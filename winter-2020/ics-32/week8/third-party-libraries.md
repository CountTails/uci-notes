# Third party libraries

## When the standard library falls short

Python's standard library is an extensive, varied set of tools that are provided to us automatically (and free!) when we install Python.

The goal of a standard library in a programming language is to provide the kinds of functionality that are not inherent in the language, but that nonetheless address common needs that a broad group of users of that language will have.

Third-party libraries have emerged to fill the gaps, where a library is written to serve a narrower purpose, but is then shared with the community under various terms.

## Installing a third party library

We'll first need to install it; since it doesn't come with Python, we'll need to find a way to make it available in our Python installation.

Of course, the simplest way to do this is just to obtain a `.py` file and include it in the same directory as our own code, but this approach has its limitations:

- difficult to easily tell the difference between code that's part of your own program and code that's part of a third-party library
- large and complex enough that they're not just a couple of `.py` files
- features are added and bugs are fixed. You'll want to be able to benefit from these changes, but managing those changes

We should tend to want our third-party libraries to be more like the ones that are built into Python. We just say `import <library>` and Python will find it for us

Fortunately, the tools for setting that kind of thing up have improved a lot in recent years, with everything we need built into our Python installation.

### Virtual environments

Installing third-party libraries directly into our Python installation is a generally bad idea.

Python supports the ability to set up virtual environments, which are completely separate, self-contained Python installations that you place into a chosen directory

Activating that environment will cause you to work from that Python installation instead of your global one.

Setting up a virtual environment requires a module called venv, which is part of Python's standard library.

```bash
python3 -m venv. && source bin/activate
```

Installing a python package requires a tool called pip, which is also part of the Python's standard library

```bash
pip install <library>
```

## Using a third party library

Assuming the commands earlier succeeded, you are in business. Simply write yourself a `.py` and import your new third party library to use it.

