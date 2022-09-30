# Lecture 3: CSS

## CSS 

- Stands for **C**ascading **S**tyle **S**heets
- Defines rules from styling
- Differs from HTML, which defines layout/style

### Why is it needed?

- Reusability: apply the same style to multiple web pages
- Modularity: include multiple stylesheets that apply to a single page
- Sane management: Files can be version controlled, separate from HTML structual content
- Maintainability: Styles can be contained

### Syntax

- **Selectors** specify which elements a **rule** applies to
- **Rules** specify what *values* to assign to different formatting **properties**

```CSS
h1 {
	font-family: 'Arial';
	color: blue;
	background-color: #ff0000 /*red*/
}
```

- Linking to stylesheets in HTML's `<head>`

```HTML
<head>
	<link rel="stylesheet" href="my-style.css">
</head>
```

## Element, ID, and class selectors

- element: what tag is being styled?

```CSS
p {
	font-family: 'Arial';
	color: red
}
```

- class: a type of element

```CSS
.emphasize {
	font-family: 'Arial';
	color: red
}
```

- id: one specific element

```CSS
#redtext {
	font-family: 'Arial';
	color: red
}
```

### HTML class and ID attributes

- Variable-value just like any other attribute
- An element can have many classes, but only one ID
- Each page can have only one element with a given ID
	- Required to pass validation
- Can use the same class  on multiple elements
	- And shoud; it's useful to apply the same style to many elemnts

```CSS
div.widget.foo#baz {
	/*can chain selectors together!*/
}
```

Applies to:

```HTML
<div class="widget foo" id="baz"></div> 
```

## Properties

- `font-family`: the font (fallback can be specified as comma separated list)
- `font-size`: the size of the text
- `font-weight`: boldness
- `color`: text color
- `background-color`: (element's background)
- `opacity`: (transparency)
- And so much, much more!

## Cascading style sheets

- Multiple rules can apply to the smae element (in a "cascade")
- CSS rules are also inherited from parent tags