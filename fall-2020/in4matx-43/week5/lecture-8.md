# Lecture 8: designs, models, and notations (part 2)

## Notations and diagrams

### UML 

- **U**nified **M**odeling **L**anguage
- Industry standard for designing software
- Different types of UML diagrams represent different aspects of the system

#### Class diagrams

- Used to decompose a system into classes known as **modules**
- Models domain concepts
- Creates detailed, object-oriented design of the code

![UML Class Template](./figures/uml-class.png)

- `-` means private visibility
- `+` means public visibility

#### Relationships between classes

##### Inheritance

![UML Inheritance](./figures/uml-inheritance.png)

##### Association

![UML Association](./figures/uml-association.png)

##### Multiplicities

![UML Multiplicities](./figures/uml-multiplicities.png)

##### Aggregation

- One object contains a *set* of other objects
- This relationship is [transitive and assymetric](../../../summer-2020/ics-6b/week3/relations-and-properties.md)

![UML Aggregation](./figures/uml-aggregation.png)

##### Composition

- A variant of aggregation
- Adds the **existence dependency** property
    - When the whole is destroyed, parts cannot exist

![UML Composition](./figures/uml-composition.png)

#### How to create classes?

- The *set of nouns* in the problem description become **classes or attributes** (data)
- The *set of verbs* in the problem description become **operations or associations**
- Review use cases to flesh out flow and needed objects
- UI mockup may be helpful
- Refer to, add to, and revise design as needed

#### Activity diagrams

- Demonstrate user flows and work flows

![UML Activity diagram](./figures/uml-activity.png)

#### Sequence diagrams

- Represent interactions between objects as they happen

![UML Sequence](./figures/uml-sequence.png)

#### Use case diagrams

- Represent use cases and interactions between actors and the system

![UML Use Case](./figures/uml-use-case.png)

### Other diagrams

- Interface mockups
- Psuedo code
- Entity-relationship diagrams (good for designing relational database schemas)
- Architecture diagrams
- Storyboards
- Sketches

## Design principles

### High cohesion / Low coupling

- *High cohesion*: grouping related functionality together
- *Low coupling*: ungrouping unrelated functionality / reducing interdependency
- Effects
    - Changes don't propogate
    - Reuse is facilitated

![High Cohesion Low Coupling](./figures/high-cohesion-low-coupling.png)

### Information hiding

- Hide design decisions that are most likely to change
- Protects other parts of the program if a change is made

![Information Hiding](./figures/information-hiding.png)