# Lecture 15: Ionic components

## Ionic

- Provides Angular-style components for a lot of common interface elements
- We'll use Ionic 4 in this class

## Component documentation

- Each component has a **lot** of potential attributes and properties
- Documentation enumerates many of the options
- The are more components than can be reasonably discussed
- Each components has more options that can be reasonably discussed
- The best way to learn them is to try it

## Types of components

### Structural

- Three availabe
    - `<ion-content>`
    - `<ion-header>` 
    - `<ion-footer>`
- Headers and footers can contain `<ion-toolbar>` for text and buttons
- A few components can replace headers and footers
    - `<ion-tabs>` for page navigations

### Items

- `<ion-item>` is the most basic component
    - Essentially a `<div>`
    - can hold text, images, and other things
    - Has a  css "block" style, so it shos up as a row
- Lots of other components can be added into `<ion-item>`

### Icons

- Can add labels or fun flavor
- Ionic provides a default set

### Input

- Ionic provides a lot of common input fileds
    - DateTime
    - Chekcbox
    - Button
    - Text input
    - And much more
- Should always be placed in a `<ion-item>`
- Utilizes two-way binding `[(ngModel)]`

### Lists

- Display rows of information
- Can provides some structure to items

### Modals

- Intended for quick entry or alerts
- Apear over the app's main contents
- Two different styles
    - Modal dialogs (toasts, alerts)
    - Modal pages (components)
- Usually triggered in model or controller (`.ts`) rather than view (`.html`)

## Routing

- URL routes defines in `app.routing.module.ts`
- But there is no browser bar in an app

### Method 1

- redefine the `href` attribute
- Can be placed on an Ionic component

### Method 2

- Use `NavController`
- Makes it easy to implement undo

