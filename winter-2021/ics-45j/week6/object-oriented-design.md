# Object oriented design

## Discovering classes

- When designing a program, you work from a requirements specification
	- The designer's task is to discover structures that make it possible to implement the requirements
- To discover classes, look for nouns in the problem description
- Find methods by looking for verbs in the task description

### Example: invoice

- Classes that come to mind
	- Invoice
	- LineItem
	- Customer
- Good idea to keep a list of candidate classes
- Brainstorm: put all ideas for classes onto the list
	- Cross out not useful ones later
- Concepts form the problem domain are good candidates for classes
- Not all classes can be discovered from the program requirements
	- Most programs need tactical classes

### The CRC card method

- After you have a set of classes
	- Define the behavior (methods) of each class
- Look for verbs in the task description
	- Match the verbs to the appropriate objects
- The invoice program needs to compute the amount due
	- Which class is responsible for this method?
	- Invoice class
- A CRC card describes a class, its responsibilities, and its collaborating classes
- Use an index card for each class
- Pick a class that should be responsible for each method (verb)
- Write the responsibility onto the card
- Indicate what other classes are needed to fulfill responsibility

## Relationships between classes

### Dependency

- A class depends on another class if it uses objects of that class
	- The "knows about" relationship
- It is good practice to minimize the coupling between classes
- When a class changes, coupled classes may also need updating

### Aggregation

- A class aggregates another if its objects contain object(s) of the other class
	- The "has-a" relationship
- Aggregation is a stronger form of dependency
- Use aggregation to remember another object between method calls
- To implement aggregation, use an instance variable in the aggregator

```Java
public class Quiz {
	private ArrayList<Question> questions;
	...
}
```

- A class may use another class without ever declaring an instance variable of class `Scanner`
	- This is dependency, NOT aggregation

### Inheritance

- Inheritance is a relationship between a more general class (the superclass) and a more specialized class (the subclass)
	- The "is-a" relationship
- Inheritance is sometimes inappropriately used when the "has-a" relationship would be more appropriate
	- Should the class `Tire` by a subclass of a class `Circle`? No
	- A tire has a circle as its boundary
	- Use aggregation

```Java
public class Tire {
	private String rating;
	private Circle boundary;
}
```

- Every car **is a** vehicle (inheritance)
- Every car **has a** tire (or four) (Aggregation)

```Java
class Car extends Vehicle {
	private Tire[] tires;
	...
}
```

- Aggregation denotes that objects of one class contain reference(s) to object(s) of another class