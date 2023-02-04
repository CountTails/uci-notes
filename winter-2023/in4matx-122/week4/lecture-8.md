# Lecture 8

## Introduction to refactoring

### Thinking in the short term

- Written some code quickly and knowingly took shortcuts
- Written some code and, although it worked, knew it "wasn't quite write"

### Technical debt

- Taking development shortcuts to get something running quickly
    - With the assumption that you can fix it by paying it back later
- Expensive
    - For every 100K lines of code, about $361,000 of technical debt is accumulated

#### A study reveals...

- Architecture choices are the greatest cause of technical debt
- More so than,
    - Overly complex code
    - Lack of documentation
    - Inadequate testing
- Issues stem from causes that may have originated from years before

#### Possibly unavoidable

- There are times to **wisely and purposely** incur technical debt
    - Speed up time-to-market
    - Puts running code is user's hands for feedback and evolution
- Must be clearly identified and and have a plan for repayment

#### Repayment

- Refactoring is the process of changing a software system such that
    - The external behavior of the system does not change
    - But the internal structure of the system is improved
- Acknowledges that it is difficult to get a design right the first time
- As a program's requirements change, the design may need to change
    - Techniques are provided to evolve the design in small incremental steps

### Why refactoring

- To repay technical debt
- People learn better ways to do things along the way
- Sometimes architectural constraints are vague at the outset and later solidify

#### Benefits

- The software’s design is improved  
- Mitigates design decay  
- Smaller, more understandable code  
- New features are added more easily  
- Time and effort tradeoffs between refactoring and feature development  
- Refactoring change is likely to be safer and more reliable than regular change in a large system
- Bugs are found more easily

#### Types

- Classic refactoring  
    - Right after adding and testing new functionality  
- Upkeep refactoring: interleaving refactoring with other types of programming activity  
    - A.k.a. “floss refactoring”  
    - Opportunistic  
- Preparatory refactoring  
    - Right before adding new functionality  
- Root canal refactoring: correcting deteriorated code and involves a protracted process consisting of exclusive refactoring  
    - Change large parts of the code  
    - Most difficult, takes the longest

#### Challenges

- Getting management buy-in  
- Getting customer buy-in  
- Lack of awareness of refactoring's benefits  
- Inadequate tool support  
- Difficult to estimate effort  
- Fear of breaking code

#### Safety nets

- Refactor incrementally  
- Continuous, automated testing  
- Test-driven development  
- Use refactoring patterns  
- Version control

## Refactoring examples

### When should it be done

- The Rule of Three  
- Three "strikes" (duplications) and you refactor  
- Refactor when you add functionality  
- Before and after  
- Refactor when you need to fix a bug  
- Refactor as you do a code review

### Where to start

- Improving variable names  
- Improving method names  
- Creating new methods to reduce code duplication  
- Simplifying if conditions and structure  
- Simplifying loop conditions
- Look for "Bad Smells" in code and apply suggested refactoring techniques

#### Strategies

#### Extract method

- You have a code fragment that can be grouped together
- Turn the fragment into a method whose name explains the purpose of the fragment

#### Consolidate conditionals

```Java
double disabilityAmount() {  
    if (seniority < 2)  { return 0; }  
    if (monthsDisabled > 12)  { return 0; }  
    if (isPartTime)  { return 0; }  
    // Compute the disability amount  
    // ... 
}
```

```Java
double disabilityAmount() {  
    if (isNotEligibleForDisability()) { return 0; }  
    // Compute the disability amount.  
    // ... 
}
```

#### Introduce parameter object

- You have a group of parameters that often go together, but they are separate
    - `amountInvoicedIn(Date start, Date end);`
    - `amountOverdueIn(Date start, Date end);`
- Stick them in an object and pass the object
    - `amountInvoicedIn(DateRange dateRange);`
- This new class starts out as a data holder but will likely attract methods to it

#### Preserve whole object

```Java
int low = daysTempRange.getLow();  
int high = daysTempRange.getHigh();  
boolean withinPlan = plan.withinRange(low, high);
```

```Java
boolean withinPlan =  plan.withinRange(daysTempRange);
```

#### Move method

- A method is using more features (attributes and operations) of another class than the class on which it is  defined
- Create a new method with a similar body in the class it uses most
- Either turn the old method into a simple delegation, or remove it altogether
- Effected elements
    - Examine its code to see if it makes use of **internal attributes of its original class**
    - **These attributes become parameters** to the method in its new home

#### Replace conditionals with polymorphism

-  You have a conditional that chooses different behavior depending on the type of an object
- Move each block of the conditional to an overriding method in a subclass
- Make the original method abstract
- Everything will work correctly via polymorphism and will be easy to extend: just add a new subclass to support a new type

#### Hide delegate

- Law of Demeter - Each unit should only talk to its friends; don't talk to strangers.

```Java
manager = aPerson.getDepartment().getManager();
```

```Java
manager = aPerson.getManager();  
class Person {  
    getManager() {  
        return this.department.getManager();  
    }
```

#### Replace temp with query

- You are using a temporary variable to hold the result of an expression
- Extract the expression into a method
- Replace all references to the temp with an expression
- The new method can then be used in other methods

#### Introduce null object

- Repeated checks for a null value (see below) can be ugly, hard-to-read, or error prone
- Rather than returning a null value from `findCustomer()` return an instance of a "null customer" object

#### Encapsulate collection

- A method returns a collection
- Make it return a read-only version of the collection and provide add/remove methods
- Change to  
    - `ReadOnlyList getCourses();`
    - `addCourse(Course c);`
    - `removeCourse(Course c);`

#### Replace nested conditionals with guard clauses

- Background: two types of conditionals
    1) Check for a variation in "normal" behavior
    2) Check for unusual circumstances that require special behavior; if all of these checks fail then the system proceeds with "normal behavior"
- This refactoring applies to #2: conditional behavior does not make clear the normal path of execution
- Use guard clauses for all special cases
    - With this refactoring, all of the code trying to identify special conditions are turned into one-line statements that determine whether the condition applies and if so handles it.
    - That’s why these statements are called "guard clauses"
    - Even with multiple returns, it is easier to understand than the method before the refactoring

### Bad smells in code

#### Duplicated code

- If you modify one instance of duplicated code but not the others, you (may) have introduced a bug!
- Remedies
    - Extract method
    - Template method
    - Pull up

#### Long method

- Reduces understandability
- Remedies
    - Split
    - Replace method with method object  
    - Extract superclass or class
    - Consolidate conditionals

#### Large class

- Reduces cohesion
- Remedies
    - Extract class
    - Superclass or interface

#### Long parameter list

- Reduces understandability
- Introduce oppurtunities for inconsistencies
- Remedies
    - Replace parameter with method call
    - Introduce parameter object
    - Preserve whole object

#### Shotgun surgery

- A change requires lots of little changes in a lot of different classes
- Rememdies: Move method or fields into one class

#### Feature envy

- A method requires lots of information from some other class or accesses that information more than its own
- Remedies
    - Move method 
    - Extract method
    - Bring information and functionality together

#### Data clumps

- Attributes that clump together (are used together) but are not part of the same class
- Remedies
    - Extract class
    - Introduce parameter object
    - Preserve whole object

#### Primitive obsessions

- Characterized by a reluctance to use classes (uses primitive data types instead)

#### Repeated switch statements

- Switch statements are often duplicated in code
- Rememdies
    - Replace Conditional with Polymorphism

#### Parallel inheritance hierarchies

- Each time I add a subclass to one hierarchy, I need to do it for all related hierarchies
- Note: some design patterns encourage this

#### Lazy class

- A class that is "ridiculously small"
- Remedies: inline class, collapse hierarchy

#### Speculative generality

- I think we need the ability to do this kind of thing someday
- Remedies: inline function, inline class, or collapse hierarchy

#### Temporary Field

- An attribute of an object is only set/used in certain circumstances
- Remedies: extract class, replace method with method object

#### Message Chains  

- A client asks an object for another object and then asks that object for another object etc.  
- client depends on the structure of the navigation  
- Remedies: Hide delegate, façade, move method  

#### Middle Man  

- If a class is delegating more than half its responsibilities to another class, do you really need it?  
- Remedies: Hide delegate  

#### Inappropriate Intimacy  

- Pairs of classes that know too much about each other’s implementation details  
- Remedies: Move method or move field

#### Refused Bequest  

- A subclass ignores most of the functionality provided by its superclass (thus may not pass the "IS-A" test)  
- Remedies: Replace inheritance with delegation  

#### Data Class (information holder)  

- Classes that have fields, associated getters and setters, and nothing else  
- Remedies: Move to associated class with functionality  

#### Comments  

- Comments are sometimes used to hide bad code (“as a deodorant!”)  
-  Remedies: Improve identifier usage