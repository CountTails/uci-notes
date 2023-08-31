# Reliable data transfer principles

## Making an unreliable channel reliable

- Important in
	- Application layer
	- Transport layer
	- Link layer
- Helps reduce the workload of the application layer
- RDT: **r**eliable **d**ata **t**ransfer
- UDT: **u**nreliable **d**ata **t**ransfer

### Provided service

![Provided Transport Server](./figures/provided-service.png)

### Desired service

![Desired Transport Service](./figures/desired-service.png)

## Getting started

- `rdt_send()`: called from above (in application layer). Passed data to deliver to receiver upper layer
- `udt_send()`: called by RDT to transfer packet over unreliable channel to receiver
- `rdt_rcv()`: called when packet arrives on rcv-side of channel
- `deliver_data()`: called by **rdt** to deliver data to upper layer

### Developing a reliable data transfer protocol

- Incrementally develop sender, receiver sides of the protocol
- Consider only unidirectional data transfer
	- But controls info will flow on both directions!
- Use **finite state machines** to specify sender and receiver

## RDT 1.0

- Underlying channel perfectly reliable
	- No bit errors
	- No loss of packets
- Separate FSMs for sender and receiver
	- Sender sends data into underlying channel
	- Receiver reads data from underlying channel

![RDT 1.0 FSM](./figures/rdt-1.0-fsm.png)

## RDT 2.0

### Channel with bit errors

- Underlying channel may flips bits in packet
	- *Error detection*: use checksum to detect bits errors
- A new mechanisms is needed to recover from errors
	- *Feedback*: control messages from receiver and sender
		- **Ack**nowledgements (ACK): receiver explicitly tells sender that packet was received OK
		- **N**egative **ACK**nowledgments (NAK): receiver explicitly tells sender that packet had errors
	- *Retransmission*
		- Sender retransmits packet on receipt of NAK

### FSM specification

![RDT 2.0 Sender FSM](./figures/rdt-2.0-sender-fsm.png)

> **STOP AND WAIT**: sender sends *one* packet then waits for receiver response

![RDT 2.0 Sender FSM](./figures/rdt-2.0-recv-fsm.png)

### Operation with no errors

1) Sender creates packet and sends it through underlying channel
2) Receiver reads packet and confirms data is **not** corrupted
3) Receiver extracts data from packet and delivers it to upper layer
4) Receiver sends ACK packet to sender
5) Sender reads response and verifies it is an acknowledgement of the packet sent earlier

### Error scenario

1) Sender creates packet and sends it through underlying channel
2) Receiver reads packet and detects the data is corrupted
3) Receiver sends NAK packet to sender
4) Sender receiver negative acknowledgement from receiver and proceeds to *retransmit* the packet
5) Receiver reads retransmitted packet an repeats until sender receives and ACK for the packet

### Fatal flaw

- What if ACK or NAK packet is corrupted?
	- Sender doesn't know what happened at receiver
	- Could retransmit, but receiver would need to handle possible **duplicates**
- Handling duplicates
	- Sender retransmit current packet if ACK or NAK corrupted
	- Sender adds a *sequence number* to each packet
	- Receiver discards (doesn't deliver up) duplicate packets

## RDT 2.1

### Sender

- Sequence number added to packet
	- Only two (0 and 1) will suffice
- Must check if received ACK or NAK packet is corrupted
- Twice as many states required
	- "Remember" if "expected" packet should have sequence number 0 or 1

![RDT 2.1 Sender FSM](./figures/rdt-2.1-sender-fsm.png)

### Receiver

- Must check if received packet is a duplicate
- State indicates whether 0 or 1 is the expected packet sequence number
- Receiver cannot know if its last ACK or NAK packet was received OK at sender

![RDT 2.1 Receiver FSM](./figures/rdt-2.1-recv-fsm.png)

### In action

#### No message or ACK corrupted

![RDT 2.1 OK](./figures/rdt-2.1-ok.png)

#### Message corrupted, feedback Ok

![RDT 2.1 Message Error](./figures/rdt-2.1-msg-err.png)

#### Message Ok, ACK corrupted

![RDT 2.1 ACK Error](./figures/rdt-2.1-ack-err.png)

#### Message corrupted, ACK corrupted

![RDT 2.1 Not Ok](./figures/rdt-2.1-not-ok.png)

## RDT 2.2

- Same functionality as RDT 2.1, but uses ACKs only
- Instead of NAK, receiver sends ACK for **last packet** received successfully
- Receiver must *explicitly* include sequence number of packet being acknowledged
- Duplicate ACK at sender results in same action as NAK: *retransmit current packet*

![RDT 2.2 FSM](./figures/rdt-2.2-fsm.png)

## RDT 3.0

### Channels with error *and* loss

- New assumptions
	- Underlying channel can also lose packets
	- Checksums, sequence numbers and ACKs will help, but is *not enough*
- Approach
	- Sender waits "reasonable" amount of time for ACK
	- Retransmit if no ACK received in this time
	- If packet (or ACK) just delayed
		- Retransmission will be duplicate, but sequence number already handles this
		- Receiver must specify sequence number of packet being acknowledged
	- Requires a **countdown timer**

### Sender

![RDT 3.0 Sender FSM](./figures/rdt-3.0-sender-fsm.png)

### In action

#### No loss

![RDT 3.0 No Loss](./figures/rdt-3.0-no-loss.png)

#### Packet loss

![RDT 3.0 Packet Loss](./figures/rdt-3.0-packet-loss.png)

#### ACK loss

![RDT 3.0 ACK Loss](./figures/rdt-3.0-ack-loss.png)

#### Premature timeout

![RDT 3.0 Timeout](./figures/rdt-3.0-timeout.png)

### Performance

- RDT 3.0 is correct, but not performant
- Example
	- 1 Gbps link
	- 15 ms propagation
	- 8000 bit packet

$$
	D_{\text{trans}} = \frac{L}{R} = \frac{8000 \text{ bits}}{10^{9} \text{ bits/sec}} = 8 \text{ microsecs}
$$

- $U_{\text{sender}}$: utilization - fraction of time sender busy sending
- Assume RTT is 30 milliseconds

$$
	U_{\text{sender}} = \frac{L / R}{RTT + L / R} = \frac{0.008}{30.008} = 0.00027
$$

- Network protocol limits use of physical resources

## Pipelined protocols

> Pipelining: sender allows multiple "in-flight", yet-to-be-acknowledged packets

- Range of sequence numbers must be increased
- Buffering at sender and/or receiver

![Pipelined Transmission](./figures/pipelined-transmission.png)

### Go-Back-N (GBN)

- Sender can have up to $N$ unacknowledged packets in the pipeline (window)
- Receiver only sends *cumulative ACKs*
	- Don't ACK packet if there is a gap
- Sender has a timer for **oldest unACKed packet**
	- When timer expires, retransmit *all unACKed packets*

### Selective repeat (SR)

- Sender can have up to $N$ unacknowldeged packets in the pipeline (window)
- Receiver sends *individual ACKs* for each packet
- Sender maintains time for **each unACKed packet**
	- When timer expires, retransmit *only that unACKed packet*

### Sliding window

![Pipeline Window](./figures/pipeline-window.png)