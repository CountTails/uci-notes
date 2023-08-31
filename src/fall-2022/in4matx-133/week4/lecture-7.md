# Lecture 7: Package management and TS

## Package management

### Importing packages so far

- Done through content delivery networks (CDN)
	- Pasting a `<script>` tag into the `<head>` of our HTML files
- Downloading from source

### Package managers

- Provide an easy way to install software
	- Both programs and libraries
- Simplify the process of updating software to the latest version
	- Challenge: packages may depend on other packages, which often vary in version from what another package might use
- App stores, but free!

#### OS-level package manager

- Unix (apt-get)
- MacOS (homebrew)
- Windows (chocolatey)

#### Language-level package managers

- pip (Python)
- RubyGems (ruby)
- npm (JS)
- yarn (also JS)

#### Why so many?

- Value in keeping language or domain-specific contexts
- Most are driven by community efforts
- Can still be a mess at times

#### `npm` vs `yarn`

- `npm` was introduced as the package manager for node.js
	- Has a lot of useful libraries
	- Occasionally used to install system-wide software
	- Package and library can be used interchangeably
- `yarn` intentially uses the same concept as npm
	- Faster, more secure
	- Developed by FaceBook

### `nmp` concepts

- `package.json` file
	- the libs installed in a given project
	- kept in the root folder of your project by convention
- `package-lock.json` file
	- Used to keep track of the specific version of other libs that the libs you've installed require
	- "the libraries of your libraries"
- `node_modules` folder
	- all the libs installed in your project
	- 

#### `npm` and `git`

- `.gitignore` file
	- Specifies what files should *not* be committed to your repo
- *Do* commit the `packge.json` and `package-lock.json` files
	- Allows someone else to install the same versions you have
- *Do not* commit the `node_modules` directory
	- Would by redundant; `package.json` already specifies which libs and their versions
	- Add to the `.gitignore` file

#### Using `npm`

- Runs from the command line
- Use from the root directory of your project
- To install a package `npm install <package-name>`
	- Will install into `node_modules` directory
- To update a package `npm update`
	- Important for patching vulnerabilities
- To install a *global* package `npm install -h <package-name>`
	- Usually CLI programs
	- Often redudant with OS-level package managers
- `package.json`
	- Just don't touch it

## TypeScript (TS)

### Installing

- `npm install -g typescript`
- Installs `tsc`,  the TS transpiler
- Can also be done via an OS-level package manager

### About

- Released by Microsoft in 2012
- Introduces static types, type checking, and objects (all optional)
- A strict superset of JS
	- Syntactically correct JS will also run in TS
	- TS can use JS libraries
- "Transcompiles" or "Transpiles" to normal JS
	- Takes TS code and converts it to equivalent JS code

#### `hello.ts`

```TypeScript
var courseNumber:number = 133;

console.log('Hello, IN4MATX ' + courseNumber + '!');
```

#### `tsc hello.ts` -> `hello.js`

```JavaScript
var courseNumber = 133;  
console.log('Hello, IN4MATX ' + courseNumber + ‘!');
```

### Typing

- Pre-defined types 
	- Number
	- Boolean  
	- String  
	- Void (generally a function return type) • Null  
	- Undefined  
	- Any
- Typing is optional
- Functions can specify arguments types and returns types
- Types enable error checking

```TypeScript
var courseNumber:any = 133; 
var courseNumber = 133;

console.log('Hello, IN4MATX ' + courseNumber + ‘!');

function area(shape: string, width: number, height: number){  
	var area = width * height;  
	return "I'm a " + shape + " of area " + area + "cm^2."; 
}

// "better" function
function area(shape: string, width: number, height: number):string {
	var area:number = width * height;
	return "I'm a " + shape + " of area " + area + " cm^2.";
}
```

### Classes

- Just like in Java, with a constructor and methods
- Will make  a function() with prototype methods when transpiled

```TypeScript
class Shape {
	area: number; 
	color: string; 
	name: string;

	constructor (name: string, width: number, height: number ) { 
		this.name = name
		this.area = width * height;
		this.color = "pink"; 
	};

	shoutout() {  
		return"I'm" + this.color +" "+ this.name + "with an area of "+ this.area + " cm squared.";
	}; 

};

var square = new Shape("square", 30, 30);
```

```JavaScript
//shape.js  
var Shape = /** @class */ (function () {
	function Shape(name, width, height) { 
		this.name = name;  
		this.area = width * height; 
		this.color = "pink";
	};  

	Shape.prototype.shoutout = function () {
		return "I'm " + this.color + " " + this.name + " with an area of " + this.area + " cm squared.";
	};
	return Shape;
}());

var square = new Shape("square", 30, 30);
```

### `tsconfig.json`

- Indicates a TypeScript project
	- Indicates what files or folders to transpile
	- Pick transpiler options
	- Specify what version of ECMAScript to transpile to
- `tsc --project tsconfig.json`

## Benefits of TypeScript

- Type checking
	- Transpiler can show warnings or errors *before* code executes
	- Allows editors to do autocompletes
	- Easier to refactor code
- Object-oriented
	- Easier to manage/maintain large code bases
	- Simple enough to use; same principles of Java and other OO languages

## Drawbacks of TypeScript

- Transpiling is occasionally a pain
	- Slow for large projects
- Might not work with new JS libs out of the gate
	- Did not interact with Angular and React nicely for a while

## Other JS transpilers

- Dart
	- By Google
	- Introduces typing and similar object-oriented practices
	- Transpiles to JS with dart2js
- CoffeeScript
	- Open source development
	- "Python like" variables, loops, and conditionals
	- Mostly meant to improve the look of JS code

## Some more TS details

### Type declaration files

- Types get stripped when compiling, so a type declaration file can be created
	- Important when someone uses your code as a library
	- Declaration file helps their code check types in your libraries
	- `tsc --declaration test.ts`
- Install typing declarations for libaries using npm

```TypeScript
//test.ts

function area(shape: string, width: number, height: number):string { 
	var area:number = width * height;  
	return "I'm a " + shape + " of area " + area + " cm^2.";
}  
document.body.innerHTML = area('square', 15, 15);
```

```JavaScript
// transpiled test.js

function area(shape, width, height) {  
	var area = width * height;  
	return "I'm a " + shape + " of area " + area + " cm^2.";
	}  
document.body.innerHTML = area('square', 15, 15);
```

``` TypeScript
// generated test.d.ts

declare function area(shape: string, width: number, height: number): string;
```

### Interfaces

Descibes the "inputs" and "outputs" of an object

```TypeScript
interface Shape {
	name: string;  
	width: number;  
	height: number;  
	color?: string; // ? Specifies an "optional" value
}

function area(shape : Shape):string {  
	var area = shape.width * shape.height;
	return "I'm " + shape.name + " with area " + area + " cm squared"; 
}

console.log(area({name: "rectangle", width: 30, height: 15})); console.log(area({name: "square", width: 30, height: 30, color: "red"}));
```

### Inheritance

Classes and interfaces can be extended

```TypeScript
class Shape3D extends Shape {
	volume: number;

	constructor (name: string, width: number, height: number, length: number ){ 
		super( name, width, height ); //calls base class constructor
		this.volume = length * this.area; };

	shoutout() { //overrides the base class
		return "I'm " + this.name + " with a volume of " + this.volume + " cm cube."; 
	}

	superShout() { //calls base class shoutout method
		return super.shoutout(); 
	}

}

var cube = new Shape3D("cube", 30, 30, 30); console.log( cube.shoutout() ); console.log( cube.superShout() );
```

### Generics

Work the same as Java generics

```TypeScript
function identity<T>(arg: T): T {
	return arg; 
}

let output = identity<string>("myString"); // type of output will be 'string'  
let output = identity("myString"); // type of output will be 'string'
```