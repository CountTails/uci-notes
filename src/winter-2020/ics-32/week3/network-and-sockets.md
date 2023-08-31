# Network and sockets

## Background

In previous coursework, and earlier this quarter, you've seen two ways that programs can read external input

- input via the keyboard
- opening and reading files

This may seem unrealistic compared to the programs we use on a daily basis

The Python Standard Library includes a number of tools that we can use to help us write Python programs that can do many of the same things that our favorite Internet-connected programs do.

## Sockets

Sockets are objects that encapsulate and hide many of the underlying details of how a program can connect directly to another program

When two programs are connected via sockets, each program has a socket representing its end of the connection between them, with each socket having two streams available:

- An input stream, which receives all of the data sent by the other program, in the order the other program sent it.
- An output stream, which takes any data written to it and sends it to the other program, in the order it was written.

Sockets (the way we'll be using them) guarantee that if the data makes it across the network successfully

The code underlying Python's sockets does a variety of things like attempting to re-send lost information periodically and holding information received out of order until the information preceding it is received, so we don't have to worry about these kinds of details.

One reason why it's handy for us to see a network connection as two streams is that it feels quite a lot like what we're used to doing with files.

## Clients and servers

The program that initiated the conversation is a client, while the program that responded to that initiation is a server.

## Some technical information about the internet

The Internet is a complex, many-layered combination of hardware and software, but you actually need to know surprisingly little about the underlying technology in order to write programs that use it.

### IP addresses

Every machine connected to the Internet has an IP address. An IP address is akin to a telephone number; by specifying that a message is to be sent to a particular IP address, the network will be able to determine who should receive the message and how the message should get there.

An IP address is generally displayed as a sequence of four numbers separated by dots; each of the numbers has a value in the range 0-255.

If you want a program of yours to connect to another program running on another machine, you'll have to know the IP address where that other program is running.

### The "loopback" address

There is a special range of IP addresses that can always be used to connect a computer to itself, regardless of what its IP address is.

These are called "loopback" addresses, the most common of which is `127.0.0.1`

### Ports

It's not enough to know the IP address of the other machine. Multiple programs on the same machine are likely to be connected to the Internet at any given time.

A program acting as a server will register its interest in a particular port by binding to it; the operating system will generally only allow one program to be bound to a particular port at a time.

Ports have numbers that range from 0-65535. It's generally a good idea not to use ports with numbers below 1024, becuase these tend to be reserved for common uses.

In order for a client to initiate a connection to a server, the client will need to use not only the IP address of the machine where the server is running, but also the port that the server is listening on.

### The domain name system and DNS lookups

Though every machine connected to the Internet has an IP address, users don't typically use IP addresses on an everyday basis.

DNS resolves human-readable names for hosts to their IP addresses. 

### Firewalls

It's hard to know who's contacting you or what their motives are if all you can see is their IP address and what port they're connecting to.

The theory is that if no one can connect to you, no one can take advantage of you. This is the theory behind firewalls, which are software or hardware that restrict other computers' access to computers behind them.

This may make it more difficult for programs on other machines to connect to yours when you want them to, because your computer may be configured to disallow incoming connections.

### Routers and network address translation (NAT)

The router is connected to my one Internet connection. Whenever it's connected, it has an IP address.

My computers don't connect directly to the Internet; instead, they connect to the router.

The router and my computers form their own local-area network, or LAN. The router assigns a "fake" IP address to each of my computers, using a range of addresses that is never assigned to computers on the Internet.

Network address translation, or NAT, means that it converts the internal, "fake" IP addresses used by my computers to its own IP address for traffic going out, and converts its own IP address back to the "fake" IP addresses on the way back in.

Your router will make it much more difficult for programs on other machines to connect to yours. They'll need to have your router's IP address, not your computer's IP address.

## Connecting to a server without using Python

If you want to write a client program in Python that will talk to a server, it can often be useful to first experiment with the server a bit manually, so you completely understand the behavior of the program you'll be talking to.

### Using PuTTY on Windows

Launch PuTTY and do the following:

- Under Host Name (or IP address), type [www.ics.uci.edu](http://www.ics.uci.edu)
- Under Connection type, select Raw (which means that we don't want to use encryption or anything else fancy; we just want to send text back and forth)
- Under Port, type 1234
- Under Close window on exit, select Never (which will allow you to see what happened, even after the connection has been closed)

### Using "telnet" or "nc" on Mac OS X, Linux, or other Unix-based operating systems

To use telnet for this, in a Terminal window, you would type the command `telnet www.ics.uci.edu 1234`

To use nc to connect to the same machine, you'd type the command `nc -c www.ics.uci.edu 1234`.

## Writing a simple Python client program

### The socket module

The socket module is that it includes a type called socket, which is the kind of object we'll need to interact with.

To get one of these socket objects. This is simple: we call its constructor, a special function that constructs a socket object for us.

```Python
>>> import socket
>>> example_socket = socket.socket()
```

Sockets can be used, initially, for two things: listening and connecting.

- Listening means that we want to wait for another program to contact us
- Connecting means that we want to connect to another program.

### Connecting our socket to a server

Connecting requires that we ask the socket to connect to a particular port on a particular host.

The socket module represents host/port commbinations as two-element Python tuples.

```Python
>>> connect_address = ('128.195.1.83', 5151)  
>>> example_socket.connect(connect_address)
```

If the call to the connect method succeeds, our socket is connected successfully; if the attempt to connect fails, connect will raise an exception instead.

We can use our socket to send and receive data between our client program and the server that we're connected to. The one tricky part is that the data that is sent and received is made up of what are called bytes.

### Pseudo-file objects

It seems a shame that we can't just treat a socket the way we do a text file. Or can we?

As is often the case in a programming language library, when you dig a little bit further, you find the tool you were looking for. If you want to treat a socket similarly to how you treat a text file — reading lines and getting back strings, writing strings — you can do it.

You just have to ask for a "middleman" of sorts, an object that behaves outwardly the way a file object does, but that reads and writes via a socket rather than a file.

We'll call these objects pseudo-file objects, because they are, in essence, "fake" files; they'll feel like the file objects we've seen before when we use them, but the reality is that they are connected to the socket instead of a file on our hard drive.

```Python
>>> input_stream = example_socket.makefile('r')  
>>> output_stream = example_socket.makefile('w')
```

We can write a line of text to our socket by calling `write()` on `output_stream`, just like when we write to a text file.

```Python
>>> output_stream.write('Hello there\r\n')  
>>> output_stream.flush()
```

Notice that we also called the `flush()` method after writing. File objects do something called *buffering*. This means the written data is stored in memory, or in a buffer, and the write is only done when the buffer is filled.

When you're talking to another program via a socket, it's usually important that a message is sent immediately, because the other program won't know what to do until it is received.

When we want to read a line of text from our socket, we can call `readline()`, just like when we want to read a line of text from a text file instead.

`readline()` will block until a complete line of text has arrived. So we'll need to be careful and call it only when we expect a response from the server.

```Python
>>> input_stream.readline()  
'Hi!\n'
```

### Closing the socket

Finally, when we're done with the socket, we'll want to close both the pseudo-file objects and the socket itself.

This does the following:

- lets the other program know we are finished with the coversation
- releases any operating system resources associated with the open connection

Close the psuedo-files first, then the socket.

```Python
>>> input_stream.close()  
>>> output_stream.close()  
>>> s.close()
```

## The code

```Python
# echo_client.py
#
# ICS 32 Winter 2020
# Code Example
#
# As we saw in lecture, we can ask a socket object to give us a
# "pseudo-file object," an object that behaves just like a file
# object, except that it reads or writes to the socket's underlying
# streams, instead of to a file.  We end up needing two of them: one that
# reads from the socket's input stream and another that writes to its
# output stream.  Once we have them, we can treat our socket a lot like
# a text file, using techniques we already know.
#
# On the other hand, this leaves us with three separate objects to manage:
# the socket, the pseudo-file object for reading, and the pseudo-file
# object for writing.  Our best move is to collect these into one data
# structure, which we can pass around wherever we need it.  We opted for
# a tuple in lecture (and in this example), but we'll see in the next
# example that a better tool -- called a "namedtuple" -- would actually
# be a much better choice.

import socket



# The first few functions are centered around interacting with the user:
# asking for input and printing output in a clean form.  We keep these
# functions separate from the others, so that other functions become much
# simpler and more straightforward.


def read_host() -> str:
    '''
    Asks the user to specify what host they'd like to connect to,
    continuing to ask until a valid answer is given.  An answer is
    considered valid when it consists of something other than just
    spaces.
    '''

    while True:
        host = input('Host: ').strip()

        if host == '':
            print('Please specify a host (either a name or an IP address)')
        else:
            return host



def read_port() -> int:
    '''
    Asks the user to specify what port they'd like to connect to,
    continuing to ask until a valid answer is given.  A port must be an
    integer between 0 and 65535.
    '''

    while True:
        try:
            port = int(input('Port: ').strip())

            if port < 0 or port > 65535:
                print('Ports must be an integer between 0 and 65535')
            else:
                return port

        except ValueError:
            print('Ports must be an integer between 0 and 65535')



def read_message() -> str:
    '''
    Asks the user what message they'd like to send to the echo server.
    Any message is legitimate, including the empty string, so no validation
    is done, but this function still serves the purpose of encapsulating
    our decision about how to prompt the user.
    '''

    return input('Message: ')



def print_response(response: str) -> None:
    '''
    Prints the response sent back from the echo server, along with an
    appropriate prompt.
    '''

    print('Response: ' + response)



# The next few functions handle the conversation between our program and
# the echo server.  The goal is for other parts of our program to be
# completely insulated from the details of how these functions work.
# So when we connect, we return a "connection" object -- which is really a
# tuple consisting of a socket and two pseudo-file objects, but no code
# outside of these functions ever needs to know about that; as far as other
# functions are concerned, a connection is simply an opaque object that
# represents a connection to an echo serve.r


def connect(host: str, port: int) -> 'connection':
    '''
    Connects to the echo server, which is assumed to be running on the
    given host and listening on the given port.  If successful, a
    connection object is returned; if unsuccessful, an exception is
    raised.
    '''

    # Our first order of business is to create a socket and connect it
    # to the echo server.
    echo_socket = socket.socket()
    echo_socket.connect((host, port))

    # Next, because we know we plan to read and write text through our
    # socket, we create pseudo-file objects -- one for reading and one
    # for writing -- so we can read and write text through our socket
    # using the same basic interface we already learned for reading and
    # writing to text files.
    echo_socket_input = echo_socket.makefile('r')
    echo_socket_output = echo_socket.makefile('w')

    return echo_socket, echo_socket_input, echo_socket_output



def close(connection: 'connection') -> None:
    '''
    Closes a connection
    '''

    # Since a connection object is really a tuple, it's handy for us
    # to assign the tuple's values into three variables, so that the
    # variables can have meaningful names (as opposed to using an
    # unclear notation like connection[0], connection[1], and connection[2]).
    # Sequence assignment makes for a nice way to "unpack" the tuple and
    # name its elements.
    #
    # If this seems sort of silly to you, we'll clean this up in the next
    # example when we use a namedtuple for this instead, which will give
    # us what we want (a meaningful name for each object within the
    # connection object) without us having to do this every time.
    echo_socket, echo_socket_input, echo_socket_output = connection

    # Closing a connection requires closing the pseudo-file objects and
    # then closing the socket, so we'll do all of that here.
    echo_socket_input.close()
    echo_socket_output.close()
    echo_socket.close()



def send_message(connection: 'connection', message: str) -> None:
    '''
    Sends a message to the echo server via a connection that is already
    assumed to have been opened (and not yet closed).
    '''

    echo_socket, echo_socket_input, echo_socket_output = connection

    # There are a couple of details that we're handling here, so we
    # never have to remember to do them anywhere else
    #
    # (1) We're being sure to put the correct newline sequence on the
    #     end of the message.  This is the right place to do that, since
    #     this is the function that is in charge of sending messages to
    #     the server (so it's the natural place to handle the details of
    #     exactly how the server wants it to look).
    #
    # (2) We have to remember to "flush".  File objects do something called
    #     "buffering".  When you write to them, they store data in memory
    #     temporarily and then write it once in a while when the buffer
    #     runs out of space.  This is mainly done because the act of actually
    #     writing the data -- especially when you're talking about files on a
    #     hard disk, but even when you're using a socket -- is much slower
    #     than storing it in memory, so only writing data once in a while can
    #     dramatically reduce that cost.  But when you're talking to another
    #     program vi a socket, it's usually important that a message is sent
    #     *now*, because the other program won't know what to do until it is
    #     received.  So it becomes important to tell the file object "Take
    #     whatever is in your buffer and send it now!  Don't wait until a
    #     opportune time!"  That's what flush() does.
    echo_socket_output.write(message + '\r\n')
    echo_socket_output.flush()



def receive_response(connection: 'connection') -> None:
    '''
    Receives a response from the echo server via a connection that is
    already assumed to have been opened (and not yet closed).
    '''

    echo_socket, echo_socket_input, echo_socket_output = connection

    # When we call readline() on any file object (including a pseudo-file
    # object), we get back a newline character on the end of the line.
    # Here, we strip that newline off the end of the string using list
    # slicing, since this is a detail of how we interact with the echo
    # server, but not something that the rest of the program needs to be
    # concerned with.  Functions that have to do with interacting with the
    # server are the natural place to implement the details of how that
    # interaction works.
    return echo_socket_input.readline()[:-1]



# Finally, the main user interface of our program is implemented in the
# run_user_interface() function below.  Notice that this function is a little
# bit longer, but that it's mainly in the business of calling other
# functions that we've already written.  So this functions reads a lot more
# like a high-level English description of what our program does, as opposed
# to overwhelming us with every detail.
#
# Our user interface asks the user to specify a host and a port, then asks
# the user repeatedly to specify a message to be sent, prints the response
# sent back by the echo server, and continues until the user enters an
# empty message.


def run_user_interface() -> None:
    host = read_host()
    port = read_port()

    print(f'Connecting to {host} (port {port})...')
    connection = connect(host, port)
    print('Connected!')

    while True:
        message = read_message()

        if message == '':
            break
        else:
            send_message(connection, message)
            response = receive_response(connection)
            print_response(response)

    print('Closing connection...')
    close(connection)
    print('Closed!')



# When we run this module, it calls our user interface.

if __name__ == '__main__':
   run_user_interface()
```