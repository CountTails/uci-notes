# Web APIs

## Background

We saw that the Python standard library makes it easy to download a web page. Given a URL, which specifies the location of the page you want to download, the `urllib.request.urlopen()` function hides nearly all of the details of the conversation between your Python program and the web server that will send the page back to it.

Writing a program to download a web page — the same page you might see if you visited a particular URL in a web browser — often isn't the right choice.

A web page is suitable for display to a human user within a browser, but isn't necessarily a suitable result for a program to download.

A web page is a combination of HTML, JavaScript, CSS, and other code used to make the page look the way it does. In order to find the important data, you'll need to build a program called a web scraper to do that.

If the web page structure changes, the web scraper becomes obsolete and you'll have to build a scraper to scrape the new structure.

## Using Web APIs instead of webpages

Fortunately, some sites provide an alternative interface, one that's intended to be used by programs instead of people that are called APIs (Application Programming Interfaces).

Using web APIs effectively requires us to learn a handful of new techniques, though we'll find that most of them (certainly YouTube's) are implemented around standards

## Standards for Web APIs

### URLs with query parameters

Since the very early days of the World Wide Web, it has been necessary to specify URLs that carry parameters, particularly on web sites whose content is generated dynamically.

The `?` in a URL is special; it indicates that what follows it will be a sequence of query parameters.

Each parameter is specified as a name and a value, with an `=` separating them; the parameters themselves are separated by `&` characters.

Consider the following example URL: `http://www.blah.com/some/page?param1=value1&param2=value2&param3=value3`

- `http://www.blah.com/some/page` is a URL for a webpage that we've seen before
- `?` indicates the start of the parameter list
	- `param1=value1` is the first parmeter
	- `param2=value2` is the second parameter
	- `param3=value3` is the third parameter
- `&` is a separater between parameters

### URL encoding

How do we specify a parameter whose value contains an `=` character? How about a parameter whose name includes a `?` character? Or a parameter whose value includes `&`?

These characters are reserved for a purpose in the URL, so to specify them we have to encode them

- Spaces are replaced with + characters.
- Other special characters — anything that isn't legal in a URL, or has a special meaning (such as ?, &, or =) is replaced by a % followed by a "character code"

We do need to be able to recognize whether something has been URL encoded — which we can pick up visually just by looking for % characters followed by two hexadecimal digits

### JavaScript Object Notation (JSON)

Many web APIs, returns its results in a common format called JavaScript Object Notation — usually referred to by its acronym, JSON

JSON has become so common in web APIs and across the Internet, the Python standard library provides a module that can parse it, so we won't have to.

This is a JSON description of an object, which consists of a collection of attributes (much like Python's objects do).

```JSON
{ "name": "Boo", "age": 13, "qualities": ["smart", "cute", "playful", "relentless", "perfect", "forever"] }
``` 

In this example, the attribute name has the string value "Boo", the attribute age has the numeric value 13, and the attribute qualities has a value that is an array (you can think of these like Python lists) containing the strings "smart", "cute", "playful", "relentless", "perfect", and "forever".

## Using the YouTube API

Our goal is to issue a search query — like we might do on YouTube's web page — and display the titles and descriptions of videos that match the request. So, the appropriate request in the YouTube Data API is called search

A search request is issued using a URL that starts out like this: `https://www.googleapis.com/youtube/v3/search`

Following the word search in the URL, we add a `?` character and then include a list of query parameters

- `key`, which is an API key that uniquely identifies us as a user of Google's web APIs.
- `type`, which specifies what we want to search for. In our case, we want to search for video.
- `part`, which specifies what part of YouTube's information you're interested in obtaining. In our case, we want something called a `snippet`.
- `maxResults`, which specifies how many results we want (at most)
- `q`, which specifies our search query

The final URL may look something like

```
https://www.googleapis.com/youtube/v3/search?key=YOUR_API_KEY&type=video&part=snippet&maxResults=10&q=lakers+clippers
```

## How the Python standard library can help

There are three basic operations we need here:

- To URL encode a set of query parameters, so that it's safe to pass them to a web API.
- To issue an HTTP request to the URL we built and get the HTTP response.
- To parse the response, which will be a JSON object in the format documented in the YouTube Data API documentation.

### Encoding URL query parameters

The module urllib.parse, which sounds like it knows how to parse URLs (i.e., to break them into their component parts), happens also to contain a function that knows how to URL encode query parameters.

```Python
>>> import urllib.parse  
>>> urllib.parse.urlencode([('name', 'Boo'), ('age', 12), ('description', 'pekingese/perfect'), ('search', 'lakers clippers')])  
'name=Boo&age=12&description=pekingese%2Fperfect&search=lakers+clippers'
```

The function will encode query parameters as needed and will chain them together with `=` or `&` as needed. Spaces will also be replaced automatically with `+`.

### Issuing an HTTP reques and getting an HTTP response

We use the `urllib.request.urlopen` and pass it our full URL. Just like in [URLs and HTTP](./urls-and-http.md).

In this case, the HTTP method is the same, but it is not uncommon to use a different HTTP method for web APIs

### Parsing the JSON response

Once we've retrieved a bytes object containing the content of our HTTP response, we'll have the response text in JSON format. 

However, it won't be a `string`; it'll be a `bytes` object. We could turn it into a `string` — we've seen already how to do that — but that doesn't leave us in a much better place.

A string in JSON format isn't a very convenient thing to have; to process it, we'll need to start searching for curly braces, double quotes, commas, colons, brackets, etc., in order to build an understanding of what's there and act on it.

The Python standard library includes a module called `json` that can parse JSON strings! It can turn JSON into Python dictionaries (and also Python dictionaries back into JSON again, though we won't need that here)

```Python
>>> import json  
>>> x = '{ "name": "Boo", "age": 13, "qualities": ["intelligent", "cute", "playful", "perfect"], "forever": true }'  
>>> obj = json.loads(x)  
>>> obj['name']  
'Boo'  
>>> obj['age']  
12  
>>> for quality in obj['qualities']:  
        print(quality)  
  
intelligent  
cute  
playful  
perfect
```

## Web APIs and security

Web APIs are, by definition, online, so we might reasonably expect for there to be security implications involved in their use, both from the perspective of the provider of the API and also for its users.

### Security for the provider

- A web API can't immediately know the identity of who connected to it. This is one reason why Google requires an API key to make requests from the YouTube Data API
- A web API can't know the intentions of whoever connected to it, meaning that it will need to be vigilant about interpreting the information that it's sent. 
	- If the HTTP request is written incorrectly in some way, better to refuse service (or even close the connection) than to try to recover from it
- A web API may need to protect sensitive data. Some operations require an additional authentication to be performed (wherein a user or program logs into the corresponding Google account with the appropriate credentials).

### Security for the client

- The client of a web API can't immediately know for sure who it connected to. For this reason, we should prefer to use HTTPS whenever it's an option;
- APIs aren't just about querying information that already exists; they're also used by clients to provide new information. This is particularly important if we're talking about a web API belonging to a bank, a government agency, or something of that nature.

## The code

```Python
# youtube.py
#
# ICS 32 Winter 2020
# Code Example
#
# This program issues a search for YouTube videos, given a particular
# search query like "lakers clippers".

import json
import urllib.parse
import urllib.request


# You'll need to paste a valid Google API key here.  It needs to be one
# that has the YouTube Data API activated.  I've created such an API key
# for this course -- which I'll email out separately -- but you can also
# create your own, if you prefer.
GOOGLE_API_KEY = 'zzzzzz'

# All of the services provided by the YouTube Data API have URLs that
# begin like this; it's simply a matter of adding the rest of the URL
# and its query parameters to the end of this.
BASE_YOUTUBE_URL = 'https://www.googleapis.com/youtube/v3'



def build_search_url(search_query: str, max_results: int) -> str:
    '''
    This function takes a search query and the maximum number of results
    to display, and builds and returns a URL that can be used to ask the
    YouTube Data API for information about videos matching the search
    request.
    '''

    # Here, we create a list of two-element tuples, which we'll convert to
    # URL query parameters using the urllib.parse.urlencode function.  The
    # reason we do this, rather than building the URL string ourselves, is
    # because there is a fair amount of complexity -- dealing with special
    # characters, etc. -- that will be difficult to get precisely correct,
    # but that urllib.parse.urlencode already knows how to do correctly.
    query_parameters = [
        ('key', GOOGLE_API_KEY), ('part', 'snippet'),
        ('type', 'video'), ('maxResults', str(max_results)),
        ('q', search_query)
    ]

    return BASE_YOUTUBE_URL + '/search?' + urllib.parse.urlencode(query_parameters)



def get_result(url: str) -> dict:
    '''
    This function takes a URL and returns a Python dictionary representing the
    parsed JSON response.
    '''
    response = None

    try:
        # Here, we open the URL and read the response, just as we did before.
        # After the second line, json_text will contain the text of the
        # response, which should be in JSON format.
        response = urllib.request.urlopen(url)
        json_text = response.read().decode(encoding = 'utf-8')

        # Given the JSON text, we can use the json.loads() function to convert
        # it to a Python object instead.
        return json.loads(json_text)

    finally:
        # We'd better not forget to close the response when we're done,
        # assuming that we successfully opened it.
        if response != None:
            response.close()



def print_title_and_description(search_result: dict) -> None:
    '''
    This function takes a parsed JSON response from the YouTube Data API's
    search request and prints the titles and descriptions of all of the
    videos in the response.
    '''
    for item in search_result['items']:
        print(item['snippet']['title'])
        print(item['snippet']['description'])
        print()



def run() -> None:
    search_query = input('Query: ')
    result = get_result(build_search_url(search_query, 10))
    print_title_and_description(result)



if __name__ == '__main__':
    run()
```