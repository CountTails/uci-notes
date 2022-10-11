# Lecture 5: JavaScript

## Language roles

- HTML is a markup language. It specifies how content is rendered
- CSS is a styling language. It specifies the visual style of content
- JavaScript is a programming language. It allows for dynamically manipulate content

## Why JS?

- Make pages
	- more dynamic
	- more personalized
	- interact with other sources

### Other web languages

- Ruby: via ruby on rails
- Python: via Django or web2py
- Typescript: JS with types
- Kotlin: compiles to JS
- Any language can be used to create a dynamic website

## History of JS

### Pre release

- First shipped with Netscape Navigator 2.0 in September 1995
- Name is a marketing ploy that piggy-backed on Java's popularity

### Different implementations

- Microsofts JScript engine
- Adobe's flash
- Even browser implementations differed slightly

### Standardization

- JS is alsr referred to as ECMAScript
- ECMAScript sets the standards for JS
- JS engines and browsers continually play catchup

## Java vs. JavaScript

| JavaScript | Java |
| ---- | ---- |
| interpreted | compiled |
| executed by a JS engine | run in a JVM |
| engine runs the same code that was written | Bytecode is not human readable |
| standardized through ECMAScript | "Write once, deploy anywhere" |
| Debugging done at runtime | Bugs found at compile time |
| Prototype based | Class based |
| Used in every browser | Requires a plugin to run in browser |

## JS a just programming language

### Printing

```JavaScript
console.log("Hello, world!");
```

- Not shown in browser, shows up in the JS console

### Syntax

- Has function and objects
- Look like their Java counterparts, but act differently

### Variables

- Dynamically types
- Unassigned variables have the value `undefined`

```JavaScript
var x = 'hello'; //value is a string console.log(typeof x); //string

x = 42; //value is now a Number console.log(typeof x); //number

var hoursSlept; 
console.log(hoursSlept);
```

### Types

```JavaScript
console.log('40' + 2) // '402'
console.log('40' - 4) // 36
```

- Types are loosely defined. JS will do type conversion in order to make sense of an expression
- For checking equality `==` will allow type conversion and `===` is strict with types

### Loops and conditionals

- Has the standard `if-else if-else` patther
- Has the standard `for` and `while` loops

### Methods

- Called with the dot notation
- Arrays(can contain mixed types) have their own methods

### Objects

- An *unordered* set of keys and value pairs
- Like a `HashMap` in Java or a `dict` in Python
- Sometimes called associative arrays

#### JSON

- Short for *J*ava*S*cript *O*bject *N*otation
- Used in many APIs to send/receive data

#### Properties

- Can be referenced with the `array[]` syntax
- Use to look up and assign values
- Keys not in the object have `undefined` value
- Can also be referenced with the dot notation

### Functions

- Are like static methods in Java
- Have no access modifier, return type and parameters have no types
- All parameters are optional
- Functions are objects

### Anonymous variables

- Pass in a value that is not named
- Can also be functions, which can be passed as parameters

### Callbacks

- A function that is passed to *another* function for it to "call back to" and execute
- The array methods `forEach`, `map`, `filter`, `reduce` all take a callback function