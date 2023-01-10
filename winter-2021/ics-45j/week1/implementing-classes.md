# Implementing classes

## Instance variables and encapsulation

### Instance variables

- Store the data of an instance of a class
- Present as a storage location for each object

```Java
public class Counter
{
    private int value;
    ...
}
```

- Instance variable *should* always be `private`
- Declare instance variables as `private typeName variableName;`
- Each object of the class has a separate copy of the instance variable(s)

### Encapsulation

- The process of hiding implementation details and providing methods for data access
- To encapsulate data
    1) Declare an instance variable as `private`
    2) Declare a `public` method that accesses the instance variable
- Allows for use of a class without knowing its implementation
- Hiding information makes it easier for class implementor to find errors and change implementations

## Specifying the public interface of a class

- Determine which methods are required
- Consider the essential behaviors of a bank account
    - Deposit money
    - Withdraw money
    - Get balance
- Declare `BankAccount` methods that support this behavior as `public`
    - Public methods can be called by any other method in the program
- Methods can also be `private`
    - Can only be called by methods in the same class
    - Not part of the public interface
- Public constructors and methods form the **public interface** of the class
- Constructors (used with the `new` operator)
    - Initialize objects
    - Name is always the same as the class
    - Have no return type (not even `void`)
    - Completely optional

## Providing the class implementation

- Consist of
    - Instance variables
    - Bodies of constructors
    - Bodies of methods

### Providing instance variables

- Determine what data is needed

### Providing constructors

- Initialize the instance variables provided earlier

### Providing methods

- `deposit`
- `withdraw`
- `getBalance`

## Local variables

- Declared in the body of a method
- Removed when the method exits
- **Parameter variables** are declared in the method header and are also considered local variables
- Locals must be intialized manually (unlike instance variables, which are default initialized)

## The `this` reference

- Two types of input are passed when a method is called
    - The object you invoke the method on (implicitly)
    - The method arguments (explicitly)
- The `this` reference denotes the implicit parameter
    - `balance = balance + amount;` is actually `this.balance = this.balance + amount;`
    - The `this` reference can be used to distinguish between instance and local variables