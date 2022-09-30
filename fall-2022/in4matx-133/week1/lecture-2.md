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

## Why structure matters?

### Web access is important

- Access by everyone regardless of disability is an essential aspect
- All sorts of people will use the webpage you create

### Common impariments

- vision 
	- can't see the screen
- motor impairments 
	- might not be able to use a mouse
- cognitive impairments
	- autism
	- dyslexia 
	- language barriers

### Supporting easy navigation with screen reader

#### Add semantic meaning to tags

- ARIA roles - the "old way"
- Given a non-semantic tag, a `role` attributes to provide meaning

```html
<div role="main"></div>  
<div role="navigation"></div>
<div role=“form"></div>
```

- HTML5 tags - the "new way"
- Dedicated sematic tags

```html
<header> </header>
<nav> </nav> 
<article> </article>
<section> </section>
<aside> </aside>
<footer> </footer>
```

- `alt` attributes in images
- `aria-label` attributes to describe non-visual elements (buttons)

#### Alt text guidelines

- Always include the `alt` attribute, even if empty
- Describe the information, not the picture
- "Active" images and images which contain information require descriptive alt text
- Descriptive images should have empty `alt` text
- Be succinct, avoid being redundant with text

### Accessibility validators

- [WAVE]( http://wave.webaim.org/)
- [ACheker](https://achecker.ca/checker/index.php)
- Both over-report problems, requires you to think through whether something is actually an accessibility issue
- Can try on your own with a screen reader

## Inclusive design is better for everyone

- The HTML stands alone
	- Developers can glance at a page's source and have a good idea of what it renders
- Semantic HTML helps people identify the content they want
	- Accessibility benefits
	- Interfaces can selectively remove or de-emphasize contextually unimportant contents
	- Search engines can index the important content rather than UI content