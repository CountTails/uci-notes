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
- Rules are applied **in order** (last rule always win among peer selectors)

### Specifying style

- CSS specificity is *calculated* based on which selector designates it
- General rule: rule that's "closer to the HTML element" applies
- Usually trial-and-error resolves most things

From most specific to least specific

- In line styling
- ID attributes
- Classes, pseudo-classes, other attributes
- Elements, pseudo-elements

### Positioning

- HTML tags are either 
	- **Block** elements (line break after)
	- **Inline** elements (no line break)
- Don't put block elements inside inline elements

```HTML
<p>
This is on a line.
<em>This is on the same line.</em> 
</p>
<p>This will be on a new line.</p>
```

#### The box model

- **Content** contains "real" content
	-  dimensions are specified with `width` and `height`
	- Content color extends into padding
- **Padding** extends content area
	- specified with the `padding` property
- **Border** is similar to padding
	- specified with the `border` property
- **Margin** is intended to separate elements from neighbors
	- specified with the `margin` property

#### Types

- All positioning is relative to the parent (child margins depend on the parent's)
- `static` (default)
	- follow the overall flow of the page
- `relative` (offset from default)
	- follow the overall flow of the page
- `absolute` (from top-left)
	- ignore flow of the page
- `fixed` (absolute + floating, fixed to the viewport)
	- ignore flow of the page
	- Make responsive layouts difficult, but helpful for things like floating action buttons
- `sticky` will stop when a user scrolls past it
	- Useful for menus
	- Not fully supported on all browsers

### Units

- Pixels (`px`), element units (`em`), percentages (`%`), real world units (`in`, `cm`)
- Use relative units whenever possible (`em`, `%`)
- Helps accessibility, people with low vision change default size
- Also useful to vary based on screen size

### Advanced selectors

- Extremely useful for making clean stylesheets
- Add a top margin for all `h2`s that follow a paragraph

```CSS
p + h2 {
	margin-top: 10px;
}
```

- or only in a particular `div`

```CSS
div.post p + h2 {
	margin-top: 10px; 
}
```

#### Child and descendent selectors

- Select *all* children and grandchildren

```CSS
ui li {

}
```

- Select *direct* children (not grandchildren)

```CSS
ui > li {

}
```

### Fonts & fallbacks

- Browser will try fonts in orde

```CSS
p {
	font-family: "Times New Roman", Times, serif;
}
```

### Fallback in HTML

- Similar to CSS fallbacks

```HTML
<video autoplay>
	<!-- webm not supported in IE or safari-->
	<source src="lecture3.webm" type="video/webm" />
	<!--mp4 supported in modern browsers, but lower quality-->
	<source src="lecture3.mp4" type="video/mp4" />
	<!--backup important for some old browser-->
	<img src="lecture3.jpg" title="Your browser does not support the <video> tag">
</video>
```

- Browser will try sources in order

### Why fallbacks

- Format may not be supported
- Font might not support certain characters
- Might take time to load ("flash of unstyled text")
	- pick a similar default font

## Browser compatibility

- Use to be a much bigger issue, but still work checking

## Validation

- [W3Validator](https://validator.w3.org)

## Extra goodies

### Specifying styles

#### Inline styling

- supported, but generally a bad practice
- Goes against DRY principle (don't repeat yourself)

#### Internal styling

- just putting CSS into the `<head>` of your HTML

#### External styling

- Generally a best practice
- Aligns with the idea of separating structure from style
- External styles apply in order too

### Positioning: shorthand

- multiple values can be specified in one line
- difficult to remember
- being explicit improves readability at the expense of brevity

```CSS
p {
	padding:10px 5px 5px 10px;
	/*      Top R Bottom L*/
}

p {
	padding: 10px 5px 10px;
	/*       Top  R&L Bottom*/
}

p {
	padding: 8px 12px;
	/*       T&B R&L*/
}
```

### Borders: shorthand

- multiple values can be specified in one line
- slightly easier to remember
- maybe even more readable

```CSS
div {
	border-bottom-width: 3px;
	border-bottom-style: solid;
	border-bottom-color: red;
}

div {
	border-bottom: 3px solid red;
}
```

### Psuedo-classes

- Define a special state of an element

```CSS
a:link { /* unvisited link */
	color: #FF0000;
}

a:visited { /* visited link */
	color: #00FF00;
}

a:hover { /* mouse over link */
	color: #FF00FF; 
}

a:active { /* selected link */
	color: #0000FF; 
}
```