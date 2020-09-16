# The Application Layer

The application layer doesn't refer to the application itself, rather the set of protocols that provide communication services to applications.

Protocols at the application layer are the ones that an application most directly interacts, although applications aren't limited to only interacting with protocols at the application level.

The application layer protocols rely on the protocols from the lower levels to handle the transport of messages from one point to another, the application layer protocols focus on the structure of the message and the data that it should contain. 

## Summary

- The *Domain Name System* (DNS) is a distributed database which *translates a domain name* such as `google.com` *to an IP Address* such as `216.58.213.14`

- A *URI* is an *identifier* for a *particular* resource within an information space.

- A URL is a subset of URI, but the two terms are often used interchangeably.

- URL components include the *scheme*, *host* (or hostname), *port*, *path*, and *query string*.

- *Query strings* are used to *pass additional data* to the server during an HTTP Request. They take the form of *name/value pairs* separated by an `=` sign. Multiple name/value pairs are separated by an `&` sign. The start of the query string is indicated by a `?`.

- *URL encoding* is a technique whereby *certain characters* in a URL are *replaced with an ASCII code*.

- URL encoding is used if a character has no corresponding character in the ASCII set, is unsafe because it is used for encoding other characters, or is reserved for special use within the url.

- A single HTTP message exchange consists of a *Request* and a *Response*. The exchange generally takes place between a *Client* and a *Server*. The client sends a Request to the server and the server sends back a Response.

- An *HTTP Request* consists of a *request line*, *headers*, and an optional *body*.

- An *HTTP Response* consists of a *status line*, optional *headers*, and an optional *body*.

- *Status codes* are part of the status line in a Response. They indicate the status of the request. There are various categories of status code.

- HTTP is a *stateless* protocol. This means that each Request/ Response cycle is independent of Request and Responses that came before or those that come after.

- *Statefulness can be simulated* through techniques which use *session IDs*, *cookies*, and *AJAX*.

- HTTP is *inherently insecure*. Security can be increased by using *HTTPS*, enforcing *Same-origin policy*, and using techniques to prevent *Session Hijacking* and *Cross-site Scripting*.

## Application layer protocols

Application layer protocols are the rules for how applications talk to each other at a syntactical level. 

Different types of applications have different requirements with regards to how they communicate at a syntactical level so there are many different protocols that exist at the application layer. For example, the rules for how an email client communicates with an email server will be different from the rules for how a web browser communicates with a web server. 

 

## HTTP and the web

The internet is essentially a network of networks and can be thought of as the infrastructure that enables inter-network communication, both in terms of the physical network and the lower-level protocols that control its use.

The World Wide Web (web) is a **service** that can be accessed via the internet. It's a vast information system comprised of resources that can be accessed via a URL (Uniform Resource Locator). HTTP is closely tied to the web and is the primary means by which applications interact with the resources that make up the web.

### History of the web

The web was developed to address the problem of CERN having lots of information distributed across many different computers, which were on the same network but were difficult to access. Berners-Lee's idea was to harness the power of internet connectivity along with the emerging technology, hypertext. His aim was to develop an easily accessible information system. Within this system information would exist on various computers as structured resources and the resources would be connected to each other using hyperlinks. This would create a vast 'web' of information.

For this system to work uniformity is required. Uniformity in how resources were structured so they would all render correctly, uniformity in how resources were addressed so they could be located easily and uniformity in the way a request for a resource is made and uniformity in how the request is responded to. This uniformity was initially imposed by a combination of three technologies - HTML, URIs and HTTP.

**Hypertext Markup Language** (HTML) was the means by which the resources in this system should be uniformly structured. This early version of HTML was intended for structuring text documents using headings, paragraphs, and lists. It was very basic, containing only 18 elements. The most revolutionary of these elements was the anchor elements `<A>`, which uses a `href` attribute to provide a link from one resource to another. We'll explore HTML in a lot more detail in a later course.

A **Uniform Resource Identifier** (URI), is a string of characters which identifies a particular resource. It is part of a system by which resources should be uniformly **addressed** on the Web. The terms URI and URL (Uniform Resource Locator) are often used interchangeably. We'll discuss the distinctions in a later assignment.

**Hypertext Transfer Protocol** (HTTP) is the set of rules which provide uniformity to the way resources on the web are transferred between applications. In the next assignment we'll dive into HTTP and get a good understanding of how it works.

## HTTP book

[HTTP book](https://www.notion.so/HTTP-book-e4896067cfc642f280d79509ab5286dc)

## Background and diagrams

### Client-server

HTTP is a stateless protocol for a client to communicate with servers. A client issues a HTTP request to a server, the server processes the request and sends a response back to the client.

What we refer to as the 'server' is more complex than first thought. A server is composed of components, such as a web server and application server, and this is still a simplified model. Each of these components may be distributed across many physical machines and each of them could itself be comprised of multiple machines. There could also be many other intermediary machines, like load balancers, etc; large server infrastructures run into the hundreds or thousands of machines. Yet taken together as unified concept, the server-side infrastructure in its entirety is the "server" to the client. The word "server" is severely overloaded, so it's important to keep in mind what exactly we're talking about at every turn.

In a simple model three primary server-side infrastructure components are a **web server**, an **application server** and a **data store**.

A web server typically responds to simple requests for static assets such as files, images, css, JavaScript etc. The requests don't require data processing so they can be handled by a simple web server. 

An application server is usually where the application or business logic resides and is where complex requests are handled. This is where server side code lives when deployed.

The application server will communicate with a persistent data store to retrieve or create data. Data stores can be databases, simple files, key/value stores, and many other variations as long as the store can save data in some format for later retrival and processing.

### HTTP over TCP

Most of the time HTTP is relying on a TCP/IP connection. HTTP operates at the application layer and is concerned with structuring the messages that are exchanged between applications. It's actually TCP/IP that ensures the request/response cycle is completed between the client and the server.

## URLs

URI = uniform resource identifier

URL = uniform resource locator

URLs are the most frequently used part of an URI but the distinction between the two terms can be a point of confusion, particularly as the terms are sometimes used interchangeably.

According to official documentation a URL is a subset of a URI that includes the network location of a resource. Therefore, [`https://launchschool.com/forum`](https://launchschool.com/forum) could be referred to as both a URL and a URI but we will stick to using URL as this is more specific.

 

[https://www.youtube.com/watch?v=if0pzXWZOfY](https://www.youtube.com/watch?v=if0pzXWZOfY)

 

### Schemes and protocols

The terms scheme and protocol are frequently confused when discussing URLs. 

The component of a URL that prepends the colon and two forward slashes is the scheme but it's frequently incorrectly referred to as the protocol. There is a relationship between the two things in that the scheme identifies which protocol should be used to access the resource. It should be noted that 'protocol' in this sense refers to a 'family' of protocols, rather than a specific protocol version, e.g. `HTTP` rather than `HTTP 1.0` or `HTTP 1.1`.

In the [more general context](https://tools.ietf.org/html/rfc3986#section-3.10) of a URI, a scheme name is defined as "a specification for assigning identifiers within that scheme", and isn't related to a particular protocol. A full list of URI scheme names can be found on the [IANA website](https://www.iana.org/assignments/uri-schemes/uri-schemes.xhtml).

One more thing to note when discussing schemes and protocols is that the canonical form of a scheme name is lowercase. The convention is to refer to scheme names in lowercase, e.g. `http`, and protocol names in uppercase, e.g. HTTP.

### URLs and filepaths

In the early days of the web the path portion of a URL represented a location to a physical file on the web. However, now much of the content consumed on the web is generated dynamically. 

The dynamic generation of content often takes place on the server, with server-side frameworks or applications combining templates with stored data to produce HTML 'pages' that form the body of an HTTP response. In recent years there has been a rises in client-side frameworks where the HTTP response will contain the raw data which is manipulated by an application running in the browser before being rendered.

Although these server-side and client-side frameworks differ in their implementation, one thing they have in common is that the way the path portion of the URL is used is determined by the application logic, and doesn't necessarily bear any relationship to an underlying file structure on the server. The way that the path is used will vary according to the specific implementation of the application or framework, but often involves URL pattern-matching to match the path to a pre-defined 'route' which then executes some specific logic.

 

### Practice problems: URL components

1. Given the following URL:

```
https://amazon.com/Double-Stainless-Commercial-Refrigerator/B60HON32?ie=UTF8&qid=142952676&sr=93&keywords=commercial+fridge

```

a. Identify the **host**

`amazon.com`

b. Identify the **names** of the **query parameters**

`ie`

`qid`

`sr`

`keywords`

c. Identify the **values** of the **query parameters**

`UTF8`

`142952676`  

`93`

`commercial+fridge`

d. Identify the **scheme**

`https`

e. Identify the **path**

`/Double-Stainless-Commercial-Refrigerator/B60HON32`

f. Identify the **port**

Not shown.

2. Add the port `3000` to the following URL:

```
http://amazon.com:3000/products/B60HON32?qid=142952676&sr=93
```

3. Given the following URL:

```
http://localhost:4567/todos/15

```

a. Identify the **query parameters** 

None.

b. Identify the **scheme**

`http`

c. Identify the **path**

`todos/15`

d. Identify the **host**

`localhost`

e. Identify the **port**

`4567`

4. What are two different ways to encode a space in a query parameter? We didn't cover this in the lectures, so feel free to search online for the answer.

`%20` or `+`

5. What character indicates the beginning of a URL's query parameters?

`?`

6. What character is used between the name and value of a query parameter?

`=`

7. What character is used between multiple query parameters?

`&`

### Practice problems: request/response cycle

1. What are the required components of an HTTP request? What are the additional optional components?

    **Required:**

    HTTP method (GET or POST)

    Path

    Host header

    **Optional:**

    Parameters

    Other headers

    Message body

2. What are the required components of an HTTP response? What are the additional optional components?

    **Required:**

    Status code

    **Optional:**

    Headers

    Body

3. What determines whether a request should use `GET` or `POST` as its HTTP method?

The purpose of the request. If the client wants to receive data from a server - use GET, if it wants to send data to a server, use POST.