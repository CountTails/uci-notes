# Protocols

## What are protocols

A program that writes data to a file needs to store it in a specific *file format*. Sometimes an existing format will do, while other times a new format is needed

A similar problem arising with network communications. Without an agreement about what that data will look like, the data sent from one program won't make sense to the other one.

Existing protocols, such as HTTP for web traffic and SMTP for email, can be used. But you can also define your own protocol if you need something specific for your particular use.

## The polling protocol

Polling server allows users to answer multiple choice questions. The server will keep track of the number of times that a choice was picked

Polling client can connect to polling server via a socket. It can then communicate with polling server in a *predefined* format called **Polling protocol**

Polling protocal is a *request-reply* protocol. Lines of text are sent back and forth between the client and server, with each interaction being driven by the client sending a request and the server sending a corresponding reply.

The interactions between polling server and polling client should be as follows:

- The client connects to the Polling server
- The Polling server accepts the connection
- Client sends a line like `POLLING_HELLO <ucinetid>`
- Server responds with `HELLO` if user exists else `NO_USER`
	- The purpose of this initial interaction is to establish that the client implements the Polling protocol and not some other one; it's quite common for protocols to begin with some kind of "hello" or "handshake" sequence like this
- Once the handshake is complete, the user is "logged in" and the following interactions are allowed
	- Ask server for the questions
		- send `POLLING_QUESTIONS`
		- recv `QUESTION_COUNT number_of_questions` and `n` lines of `QUESTION <id> <text>`
	- Ask server for question choices
		- send `POLLING_CHOICES question_id`
		- recv `NO_QUESTION question_id` if question is not valid else `CHOICE_COUNT number_of_choices` followed by `n` lines of `CHOICE <id> <text>`
	- Vote 
		- send `POLLING_VOTE question_id choice_id`
		- recv
			- `VOTED`, if the vote was accepted.
			- `ALREADY_VOTED`, if the user already voted on this question.
			- `NO_QUESTION question_id`, if the question did not exist.
			- `NO_CHOICE choice_id`, if the choice did not exist for the specified question.
	- View results
		- send `POLLING_RESULTS question_id`
		- recv `NO_QUESTION <id>` if question is not valid else `RESULT_COUNT number_of_choices` followed by `number_of_choices` lines of `RESULT <choice id> <count> <text>`
- The line `POLLING_GOODBYE` will end the session and the server will respond wigh `GOODBYE`

## Example session

| Client | Server |
| --- | --- |
| *initiates a connection* | |
| | *accepts the connection* |
| `POLLING_HELLO boo` | |
| | `HELLO` |
| `POLLING_QUESTIONS` | |
| | `QUESTION_COUNT 1` |
| | `QUESTION 1 Who is your favorite Pekingese?` |
| `POLLING_CHOICES 1` | |
| | `CHOICE_COUNT 1` |
| | `CHOICE 1 Boo` |
| `POLLING_VOTE 1 1` | |
| | `VOTED` |
| `POLLING_VOTE 1 1` | |
| | `ALREADY_VOTED` |
| `POLLING_GOODBYE` | |
| | `GOODBYE` |
| | *closes the connection* |
| *closes the connection* | |

## The importance of knowing who and what to trust

- The client is the first one to "speak".
- The client includes something that makes clear what protocol is used

Programs on the internet do not know who you are talking to. We want to be sure we protect information from being accessed or changed by parties (and in ways) that it ought not to be

If a program cannot communicate is the predefined protocol, or if it is attempting to use a different protocol, we should just "hang up" rather than try to "muddle" through the conversation. 

Clients often make the first move. But both sides have to be viligent of who they are trusting with potential sensitive information

## What we wanted to build

The Polling protocol, or any protocol, is typically not designed for human use. The polling client should allow the user the interact with the polling server, but hide the conversion behind a user interface.

## Taking the oppurtunity to think about design

As programs get larger, we're best off separating them into modules that contain related subsets of functionality.

A natural separation exists between the part of the program that implements the protocol (i.e., the part that communicates with the Polling server) and the program's user interface. 

Isolating each of these into its own module makes each of those modules simpler, and also provides other benefits

So this program is probably best written with two modules, which we'll call **polling** (the protocol implementation) and **polling_ui** (the user interface).

The functions in each module are broken into progressively smaller functions, with meaningful names and well-named parameters.

Separating the public functions (i.e., the ones we expect would be needed by code in other modules) from the private ones (i.e., the ones that are only useful within that module)

## A word of warning

This example cannot be copied and pasted in lieu of Project #2

## The code

polling_ui.py

```Python
# polling_ui.py
#
# ICS 32 Winter 2020
# Code Example
#
# This module implements a simple, text-based Polling client, which allows
# the user to interact with our Polling service without being aware of all of
# the underlying details.  It's sort of akin to a smartphone application that
# interacts with Twitter; the user doesn't have to know how Twitter works
# underneath, and yet they can still read and post tweets, and so on.
#
# In Python, our modules are on a level field with the ones in the Python
# Standard Library.  When we've written things in one module and want to use
# them in one of our other modules, we use "import" the same way and we call
# the functions the same way (i.e., by qualifying them with the name of the
# module and a dot).  The only tricky part is setting them up so that
# Python can find them, the simplest solution to which is to put all of
# the modules comprising a program into the same directory.  Note, too,
# that the file is called "polling.py", but we refer to it in a Python
# program as just "polling; this turns out to be important.

import polling



# There are better solutions than embedding these kinds of details in the
# code of a program, but this will do for now.  You will need to change
# this string so that it indicates the machine where the Polling server
# is running.

POLLING_HOST = 'localhost'
POLLING_PORT = 5501



# Note how this function reads a lot like English, since most of what it
# does is to call other functions that have clear names.  This is a
# technique you'll want to use in your programs.

def _run_user_interface() -> None:
    '''
    Runs the console-mode user interface from start to finish.
    '''
    _show_welcome_banner()
    connection = polling.connect(POLLING_HOST, POLLING_PORT)

    try:
        while True:
            username = _ask_for_username()

            response = polling.hello(connection, username)

            if response == polling.NO_USER:
                print('That user does not exist')
            else:
                break

        # Notice how _handle_command returns False only when there are
        # no more commands to be processed.  That gives us the ability
        # to get out of this loop.
        while _handle_command(connection):
            pass

    finally:
        # No matter what, let's make sure we close the Polling connection
        # when we're done with it.
        polling.close(connection)



def _handle_command(connection: polling.PollingConnection) -> bool:
    '''
    Handles a single command from the user, by asking the user what command
    they'd like to execute and then handling it.  Returns True if additional
    commands should be processed after this one, False otherwise.
    '''
    command = input('[V]ote, [R]esults, or [G]oodbye? ').strip().upper()

    if command == 'V':
        _handle_vote_command(connection)
        return True
    elif command == 'R':
        _handle_results_command(connection)
        return True
    elif command == 'G':
        _handle_goodbye_command(connection)
        return False
    else:
        print('Invalid command; try again')
        return True



def _handle_vote_command(connection: polling.PollingConnection) -> None:
    '''
    Allows the user to choose a question, then vote on the one they chose.
    '''

    questions = polling.questions(connection)

    print()
    print('Choose a question to vote on')
    print()
    
    _show_questions(questions)

    print()
    question_id = input('What question would you like to vote on? ').strip()

    for question in questions:
        if question.question_id == question_id:
            choices = polling.choices(connection, question_id)
            _show_choices(choices)

            print()
            choice_id = input('What is your choice? ').strip()

            result = polling.vote(connection, question_id, choice_id)

            if result == polling.VOTED:
                print('Your vote has been noted')
            elif result == polling.ALREADY_VOTED:
                print('You have already voted on this question')
            elif result == polling.NO_QUESTION:
                print('That is not a valid question')
            elif result == polling.NO_CHOICE:
                print('That is not a valid choice')
            
            break

    else:
        print()
        print('That is not one of the questions available')



def _handle_results_command(connection: polling.PollingConnection) -> None:
    '''
    Allows the user to choose a question, then shows its results.
    '''

    questions = polling.questions(connection)

    print()
    print('Choose a question for which to see results')
    print()
    
    _show_questions(questions)

    print()
    question_id = input('For what question would you like to see results? ').strip()

    for question in questions:
        if question.question_id == question_id:
            results = polling.results(connection, question_id)
            _show_results(results)
            break
    else:
        print()
        print('That is not one of the questions available')


def _handle_goodbye_command(connection: polling.PollingConnection) -> None:
    '''
    Handles a Goodbye command by exchanging GOODBYE messages with the server.
    '''
    print('Goodbye!')
    polling.goodbye(connection)



def _show_welcome_banner() -> None:
    '''
    Shows the welcome banner
    '''
    print('Welcome to the Polling client!')
    print()
    print('Please login with your username.')
    print()


def _ask_for_username() -> str:
    '''
    Asks the user to enter a username and returns it as a string.  Continues
    asking repeatedly until the user enters a username that is non-empty, as
    the Polling server requires.
    '''
    while True:
        username = input('Username: ').strip()

        if len(username) > 0:
            return username
        else:
            print('That username is blank; please try again')



def _show_questions(questions: [polling.PollingQuestion]) -> None:
    '''
    Shows all of the questions in the given list.
    '''

    print('QUESTIONS')
    
    for question in questions:
        print(f'{question.question_id}: {question.question_text}')

    print()



def _show_choices(choices: [polling.PollingChoice]) -> None:
    '''
    Shows all of the choices in the given list.
    '''

    print('CHOICES')

    for choice in choices:
        print(f'{choice.choice_id}: {choice.choice_text}')

    print()



def _show_results(results: [polling.PollingResult]) -> None:
    '''
    Shows all of the results in the given list.
    '''

    print('RESULTS')

    total_votes = _count_total_votes(results)

    for result in results:
        id = result.choice_id
        percentage = round(result.vote_count / total_votes * 100, 1)
        text = result.choice_text
        print(f'{id} ({percentage}%): {text}')

    print()



def _count_total_votes(results: [polling.PollingResult]) -> int:
    '''
    Counts the total number of votes in a list of results
    '''

    total_votes = 0

    for result in results:
        total_votes += result.vote_count

    return total_votes



if __name__ == '__main__':
    _run_user_interface()
```

polling.py

```Python
# polling.py
#
# ICS 32 Winter 2020
# Code Example
#
# This module provides a set of functions that implement the Polling protocol
# using sockets, allowing a Python program to connect to a Polling server and
# use it to send and view questions, view questions, vote on them, and so on,
# while insulating the program from the underlying details of how the
# protocol is implemented.
#
# It's important to note that the module contains no user interface and is
# not a "program" that can be executed.  Instead, it provides utility
# functions that can used by programs, in the same way that modules like
# "os" and "socket" do in the Python Standard Library.  It's fair to say,
# actually, that this module is a small library.  (See?  We can build our
# own libraries, too!)

from collections import namedtuple
import socket


# From our work with sockets in previous examples, we discovered that we
# needed to know three things about a connection at any given time:
#
# (1) The socket across which the connection is traveling
# (2) A pseudo-file object that lets us read input from that socket as
#     though we were reading from a text file
# (3) A pseudo-file object that lets us write input to that socket as
#     though we were writing to a text file
#
# Because these three things need to be available to various functions
# in our module, it's handy to create a kind of object to store all three,
# so we only have one thing to store, one thing to return, and one thing
# to pass as a parameter.  A namedtuple is a convenient way to do that.

PollingConnection = namedtuple(
    'PollingConnection',
    ['socket', 'input', 'output'])



# When we ask the Polling server for a list of questions that are available
# to vote on, there are a couple of things we want to know about each one.
# A handy way to keep all of that together is to use a namedtuple.  Similarly,
# we'll do the same with choices and results.

PollingQuestion = namedtuple(
    'PollingQuestion',
    ['question_id', 'question_text'])

PollingChoice = namedtuple(
    'PollingChoice',
    ['choice_id', 'choice_text'])

PollingResult = namedtuple(
    'PollingResult',
    ['choice_id', 'vote_count', 'choice_text'])



# These constants represent results that can be returned from some of
# the functions below.  When functions can return one or more of these
# values, they're described in the function's type annotation.

HELLO = 0
VOTED = 1
ALREADY_VOTED = 2
NO_QUESTION = 3
NO_CHOICE = 4
NO_USER = 5



# This is the simplest example of how you create new kinds of exceptions
# that are specific to your own program.  A class introduces a new type of
# object into your program.  In this case, we're introducing a new type called
# PollingProtocolError, and specifying that we want it to be a kind of
# exception (i.e., something that we can raise to indicate failure).  We'll
# talk a lot more about classes a little later in the course.

class PollingProtocolError(Exception):
    pass



# Set this to True if you want to see a trace of what gets sent to the server
# and what gets received back from it.  Before a program is "finished,"
# you'd want to set this back to False, but providing this ability makes
# it easy to see the underlying interactions between client and server
# -- which are otherwise invisible -- when you need to troubleshoot a
# problem.

_SHOW_DEBUG_TRACE = False



def connect(host: str, port: int) -> PollingConnection:
    '''
    Connects to a Polling server running on the given host and listening
    on the given port, returning a PollingConnection object describing
    that connection if successful, or raising an exception if the attempt
    to connect fails.
    '''

    polling_socket = socket.socket()
    
    polling_socket.connect((host, port))

    polling_input = polling_socket.makefile('r')
    polling_output = polling_socket.makefile('w')

    return PollingConnection(
        socket = polling_socket,
        input = polling_input,
        output = polling_output)



def hello(connection: PollingConnection, username: str) -> HELLO or NO_USER:
    '''
    Logs a user into the Polling service over a previously-made connection.
    If the attempt to send text to the Polling server or receive a response
    fails (or if the server sends back a response that does not conform to
    the Polling protocol), an exception is raised.
    '''

    # The _write_line and _expect_line functions are written below.  Their
    # goal is to hide the details of interacting with the socket (e.g.,
    # putting the correct newline sequence on the end of the line, remembering
    # to flush the output after writing it, etc.).  Notice how, given those
    # tools, the code we've written here is terse and clear, relative to
    # what it would look like if we had these details interspersed throughout
    # this function.
    _write_line(connection, 'POLLING_HELLO ' + username)

    response = _read_line(connection)

    if response == 'HELLO':
        return HELLO
    elif response.startswith('NO_USER '):
        return NO_USER
    else:
        raise PollingProtocolError()



def questions(connection: PollingConnection) -> [PollingQuestion]:
    '''
    Asks the Polling server for a list of the currently-available
    questions.  Returns a list of PollingQuestion objects to describe
    them.
    '''

    _write_line(connection, 'POLLING_QUESTIONS')

    count_words = _read_line(connection).split()

    if len(count_words) != 2 or count_words[0] != 'QUESTION_COUNT':
        raise PollingProtocolError()

    try:
        question_count = int(count_words[1])
    except ValueError:
        raise PollingProtocolError()

    questions = []

    for i in range(question_count):
        question_line = _read_line(connection)
        question_words = question_line.split()

        if len(question_words) < 3 or question_words[0] != 'QUESTION':
            raise PollingProtocolError()

        question_id = question_words[1]
        question_text = question_line[(10 + len(question_id)):]

        questions.append(PollingQuestion(question_id, question_text))

    return questions



def choices(connection: PollingConnection, question_id: str) \
        -> [PollingChoice] or NO_QUESTION:
    '''
    Asks the Polling server for a list of choices associated with a
    question.  Returns a list of PollingChoice objects that describes
    them.  If the question does not exist, returns NO_QUESTION instead.
    '''

    _write_line(connection, 'POLLING_CHOICES ' + question_id)

    count_words = _read_line(connection).split()

    if len(count_words) > 0 and count_words[0] == 'NO_QUESTION':
        return NO_QUESTION
    elif len(count_words) != 2 or count_words[0] != 'CHOICE_COUNT':
        raise PollingProtocolError()

    try:
        choice_count = int(count_words[1])
    except ValueError:
        raise PollingProtocolError()

    choices = []

    for i in range(choice_count):
        choice_line = _read_line(connection)
        choice_words = choice_line.split()

        if choice_words[0] != 'CHOICE' or len(choice_words) < 3:
            raise PollingProtocolError()

        choice_id = choice_words[1]
        choice_text = choice_line[(8 + len(choice_id)):]

        choices.append(PollingChoice(choice_id, choice_text))

    return choices



def vote(connection: PollingConnection, question_id: str, choice_id: str) \
        -> VOTED or ALREADY_VOTED or NO_QUESTION or NO_CHOICE:
    '''
    Votes on a question via the Polling server.  Returns one of four
    values: VOTED, ALREADY_VOTED, NO_QUESTION, or NO_CHOICE.
    '''

    _write_line(connection, 'POLLING_VOTE {} {}'.format(question_id, choice_id))

    response = _read_line(connection)

    if response == 'VOTED':
        return VOTED
    elif response == 'ALREADY_VOTED':
        return ALREADY_VOTED
    elif response.startswith('NO_QUESTION '):
        return NO_QUESTION
    elif response.startswith('NO_CHOICE '):
        return NO_CHOICE
    else:
        raise PollingProtocolError()



def results(connection: PollingConnection, question_id: str) \
        -> [PollingResult] or NO_QUESTION:
    '''
    Asks the Polling server for a list of results associated with a
    question.  Returns a list of PollingResult objects that describes
    them.  If the question does not exist, returns NO_QUESTION instead.
    '''

    _write_line(connection, 'POLLING_RESULTS {}'.format(question_id))

    count_words = _read_line(connection).split()

    if len(count_words) > 0 and count_words[0] == 'NO_QUESTION':
        return NO_QUESTION
    elif count_words[0] != 'RESULT_COUNT' or len(count_words) != 2:
        raise PollingProtocolError()

    try:
        result_count = int(count_words[1])
    except ValueError:
        raise PollingProtocolError()

    results = []

    for i in range(result_count):
        result_line = _read_line(connection)
        result_words = result_line.split()

        if result_words[0] != 'RESULT' or len(result_words) < 3:
            raise PollingProtocolError()

        result_id = result_words[1]

        try:
            vote_count = int(result_words[2])
        except ValueError:
            raise PollingProtocolError()
        
        result_text = result_line[(10 + len(result_id)):]

        results.append(PollingResult(result_id, vote_count, result_text))

    return results
    


def goodbye(connection: PollingConnection) -> None:
    'Exchanges goodbye messages with the server'

    _write_line(connection, 'POLLING_GOODBYE')
    _expect_line(connection, 'GOODBYE')



def close(connection: PollingConnection) -> None:
    'Closes the connection to the Polling server'

    # To close the connection, we'll need to close the two pseudo-file
    # objects and the socket object.
    connection.input.close()
    connection.output.close()
    connection.socket.close()




# These are "private functions", by which I mean these are functions
# that are only intended to be used within this module.  They're
# hidden implementation details, used only to make writing other functions
# in this module easier.  By starting their names with an underscore,
# we're making clear to users of this module that these functions are
# intended to be private -- this convention is typical in Python programs,
# so if we name things beginning with underscores, it's a strong hint to
# knowledgeable Python programmers that our intent is for these things
# only to be used where they're defined (in this case, only within the
# polling.py module).



def _read_line(connection: PollingConnection) -> str:
    '''
    Reads a line of text sent from the server and returns it without
    a newline on the end of it
    '''

    # The [:-1] uses the slice notation to remove the last character
    # from the string.  Since we know that readline() will always
    # return a line of text with a '\n' character on the end of it,
    # the slicing here will ensure that these will always be stripped
    # out, so we'll never have to deal with this detail elsewhere.
    line = connection.input.readline()[:-1]

    if _SHOW_DEBUG_TRACE:
        print('RCVD: ' + line)

    return line



def _expect_line(connection: PollingConnection, expected: str) -> None:
    '''
    Reads a line of text sent from the server, expecting it to contain
    a particular text.  If the line of text received is different, this
    function raises an exception; otherwise, the function has no effect.
    '''

    line = _read_line(connection)

    if line != expected:
        raise PollingProtocolError()



def _write_line(connection: PollingConnection, line: str) -> None:
    '''
    Writes a line of text to the server, including the appropriate
    newline sequence, and ensures that it is sent immediately.
    '''
    connection.output.write(line + '\r\n')
    connection.output.flush()

    if _SHOW_DEBUG_TRACE:
        print('SENT: ' + line)
```