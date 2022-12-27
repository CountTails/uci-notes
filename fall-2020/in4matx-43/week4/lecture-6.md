# Lecture 6: software architecture (part 2)

## Architectural styles

- A named collection of arhctectural design decisions that
    - are applicable is a given development context
    - constrain architectural design decisions
    - result in beneficial qualities
- A named, commonly used set of components/connectors/configurations
    - Each component/connector has its own job

### Object oriented

- Components are objects
- Connections are function and method calls
- Key benefits
    - Understandability: models real world objects
    - Abstraction: public vs. private details
    - Anticipation of change: can change internal details without side effects

### Model-view-controller

- Utilizes exactly 3 components
    - View (UI)
    - Model (data)
    - Controller (respond to input)
- Key benefits
    - Modularity: separates concerns really well
    - Anticipation of change: easy to change components without introducing bugs

### Client-server

- Composes of two components
    - Client to make requests
    - Server to handle requets
- Connectors are literal network connections
- Key benefits
    - Share data/services with multiple clients
    - Centralized control with server controlling data

### Layered

- Enforces a specific protocol of interaction
    - Abstract away irrelevant details
    - Minimize the effects of change
- Separate concerns
- Key benefits
    - Modularity: separates concerns
    - Abstraction: each layer abstracts layers below
    - Anticipation of change: Change affects (at most) layers directly above / below it
    - Reuse: Lower layers are more generalized

### Peer2Peer

- Components are considered equal
- There are direct connections between components
- Key benefits
    - Efficiency
    - Robustness (decentralized)

### Pipe and filter

- Components are filters (translate input to output)
- Connectors are pipes (transport data between filters)
- Key benefits
    - Modularity: easy to add/replace filters
    - Reuse
    - Anticipation of change

### Publish and subscribe

- Components are publishers and subscribers
- Connectors is a subscription manager
- Key benefits
    - Efficiency: deliver as needed
    - Scalability: handle large amount of users and information

## Multiple styles

- Often neccessary
- One architectural style will typically not solve entire system

## Evolution

- All successful software evolves
- Must be accommodated/planned as much as possible
