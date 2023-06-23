# Interfaces (part 2)

## The `Comparable` interface

- The `Comparable` interface is in the standard java library
- The `Comparable` interface has single method

```Java
public interface Comparable {
	int compareTo(Object otherObject);
}
```

- The call to the method `a.compareTo(b)` compares for ordering
- The `compareTo` method returns
	- A negative number if `a` should come before `b`
	- Zero if `a` and `b` are the same
	- A positive number if `b` should come before `a`
- Implement the `Comparable` interface so that objects can be compared, for example, in a sort method
- `BankAccount` class's implementation of `Comparable`

```Java
public class BankAccount implements Comparable {
	...
	public int compareTo(Object otherObject) {
		BankAccount other = (BankAccount) otherObject;
		if (balance < other.balance) { return -1; }
		if (balance > other.balance) { return 1 ; }
		return 0;
	}
	...
}
```

- Because the `BankAccount` class implements the `Comparable` interface, you can sort an array of bank accounts with the `Arrays.sort` method

```Java
BankAccount[] accounts = new BankAccount[3];
accounts[0] = new BankAccount(10000);
accounts[1] = new BankAccount(0);
accounts[2] = new BankAccount(2000);
Arrays.sort(accounts); // accounts is now sorted by increasing balance
```

## Using interfaces for callbacks

- Limitations of `Measurable` interface
	- Can add `Measurable` interface only to classes under your control
	- Can measure an object in only one way
- **Callback**: a mechanism for specifying code that is executed at a later time
- Problem: the responsibility of measuring lies with the added objects themselves
- Alternative: give the `average` method *both* the data to be averaged and a method of measuring

```Java
public interface Measurer {
	double measure (object anObject);
}
```

- The code that makes the call to the callback receives an object of the class that implements this interface

```Java
public static double average(Object[] objects, Measurer meas) {
	double sum = 0;
	for (Object obj : objects) {
		sum = sum + meas.measure(obj);
	}
	if (objects.legnth > 0) { return sum / objects.length; }
	else { return 0; }
}
```

- The `average` method simply makes a callback to the `measure` method whenever it needs to measure any object
- A specific callback is obtained by implementing the `Measurer` interface

```Java
public class AreaMeasurer implements Measurer {
	public double measure(Object anObject) {
		Rectangle aRectangle = (Rectangle) anObject;
		double area = aRectangle.getWidth() * aRectangle.getHeight();
		return area;
	}
}
```

- To compute the average area of rectangles
	- Construct an object of all `AreaMeasurer` class
	- Pass it to the `average` method

```Java
Measurer areaMeas = new AreaMeasurer();
Rectangle[] rects = { new Rectangle(5, 10, 20, 30), new Rectangle(10, 20, 30, 40) };
double averageArea = average(rects, areaMeas);
```

- The average method will ask the `AreaMeasurer` object to measure the rectangles
- The `Data` class (which holds the average method) is decoupled from the class whose objects it processes
- You provide a small "helper" class `AreaMeasurer`, to process rectangles

## Inner classes

- A trivial class can be declared inside a method

```Java
public class MeasurerTester {
	public static void main(String[] args) {
		class AreaMeasurer implements Measurer {
			...
		}
		...
		Measurer areaMeas = new AreaMeasurer();
		double averageArea = Data.avaerage(rects, areaMeas);
		...
	}
}
```

- An inner class is a class that is declared inside another class
- You can declare an inter class inside an enclosing class, but outside its methods
- It is available to all methods of the enclosing class

```Java
public class MeasurerTester {
	class AreaMeasurer implements Measurer { ... }

	public static void main(String[] args) {
		Measurer areaMeas = new AreaMeasurer();
		double averageArea = Data.average(rects, areaMeas);
	}
}
```

- Inner classes are commonly used for utility classes that should not be visible elsewhere in a program