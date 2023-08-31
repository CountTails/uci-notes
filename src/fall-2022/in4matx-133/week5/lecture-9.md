# Lecture 9: AJAX, fetch & promises

## Web APIs

- Many web services and data sources allow you to use HTTP (web) requests to access their data
- This is done by providing a web API
- API stands for **A**pplication **P**rogramming **I**nterface
	- The *interface* we can use to interact with an *application* through *programming*
	- An interface is just a defined set of functions

```JavaScript
function doSomething(param1, param2) {
	//body
}
```

## Using the internet

### Review URL

- protocol: how to handle info
- host: who has info
- resource: what info you want

Browser issues an HTTP request, server sends back an HTTP response

### URIs

- Stands for **U**niform **R**esource **I**ndicator
- All URLs are URIs, but URLs also specify an "access mechanism"
	- `http://` or `file://`
- URIs will return a resource
	- Could be a webpage, image file
	- Could also just be data
- `http://www.domain.com/users` -> returns a list of users
	- The list of users is a *resource*
- URIs can have sub resources
	- `http://www.domain.com/users/shawna`
	- Returns a specific user

### URI format

- Base URI
	- How every API request for that API starts
	- `https://api.twitter.com/`
- Endpoint
	- Specific resources which can be accessed via that API
	- `1.1/search/tweets.json`
	- `1.1/status/filter.json`
	- Endpoints often contain an API version number

### URI queries

- Key/value pairs which follow the URI
	- Parameters for the resource, may specify exactly what to return or what format it should be in
	- `?key=value&key=value`
- `https://api.twitter.com/1.1/search/tweets.json?q=UCI&lang=en`

### HTTP verbs

HTTP requests include a target resource and a verb (method) specifying what to do with it

| Verb | Meaning |
| ---- | ---- |
| `GET` | return a representation of the current state of the resouce |
| `POST` | add a new resource |
| `PUT` | update an existing resource to a new state |
| `PATCH` | update a portion of the resource's state |
| `DELETE` | remove a resource |
| `OPTIONS` | returns a set of methods that can be performed on the resource |

### HTTP responses

Responses will include 

- a *status code* (whether it worked as expected) 
- a *body* (the actual response)

| Code | Meaning |
| ---- | ---- |
| `200` | OK |
| `201` | Created (for `POST`) |
| `400` | Bad request (something is wrong with your URI) |
| `403` | Forbidden (some access or authentication issue) |
| `404` | Not found (the resource does not exist) |
| `500` | Internal server error (generic server-side error) |

### Putting it together

SEND

```
HTTP GET
https://api.twitter.com/1.1/search/tweets.json?q=UCI&lang=en
```

- Use the “get” verb to access English-language tweets which mention UCI
- We expect/hope for status code 200 (OK)  
- Then we access the body

### Escaping characters

Some characters, like the hash (#) are reserved in URLs

- Linking to IDs within pages
- We need to encode the character to search for a hashtag on Twitter
- This is called URL encoding. There is typically a package/library that does this for you

```
HTTP GET https://api.twitter.com/1.1/search/tweets.json?q=%23UCI &lang=en
```

## Asychronous JS and XML

### XML

- Stands for E**x**tensible **M**arkup **L**anguage
- A generalized syntax for semantically defining structured content
- HTML is XML with predefined tag

```XML
<person>
	<firstName>Alice</firstName> 
	<lastName>Smith</lastName> 
	<favorites>
		<music>jazz</music>
		<food>pizza</food>
	</favorites>
</person>
```

### XML v JSON

- XML and JSON represent the same data
- JSON is more concise
- JSON is easier to read
- JSON has taken over as the typical format of web requests

### Sending an AJAX request

AJAX requests are built into a browser-provide object called `XMLHTTPRequest`

```JavaScript
var xhttp = new XMLHttpRequest();  
xhttp.onreadystatechange = function() {
	if (xhttp.readyState == 4 && xhttp.status == 200) {  
	// Action to be performed when the document is read; 
	var xml = xhttp.responseXML;
	var movie = xml.getElementsByTagName("track");

	//...

} 
};

xhttp.open("GET", "filename", true); 
xhttp.send();
```

### Fetch

- A new, modern method for submitting XMLHTTPRequests
- Included in most browsers (but not IE)
- `fetch('url')`
	- Defaults to a `GET` requests
	- takes an optional `options` argument
		- `method`: what method to use
		- `headers`:specify content type format, etc
		- `body`:what you want to send for a `POST`/`PUT` request

### Same origin policy

- Many browsers do not permit AJAX requests to a different server
- A non-browser proxy server running locally can communicate with a different server
- The browser can communicate with the proxy server
- Exceptions
	- Apps can always communicate with apps in the same domain (no same origin restrictions for localhost server)
	- A server can designate that it will accept connections from sources with a particular origin
	- You *can* disable this behavior, but **SHOULD NOT** do so

```
                +---------+
                | Server1 |
+-----+ <-----> +---------+
| App |
+-----+ ---X--> +---------+
                | Server2 |
                +---------+
```

```
+-----+          +---------+-------+           +---------+
| App |< ----- > | Server1 | Proxy | < ----- > | Server2 |
+-----+          +---------+-------+           +---------+
```

### Asychronous requests

- Ajax requests are asychronous, so they happen simultaneously with the rest of the code
- After a request is sent, the next line of code is executed **without waiting for the request to finish**

1) `console.log('about the send request');`
2) `fetch(url)`
3) `console.log('Sent request')`
4) Data is received sometime later

- It's uncertain how long it'll take the request to complete
- Handling requests asychrounously allows a person to continue interacting with your app
	- The request is not blocking their interace interactions
	- It's a bad experience when a person tries to navigate your webpage, but cannot

## Promises

- Because `fetch()` is asychronous, the method returns a **Promise**
- Promises act as a placeholder for the data that will eventually be received from the AJAX request
- use the `.then()` method to specify a **callback** function to be executed when the promise is fulfilled (when the asynchronous request is finished)

```JavaScript
//what to do when we get the response
function successCallback(response) {
   console.log(response);
}

//when fulfilled, execute the callback function 
//(which will be passed the fetched data)  
var promise = fetch(url); 
promise.then(successCallback, rejectCallback); // rejectCallback is optional

//more common to use anonymous variables/callbacks:
fetch(url).then(function(response) { 
					console.log(response); 
				});
```

### `fetch()` responses

- The parameter passed to the `.then()` callback is the **response**, not the data we are looking for
- The `fetch()` API provides a `.json()` method that can be used to extract the data from the response
	- The `.json()` is also asychronous and thus returns another promise

```JavaScript
fetch(url).then(function(response) { 
					var newPromise = response.json();
				    //... what now?
				});
```

### Chaining promises

- The `.then()` method itself returns a Promise containing the value (data) returned by the callback method
- This allows you to **chain** callback functions together, doing one after another (but *after* the Promise is fulfilled)

```JavaScript
function makeString(data) {
    return data.join(", "); //a value to put in Promise 
}

function makeUpper(string) {
    return string.toUpperCase(); //a value to put in Promise 
}

var promiseA = getData()
var promiseB = promiseA.then(makeString)
var promiseC = promiseB.then(makeUpper)
promiseC.then(function(data){
	console.log(data);
});
```

```JavaScript
//more common to use anonymous variables and chain functions
getData()  
    .then(makeString)  
    .then(makeUpper)  
    .then(function(d) { console.log(d); };
```

### Multiple promises (sequential)

- The `.then()` function will also handle promises *returned by previous callbacks*, allowing for sequential async calls

```JavaScript
getData(fooSrc) 
	.then(function(fooData){
		var modifiedFoo = modify(fooData)
		return modifiedFoo; 
	})
	.then(function(modifiedFoo){  
	//do something with modifiedFoo 
	var barPromise = getData(barSrc); 
	return barPromise;
	}) 
	.then(function(barData){
	//do something with barData
	})
```

### Extracting `fetch()` data

- To actually download JSON data

```JavaScript
fetch(url)
	.then(function(response) {  
		var dataPromise = response.json();
		return dataPromise; 
	})
	.then(function(data) {  
		//do something with data
	});
```

### Catching errors

- We can use `.catch()` function to specify a callback that will occur if the promise is **rejected** (an error occurs)
- This method will "catch" errors from all previous `.then()`s

```JavaScript
getData(fooSrc)
	.then(firstCallback) 
	.then(secondCallback) 
	.catch(function(error) {
	//called if EITHER previous callback 
	//has an error
	//param is object representing the error itself
		console.log(error.message);
	})
	.then(thirdCallback) //will only do this if //no previous errors
```

### Multiple promises (concurrent)

- Because promises are just commands to do something, we can wait for all of them to be done

```JavaScript
var foo = fetch(fooUrl); 
var bar = fetch(barUrl);

//a promise for when all commands ready
Promise.all(foo, bar) 
	.then(function(fooRes, barRes) {
		//do something both both responses, e.g.,
		return Promise.all(fooRes.json(), barRes.json());
	})  
	.then(function(fooData, barData){
		//now have both data sets!
	})
```

