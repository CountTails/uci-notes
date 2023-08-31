# Lecture 10

## Reflection

### In programming languages

> The ability to inspect and even act on the code of the program

### Why?

- Common in program that examine or modify runtime behavior
- Relatively advanced feature
- A powerful technique that make impossible operations possible
- Can make use of external, user-defined classes by using fully qualified names

### Practical applications

#### Proxies

- Proxy of a large implementation to wrap a specific implementation
- Can override methods with `InvocationHandler` or via reflection

#### Plugins

- Load specific classes at run-time

#### Class browsers and visual development environments

- Enumerate members of classes
- Type information can aid code development

#### Debuggers and test tools

- Need to examine private members on classes
- Can systematically call a discoverable set APIs defined on a class

#### Who?

- Framework writers who want to provide generic features
- Software tool writers

## Reflection as used in

### PHP

- Designed to reverse engineer various parts of PHP
- Provides all sorts of information you would need to dig out yourself

#### Use cases

1) You have encoded scripts you need to interact with
2) The PHP manual isn't wholly up to date and you are unable to, or you don't want to read the source code
3) You're just curious how something works and would rather not read someone else's PHP

#### Example

- Consider the following classes

```PHP
<?php
	class myparent {
		public function foo($bar) {
			// do stuff
		}
	}
	class mychild extends myparent {
		public $val;
		private function bar (myparent &$baz) {
			// do stuff
		}
		public function __construct($val) {
			$this->valu = $val;
		}
	}
	$child = new mychild('hello world');
	$child->foo('test')
?>
```

- Using a reflection class

```PHP
$childreflect = new ReflectionClass('mychild');
echo "This class is abstract: ", (int)$childreflect->isAbstract(), "\n";
echo "This class is final: ", (int)$childreflect->isFinal(), "\n";
echo "This class is actually an interface: ", (int)$childreflect->isInterface(), "\n";
echo "\$child is an object of this class: ", (int)$childreflect->isInstance($child), "\n";
$parentreflect = new ReflectionClass('myparent');
echo "This class inherits from myparent: ", (int)$childreflect->isSubclassOf($parentreflect), "\n";
```

- Is should produce the following output

```
The output of that is:
This class is abstract: 0
This class is final: 0
This class is actually an interface: 0
$child is an object of this class: 1
This class inherits from myparent: 1
```

### Ruby

- Can create classes at runtime, perhaps depending on a parameter being passed to the function
- Could use a loop, but a lot of classes makes this difficult

#### Available information

1) What classes already exist
2) Information on the methods on those classes
3) Inheritance, etc.

#### How

- `ObjectSpace` allows us to obtain the reflective information
- `ObjectSpace.each_object {|x| puts x}` gives us all the living, non-immediate objects in the process
- `ObjectSpace.each_object(Class) {|x| puts x}` gives us all the classes in the ruby process
- Iterate over all the classes, and if the name matches do stuff

#### Example

```Ruby
def createClassFromString(classname)
	ObjectSpace.each_object(Class) do |x|
		if x.name == classname
			object = x.new
			object.getCounterValue
		end
	end
end
```

### Java

#### How

- `Class c = "foo".getClass();`
- `Class.forName("classname");`

## Considerations

### Performance

- If reflection is not needed, don't use it
- Dynamically resolving types prevents optimizations
- Should be avoided in frequently called code

### Security

- Requires a runtime permission, which may not be present
- Allows to operations that would be illegal in non-reflective code
- Can lead to unexpected side-effects
- Breaks abstractions and my change behavior with upgrades to platforms
