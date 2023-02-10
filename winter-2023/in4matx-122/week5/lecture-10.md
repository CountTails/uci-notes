# Lecture 10

## Architectural design recovery

### Temporal aspect

- Design decisions are made and umnade over a system's lifetime
- At any given point in time, the system has only **one** architecture
- A system's architecture will change over time

### Prescriptive architecture

- Describes design decisions made prior to the system's construction
- It is the as-conceived, as-intended, as-documented, or conceptual architecture

### Descriptive architecture

- Describes how the system has been built
- It is the as-implemented, as-realized, or concrete architecture

### Architectural evolution

- As system evolves, prescriptive architecture *should* be modified first
- In practice, descriptive architecture is directly modified
    -  Developer sloppiness  
    - Short deadlines which prevent thinking through and documenting  
    - Lack of documented prescriptive architecture  
    - Need or desire for code optimizations  
    - Inadequate techniques or tool support

### Architectural degradation

- **Architectural drift** is the introduction of principal design decisions into a system's descriptive architecture
    - Not included in, encompassed by, or implied by the prescriptive architecture
    - Do not violate any of the prescriptive architecture’s design decisions
- **Architectural erosion** is the introduction of architectural design decisions into a system's descriptive architecture that violate its prescriptive architecture

### Architectural recovery

- If architectural degradation is allowed to occur, one will be forced to recover the system’s architecture sooner or later
- *Architecture recovery* is the process of determining a software system's architecture from its implementation-level artifacts
- Often called architecture reconstruction or architectural recovery

## Recovering architecture

### Rules or heuristics to recover architecture

- Mapping principles: rules that determine mappings from implementation-level entities to architectural elements
- Generic principles: drawn from long-standing software-engineering principles
    - Separation of concerns
    - Isolation of change
    - Coupling and cohesion
- Domain principles: mapping principles based on domain information
- Application principles: specific to application under recovery
- System-context principles: infrastructure
    - Choice of OS
    - Programming language
    - Implementation framework

### Rules of focus

1. Group based on isolated classes  
2. Group based on generalization  
3. Group based on aggregation  
4. Group based on composition  
5. Group based on two-way association  
6. Identify domain classes  
7. Merge classes with a single originating domain class association into domain class  
8. Group classes along a domain class circular dependency path  
9. Group classes along a path with a start node and end node that reference a domain class  
10. Group classes along paths with the same end node, and whose start node references the same domain class

### Generic Mapping Principles

- Domain class rules  
    - Class with large majority of outgoing calls  
- Exclusion rules  
    - Class with large majority of incoming calls  
    - Utility classes  
    - Heavily passed data-structures  
    - Benchmarking and test classes  
- Additional groupings  
    - By exception  
    - By interface  
    - By package if idealized architecture matches first-class component

### Domain principles for distributed systems

- Infer distributor connectors from idealized architecture  
- Classes with methods and names similar to first-class components are domain classes  
- Classes importing network communication libraries are domain classes  
- `main()` functions often identify first-class components  
- Classes deployed onto different hosts must be grouped separately

### Goals

- Redocumentation and Understanding  
- Reuse  
- Conformance  
- Co-Evolution  
- Analysis  
- Evolution and Maintenance

### Input

- Source Code  
- Textual Information  
- Dynamic Information  
- Physical Organization  
- Human Organization  
- Historical Information  
- Human Expertise