# The internet

## Summary

- The internet is a vast *network of networks*. It is comprised of both the *network infrastructure* itself (devices, routers, switches, cables, etc) and the *protocols* that enable that infrastructure to function.

- Protocols are *systems of rules*. Network protocols are systems of rules governing the exchange or transmission of data over a network.

- Different types of protocol are concerned with different aspects of network communication. It can be useful to think of these different protocols as operating at particular 'layers' of the network.

- *Encapsulation* is a means by which protocols at different network layers can work together.

- Encapsulation is implemented through the use of *Protocol Data Units* (PDUs). The PDU of a protocol at one layer, becomes the data payload of the PDU of a protocol at a lower layer.

- The *physical network* is the tangible infrastructure that transmits the electrical signals, light, and radio waves which carry network communications.

- *Latency is a measure of delay*. It indicates the amount of time it takes for data to travel from one point to another.

- *Bandwidth is a measure of capacity*. It indicates the amount of data that can be transmitted in a set period of time.

- *Ethernet* is a set of standards and protocols that enables *communication between devices on a local network*.

- Ethernet uses a Protocol Data Unit called a Frame.

- Ethernet uses *MAC addressing* to identify devices connected to the local network.

- The *Internet Protocol* (IP) is the predominant protocol used for *inter-network communication*.

- There are two versions of IP currently in use: IPv4 and IPv6.

- The *Internet Protocol* uses a system of addressing (IP Addressing) to *direct data between one device and another across networks*.

- IP uses a Protocol Data Unit called a Packet.

## Networks

### What is a network?

The most basic way to describe a network is as two devices connected in such a way that they can exchange data. A primitive implementation of this would be connecting two computers directly to each other using a LAN cable, and configuring their network settings in such a way that they form a distinct network.

### Local area network

More likely to have multiple devices connected via a network bridging device such as a hub or a switch. The computers are connected via network cables and this forms the network. 

If the central device is a wireless hub or switch, this is known as WLAN. 

In a LAN the scope of communication is limited to the devices connected to the network hub or switch. 

### Inter-network communication

Routers are network devices that can route network traffic to other networks. Within a LAN they act as gateways in and out of the network.

### A Network of Networks

We can imagine the internet as a vast number of these networks connected together. In between all of the sub-networks are systems of routers that direct the network traffic.

## Protocols and network models

Protocols are a set of rules governing the exchange or transmission of data. 

There are numerous different protocols that are used to communicate over the internet. There are multiple protocols for network communication. Two of the main reasons for this are:

1. Different protocols were developed to address different aspects of network communication.
2. Different protocols were developed to address the same aspect of network communication, but in a different way or for a specific use-case. 

### A layered system

In computer network communication there are numerous conceptual models that attempt to break down the communication process into modules and structure it into a layered system. Two of the most popular are the OSI model and the Internet Protocol Suite (also known as the TCP/IP model or DoD model).

![The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled.png](The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled.png)

The different models have a different number of layers due to the different approaches taken by the two models. 

IP/TCP model = divides layers based on the scope of communications within each layer. 

OSI model = divides layers based on the functions that each layer provides.

Neither of these models perfectly fit a real world implementation but they are useful for developing a broad understanding of how a system works as a whole and for modularizing different levels of responsibility within that system.

Both models use encapsulation, which in this context refers to hiding data from one layer by encapsulating it within a data unit of the layer below.

### Protocol data units

A PDU is an amount or block of data transferred over a network. Different protocols refer to PDUs as different names.

At the data/link layer PDU = frame

Internet/network = packet

Transport = segment (TCP) or datagram(UDP)

In all cases the basic concept is the same: a PDU consists of a header, a data payload and in some cases a trailer or footer.

### Header and trailer

The exact structure of the header differs between protocols but the purpose of them is the same: provide protocol specific metadata about the PDU.

### Data payload

The data payload of a PDU is the data we want to transport over the network using a specific protocol at a particular network layer. 

The data payload is the key to the way encapsulation is implemented. The entire PDU from one layer is set as the data payload for a protocol at the layer below. 

![The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%201.png](The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%201.png)

The major benefit of this approach is the separation it creates between the protocols at different layers. This means that a protocol at one layer doesn't need to know anything about how a protocol at another layer is implemented in order for those protocols to interact. It creates a system whereby a lower layer effectively provides a 'service' to the layer above it. In other words, a TCP segment isn't really concerned whether its data payload is an HTTP request, an SMTP command, or some other sort of Application layer data. It just knows it needs to encapsulate *some data* from the layer above and provide the result of this encapsulation to the layer below.

This separation of layers provides a certain level of abstraction, which allows us to use different protocols at a certain layer without having to worry about the layers below. This is especially apparent at the Application layer, where many different protocols are used depending on the application and use case. For example, an email client would use SMTP, and web browser HTTP, and a file transfer program FTP, but all three of these programs could use TCP at the Transport layer to transfer the application layer data.

## The physical network

The physical network refers to the networked devices, cables, wires and radio waves used to transmit data. The physical network is bound by physical laws and rules.

These rules determine how data is transported from one place to another in a physical sense. This involves real world limitations and boundaries, such as how fast an electrical signal or light can travel, or the distance a radio wave can reach. These limitations determine the physical characteristics of a network. 

For example using Ethernet cables result in a loss of signal over just a few hundred feet. Light can be used to transmitted bits by using fiber optic cables which have glass tubes in the middle of the cable, through which light can be reflected. Using light to transmit data is fast and the signal doesn't degrade, even over large distances. Wireless data transmission occurs using radio waves. Radio waves have to be converted into binary data and can only be transmitted over short distances.

![The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%202.png](The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%202.png)

### Characteristics of a physical network

The two main characteristics that impact the performance of the physical network are **Latency** and **Bandwidth**.

Latency is the amount of *time* it takes for data to get from one point in the network to another.

Bandwidth is the *amount* of data that can be sent in a particular unit of time, usually a second. 

 

### Elements of latency

Latency is a measure of delay. There are different types of delay that can occur along the network and contribute to overall latency:

- **Propagation delay**: the amount of time it takes for a message to travel from the sender to the receiver. Can be calculated as the ratio between distance and speed.
- **Transmission delay:** the amount of time it takes to push data onto each individual link in the network. In terms of a driving analogy, you can think of it as the time taken to navigate an intersection or interchange between different roads.
- **Processing delay:** data travelling across a network doesn't directly cross from one link to another, the data is processed in various ways. Processing delays are the amount of time required for this processing to occur.
- **Queuing delay**: network devices can only process a certain amount of data at one time. If there is more data than the device can handle then it queues, or buffers the data. The amount of time data is waiting to be processed is the queuing delay.

Latency is the sum of all the delays outlined above.

Other types of latency:

- **Last mile latency:** a lot of the described delays take place within parts of the network that are closest to the end points. This is referred to as 'last mile latency' and relates to the delays involved in getting your network signal from your ISP's network to your own network.
- **Round trip time:** a latency calculation often used is round trip time (RTT). This is the length of time for a signal to be sent added to the length of time for a response to be received.

### Network hops

The journey of a piece of data on the network isn't direct but will consist of several 'hops' between nodes on the network. The nodes can be thought of as routers that process the data and forward it to the next node on the path. 

This can be visualised using `traceroute` , which displays the route and latency of a path across a network.

### Bandwidth

Bandwidth varies across a network and won't be constant from the start to the end of the network journey. For example the capacity of the core network will be greater than the part of the network that connects to your home. 

The bandwidth that a connection receives is the lowest amount at a particular point in the overall connection. A point at which the bandwidth changes from high to low is referred to as a bandwidth bottleneck.

 

## The link/ data link layer

In the last assignment, we looked at the idea of a network at the physical level being lots of devices connected by cables, transmitting binary data in the form of electrical signals, light, or radio waves. Simply having these devices being physically connected to each other isn't sufficient for them to communicate. They don't know *how* to communicate as they haven't established any rules for communication.

One of the most important rules for transferring data from one place to another is identifying the device to which we want to send that data. The protocols operating at this layer are primarily concerned with the identification of devices on the physical network and moving data over the physical network between the devices that comprise it, such as hosts (e.g. computers), switches, and routers.

Within the OSI model, the Data Link layer is Layer 2 and comes in between the Physical layer (1) and the Network layer (3). Within the Internet Protocol Suite, the Link layer is layer 1, since this model doesn't define a specific layer for the physical network. Within both of these models though, we can think of what happens at this layer as an interface between the workings of the physical network and the more logical layers above.

The most commonly used protocol at this layer is the Ethernet protocol. Ethernet cables and Ethernet communication protocols are all governed by the same IEEE standards. 

Two of the most important aspects of the Ethernet are **framing** and **addressing**.

### Ethernet frames

Ethernet frames are what PDUs are called at this layer and they encapsulate data from the Internet/ Network layer above. 

The link/ data link layer is the lowest layer at which encapsulation occurs. At the physical layer the data is essentially a stream of bits without any logical structure. An Ethernet frame adds logical structure to this binary data. The data in the frame is still in the form of bits but the structure defines which bits are actually the data payload and which are the metadata to be used in the process of transporting the frame.

An Ethernet compliant network device can identify the different parts of a frame due to the fact different 'fields' of data have specific lengths in bytes and appear in a set order.

![The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%203.png](The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%203.png)

- **Preamble and SFD:** The Preamble and Start of Frame Delimiter (SFD/ SOF) generally aren't considered part of the actual frame but are sent just prior to the frame as a synchronization measure which notifies the receiving device to expect frame data and then identify the start point of that data. The preamble is seven bytes (56 bits) long and the SFD is one byte (eight bits). Both use a repeated pattern that can be recognised by the receiving device, which then knows that the data following after is the frame data.
- **Source and Destination MAC address:** The next two fields, each six bytes (48 bits) long, are the source and destination MAC addresses. The source address is the address of the device which created the frame (as we'll see later on in this assignment, this can change at various points along the data's journey). The destination MAC address is the address of the device for which the data is ultimately intended. MAC Addresses are a key part of the Ethernet protocol; we'll look at them in more detail shortly.
- **Length:** the next field is two bytes (16 bits) in length. It is used to indicate the size of the Data Payload.
- **DSAP, SSAP, Control:** The next three fields are all one byte (8 bits) in length. The DSAP and SSAP fields identify the Network Protocol used for the Data Payload. The Control field provides information about the specific communication mode for the frame, which helps facilitate flow control.
- **Data Payload:** the data payload field can be between 42 and 1497 bytes in length. It contains the data for the entire Protocol Data Unit (PDU) from the layer above, an IP Packet for example.
- **Frame Check Sequence (FCS):** The final four bytes (32 bits) of an Ethernet Frame is the Frame Check Sequence. This is a checksum generated by the device which creates the frame. It is calculated from the frame data using an algorithm such as a cyclic redundancy check. The receiving device uses the same algorithm to generate a FCS and then compares this to the FCS in the sent frame. If the two don't match, then the frame is dropped. Ethernet doesn't implement any kind of retransmission functionality for dropped frames; it is the responsibility of higher level protocols to manage retransmission of lost data if this is a requirement of the protocol.

You don't need to memorize all of these fields. We list them here mainly to build a picture of an Ethernet Frame as *structured data*. The key components to remember are the Source and Destination MAC address and the Data Payload.

### Interframe gap

In addition to using the preamble and SFD to prepare a receiving device to process, Ethernet also specifies an interframe gap (IFG). This is a brief pause between the transmission of each frame, which permits the receiver to prepare for the next frame. The IFG contributes to the Transmission Delay of latency. 

### MAC addresses

MAC address is the physical address of a device. They are formatted as a sequence of six two digit hexadecimal numbers e.g. `00:40:96:9d:68:0a`

If you want to send data to another device on a network and the devices are connected via a hub then the data would be sent to all the networked devices and each receiving device would check its MAC address against the destination MAC address in the frame to see if it was the intended recipient. If not, it will just ignore the frame.

This is very inefficient and a better way of connecting devices on a network is to use a switch. A switch will use destination addresses to send a frame to the intended device only. A switch will store and update a record of the MAC addresses of the devices connected to the network and will associate an Ethernet port to each device connected to the switch. This data is kept in a MAC address table:

![The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%204.png](The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%204.png)

### Problem of scale

Whilst the MAC addressing system works well for local networks, there is a problem with scaling due to certain characteristics of MAC addresses:

1. They are physical rather than logical - each MAC address is tied to a specific physical device.
2. They are flat rather than hierarchical. The address can't be broken into sub-divisions.

Imagine your laptop is connected to a local network in New York. You then take that laptop to Tokyo and plug it into a local network there. In both locations, the physical MAC address would be the same. Keeping track of which MAC Addresses were part of which local networks would be an impossible task. Even if we were able to do this, the fact that the addresses are non-hierarchical means that routing devices would need a record of each single address that existed somewhere in the world; that would mean storing impossibly large tables.

If we want to solve these problems, we need a different system of rules that doesn't have these limitations and that can scale in such a way that we can build a network of networks which spans the entire globe. The Internet Protocol provides just such a set of rules.

## The Internet/ Network layer

The primary function of protocols at this layer is to facilitate communication between hosts on different networks.

The predominant protocol used at this layer is the Internet Protocol (IP). The IP is used for inter-network communication. There are two versions of the protocol currently in use : IPv4 and IPv6. There are differences between the two versions but the primary functions are the same:

- Routing capability via IP addressing
- Encapsulating data into packets

### Data packets

A Protocol Data Packet within the IP Protocol is called a packet. A packet is comprised of a data payload and a header. The data payload of a packet is the PDU from the layer above - the transport layer, and so it will generally be a TCP segment or a UDP datagram.

The header is split into logical fields that provide metadata used in transporting the packet. The data in the IP packet is in bits. The logical separation of the bits into the header field and payload is determined by the set size of each field (in bits) and order within the packet.

![The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%205.png](The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%205.png)

Some of the most important header fields are: 

- **Version:** this indicates the version of the Internet Protocol used, e.g. IPv4
- **ID, Flags, Fragment Offset:** these fields are related to fragmentation. If the Transport layer PDU is too large to be sent as a single packet, it can be fragmented, sent as multiple packets, and then reassembled by the recipient.
- **TTL:** every packet has a Time to Live (TTL) value. This is to ensure that any packets which don't reach their destination for some reason aren't left to endlessly bounce around the network. The TTL indicates the maximum number of network 'hops' a packet can take before being dropped. At each hop, the router which processes and forwards the packet will decrement the TTL value by one.
- **Protocol:** this indicates the protocol used for the Data Payload, e.g. TCP, UDP, etc.
- **Checksum:** this is an error checking value generated via an algorithm. The destination device generates a value using the same algorithm and if it doesn't match, it drops the packet. IP doesn't manage retransmission of dropped packets. This is left to the layers above to implement.
- **Source Address:** the 32-bit IP address of the source (sender) of the packet
- **Destination Address:** the 32-bit IP address of the destination (intended recipient) of the packet

### IP Addresses (IPv4)

Unlike MAC addresses, IP addresses are logical in nature. They aren't tied to a specific device but can be assigned as required when devices join a network.

IP addresses assigned to a device must fall within a range of addresses available to the local network that the device is connecting to. The range is determined by a network hierarchy in which an overall network is split into logical subnetworks, with each defined by the range of IP addresses available to it.

IPv4 addresses are 32 bits in length, divided into four sections of eight bits each. When converted from binary to decimal, each of those sections provides a range of numbers from `0` to `255`. 

![The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%206.png](The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%206.png)

Notes on this video: 

[https://www.khanacademy.org/computing/code-org/computers-and-the-internet/internet-works/v/the-internet-ip-addresses-and-dns](https://www.khanacademy.org/computing/code-org/computers-and-the-internet/internet-works/v/the-internet-ip-addresses-and-dns)

The internet is a design philosophy and architecture expressed through protocols. Design principle has allowed the internet to adapt and absorb the new communication technologies that have been developed since the conception of the internet.

A basic example of this hierarchy in action would be if all the addresses in the range `109.156.106.0` to `109.156.106.255` were assigned to a single local network. Each network defines the address at the start of the range, e.g. `109.156.106.0`, as the network address, and the address at the end of the range, e.g. `109.156.106.255`, as the broadcast address. Addresses between the network and broadcast address, `109.156.106.1` to `109.156.106.254`, can be allocated to individual devices on the network.

We won't go into what broadcast address is used for, but the network address of the range is used to identify a specific network segment. What this means is that a router that wants to forward an IP packet to any address in the entire range only needs to keep a record of which router on the network controls access to the segment with that network address. This logic is what creates the hierarchical structure, and means that routers don't need to keep records of every single device within an addressable range.

![The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%207.png](The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%207.png)

This splitting of a network into parts is referred to as sub-netting. By dividing IP address ranges further, subnets can be split into smaller subnets to create even more tiers within the hierarchy.

![The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%208.png](The%20internet%20b2ff9a2abf58425da1d5497cfb9fea05/Untitled%208.png)

### Routing and Routing tables

All routers on a network store a local routing table. When an IP packet is received by a router, the router examines the destination IP address and matches it against a list of network addresses in its routing table. The matching network address will determine where in the network hierarchy the sub network exists, which is then used to select the best route for the IP packet to travel.

[https://www.khanacademy.org/computing/code-org/computers-and-the-internet/internet-works/v/the-internet-packet-routers-and-reliability](https://www.khanacademy.org/computing/code-org/computers-and-the-internet/internet-works/v/the-internet-packet-routers-and-reliability)

### IPv6

The structure of IPv4 addresses means that there is a logical maximum of around 4.3 billion addresses. Due to the popularity of the internet, it is anticipated that this pool of addresses will eventually be depleted. Since the late 1990s, the Internet Engineering Task Force (IETF) have been working on a new version of the Internet Protocol called IPv6. Since IPv6 uses 128-bit addresses (eight 16-bit blocks), this increases the theoretical number of possible addresses to approximately 340 undecillion (340 billion billion billion billion).

As well as a difference in address structure, IPv6 has some other differences with IPv4 such as a different header structure for the packet and a lack of error checking (it leaves this to the Link Layer checksum).

### Networked Applications

Whereas the Ethernet protocol provides communication between devices on the same local network, the Internet Protocol enables communication between two networked devices anywhere in the world. We can send a message from one device on the internet and it can reach another device on the internet.

If we want to create networked applications however, communication between devices isn't sufficient. A single client device can have many applications running on it, such as a web browser, an email client, etc. Similarly a server can have many services running on it, such as a web server, a file server, or a mail server. Being able to transport data from one device to the other isn't sufficient to ensure that a specific application on the client can access the correct service on the server. This is why transport layer protocols are required.