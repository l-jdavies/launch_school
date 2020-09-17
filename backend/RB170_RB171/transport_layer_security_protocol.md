# Transport Layer Security protocol

TLS started as a protocol called SSL - Secure Sockets Layer. It was standardised and renamed TLS in 1999 but the terms are still used interchangeably. 

TLS provides three important security services - encryption, authentication and integrity. Each are important in their own right but when combined are effective are providing secure message exchange over an insecure channel. 

**Encryption**: process of encoding a message so it can only be read by those with an authorised means of decoding the message.

**Authentication**: process to verify the identity of a particular party in the message exchange. 

**Integrity**: process to detect whether a message has been interfered with or faked.

An application that uses TLS doesn't have to use all three services simultaneously. You can design an application to accept encrypted messages from a sender without authenticating who the sender is. Generally, all three services are used together to provide the most secure connection possible.

## Summary

- *HTTP Requests and Responses* are transferred in *plain text*; as such they are *essentially insecure*.

- We can use the *Transport Layer Security* (TLS) Protocol to add security to HTTP communications.

- *TLS encryption* allows us to *encode messages* so that they can only be read by those with an authorized means of decoding the message

- TLS encryption uses a combination of *Symmetric Key Encryption* and *Asymmetric Key Encryption*. Encryption of the initial key exchange is performed asymmetrically, and subsequent communications are symmetrically encrypted.

- The *TLS Handshake* is the process by which a client and a server *exchange encryption keys*.

- The *TLS Handshake* must be performed before secure data exchange can begin; it involves *several round-trips of latency* and therefore has an *impact on performance*.

- A *cipher suite* is the *agreed set of algorithms* used by the client and server during the secure message exchange.

- *TLS authentication* is a means of *verifying the identity* of a participant in a message exchange.

- TLS Authentication is implemented through the use of *Digital Certificates*.

- Certificates are *signed* by a *Certificate Authority*, and work on the basis of a *Chain of Trust* which leads to one of a small group of highly trusted *Root CAs*.

- Certificates are *exchanged* during the *TLS Handshake* process.

- *TLS Integrity* provides a means of *checking* whether a message has been *altered or interfered with* in transit.

- TLS Integrity is implemented through the use of a *Message Authentication Code* (MAC).

## TLS Encrytion

TLS sets up an encrypted connection via a process called the TLS handshake.

### Symmetric Key Encryption

Symmetric key encryption is when both the sender and the receiver both share a common encryption key. The common key is used for both message encryption and decryption. 

This poses a problem - how do you exchange the key in a secure manner? A mechanism is  required to encrypt the encryption key itself so if the key is intercepted, it can't be used.

### Asymmetric Key Encryption

This is also known as public key encryption and it uses a pair of keys: a public key and a private key. In the asymmetric key encryption the keys used in the pair are non-identical, the public key is used to encrypt and the private key is used decrypt.

The important thing to understand is that messages encrypted with the public key can only be decrypted with the private key. The public key is made openly available but the private key is kept in the sole possession of the message receiver.

![Transport%20Layer%20Security%20protocol%206d1513edee274f258e7577c4ee67158c/Untitled.png](Transport%20Layer%20Security%20protocol%206d1513edee274f258e7577c4ee67158c/Untitled.png)

### The TLS Handshake

To send messages securely using HTTP both the request and response need to be encrypted in such a way that only the intended recipient can decrypt them. The most efficient way is to use symmetric key encryption but a way to securely exchange the symmetric key is required. 

 TLS achieves this by using both symmetric and asymmetric cryptography. The bulk of the message exchange is conducted via symmetric key encryption but the initial symmetric key exchange occurs using asymmetric key encryption. The process by which the initial secure connection is established is known as the TLS handshake.

TLS assumes TCP is being used at the Transport layer, and the TLS Handshake takes place after the TCP Handshake. A step-by-step description of the TLS Handshake process might look something like this:

1. The TLS Handshake begins with a `ClientHello` message which is sent immediately after the TCP `ACK`. Among other things, this message contains the maximum version of the TLS protocol that the client can support, and a list of Cipher Suites that the client is able to use (we'll discuss Cipher Suites a little later on).

2.  On receiving the `ClientHello` message, the server responds with a message of its own. This message includes a `ServerHello`, which sets the protocol version and Cipher Suite, as well as other related information. As part of this message the server also sends its certificate (which contains its public key), and a `ServerHelloDone` marker which indicates to the client that it has finished with this step of the handshake.

3. Once the client has received the `ServerHelloDone` marker, it will initiate the key exchange process. It's this key exchange process that ultimately enables both the client and server to securely obtain a copy of the symmetric encryption key that will be used for the bulk of the secure message transfer between the two parties. The exact process for generating the symmetric keys will vary depending on which key exchange algorithm was selected as part of the Cipher Suite (e.g. RSA, Diffie-Hellman, etc). You don't need to worry about the distinctions between these key exchange mechanisms, but as an example RSA works in the following way:

- The client generates what's known as a 'pre-master secret', encrypts it using the server's public key, and sends it to the server.
- The server will receive the encrypted 'pre-master secret' and decrypt it using its private key.
- Both client and server will use the 'pre-master' secret, along with some other pre-agreed parameters, to generate the same symmetric key.
- As part of the communication which includes the `ClientKeyExchange` message (e.g. the pre-master secret), the client also sends a `ChangeCipherSpec` flag, which tells the server that encrypted communications should now start using the symmetric keys. Additionally this communication includes a `Finished` flag to indicate that the client is now done with the TLS Handshake.

4. The server also sends a message with `ChangeCipherSpec` and `Finished` flags. The client and server can now begin secure communication using the symmetric key.

![Transport%20Layer%20Security%20protocol%206d1513edee274f258e7577c4ee67158c/Untitled%201.png](Transport%20Layer%20Security%20protocol%206d1513edee274f258e7577c4ee67158c/Untitled%201.png)

The exact process will vary according to which version of TLS is used. The key points to remember about the TLS Handshake process is that it is used to:

- Agree which version of TLS to be used in establishing a secure connection.
- Agree on the various algorithms that will be included in the cipher suite.
- Enable the exchange of symmetric keys that will be used for message encryption.

One of the implications of this complexity is its impact on performance. The TLS handshake can add up to two round-trip of latency (depending on the TLS version) to the establishment of a connection between client and server prior to the point where any application data can be sent. This is on top of the initial round trip resulting from the TCP Handshake.

If UDP is being used as the transport layer protocol rather than TCP then a protocol called Datagram Transport Layer Security is used instead of TLS. This protocol is based on TLS.

### Cipher suites

A cipher is a cryptographic algorithm. A cipher suite is a suite of ciphers.

TLS uses different ciphers for different aspects of establishing and maintaining a secure connection. There are many algorithms that can be used for performing the key exchange process, as well as carrying out authentication, symmetric key encryption and checking message integrity.

The term for all of these algorithms combined is the cipher suite. The suite to be used is agreed as part of the TLS handshake. As part of the `ClientHello` message, the client sends a list of algorithms it supports for each required task and the server chooses from these according to which algorithms it also supports.

## TLS Authentication

Transferring encrypted data doesn't offer any protection if the source of the encrypted data is malicious. This is why we need a way to identify the other party in a message exchange.

During the TLS handshake, the server provides its certificate as part of its response to the `ClientHello` message. The certificate contains a Public Key, which is used by the client in the key exchange process. The certificate also provides a means of identification for the party providing it.

The certificate contains various information, such as who the owner is. This doesn't really prove anything though because certificates are publicly available and a malicious third party can easily access one and present it as its own. The certificate and Public Key are only one aspect of an authentication system. 

The exact way a Public Key is used during authentication depends on the Authentication algorithm selected as part of the cipher suite. In general, the process is:

- Server sends its certificate, which includes the public key
- Server creates a 'signature' in the form of some data encrypted with the server's private key
- The signature is transmitted in a message along with the original data from which the server was created
- On receipt of the message the client decrypts the signature using the server's public key and compares the decrypted data to the original version
- If the two versions match then the encrypted version could only have been created by a party in possession of the private key.

Note the processes of message encryption and the use of encrypting the signature during authentication are different processes so the public and private keys are used in different ways. 

The purpose of authentication is different and so a different process can be used. Here the sender (server) uses the private key to encrypt, and the receiver (client) uses the public key to decrypt. Of course, any party with access to the publicly available public key can decrypt the message, but that doesn't matter because the aim isn't to safeguard the content of the message, but instead to verify the identity of the sender. The point is that if the decrypted data matches the unencrypted version in the certificate, then the sender must be in possession of the private key (no one else could have encrypted the message in that way), and this confirms the identity, or in other words authenticates the sender.

This method of authenticating the sender doesn't prevent a malicious third-party creating their own key pair and certificate to identify themselves as a trusted party, such as a known bank. Certificate authorities are required to determine whether or not a certificate is genuine.

### Certificate Authorities and the Chain of Trust

Identification is much more likely to be accepted as genuine if it comes from a trustworthy source. For digital certificates the trustworthy sources are called Certificate Authorities. 

When a CA issues a certificate, it does the following:

1. Verifies that the party requesting the certificate is who they say they are. This process is implemented by the CA and will depend on the type of certificate being issued.
2. Digitally signs the certificate being issued. This is done by encrypting some data with the CA's own private key and using this encrypted data as a signature. The unencrypted version of the data is also added to the certificate. In order to verify that the certificate was issued by the CA, the signature can be decrypted using the CA's public key and checked for a match against the unencrypted version.

There are different levels of CA. An intermediate CA can be any company or body authorised by a Root CA to issue certificates on its behalf. A widely used intermediate CA is Let's Encrypt who provide free, automated certificates.

Google have their own intermediate CA called Google Internet Authority who issue certificates on Google's behalf.

You can view a chain of trust from a website to the intermediate CA to a root CA. One root CA is GlobalSign. Root certificates are self-signed and are the end-point of the chain of trust.

Client software, such as browsers store a list of these authorities along with their root certificate. When receiving a certificate for checking the browser can go up the chain to the root certificate stored in its list.

![Transport%20Layer%20Security%20protocol%206d1513edee274f258e7577c4ee67158c/Untitled%202.png](Transport%20Layer%20Security%20protocol%206d1513edee274f258e7577c4ee67158c/Untitled%202.png)

This system provides a high level of security. The private keys of the root CAs are kept behind many layers of security to keep them as inaccessible as possible. Therefore, they don't directly issue end-user certificates, that is left to the intermediate CAs. If the private key of an intermediate CA is compromised the root CA can revoke the certificate for Intermediate, which would invalidate all the downstream certificates, and the root CA can issue a new one. 

It is necessary that such a 'chain of trust' would need to have an end-point, but if no-one is authenticating the Root CAs other than themselves, how do we know we can trust them? The answer to this is simply their reputation gained through prominence and longevity. Root CAs are essentially a small group of organisations approved by browser and operating system vendors.

Ultimately this system still relies on trust, and as such isn't infallible. In 2015 [Symantec issued some fake Google Certificates](https://www.itpro.co.uk/security/25315/symantec-employees-fired-over-fake-security-certificates). Although the issue was quickly spotted and fixed, it shows that this security infrastructure isn't necessarily 100% reliable.

## TLS integrity

To add an additional layer of security, TLS checks the integrity of data transported via the protocol.

### TLS encapsulation

The OSI model defines TLS as a Session layer protocol, and so existing in between Application layer (where HTTP resides) and the Transport layer (where TCP resides). Although, as previously stated, we're not too interested in the specifics of how the OSI Model defines these intervening layers, when thinking about TLS it can be useful to think of it as operating between HTTP and TCP.

Like other protocols, TLS sends messages in a certain format. The format can vary depending on the particular function of the TLS but when transporting application data, TLS encapsulates data in the same way as other PDUs - the data forms the payload and metadata is stored in header and trailer fields. 

![Transport%20Layer%20Security%20protocol%206d1513edee274f258e7577c4ee67158c/Untitled%203.png](Transport%20Layer%20Security%20protocol%206d1513edee274f258e7577c4ee67158c/Untitled%203.png)

The main field of interest for ensuring message integrity is the MAC field - Message Authentication Code.

### Message Authentication Code (MAC)

MAC field can be thought of in the same way as the checksum fields in other PDUs, although they differ in implementation and intention. Whilst a checksum field in a TCP packet tests if some data was corrupted during transport (error detection), the MAC field provides a means of checking if a message was altered or tampered during transport.

This is implemented through the use of a hashing algorithm:

1. The will create a digest of the data payload. This is a small amount of data derived from the actual data that will be sent in the message. The digest is created using a specific hashing algorithm combined with a pre-agreed hash value. The hashing algorithm and hash value are agreed as part of the TLS handshake process when the cipher suite is negotiated. 
2. The sender will encrypt the data payload using the symmetric key. The receiver will then also create a digest of the payload using the same algorithm and hash value. If the two digests match, the integrity of the data is confirmed.