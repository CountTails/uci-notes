# Designing classes

## Discovering classes

- A class represents a **single concept** from the problem domain
- The name of a class should be a **noun** that describes the concept
	- Look for nouns in the problem description
- Concepts from mathematics
	- `Point`
	- `Rectangle`
	- `Ellipse`
- Concepts from real life
	- `BankAccount`
	- `CashRegister`
- Types of classes
	- Domain classes (`Employee`, `Manager`, `CashRegister`)
	- Actors (end in -er, -or): objects that do some kind of work for you
	- Utility classes: no objects, only static methods and constants; cannot be instantiated
	- Program starters: a class with only a `main` method (entry point)
 - A class name should indicate what objects of the class will do
 - Do not turn a single operation action into a class

## Designing good methods

- A class should represent a single concept
- The public interface of a class is *cohesive* if all of its features are related to the concept that the class represents
- The members of a cohesive team have a common goal

### Cohesion

- This class lacks cohesion

```Java
public class CashRegister {
	public static final double QUARTER_VALUE = 0.25;
	public static final double DIME_VALUE = 0.1;
	public static final double NICKEL_VALUE = 0.05;
	...
	public void receivePayment(int dollars, int quarters, int dimes, int nickels, int pennies) {
		...
	}
}
```

- It contains two concepts
	- A cash register that holds coins and computes their total
	- The values of individual coins
- Solution: make two classes

```Java
public class Coin {
	public Coin(double aValue, String aName) { ... }
	public double getValue() { ... }
}

public class CashRegister {
	...
	public void receivePayment(int cointCount, Coin coinType) {
		payment = payment + coinCount * coinType.getValue();
	}
	...
}
```

### Minimizing dependencies

- A class *depends* on another class if its methods use that class in **any** way
- Example: printing `BankAccount` balance
	- `System.out.println("The balance is now $" + momsSavings.getBalance());`
	- Don't add `printBalance` method to `BankAccount`
		- The method depends on `System.out`
		- Not every computing environment has `System.out`
		- Violates the rule of minimizing dependencies
- Best to decouple input/output from the work of your classes
	- Place the code for producing output or consuming input in a separate class

### Separating accessors and mutators

- A **mutator method** changes the state of an object
- An **accessor method** asks an object to compute a result without changing the state
- An **immutable** class has no mutator methods
- References to objects of an immutable class can be safely shared
- In a mutable class, separate accessors and mutators
- Most of the time, mutators should have return type void
	- Sometimes a mutator can return an informational value
	- `ArrayList.remove` methods returns `true` if the removal was successful

### Minimizing side effects

- A side effect of a method is any externally observable data modification
- Mutator methods have a side effect, namely the modification of the implicit parameter
- In general, a method should **not** modify its parameter variables

```Java
/**
	Computes the total balance of the given accounts.
	@param accounts a list of back accounts
*/
	public double getTotalBalance(ArrayList<String> accounts) {
		double sum = 0;
		while (studentNames.size() > 0) {
			BankAccount account = accounts.remove(0); // Not recommended
			sum = sum + account.getBalance();
		}
		return sum;
	}
```

- Such a side effect would not be what most programmers expect!

> When designing methods, minimize side effects

## Patterns for object data

### Keeping a total

- Keep an instance variable that represents the current total
- Provide the methods as necessary
	- A method to **increase** the total by a given amount
	- A method that **reduces or clears** the total
	- A method that **yields** the current total

### Counting events

- Keep a counter variable
- Increment the counter in those methods that correspond to the events that you want to count
- Provide a method to **clear** the counter if necessary
- You may need a method to **report the count** to a user of a class

### Collecting values

- Initialize the instance variable to **an empty collection**
- Supply a mechanism for **adding values**

### Managing properties of an object

- A property is a value of an object that an object user can set and retrieve
- Provide an instance variable to store the property's value and methods to get and set it
- Is is common to add **error checking** to the setter method
- Some properties should **not change** after they have been set in the constructor

### Modeling objects with distinct states

- Some objects have behavior that varies depending on what has happened in the past
- If a fish is in a hungry state, its behavior changes
- Supply an instance variable for the current state
- Supply constants for the state values
- Determine which methods **change the state**
- Determine where the **state affects behavior**

## Static variables and methods

### Variables

- A static variable belongs to the *class*, not to any *object* of the class
- To assign bank account numbers sequentially
- Declare it using the `static` reserved word
- Every `BankAccount` object has its own `balance` and `accountNumber`
- All `BankAccount` objects share a single copy of the `lastAssignedNumber` variable
	- That variable is stored in a separate location, outside any `BankAccount` objects
- Static variables should **always** be declared as `private`
- Static constants may be either `private` or `public`
	- Methods from any class can refer to these constants

### Methods

- Sometimes a class defines methods that are not invoked on an object
	- Called a **static method**
- Example: `sqrt` of the `Math` class
	- Even if `x` is a number, the call `x.sqrt()` is not legal
	- The `Math` class provides a static method: invoked as `Math.sqrt(x)`
	- No object of the `Math` class is constructed
	- The `Math` qualifier simply tells the compiler where to find the `sqrt` method
- You can define your own static methods

```Java
public class Financial {
	public state double percentOf(double percentage, double amount) {
		return (percentage / 100) * amount;
	}
}
```

- When calling such a method, supply the name of the class containing it
- The `main` method is **always** static
	- When the program starts, there aren't any objects
	- Therefore, the first method of a program **must** be a static method

## Packages

- **Package**: set of related classes
- In java, related classes are grouped into packages
- Important packages in the Java library

| Package | Purpose | Sample class |
| -------- | ------- | ------------ |
| `java.lang` | Language support | `Math` |
| `java.util` | Utilities | `Random` |
| `java.io` | Input and output | `PrintStream` |
| `java.awt` | Abstract windowing toolkit | `Color` |
| `java.applet` | Applets | `Applet` |
| `java.net` | Networking | `Socket` |
| `java.sql` | Database access | `ResultSet` |
| `javax.swing` | Swing user interface | `JButton` |
| `omg.w3c.dom` | Document object model for XML documents | `Document` |

### Organizing related classes into packages

- To put classes in a package, you must place a line `package packageName;`as the first instruction in the source file containing each class
- A package name consists of **one or more identifiers separated by periods**

```Java
package demos.week4;
public class Financial {
	...
}
```

- Default package
	- Has no name
	- If package is not specified, classes will be placed here

### Importing packages

- Can use a class without importing: refer to its full name (package name plus class name)
	- Inconvenient
- `import` lets you refer to a class of a package by its class name, without the package prefix

```Java
import java.util.Scanner;
```

- `Scanner` can not be referenced without the package prefix
- Can import all classes in a package with a wildcard

```Java
import java.util.*;
```

- You never need to import
	- `java.lang`
	- Other classes in the same package as your classes

### Package names

- Use package names to avoid name clashes
	- `java.util.Timer`
	- `java.swing.Timer`
- Package names should be **unique**
- To get a package name: turn your domain name around
	- `edu.uci.isc45j`
- Or write your email address backwards

### Packages and source files

- The path of a `.java` file must match its package name
- The parts of the name between periods represent successively nested directories
- **Base directory**: holds your program's files
- Place the subdirectory inside the base directory

## Unit testing frameworks

- Unit test frameworks simplify the task of writing classes that contain many test cases
- [JUnit](https://junit.org)
	- Built into some IDEs like BlueJ and Eclipse
- Philosopy
	- Whenever you implement a class, also make a companion test class
	- Run all tests whenever you change you code
- Customary that the name of the test class ends in `Test`

```Java
import org.unit.Test;
import org.juint.Assert;
public class CashRegisterTest {
	@Test
	public void twoPurchases() {
		CashRegister register = new CashRegister();
		register.recordPurchase(0.75);
		register.recordPurchase(1.50);
		register.enterPayment(2, 0, 5, 0, 0);
		double expected = 0.25;
		Assert.assertEquals(expectd, register.giveChange(), EPSILON);
	}
	// More test cases
}
```