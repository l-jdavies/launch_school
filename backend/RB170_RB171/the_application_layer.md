# The Application Layer

The application layer doesn't refer to the application itself, rather the set of protocols that provide communication services to applications.

Protocols at the application layer are the ones that an application most directly interacts, although applications aren't limited to only interacting with protocols at the application level.

The application layer protocols rely on the protocols from the lower levels to handle the transport of messages from one point to another, the application layer protocols focus on the structure of the message and the data that it should contain. 

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

[HTTP book](https://www.notion.so/HTTP-book-e4896067cfc642f280d79509ab5286dc)