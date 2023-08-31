# URLs and HTTP

## Background

You've written Python programs that read data from text files and that exchange data over a network via sockets.

Most of the interesting data on the Internet resides, it's on the web, which can be accessed via web services by programs

If we want to interact with web data — the simplest example of which is to download the content of a web page — we need to know enough about that protocol to be able to implement the conversation.

HTTP is a common, so we're going to be able to use it without having to implement all of the low-level, fiddly code we had to write when we implemented our own custom protocol before. (YAY!)

## URLs

The notion of "where we want to go" is encapsulated by a URL (Uniform Resource Locator), which specifies the following

- What protocol should be used to download the web page?
- From what host, and occasionally may specify the port
- What page on that machine should be downloaded?

Consider the following URL: [http://www.ics.uci.edu/~thornton/ics32/Notes/ExceptionsAndFiles/oops.py](http://www.ics.uci.edu/~thornton/ics32/Notes/ExceptionsAndFiles/oops.py)

- `http` is the protocal to be used
- `www.ics.uci.edu` is the hostname. Since no port is specified, it will be port 80 (port 443 for HTTPS)
- `~thornton/ics32/Notes/ExceptionsAndFiles/oops.py` is the webpage to be downloaded

From the URL, a browser will know just what it needs to do:

- Initiate a socket connection to port 80 on [www.ics.uci.edu](http://www.ics.uci.edu)
- Use HTTP to request the page `~thornton/ics32/Notes/Exceptions/oops.py`
- Parse the HTTP response and draw the page in the browser window.

Browsers aren't the only programs that can have conversations using HTTP; our Python programs can do it, too

## HTTP

### Overview

HTTP (HyperText Transfer Protocol) is the protocol with which most web traffic on the Internet is transacted.

HTTP is a request-response protocol, which means that its conversations go something like this:

- Client initiates connection to server
- Server accepts connection
- Client makes a request
- Server sends a response

### Requests

Python programs can make these requests and parse these responses, but that requires us to know a little bit about the format of each. The most common is a "GET" request

```
GET /~thornton/ics32/Notes/Exceptions/oops.py HTTP/1.1  
Host: www.ics.uci.edu

```

Line 1 specified the HTTP method, in this case, `GET` followed by the resource that we want to get. At the end is the protocal name and version that this request is using

The remaining lines are called headers, which allow us to specify a variety of supplementary information that the server can use to figure out how to send us a response.

A blank line following the last header informs the server that there are no more headers. At that point, the request is complete.

### Responses

Using a tool like PuTTY (Windows) or Telnet/nc (MacOS), we can view the HTTP response to the request above.

```
HTTP/1.1 200 OK  
Date: Wed, 31 Jan 2018 07:56:07 GMT  
Server: Apache/2.2.15 (CentOS)  
...  
...  
Content-Length: 435  
Content-Type: text/plain; charset=UTF-8
```

The first line of the response indicates that the server agrees to have an HTTP/1.1 conversation, followed by what's called a status code and a reason phrase.

The lines that follow are the headers, which generally include:

- **Date** the response was generated
- **Server** that fulfilled the request
- **Content-Length** is the size, in bytes, of the payload
- **Content-Type** is the kind of content that was sent back

After the last header is a blank line, followed by the desired content.

## HTTPS vs HTTP

HTTPS is a variant of HTTP. It solves the same basic problem that HTTP does and is used in the same way except that it does two additional things that HTTP doesn't do:

1) The contents of what's sent between clients and servers are encrypted
2) The server sends something to the client that demonstrates that it is who it says it is, so you have some assurance that you're talking to, for example, Bank of America and not an imposter

The second of these is the server sending a certificate that establishes (more or less) that "Organization X certifies that the sender of this certificate is really Bank of America." 

The "Organization X" is called a certificate authority, one of a number of businesses around the world that provide the service of verifying identities and issuing certificates to establish that those identities have been verified.

Who trusts the certificate authority? The answer is that the certificate authority also issues a certificate that says "Organization Y establishes that Organization X is really a certificate authority," where "Organization Y" is another, higher-level authority.

Organization Y might also issue a certificate that establishes its identity, as verified by Organization Z. This, generally, is called a chain of trust.

The certificates in a chain of trust are difficult to forge — they each require a piece of knowledge called a private key that is kept hidden by each organization.

For this reason, operating systems generally include a set of root certificates from a few well-known organizations that are widely believed to be trustworthy.

### Note for MacOS users

Python on MacOS does not use your operating systems OpenSSL certificates. It has its own, which will need to be installed before they are used.

## The `urllib.request` module

HTTP is anything but simple. It is used for everything from fetching a simple web page, implementing the "guts" of the conversations happening behind the scenes while you use full-featured web sites like Gmail, and even for allowing non-browsers to interact with web data

HTTP support is something so fundamental to the needs of so many programmers, many programming language libraries include HTTP support; Python is no exception.

The `urllib.request` module has one function that we're interested in: `urllib.request.urlopen()`

```Python
>>> import urllib.request>>> response = urllib.request.urlopen('http://www.ics.uci.edu/~thornton/ics32/Notes/Exceptions/oops.py')
```

The `urlopen()` function returns an object called an `HTTPResponse`, which provides a few useful attributes and methods, the most important of which is the `read()` method

```Python
>>> data = response.read()  
>>> response.close()  
>>> data  
b"# oops.py\r\n#\r\n# ICS 32 Winter 2020\r\n# Code Example\r\n#\r\n......."
```

One is that we closed the response object once we were done reading the data from it. Just like you want to close files and sockets when you're finished with them.

If you look carefully at what's shown in the Python shell when we look at the value of data, you'll notice that it doesn't look quite like the other strings you've seen before. This string has a `b` displayed in front of the quote that begins it.

```Python
>>> type(data)  
<class 'bytes'>
```

```Python
>>> text = data.decode(encoding = 'utf-8')  
>>> lines = text.splitlines()  
>>> lines  
['# oops.py', '#', '# ICS 32 Winter 2020', '# Code Example', '#', .......]
```

## Interlude: What is a bytes object?

A bytes object in Python represents what it sounds like: a collection of bytes. A byte is a simple concept: it's eight binary digits, each being either 0 or 1.

If you see the byte `10001101`, what does it mean? The answer depends very much on what kind of data you expect to get. In other words, the bytes don't mean anything without you knowing what the encoding is; the encoding is a mapping between bytes and their meanings.

We think of strings as sequences of characters. But what is each character? In truth, each character is really stored numerically, using the same binary digits as everything else.

An encoding for strings maps characters to their binary representations (and back again). We can encode a string into its bytes, and we can decode the bytes back into a string again.

The only trick is telling Python which encoding to use. The most common encoding on the Internet is one called UTF-8, which is one way that a character set called Unicode can be encoded.

If we have a `bytes` object, we can turn it into the corresponding string by calling the method `decode()` on it.

```Python
>>> text = data.decode(encoding = 'utf-8')  
>>> type(text)  
<class 'str'>
>>>
>>> encoded = text.encode(encoding = 'utf-8')  
>>> type(encoded)  
<class 'bytes'>
```

In both cases, that we passed an encoding argument to the method. This is because it's not enough to say that we want to do the conversion; because there are lots of different conversions possible, we have to say how we want to do the conversion.

## The code

```Python
# download_file.py
#
# ICS 32 Winter 2020
# Code Example
#
# This is a short program that demonstrates how to download the contents
# of a URL from the web and save it into a file on the local hard drive.
# The program doesn't attempt to do anything interesting with the file;
# it saves whatever the web server sends back into the file, without
# regard to what it is, formatting concerns, or anything else; it is
# what it is.
#
# One thing that appears here that does not appear in the write-up
# accompanying this example is the use of the urllib.error.HTTPError
# exception, which is raised by urllib.request.urlopen() whenever an
# attempt to download a web page fails (e.g., because you try to
# download a page that does not exist).  When that exception is raised,
# you can catch it and use its code attribute to determine what status
# code the server returned (e.g., 404 means that the page was not found,
# i.e., that it doesn't exist).

import urllib.request
import urllib.error


def run_user_interface() -> None:
    url = _choose_url()

    if len(url) == 0:
        return
    else:
        print()
        save_path = _choose_save_path()

        if len(save_path) == 0:
            return
        else:
            _download_url(url, save_path)



def _choose_url() -> str:
    print('Choose a URL to download (press Enter or Return to quit)')
    return input('URL: ').strip()



def _choose_save_path() -> str:
    print('Choose where you\'d like to save the file you download')
    return input('Path: ').strip()



def _download_url(url_to_download: str, file_path: str) -> None:
    response = None
    file_to_save = None

    try:
        response = urllib.request.urlopen(url_to_download)

        # When you open a file with the "wb" option, you're opening it
        # because you want to write (that's the "w") bytes (that's the
        # "b") to it.
        file_to_save = open(file_path, 'wb')

        # Because response.read() returns a bytes object and because we
        # opened the file with the 'wb' option, we can write those bytes
        # directly to the file without first decoding them to a
        # string.
        file_to_save.write(response.read())

    except urllib.error.HTTPError as e:
        print('Failed to download contents of URL')
        print('Status code: {}'.format(e.code))
        print()

    finally:
        if file_to_save != None:
            file_to_save.close()
        
        if response != None:
            response.close()



if __name__ == '__main__':
    run_user_interface()
```