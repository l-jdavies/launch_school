# The Transport Layer

In the previous lesson we explored the concept of the internet as a *layered system* of communication. Within this system, each layer provides a certain level of functionality or service to the layer above. We looked at some of the protocols at each layer in more detail, and at how the Internet Protocol (IP) essentially provides the inter-network communication services necessary for what we might think of as a *minimum viable internet*.

If we want to create modern networked applications however, there's a number of things that we need beyond what IP can provide. Two of the most important things are a direct connection between applications, and reliable network communication. In the next assignment, we'll look in more detail at reliability. First though, let's think about how we can provide end-to-end communication between applications or processes.

An important thing to understand about the Internet Protocol, and its system of addressing, is that it is intended to provide communication between *hosts*, or devices. These hosts can potentially be on the same local network, or on different local networks halfway around the world from each other. Either way, we can use IP to get a message from one host to the other, but not any more than that.

As we know though, there are potentially many applications running on a single host. If IP can get us as far as the host, how do we provide communication between an application running on one host and an application running on another host (or potentially between two different applications or processes running on the same host)?

## Summary

- *Multiplexing* and *demultiplexing* provide for the transmission of *multiple signals over a single channel*

- Multiplexing is enabled through the use of *network ports*

- Network sockets can be thought of as a *combination of IP address and port number*

- At the *implementation level*, sockets can also be *socket objects*

- The underlying network is *inherently unreliable*. If we want reliable data transport we need to implement a system of rules to enable it.

- *TCP* is a *connection-oriented* protocol. It establishes a connection using the *Three-way-handshake*

- TCP provides reliability through *message acknowledgement* and *retransmission*, and *in-order delivery*.

- TCP also provides *Flow Control* and *Congestion Avoidance*

- The main *downsides of TCP* are the *latency overhead of establishing a connection*, and the potential *Head-of-line blocking* as a result of in-order delivery.

- *UDP* is a very simple protocol compared to TCP. It provides *multiplexing*, but no reliability, no in-order delivery, and no congestion or flow control.

- *UDP* is *connectionless*, and so doesn't need to establish a connection before it starts sending data

- Although it is unreliable, the *advantage of UDP* is *speed* and *flexibility*.

## Multiplexing and demultiplexing

Given the IP protocol only provides communication between devices, an additional mechanism is required to enable communication between multiple applications functioning on the one device. The different applications running on a device can be thought of as different channels.

What we need is a way to transmit multiple data inputs (from the different channels) over a single host-to-host channel (IP Protocol) and then separate them out at the other end.

![The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled.png](The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled.png)

In the context of communication networks, the concept of transmitting multiple signals over a single channel is known as multiplexing. The reverse is demultiplexing. This takes place through the use of network ports.

## Ports

Ports are an identifier for a specific process running on a host. The identifier is an integer in the range of 0-65535.

Some ports are reserved for specific purposes:

- 0-1023 are well-known ports. These are assigned to processes that provide commonly used network services. For example HTTP is port 80, FTP is port 20 and 21, SMTP is port 25, and so on.
- 1024-49151 are registered ports. They are assigned as requested by private entities. For example, companies such as Microsoft, IBM, and Cisco have ports assigned that they use to provide specific services. On some operating systems, ports in this range are also used for allocation as *ephemeral ports* on the client side.
- 49152-65535 are dynamic ports (sometimes known as private ports). Ports in this range cannot be registered for a specific use. They can be used for customized services or for allocation as *ephemeral ports*.

Services running on servers will likely have a port in the well-known range assigned to them. If you want to connect via HTTP to a web-server running on a host machine, that web-server process will likely have port 80 assigned to it. This is sometimes described as the web server *listening* on port 80. We'll look in a bit more detail at what that means later on.

A service running on a client machine, for example in a browser running on your laptop, won't use one of these well-known ports, but instead have an *ephemeral* or temporary port assigned to it by the operating system, for example 59258.

Ports assist in multiplexing by being specified in the header of PDUs used in the transport  layer. The name and exact structure of PDUs in the transport layer differ depending on the protocol used but the PDUs all include the source port and destination port details.

Data from the application layer is encapsulated as the data payload in this PDU and the source and destination ports can be used to direct that data to a specific process on a host. The entire PDU is then encapsulated as the data payload in an IP packet. The IP addresses in the packet header direct the data from one host to another but it's the IP address and port numbers together that enable end to end communication between specific applications on different machines. 

The combination of an IP address and port define a communication end point. 

This communication end-point is generally referred to as a socket.

![The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled%201.png](The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled%201.png)

### Netstat

`netstat -ntup` returns a list of active network connections, in which the local address and foreign addresses are combinations of IP addresses and sockets.  

## Sockets

The term sockets is used slightly differently depending on the context. 

At a conceptual level a socket is an abstraction for an endpoint used for inter-process communication. However at implementation it can be used to refer to different things:

- UNIX socket: a mechanism for communication between local processes running on the same machine.
- Internet sockets (such as a TCP/IP socket): a mechanism for inter-process communication between networked processes (usually on different machines).

In socket programming, or network programming terms, the implementation of the socket concept involves instantiating socket objects. 

### Sockets and connections

In a connectionless system we might only have one socket object defined by the IP address of the host machine and the port assigned to a particular process running on that machine. The object could call a `listen()` method that would allow it to wait for incoming messages directed to that socket. The messages could come from any source, at any time and in any order but that isn't a concern in an connectionless system, it simply processes any incoming messages as they arrive and send any responses as required.

In a connection-orientated system you have a socket object, also using the `listen()` method to wait for incoming messages but when a message arrives a new socket object is instantiated. This new socket isn't only defined by the local IP address and port number but also the IP and port of the process that sent the message. The new socket object would then specifically listen for messages where all four pieces of information match (source port, source IP, destination port, destination IP). The combination of these four pieces of information are referred to as a **four-tuple**. 

![The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled%202.png](The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled%202.png)

 

Any messages that don't match the four tuple will be picked up by the original socket and a new socket object will be instantiated for the new connection.

This creates a dedicated connection between a specific process running on one host and a specific process running on another host. The advantage is you can more easily put in place rules for managing the communication such as order of messages, acknowledgement of message receival etc. The purpose of these types of additional communication rules is to add more reliability to the communication.

## Network reliability

The communication protocols used to provide functionality at the lower layers of the network systems are inherently unreliable. The Ethernet and Internet Protocols use checksum data to determine if any data was corrupted during transport but if the data is corrupt the frame or packet is just dropped. These protocols have no provision for replacing the lost data. 

Obviously an unreliable system isn't particularly useable, therefore additional protocols are required to enable a reliable transfer of data over an unreliable system.

## Transmission Control Protocol (TCP)

TCP is one of the corner stones of the internet by providing reliable data transfer.

TCP provides the abstraction of reliable network communication on top of an unreliable channel. The abstraction hides most of the complexity of reliable network communication from the application layer. It abstracts the implementation of data integrity, de-duplication, in-order delivery and the retransmission of lost data.

Although TCP is the protocol of choice for many networked applications, the complexity of the protocol has an impact on performance.

In addition to providing reliability, TCP also provides data encapsulation and multiplexing through the use of TCP segments.

### TCP Segments

Segments are the PDUs of the TCP. The TCP segment header contains a number of different fields, including the source port and destination port, which provide the multiplexing capability of the protocol. 

![The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled%203.png](The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled%203.png)

![The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled%204.png](The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled%204.png)

Some of the more important fields in the header in terms of implementing reliability are:

- **CHECKSUM:** The Checksum provides the Error Detection aspect of TCP reliability. It is an error checking value generated by the sender using an algorithm. The receiver generates a value using the same algorithm and if it doesn't match, it drops the Segment. We've encountered Checksums already in this course, in other PDUs at other network layers such as IP Packets. Having a Checksum at the Transport Layer does render Checksums at lower layers redundant to a certain extent. IPv6 headers don't include a Checksum for this reason, based on the assumption that checksums are implemented at either the Transport or Link/ Data Link layers (or both).
- **SEQUENCE NUMBER and ACKNOWLEDGEMENT NUMBER:** these two fields are used together to provide for the other elements of TCP reliability such as In-order Delivery, Handling Data Loss, and Handling Duplication. The precise way in which TCP uses these fields is beyond the scope of this course, but it is essentially a more complex version of the simplified example of the Reliable Protocol we constructed in the previous assignment.

Other fields of interest in a typical header are the WINDOW SIZE field and the various Flag fields. The WINDOW SIZE field is related to Flow Control, which we will look at a bit later on. The Flag fields are one-bit boolean fields. A couple of these fields, `URG` and `PSH`, are related to how the data contained in the Segment should be treated in terms of its importance or urgency; we aren't going to go into exactly how these particular flags are used. The `SYN`, `ACK`, `FIN`, and `RST` flags are used to establish and end a TCP connection, as well as manage the state of that connection.

### TCP Connections

TCP is a connection-orientated protocol. Data transmission only begins once a connection has been established between application processes. In order to establish a connection TCP uses a three-way handshake, which uses the `SYN` and `ACK` flags.

![The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled%205.png](The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled%205.png)

In the above process, the following happens:

- The sender sends a SYN message (a TCP Segment with the `SYN` flag set to `1`)
- Upon receiving this SYN message, the receiver sends back a SYN ACK message (a TCP Segment with the `SYN` and `ACK` flags set to `1`)
- Upon receiving the SYN ACK, the sender then sends an `ACK` (a TCP Segment with the `ACK` flag set to `1`)

Upon sending the `ACK`, the sender can immediately start sending application data. The receiver must wait until it has received the ACK before it can send any data back to the sender. One of the main reasons for this process is to synchronise (`SYN`) the sequence numbers that will be used during the connection.

The flags manage the connection state.

A connection progresses through a series of states during its lifetime. The states are: `LISTEN`, `SYN-SENT`, `SYN-RECEIVED`, `ESTABLISHED`, `FIN-WAIT-1`, `FIN-WAIT-2`, `CLOSE-WAIT`, `CLOSING`, `LAST-ACK`, `TIME-WAIT`, and the fictional state `CLOSED`. `CLOSED` is fictional because it represents the state when there is no TCB, and therefore, no connection. Most of the time the state we are most concerned with is `ESTABLISHED`, and also `LISTEN` on the server side. The other states are related to the establishment and termination of connections.

This three way handshake means there is a latency each time a TCP connection is made, which will impact any application that uses TCP at the transport layer. TCP involves a lot of overhead to establish a connection and providing reliability through the transmission of lost data. To mitigate these overheads the process of data transfer needs to be as efficient as possible. TCP achieves this by providing mechanisms for flow control and congestion avoidance.

### Flow control

Flow control prevents a sender from overwhelming a receiver with too much data at once. Data that's waiting to be processed is stored in a 'buffer'. Buffer size is dependent on the amount of memory allocated and the physical resources available.

Each side of the connection specifies the amount of data it can accept in the WINDOW field of the TCP header. This can change during the course of a connection. For example if the receiver's buffer is getting full then it can set a lower amount in the WINDOW of the segment it sends to the sender.

Flow control only prevents the sender overwhelming the receiver - it doesn't prevent the sender or the receiver from overwhelming the network. That is managed by congestion avoidance.

### Congestion avoidance

Network congestion is when there is more data being transmitted on the network than there is network capacity to process and transmit the data. Any excess data on the network is dropped.

In the [last lesson](https://launchschool.com/lessons/4af196b9/assignments/b222ecfb) we looked at IP packets moving across the networks in a series of 'hops'. At each hop, the packet needs to be processed: the router at that hop runs a checksum on the packet data; it also needs to check the destination address and work out how to route the packet to the next hop on its journey to that destination. All of this processing takes time, and a router can only process so much data at once. Routers use a 'buffer' to store data that is awaiting processing, but if there is more data to be processed than can fit in the buffer, the buffer over-flows and those data packets are dropped.

As we've already seen, TCP retransmits lost data. If lots of data is lost that means lots of retransmitted data, which is inefficient. Ideally we want to keep retransmission to a minimum. TCP actually uses data loss as a feedback mechanism to detect, and avoid, network congestion; if lots of retransmissions are occurring, TCP takes this as a sign that the network is congested and reduces the size of the transmission window.

There are various different approaches and algorithms for determining the size of the initial transmission window, and how much it should be reduced or increased by depending on network conditions. The exact algorithm or approach used will depend on which variant of TCP is in operation.

   

### Disadvantages of TCP

In addition to the latency caused by establishing a TCP connection, TCP can also cause head-of-line (HOL) blocking.

HOL isn't specific to TCP and in general it relates to the fact that issues in delivering or processing one message in a sequence of messages can delay or block the delivery or processing of subsequent messages in the sequence.

With TCP HOL blocking can occur as a result of the fact that TCP provides for in-order delivery of segments. If one of the segments need to be retransmitted then the segments that come after it in the sequence can't be processed and are buffered until the retransmission has occurred. This can increase the queuing delay.

## User Datagram Protocol (UDP)

UDP doesn't implement reliable data transfer through sequencing and retransmission of lost data, nor does it have mechanisms for flow control or congestion avoidance.

PDU of the UDP is a datagram. The header of a datagram only has four fields: The header only has four fields: Source Port, Destination Port, UDP Length (the length, in bits, of the Datagram, including any encapsulated data), and a Checksum field to provide for error detection. That's it. Even the Checksum field is optional if using IPv4 at the Network layer (if using IPv6, you need to include a Checksum in the Datagram since IPv6 packets don't include one themselves).

![The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled%206.png](The%20Transport%20Layer%201d6347e4639f4bdea37c164c97d837ab/Untitled%206.png)

The inclusion of the source port and destination port in the UDP datagram header means multiplexing is provided by UDP but that's about it. Unlike TCP, UDP does not provide any reliability to the unreliable layers below. In comparison to TCP, UDP does not:

- provide guarantee of message delivery
- provide guarantee of message delivery order
- provide built in mechanisms for flow control or congestion avoidance
- provide connection state tracking - it is a connectionless protocol

### Advantage of UDP

One advantage of using UDP is that it is much more simple than TCP and that simplicity offers speed and flexibility. 

UDP is a connectionless protocol. Applications using UDP at the Transport layer can just start sending data without having to wait for a connection to be established with the application process of the receiver. In addition to this, the lack of acknowledgements and retransmissions means that the actual data delivery itself is faster; once a datagram is sent it doesn't have to be sent again. Latency is less of an issue since without acknowledgements data essentially just flows one way: from sender to receiver. The lack of in-order delivery also removes the issue of Head-of-line blocking (at least at the Transport layer).

It's likely that someone building a UDP-based application will want to implement some of the services that UDP doesn't natively provide. Which services those would be, and the way they're implemented, would be up to whoever was building the application though. For example, you might want your application to have in-order delivery, but at the same time not be worried about the occasional piece of lost data. You could implement sequencing, but choose not to implement data retransmission. The specifics of which services to include are in left up to the software engineer and can be implemented at the application level, effectively using UDP as a 'base template' to build on top of.

An example of such an application would be a voice or video calling application. The occasional piece of dropped data leading to a slightly glitchy call or a few pixels of video not rendering properly is worth the trade off of the speed provided by the protocol which allows the application to work even over long distances where there is high latency. Another example would be online gaming where the occasional loss of data causing a slight glitch is more acceptable than having significant lag in the gaming experience.

While UDP provides a lot of flexibility and freedom, with that freedom comes a certain amount of responsibility. There are various best practices that should be adhered to. For example, it would be expected that your UDP-based application implements some form of congestion avoidance in order to prevent it overwhelming the network.