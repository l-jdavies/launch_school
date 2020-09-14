# HTTP book

HTTP was invented in the 1980s. It's a protocol that serves as a link between applications and the transfer of hypertext documents. HTTP follows a simple model where a client makes a request to a server and waits for a response. It is referred to as a **request response protocol**.

The HTTP protocol has gone through several changes since it was first developed. The earliest form of the protocol could only return HTML pages. HTTP/2 is gaining traction and HTTP/3 is currently in development.

## How the internet works

The Internet consists of millions of interconnected networks that allow all sorts of computers and devices to communicate with each other. By convention, all devices that participate in a network are provided unique labels. The general term for this type of label is an Internet Protocol Address or **IP Address** and is similar to a computer's phone number on the Internet. **Port numbers** add more detail about how to communicate (think of company phone extensions). IP Addresses are represented as:

```
192.168.0.1

```

When a port number is needed, the address is specified as:

```
192.168.0.1:1234

```

where the IP Address is `192.168.0.1` and the port number is `1234`. An IP Address acts as the identifier for a device or server, and can contain hundreds or thousands of ports, each used for a different communication purpose to that device or server.

When it comes to the wider Internet, effective communication begins when each device has a public IP address provided by an [Internet Service Provider](http://en.wikipedia.org/wiki/Internet_service_provider). But what about an address like [http://www.google.com](http://www.google.com/)? How does your computer know what IP address it's mapped to? When we wish to connect to Google's main page, we do not type in the IP Address, we type in its URL.

### DNS

Mapping from URL to IP address is handled by the DNS - domain name system.

DNS is a distributed database that translates domain names to an IP address that can be used to make a request to the server. DNS databases are stored on **DNS servers.** There is a world-wide network of hierarchically organised DNS servers with no one server containing the complete database. If a DNS server does not contain the requested domain name then the DNS server routes the request to a DNS server higher up the hierarchy.

 

Your typical interaction with the Internet starts with a web browser when you:

1. Enter a URL like [http://www.google.com](http://www.google.com/) into your web browser's address bar.
2. The browser creates an HTTP request, which is packaged up and sent to your device's network interface.
3. If your device already has a record of the IP address for the domain name in its DNS cache, it will use this cached address. If the IP address isn't cached, a DNS request will be made to the Domain Name System to obtain the IP address for the domain.
4. The packaged-up HTTP request then goes over the Internet where it is directed to the server with the matching IP address.
5. The remote server accepts the request and sends a response over the Internet back to your network interface which hands it to your browser.
6. Finally, the browser displays the response in the form of a web page.

Although this is a simplification of the steps involved the key point is that when a browser issues a request it's simply sending some text to an IP address. HTTP

 is a protocol that enables a server to break down a request from a client and understand the components before sending a response back to the client. The web browser then processes the response string. 

### Clients and servers

The most common client is a web browser. Web browsers are responsible for issuing HTTP requests and processing the HTTP response in a user friendly manner. There are many other tools that function as clients.

Content that is requested by a HTTP request is located on a server - a remote computer. Servers are machines or devices that are capable of handling inbound requests and issuing a response back to the client. Often the response sent will contain the relevant data requested.

### Statelessness

A protocol is said to be stateless when the design means that each request/response pair is independent of the previous one. HTTP is a stateless protocol and this means the server does not hang on to any information or state between requests. This means if request breaks en-route to a server, no clean up is required. This makes HTTP both a resilient protocol and a difficult protocol for designing stateful applications. This means developers have to work to create stateful applications on top of a stateless protocol. 

 

## What is a URL?

A URL is the most frequently used part of the general concept of a Uniform Resource Identifier or URI, which specifies how resources are located.

When you see a URL, such as "[http://www.example.com:88/home?item=book](http://www.example.com:88/home?item=book)", it is comprised of several components. We can break this URL into 5 parts:

- `http`: The **scheme**. It always comes before the colon and two forward slashes and tells the web client how to access the resource. In this case it tells the web client to use the Hypertext Transfer Protocol or HTTP to make a request. Other popular URL schemes are `ftp`, `mailto` or `git`. You may sometimes see this part of the URL referred to as the *protocol*, and there is a connection between the two things in that the scheme can indicate which protocol (or system of rules) should be used to access the resource; in the context of of a URL however, the correct term for this component is the *scheme*.
- `www.example.com`: The **host**. It tells the client where the resource is hosted or located.
- `:88` : The **port** or port number. It is only required if you want to use a port other than the default.
- `/home/`: The **path**. It shows what local resource is being requested. This part of the URL is optional.
- `?item=book` : The **query string**, which is made up of **query parameters**. It is used to send data to the server. This part of the URL is also optional.

Sometimes, the path can point to a specific resource on the host. For instance, [www.example.com/home/index.html](http://www.example.com/home/index.html) points to an HTML file located on the [example.com](http://example.com/) server.

### Query Strings/Parameters

A simple URL with a query string might look like:

```
http://www.example.com?search=ruby&results=10
```

 

- `?` : reserved character that marks the start of the query string.
- `search=ruby` : parameter name/value pair
- `&` : reserved character used when adding more parameters to the query string.
- `results=10` : another parameter name/value pair

How a server uses parameters in a query string is determined by the server side application.

Because query strings are passed in through the URL they are only used in HTTP GET requests. 

Query strings pass in additional information to the server but there are some limitations:

- Query strings have a maximum length and therefore can't be used to submit lots of information
- The name/value pairs used in query strings are visible in the URL - no sensitive information
- Whitespaces and reserved characters can't be used with query strings - they must be URL encoded

### URL encoding

URLs only accept certain characters in the standard 128 character ASCII character set. Reserved or unsafe ASCII characters that are not being used for their intended purpose as well as any additional characters, have to be encoded. URL encoding replaces the non-conforming characters with a `%` symbol followed by two hexadecimal digits that represent the ASCII code of the character.

![HTTP%20book%20c0a0998155f8400097a2b6f0940d3d62/Untitled.png](HTTP%20book%20c0a0998155f8400097a2b6f0940d3d62/Untitled.png)

 

Characters should be encoded if:

- They have no corresponding character within the standard ASCII character set
- Use of the character is unsafe because it may be misinterpreted or modified by some systems. For example `%` is unsafe because it can be used for encoding other characters. Other unsafe characters include spaces, quotation marks, the `#` character, `<` and `>`, `{` and `}`, `[` and `]`, and `~`, among others.
- The character is reserved for special use within the URL scheme. Some characters are reserved for a special meaning; their presence in a URL serve a specific purpose. Characters such as `/`, `?`, `:`, `@`, and `&` are all reserved and must be encoded. For example `&` is reserved for use as a query string delimiter. `:` is also reserved to delimit host/port components and user/password.

So what characters can be used safely within a URL? Only alphanumeric and special characters `$-_.+!'()",` and reserved characters when used for their reserved purposes can be used unencoded within a URL. As long as a character is not being used for its reserved purpose, it has to be encoded.

## Making HTTP requests

The two most common HTTP request methods are `GET` and `POST` .

### GET requests

`GET` requests are initiated by clicking a link or via the address bar of a browser. The default behaviour of a link is to issue a `GET` request to a URL.

The primary concepts of `GET` requests are:

- GET requests are used to retrieve a resource and most links are GETs.
- The response from a GET request can be anything but if it's HTML and that HTML references other resources then the browser will automatically request those referenced resources

### POST requests

`POST` is used when you need to initiate an action on the server or send data to a server.

Typically from within a browser, you use POST when submitting a form. POST requests allow us to send much larger and sensitive data to the server, such as images or videos. For example, say we need to send our username and password to the server for authentication. We could use a GET request and send it through query strings. The flaw with this approach is obvious: our credentials become exposed instantly in the URL; that isn't what we want. Using a POST request in a form fixes this problem. POST requests also help sidestep the query string size limitation that you have with GET requests. With POST requests, we can send significantly larger forms of information to the server.

Instead of sending data through the URL, data can be sent in the HTTP body. The body contains the data that is being transmitted in an HTTP message and is optional. A HTTP message can be sent with an empty body. When used, the body can contain HTML, images, audio and so on. You can think of the body as the letter enclosed in an envelope, to be posted.

The POST request generated by the HTTP tool or curl is the same as you filling out the form in the browser, submitting that form, and then being redirected to the next page. Look carefully at the raw response in the HTTP tool screenshot. The key piece of information that redirects us to the next page is specified in the field `Location: [http://al-blackjack.herokuapp.com/bet](http://al-blackjack.herokuapp.com/bet)`. `Location` and its associated data is part of what is known as an HTTP response header. Your browser sees the response header and automatically issues a brand new request to the URL specified in the `Location` header, thereby initiating a new, unrelated request. 

### HTTP headers

HTTP headers allow the client and server to send additional information during the request/response HTTP cycle. Headers are colon separated name/value pairs that are sent in plain text. They can be viewed by using the inspector in a browser. There are response and request headers.

 

### Request headers

Request headers give more information about the client and the resource to be fetched. 

 

## Processing responses

The raw HTTP data returned by a server is called a response.

### Status code

The HTTP status code is a three digit number that the server sends back after receiving a request to signify the status of the request. The `status text` displayed next to the `status code` provides a description of the code. It's listed under the **Status** column of the inspector.