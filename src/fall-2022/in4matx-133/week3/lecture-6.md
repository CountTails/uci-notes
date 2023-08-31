# Lecture 6: DOM Manipulation

## JS has functions that can edit webpages

### Client side

- Can edit what is being rendered
- Can react to browser events
- Can be seen by the user
- Cahnages happen in real-time in the browser

### Server side

- Navigate file system programmatically
- Dynamically generate pages
- Transport, store and retrieve data
- Cannot be seen by the user
- Change happen on the server in response to HtTP requests

## Client side objects

### Window

- Refers to the browser itself
- Can access properties and execute functions on it

```JavaScript
// example properties
var width = window.innerWidth; //viewport width
var height = window.innerHeight; //viewport height

// example functions
window.alert("Boo!");

var confirmed = window.confirm("Are you sure?");
var quest = window.prompt("What is your quest?")
```

- Possible to use window to control the browser, but behavior differs by browser

```JavaScript
var xPos = window.screenX; //offset from screen edge 
var yPos = window.screenY; //offset from screen edge 
var scroll = window.scrollY; //pixels scrolled down 
var url = window.location.href; //url for this page

window.scrollTo(0,1000); //scroll to position
window.open(url); //open a new window loading the URL
window.close(); //close window
```

### Server side objects

- No window object exists in server-side JS
- Nothing to scroll to and no one to alert
- More on server-side development later in the course

## HTML Document Object Model (DOM)

- A standard for how to get, change, add, or delete HTML elements
- HTML is parsed by the browser and turned into the DOM
- Client side JS can edit the DOM
- Server side JS might specify what HTML to show, but will not edit DOM

## JS in HTML

- Can insert inline using the `<script>` tag

```HTML
<head>
	<script>
		alert("Hello, world!"); 
	</script>
</head>
<body>

</body>
```

- Your script should wait until after the page has loaded
- Otherwise elements you’re trying to access might not exist

```HTML
<head>
	<script>  
		function pageLoaded() {
		    alert("Page Loaded!");
		 }
	</script>  
</head>  
<body onload="pageLoaded();">

</body>
```

- Functions can respond to events

```HTML
<head>
	<script>  
		function buttonClicked() {
		    alert("Button Clicked!");
		}
	</script>
</head>
<body>
	<!--Bad style! Don't do this-->
	<button onclick="buttonClicked()">Click me!</button> 
</body>
```

- Like CSS, better to load an external script (JS is in a separate file)

```HTML
<head>
	<script src="js/script.js"></script> 
</head>
```

## Editing the DOM

- Write into the DOM with `document.write`

```HTML
<script>
	document.write("<h1>Hello, World!</h1>");
	var myCourse = "IN4MATX 133";
	document.write("<h1>Hello, " + myCourse + "!"); 
</script>
```

- Reference individual HTML elements by calling selector functions

```JavaScript
//element with id="foo"  
var fooElem = document.getElementById('foo');

//elements with class="row"
var rowElems = document.getElementsByClassName('row');

//<li> elements
var liElems = document.getElementsByTagName('li');

/*easiest to select by reusing CSS selectors! */ 
var cssSelector = 'header p, .title > p';

//selects FIRST element that matches css selector
var elem = document.querySelector(cssSelector);

//matches ALL elements that match css selector
var elems = document.querySelectorAll(cssSelector);
```

- Properties and functions of elements can manipulate them

```JavaScript
/* properties to access the CONTENT of the element */

var elem = document.querySelector('p');  
var text = elem.textContent; //the text content of the elem

elem.textContent = "I'm different!"; //change the content 
var html = elem.innerHTML; //content including tags

elem.innerHTML = "I'm <strong>different</strong>"; 
var parent = elem.parentNode; //get the parent node
```

- Can add/remove classes, IDs, and inline style

```HTML
<style>/*Bad form! Just for demo*/
	.title {
		font-style: italic;
}

</style>  
<h1>Hello, IN4MATX 133!</h1> 
<script>
	var elements = document.getElementsByTagName("h1"); 
	for(var i = 0; i < elements.length; i++) {
		elements[i].classList.add("title");
	    elements[i].style.color="blue";
	 }
</script>
```

- Can and/remove/replace HTML elements

```JavaScript
//create a new <p> (not yet in the tree)

var newP = document.createElement('p'); 
newP.textContent = "I'm new!";

//create Node of textContent only
var newText = document.createTextNode("I'm blank");

var div = document.querySelector('div#container'); 
div.appendChild(newP); //add element INSIDE (at end) 
div.appendChild(newText);

//add node BEFORE element (new, old)
div.insertBefore(document.createTextNode("First!"), newP); //replace node (new, old)

div.replaceChild(document.createTextNode('boo'), newText);

//remove node
div.removeChild(div.querySelector('p'));
```

- Can check form fields before sending to server
- Provides instant feedback, reduce server back-and-forth

```HTML
<script>
	function validateForm() {  
		var x = document.forms["myForm"]["fname"].value; 
		if(x==null || x=="") {
			alert("Name must be filled out");
			return false; 
		}
	}
</script>  
<form name="myForm" onsubmit="return validateForm()" method="post">

<label>Name: </label>  
<input type="text" name="fname"> <input type="submit" value="Submit">

</form>
```

- Can gather and use information
- Remember that this works on the client side only

```HTML
<script>
	var x = document.getElementById("demo"); 
	function getLocation() {
		if (navigator.geolocation) { 
			navigator.geolocation.getCurrentPosition(showPosition);
		} 
		else {
			x.innerHTML = "Geolocation is not supported by this browser."; 
		}
	}  

	function showPosition(position) {
		x.innerHTML = "Latitude: " + position.coords.latitude + "<br>Longitude: " + position.coords.longitude;
	}
</script>
```

## Making pages interactive

### Listeners

- Can attach a listener to that method, specifying that we want to do something when that element causes an event

```JavaScript
//respond to "click" events
elem.addEventListener('click', callback);

//often use an anonymous callback function
elem.addEventListener('click', function(){ 
	console.log('clicky clicky!');
});
```

- Listener callback function will be passed an event parameter
- Contains usefule information, but can often be ignored

```JavaScript
elem.addEventListener('click', function(event) { 
	console.log('You clicked me!'); 
	//get what was clicked;
	var clickedElem = event.target; 
});
```

### Event types

| name | action |
| ---- | ---- |
| `click` | mouse or button clicked |
| `dblclick` | double clicked |
| `hover` | mouse hover |
| `focus` | element gains focus (imporatant!) |
| `mouseenter` | mouse is moved over an element |
| `mouseleave` | mouse leaves an element |
| `keydown` | key is pressed |

- A full list can be found [here](https://developer.mozilla.org/en-US/docs/Web/Events)

## jQuery

- Manipulation in pure JS is verbose
- Editing a lot of tags can make code very long and difficult to read
- jQuery predefines methods for manipulating the DOM

```HTML
<script
src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous">
</script>
```

- Include **before** your own script(s)
- Integrity: hashes ensure the downloaded file matches what you expect
- Crossorigin: some imports require credentials, anonymous requires none

### jQuery selectors

- Use the `jQuery()` function to select DOM elements
- The parameter is a CSS selector string (like `querySelector`)
- More common to use `$()` aka the all-powerful dollar sign function

```JavaScript
//selects element with id="foo" (e.g., <p id="foo">) 
var fooElem = jQuery('#foo');

//selects all <a> elements (returns an array)
var allLinksArray = jQuery('a');  

//selects element with id="foo" (e.g., <p id="foo">)
var fooElem = $('#foo');

//selects all <a> elements (returns an array)
var allLinksArray = $('a');
```

- `jQuery` can handle all CSS selectors, as well as some additional pseudoclasses

```JavaScript
$('#my-div') // by id  
$('div') // by type  
$('.my-class') // by class
$('header, footer') // group selector
$('nav a') // descendant selector
$('p.red') // scoped selector
$('section:first') // first <section> element
                   // not a css selector!
```

### jQuery and elements

- Similar to pure JS, jQuery has methods to access and modify attributes and CSS

```JavaScript
//Pure JavaScript
var txt = document.querySelector('#my-div').textContent; document.querySelector('#my-div').textContent = 'new info!';  
document.querySelector('#my-div').innerHTML = '<em>new html!</em>';

//jQuery  
var txt = $('#my-div').text(); //get the textContent 
$('#my-div').text('new info!'); //change the textContent  
$('#my-div').html('<em>new html!</em>'); //change the HTML
```

### jQuery and the DOM tree

```JavaScript
//create an element (not in DOM)
var newP = $('<p class="new">This is a new element</p>');

//add content to DOM  
$('main').append(newP); //add INSIDE, at end 
$('main').append('<em>new</em>'); //can create element on the fly

$('main').prepend('<em>new</em>'); //add INSIDE, at beginning 
$('main').before('<header>'); //insert BEFORE 
$('footer').insertAfter('main'); //insert target AFTER param

$('main').wrap('<div class="container"></div>'); //surround
$('footer').remove(); //remove element 
$('main').empty(); //remove all child elements
```

### jQuery event handling

- jQuery also has methods for registering event listeners

```JavaScript
$('#button').click(function(event) { 
	console.log('clicky clicky!');
	var element = $(event.target);
});
```

- Remember how your script should wait until after the page has loaded?

```JavaScript
$(document).ready(function() {  
	//your program goes here  
	//this need not be an anonymous function
});
```

### jQuery effects

- Support for adding transitions to modify the appearance of effects

```JavaScript
$('#id').fadeIn(1000); //fade in over 1 second 
$('#id').fadeOut(500); //fade out over 1/2 sec 
$('#id').slideDown(200); //slide down over 200ms 
$('#id').slideUp(500); //slide up over 500ms 
$('#id').toggle(); //toggle whether displayed
```

### Utility functions

- Included to simplify syntax

```JavaScript
//check if an item is in an array 
$.inArray(4, [3,4,3] );

//this is like .filter, but works on old browsers
$.grep( [3,4,3], function(item) {
	return item > 3; 
});

//iterate over arrays or objects -- works for either!
$.each( [1,3,3], function(key, value) {
	console.log('Give me a '+value); 
});

$.each( {dept:'IN4MATX',num:'133'}, function(key, value) {
	console.log(key+' name: '+value); 
});
```

- The [Lodash](https://lodash.com/) is a handy library for working with basic data structure

```JavaScript
_.flatten([1, [2, [3, [4]], 5]]);  
// => [1, 2, [3, [4]], 5]

var zipped = _.zip(['a', 'b'], [1, 2], [true, false]); 
// => [['a', 1, true], ['b', 2, false]]

_.unzip(zipped);
// => [['a', 'b'], [1, 2], [true, false]]
```

## Importing JS

- If script uses document ready, load it in the `<head>` tag
- Ordering is important, escpecially when dealing with libraries

```HTML
<head>
	<script src="https://code.jquery.com/jquery- 3.3.1.min.js"></script>
	<script src="index.js"></script> 
</head>
```