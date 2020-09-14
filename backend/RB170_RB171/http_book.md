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

### Status codes

The HTTP status code is a three digit number that the server sends back after receiving a request to signify the status of the request. The `status text` displayed next to the `status code` provides a description of the code. It's listed under the **Status** column of the inspector. 

Common status codes:

[Untitled](https://www.notion.so/fa46a593b4b745d48f7a2a64574c9e0f)

 

**302 Found**

When a resource is moved the most common strategy is to re-route the request to a new URL. This is called a `redirect` . The status code 302  means the resource has been moved and the browser will automatically follow the new re-routed URL as stated in the `Location` response header. Automatic re-routing will only occur when using a browser, not a HTTP tool. 

**404 Not Found**

The server will return this status code when the requested resource can't be found. 

**500 Internal Server Error**

This means something has gone wrong on the server side. It's a generic error status code and it could mean a range of issues have occurred. It needs to be de-bugged and fixed by someone with server access. 

### Response headers

Response headers can also be viewed using the inspector tool and they offer information about the resource being sent back.

Some common response headers:

[Untitled](https://www.notion.so/936a209f311c44e3abff7732d4b521a9)

 

## Stateful web applications

We know that the HTTP protocol is stateless - the server doesn't hang on to information between each request/response cycle.

Despite HTTP being stateless most widely used applications has a certain state, for example when you navigate around Facebook you don't get logged out each time you navigate to a new page, the server response contains HTML that still shows our username and the application seems to maintain it's state.

Some of the techniques used to simulate a stateful experience are: 

- Sessions
- Cookies
- Asynchronous Javascript calls or AJAX

### Sessions

The client (browser) is used to augment HTTP into acting as though it were maintaining a stateful connection with the server, even though it isn't. One way this is achieved is having the server send a unique token to the client and whenever the client makes a request to that server the client appends the token as part of the request, allowing the server to identify clients. This unique token is called a **session identifer**.

Passing a `session id` between the client and server creates a sense of a persistent connection between requests. 

This a faux statefulness, which has several consequences. Each request must be inspected to see if it contains a session identifier. If a session does then the server must check to ensure the session id is still valid. The server needs to maintain some rules with regards to handling session expiration and how to store session data. The server also needs to retrieve the session data based on the session id. Finally, the server needs to recreate the application state from the session data and send it back to the client as a response.

This puts a lot of work onto the server because every request still gets its own response, even if most of the response is identical to the previous response. For example, if you're logged into Facebook, the server has to generate the initial page you see, and the response is a pretty complex and expensive HTML that your browser displays. The Facebook server has to add up all the likes and comments for every photo and status, and present it in a timeline for you. It's a very expensive page to generate. Now if you click on the "like" link for a photo, Facebook has to regenerate that entire page. It has to increment the like count for that photo you liked, and then send that HTML back as a response, even though the vast majority of the page stayed the same.

There are many advanced techniques that servers employ to optimize sessions and, as you can imagine, there are also many security concerns. Most of the advanced session optimization and security concerns are out of scope of this book, but we'll talk about one common way to store session information: in a browser cookie.

### Cookies

A cookie is a piece of data that's sent from the server and stored in the client during a request/response cycle. Cookies are small files stored in the browser and contain the session info. Most browsers have cookies enabled by default. The first time you visit a website, the server sends session information and sets it in your cookie browser on your computer. Note it's only the session information that's stored on your machine, the session data is still stored on the server. The client side cookie is compared with the server-side session data on each request to identify the current session. When you visit the same webpage again, your session will be recognized because of the stored cookie with its associated information. 

The response header will contain **set-cookie** headers that add cookie data to the response. The set-cookie response header is set the first time you visit a webpage. If you visit the same webpage again the cookie request header will be set to the same data previously sent by the set-cookie response header. The browser stores the cookies and the information persists even if the browser is closed and the computer shut down. 

In summary the session data is generated and stored on the server-side and the session id is sent to the client in the form of a cookie. Web applications take advantage of this to mimic a stateful experience on the web.

 

### AJAX

AJAX = Asynchronous JavaScript and XML. It allows browsers to issue requests and process responses without a full page refresh. When AJAX is used, all requests sent from the client are performed asynchronously, which just means that the page doesn't refresh.

The main thing to remember is that AJAX requests are just like normal requests: they are sent to the server with all the normal components of an HTTP request, and the server handles them like any other request. The only difference is that instead of the browser refreshing and processing the response, the response is processed by a callback function, which is usually some client-side JavaScript code.

 

## Security

### Secure HTTP

As the client and server send requests and responses to each other, all information in both requests and responses are being sent as strings. If a malicious hacker was attached to the same network, they could employ packet sniffing techniques to read the messages being sent back and forth. As we learned previously, requests can contain the session id, which uniquely identifies you to the server, so if someone else copied this session id, they could craft a request to the server and pose as your client, and thereby automatically being logged in without even having access to your username or password.

With HTTPS every request/response is encrypted before being transported on the network. This means if a malicious hacker sniffed out the HTTP traffic, the information would be encrypted and useless.

HTTPS sends messages through a cryptographic protocol called TLS for encryption. Earlier versions of HTTPS used SSL or Secure Sockets Layer until TLS was developed. These cryptographic protocols use certificates to communicate with remote servers and exchange security keys before data encryption happens. You can inspect these certificates by clicking on the padlock icon that appears before the https://

### Same-origin policy

This concept permits unrestricted interaction between resources originating from the same origin but restricts certain interactions between resources originating from different resources. **Origin refers to a combination of a url's scheme, hostname and port**. So [`http://mysite.com/doc1`](http://mysite.com/doc1) would be considered to have the same origin as [`http://mysite.com/doc2`](http://mysite.com/doc2), but a different origin to [`https://mysite.com/doc2`](https://mysite.com/doc2) (different scheme), [`http://mysite.com:4000/doc2`](http://mysite.com:4000/doc2) (different port), and [`http://anothersite.com/doc2`](http://anothersite.com/doc2) (different host). 

Same-origin policy doesn't restrict all cross-origin requests. Requests such as linking, redirects, or form submissions to different origins are typically allowed. Also embedding of resources from other origins such as scripts, images and other media are permitted. What is restricted are cross-origin requests where resources are being accessed programmatically using  APIs.

While secure, same-origin policy is an issue for web developers who have a legitimate need for making these restricted kinds of cross-origin requests. Cross-origin resource sharing or **CORS** was developed to deal with this issue. CORS is a mechanism that allows interactions that would normally be restricted cross-origin to take place. It works by adding new HTTP headers, which allow servers to serve resources cross-origin to certain specified origins.

The same-origin policy is an important guard against session hijacking attacks and serves as a cornerstone of web application security.

### Session hijacking

Usually, the session id is implemented as a random string and comes in the form of a cookie stored on the computer. With the session id in place on the client side now every time a request is sent to the server, this data is added and used to identify the session. In fact, this is what many web applications with authentication systems do. When a user's username and password match, the session id is stored on their browser so that on the next request they won't have to re-authenticate.

Unfortunately, if an attacker gets a hold of the session id, both the attacker and the user now share the same session and both can access the web application. In session hijacking, the user won't even know an attacker is accessing his or her session without ever even knowing the username or password.

Countermeasures for Session Hijacking:

- One popular way of solving session hijacking is by resetting sessions. With authentication systems, this means a successful login must render an old session id invalid and create a new one. With this in place, on the next request, the victim will be required to authenticate. At this point, the altered session id will change, and the attacker will not be able to have access. Most websites implement this technique by making sure users authenticate when entering any potentially sensitive area, such as charging a credit card or deleting the account.
- Another useful solution is by setting an expiration time on sessions. Sessions that do not expire give an attacker an infinite amount of time to pose as the real user. Expiring sessions after, say 30 minutes, gives the attacker a far narrower window to access the app.
- Finally, as we have already covered, another approach is to use HTTPS across the entire app to minimize the chance that an attacker can get to the session id.

### Cross site scripting(XSS)

This type of attack happens when you allow users to input HTML or JavaScript that ends up being displayed by the site directly.

For example, a form that allows you to add comments, which will then be displayed on the site. Because it's just a normal HTML `<textarea>`, users are free to input anything into the form. This means users can add raw HTML and JavaScript into the text area and submit it to the server as well.

If the server side code doesn't do any sanitization of input, the user input will be injected into the page contents, and *the browser will interpret the HTML and JavaScript and execute it*. In this case an alert message will pop up, which is definitely not the desired outcome. Attackers can craft ingeniously malicious HTML and JavaScript and be very destructive to both the server as well as future visitors of this page. For example, an attacker can use JavaScript to grab the session id of every future visitor of this site and then come back and assume their identity. It could happen silently without the victims ever knowing about it. Note that the malicious code would bypass the same-origin policy because the code lives on the site.

Potential solutions for cross-site scripting:

- One way to prevent this kind of attack is by making sure to always sanitize user input. Eliminate problematic input, such as <script> tags, or disallowing HTML and JavaScript input altogether in favor of a safer format, like Markdown.
- The second way to guard against XSS is to escape all user input data when displaying it. If you do need to allow users to input HTML and JavaScript, then when you print it out, make sure to escape it so that the browser does not interpret it as code.