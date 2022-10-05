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