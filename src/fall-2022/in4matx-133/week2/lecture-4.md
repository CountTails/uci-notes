# Lecture 4: Responsive Design & Bootstrap

## Screen sizes over time

### Personal computing era

- 960px wide was pretty common
- Most screens were 1024x978, leaving some room for vertical scrollbar
- Nicely divisible, can create even columns

### Today

- iPhone screens range from 3.5" diagonally to almost 6"

## Responsive vs. adaptive

| Responsive | Adaptive |
| ---- | ---- |
| Develop one set of HTML & CSS which changes layout depending on screen size | Develop and maintain multiple sets of code that adjusts layout depending of device type and screen size |

| Responsive design | Adaptive design |
| ---- | ---- |
| **+** Easier to maintain one codebase | **+** Can cater expereinces to a device |
| **-** worse performance | **-** more difficult to maintain several codebases |
| **-** emphasis on making it look right | **-** limits development to a few capabilities |

## Adaptive design

- User agent string accessible via JS
- CSS media queries are better and can load appropriate external style sheets

```HTML
<head>  
<link rel="stylesheet" media="screen and (device-width: 375px) and (device-height: 667px) and (-webkit-device-pixel-ratio: 2)" href="iPhone8.css"> </head>
```

### Media query

- `@media`
- `screen, print, speech, all`
- `min-width, max-width`
- `orientation, -webkit-min-device-pixel-ratio`
- Many more

## Responsive designs

### Breakpoints

- The point at which your design "breaks" and is no longer visually appealing or usable
- Most designs have 3-5 breakpoints
	- extra small (old mobile)
	- small (mobile)
	- medium (tablet)
	- large (laptop, desktop)
	- extra large (wide desktop or wall display)

```CSS
@media screen and (max-width: 640px) { /* small screens */

}

@media screen and (min-width: 640px and max-width: 1024px) {

 /* medium screens */

}

@media screen and (min-width: 1024px) { /* large screens */

}
```

### Fluid and flexible

- Lay out content in columns whose width can vary
- Let image sizes change based on screen layout
- Put images in containers which scale appropriately
- set `width:100%, max-width:100%, height:auto`

### Mobile first design

- "Graceful degradation" vs "progressive enhancement"
- Plan your design for mobile first
- Then make your app *better* with more real estate
	- add more features
	- make existing features easier to navigate
- Tips for mobile design
	- show the same content; organize it appropriately
	- stack content vertically
	- show navigation on demand
	- larger touch targets
- Mobile-first, not mobile only
	- Plan for mobile
	- consider how the experience should change on desktop
	- Go beyond making everything bigger; *enhance* your design

## Grid-based layout

- established tool for content arrangement
- gridded content is familiar and easy to follow
- In general, it's good to target fewer lines
	- Breaking that rule allows for more creativity and attention grabbing
	- Utilize rows, columns gutters, padding/spacing

## Digging into bootstrap

- [Download](http://getbootstrap.com/docs/4.1/getting-started/download/) a collection of CSS and JS files
- Load it by adding this to head

```HTML
<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="stylesheet" href=“css/override.css">
```

- Content delivery networks (CDN)
- Broswer-side caching reduces burden of loading files
- Integrity: hashes to ensure the downloaded file matches what's expected
	- Protects against server being compromised
- Crossorigin: some imports require credentials, anonymous require none

```HTML
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
```

### Specifying a viewport

- done in the page's head
- sets the device width and scale level (for zooming)

```HTML
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">  
</head>
```

### Designating a container

- All bootstrap content lives in a container
- Just a class; anything can be a container

```HTML
<div class="container">

 <!--Bootstrap content-->

</div>

<main class="container">

 <!--Bootstrap content-->

</main>
```

### Grid system

- Grid system has 12 columns
	- 12 has a lot of factors (1, 2, 3, 4, 6)
- Content over 12 columns will wrap
- 15px gutter for each
- Classes for `row` and `col-[size]-[number]`
- Size parameters is optional; will divide space proportionally
- Rows are block elements; columns are inline elements
- `.col` with no size defaults to the smallest (`xs`)
- largest size listed will cover larger sizes
- default to width 12 (full width) when size not specified

### Media queries

```CSS
@include media-breakpoint-up(sm) {
	.some-class { 
		display: block;
	} 
}
```

### Hiding and showing

There are some helpful classes for showing and hiding content across breakpoints

- `.visible-[sz]-*`
- `.hidden-[sz]-*`

### Default styling

- Bootstrap changes a lot of styles
- Custom styles involve various suffixes

### Components

- Components are elements pre-arranged into common patterns
- Makes making nav bars, drop downs, alerts, etc. nice and simple
- Requires some JS

## Downsides for grid frameworks

- Can lead to similar looking webpages
- Can involve loading a lot of files; which can lower performance
- Can stifle creativity