# Intra-domain routing

## Scalable routing

- Routing study thus far has been "idealized"
	- All routers identical
	- Network is "flat"
	- *Not* true in practice
- Must scale to billions of destinations
	- Can't store all destinations in a routing table
	- Routing table exchanges would swamp links (No real data transmitted)
- Want administrative autonomy
	- Internet is a network of networks
	- Each network admin may want to control routing in its *own* network

### Approach

> Aggregate routers into regions known as **autonomous systems** (AS)


- Intra-AS routing
	- Routing among hosts and routers in the same AS (network)
	- All routers is AS must run *same* intra-domain protocol
	- Routers in *different* AS can run *different* intra-domain routing protocol
	- Gateway router: at "edge" of its own AS, has link(s) to router(s) in other AS'es
- Inter-AS routing
	- Routing among AS'es
	- Gateways perform inter-domain routing (as well as intra-domain routing)
- Forwarding table
	- Configured by both intra and inter-AS routing algorithms
	- Intra-AS routing determines entries for **destinations within AS**
	- Inter-AS and intra-AS determine entries for **external destinations**

## Intra-AS routing

### Tasks

- Suppose router is AS1 receives datagram destined **outside** of AS1
- Router should forward packet to gateway router, but which one?
- AS1 must
	1) Learn which destinations are reachable through AS2, which through AS3
	2) Propagate this reachability info to all routers in AS1

### Protocols

- RIP: routing information protocol (like Bellman-Ford)
- OSPF: open shortest path first (like Dijkstra)
- IGRP: interior gateway routing protocol (proprietary until 2016)

## Routing information protocol (RIP)

- Included in BSD-Unix distributions in 1982
- Runs the distance vector algorithm with the following parameters
	- Each link cost is 1
	- `D(V)`'s exchanged with neighbors every 30 seconds as an advertisement
	- Each advertisement lists **up to 25 destination** subnets 

### Link failure and recovery

- If no advertisement heard after **180 seconds** -> neighbor/link is declared **dead**
- Routers via that neighbor/link are invalidated
- New advertisements sent to neighbors
	- Neighbors may also send out new advertisements if tables changed 
- Allows link failure to quickly propagate to entire networks
- *Poison reverse* used to prevent ping-pong loops (infinite distance = 16 hops)

### Table processing

- RIP routing tables managed by *application-level* process called `routed` (daemon)
- Advertisements sent in **UDP** packets, periodically repeated

## Open shortest path first (OSPF)

- "Open": publicly available
- Uses the link-state algorithm
	- LS packet dissemination
	- Topology mapped at each node
	- Link costs set by an administrator: used to affect routing
	- Route computation uses Dijkstra's algorithm
- OSPF advertisement carries one entry per neighbor
- Advertisements flooded to *entire* AS
	- Carried in OSPF messages directly **over IP** (rather than TCP or UDP)
	- Sent upon change and periodically (every 30 minutes)
	- `HELLO` messages used to check links
- *IS-IS routing* protocol: nearly identical to OSPF 

### Advanced features

- Security: all OSPF messages are authenticated (to prevent malicious intrusion)
- Multiple same-cost paths allowed 
- For each link, multiple cost metrics for different types of service
- Integrated unicast and multi-cast support
- Support for *hierarchical* OSPF in large domains

### Hierarchical OSPF

- *Two-level hierarchy*: local area, and a backbone
	- Link-state advertisements only in area
	- Each nodes has detailed area topology; only know direction (shortest path) to networks in other areas
- *Area border routers*: "summarize" distances to networks in own area, advertise to other area borders
- *Backbone routers*: run OSPF routing limited to backbone
- *Boundary routers*: connect to other AS'es