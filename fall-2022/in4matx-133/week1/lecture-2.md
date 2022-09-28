# Lecture 2: HTML & Accessibility

## Client-side web development

### Using the internet

#### URL (uniform resource locator)

- protocol: how info should be handled (http/https)
- host: who has the info you are looking for
- resource: specific info that you want

#### Browser workflow

1) Browser will make a request
2) Web server will interpret the request
3) Web server will send appropriate response

The web is designed to send files across a network

### HTML

Stands for **H**yper**T**ext **M**arkup **L**anguage

- Adds meaning to text
- uses tags to organize content
- There and hundreds, not all are needed to make a webpage
- Tags can contain other tags to nest elements

#### Nesting

```html
<html>
	<body>
		<h1> Mark's Shopping List </h1>
		<ul>
			<li>Milk</li>
			<li>Eggs</li>
			<li>Sandwich ingredients</li>
			<ul>
				<li>Bread</li>
				<li>Tomato</li>
				<li>Lettuce</li>
			</ul>
		</ul>
	</body>
</html>
```

#### Attributes

- specify options and add meaning
- space separated list of names and values
	- kind of like variables, but are always strings

#### Structure

- Document format
- Specify language
- Document header (not shown by browser)
	- Charset
	- Metadata for search engines
	- Title
- Document body (shown by browser)

Browsers are pretty accommodating about HTML errors. There are no compiler errors when something is wrong. However, validation can help ensure browser compatibility and usability
