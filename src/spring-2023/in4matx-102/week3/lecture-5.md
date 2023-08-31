# Lecture 5

## More on monads

### Writing a monad

```Python
def hypotenuse(x, y):
	return math.sqrt(math.pow(x, 2) + math.pow(y, 2))
```

- Let's call functions `(float, float) -> (float, string)` traceable_f_f

```Python
def makeTraceable_f_f(f):

    def traceable_f_f(x,y):
        h=f(x,y)
		return h, str(f) + " was called, result=" + str(h) + "\n"
	return traceable_f_f
```

- Let's make one of these and call it

```Python
>>> a_traceable_hypo = makeTraceable_f_f(hypotenuse)
>>> a_traceable_hypo(3, 4)
(5.0, '<function hypotenuse at 0xfff42a74> was called, result=5.0\n')
```

- It would be nice to trace `math.pow` too!
- Let's "lift" it and call functions `(float, string), float -> (float, string)` tracceable_f_s_f

```Python
def makeTraceable_f_s_f(f, p):
	def traceable_f_s_f(t_f_f):  
		r = f(t_f_f[0], p)  
		return r, t_f_f[1] + str(f)+" was called, result="+str(r) + "\n"

    return traceable_f_s_f
```

- Let's make one of these and call it

```Python
>>> aTraceablePowOf2=makeTraceable_f_s_f(math.pow, 2)
>>> aTraceablePowOf2(aTraceableHypo(3,4))
(25.0, '<function hypotenuse at 0xfff42a74> was called, result=5.0\n<built-in function pow> was called, result=25.0\n')
```

- Still too tightly coupled, let's "bind" them externally instead

```Python
>>> bind(aTraceableHypo(3, 4), aTraceablePowOf2)
```

- Writing the bind function

```Python
def bind(t, f):
	return f(t)
```

### Types of monads

- Identity
- Maybe
- Error
- List
- IO
- State
- Reader
- Writer
- Continuation

#### Identity monad

- Simple function application: `bind(x, f) = f(x)`

#### Maybe monad

- Functions that return either a value of a certain type or no value at all
- Nothing values stop the computation
- Something values get passed on
- A nice alternative to exceptions

```C#
public interface Maybe<T>{}

public class Nothing<T> : Maybe<T>
{
    public override string ToString()
	{
        return "Nothing";
    }
}

public class Something<T> : Maybe<T>
{
    public T Value { get; private set; }
    public Something (T value)
    {
    Value = value;
	}
	public override string ToString()
    {
        return Value.ToString();
	} 
}
```

- Need 2 operations
	- One to construct maybe's
	- One to bind maybe's to the rest of the computation
- The maybe type constructor

```C#
public static Maybe<T> ToMaybe<T>(this T value)
{
	return ewn Something<T>(value);
}
```

- The bind operation

```C#
public static Maybe<B> Bind<A, B>(this Maybe<A> a, Func<A, Maybe<B>> func){
	var something = a as Something<A>;
	return something == null ? new Nothing<B>() : func(something.Value);
}
```

- Usage

```C#
public static Maybe<int> Div(this int numerator, int denominator)
{
	return denominator == 0 ? Maybe<int> new Nothing<int>() : new Something<int> (numerator/denominator);
}
```

```C#
15.Div(3);
>> 5

15.Div(0);
>> Nothing

36.ToMaybe().Bind(n => Div(n, 3)).Bind(m => Div(m, 0)).Bind(p => Div(p, 9));
>> Nothing //Div(9) never happens
```

## Function objects

### Modeling functions ad data in OOP

#### Attempt 1

```Java
class ReadFile {
	String readFile(String arg) {
		string contents = ... // Code for reading file
		return contents
	}
}
```

```Java
new ReadFile().readFile("path/to/some/file");

// or

ReadFile rf = new ReadFile();
someObj.meth(rf);
```

- Can do the same for each function

#### Problem with attempt 1

> No commonality between functions

```Java
class TFTheOne {
	private Object value;
	public TFTheOne bind(??? func) {
		value = func.???(value)
	}

	public printme() {
		System.out.println(value);
	}
}
```

- Could use a generic object, but would require a giant switch statement

### A function object interface

```Java
interface IFunction {
	Object call(Object arg);
}
```

#### The ONE 

```Java
class ReadFile implements IFunction {
	Object call(Object arg) {
		String fileName = (String) arg;
		String contents = // code for reading a file
		return contents
	}
}

class FilterChars implements IFunction {
	Object call(Object arg) {
		String data = (String) arg;
		String fcontents = // code for filtering
		return fcontents;
	}
}
```

- Generalized

```Java
class TFTheOne {
	private Object value;
	TFTheOne(Object v) { value = v; }

	public TFTheOne bind(IFunction func) {
		value = func.call(value);
		return this;
	}

	public printme() {
		System.out.println(value);
	}
}
```

- Main function

```Java
public static void main(String[] args) {
	TFTheOne one = new TFTheOne(args[...]);

	one.bind(new ReadFile()).bind(new FilterChars()).bind ...
}
```

#### Kick forward

```Java
interface IFunction {
	void call(Object arg, IFunction func);
}
```

```Java
class ReadFile implements IFunction
{
	void call(Object arg, IFunction func) {
		String fileName = (String)arg;
		String contents = // code for reading a file
		func(contents, new FilterChars());
	}
}
```

### Functions as objects

- Define a clean function interface
- Define one class per function, each implementing the interface
- When you need to pass the function, instantiate the class and pass that object

### More generally

- Objects are capsules of procedures/functions
	- with or without state
- Functions as data in pure OOP -> function objects
- If you need to manipulate them independent of the type -> use interface / super