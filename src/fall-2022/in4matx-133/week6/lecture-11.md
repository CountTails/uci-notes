# Lecture 11: Components in Angular

## A2: a "small" client interface

- 3 pages
- No interactivity between pages
- Data is dynamic, but UI is fairly static
- A lot of computation behind each page, but each page was very self-contained

## Facebook: A "large" client interface

- Hundreds of pages and ways to navigate between pages
- Repeated UI components (status updates)
- Different content, links, etc. displayed for each person

## How to develop client applications?

### Frameworks for large clients

- Add structure and organization
- Make UI components reusable
- Support modularity 
    - import packages, UIs, etc. when needed
- Examples (all support the same overall goal)
    - Angular (Big boy #1)
    - React (Big boy #2)
    - Vue.js (More niche, but still popular)

### Angular

- First released in 2009
- Uses TypeScript, HTML, and CSS
- Does not dictate what framework is used server-side
- Last major release was version 14 in June 2022

### Angular `!=` AngularJS

- Major rewrite in 2016
    - Move to TypeScript from JavaScript
    - Not backwards-compatible
- Makes searching StackOverflow a bit of a pain
    - But the syntax maps over reasonably okay

### Angular installation

- `npm install -g @angular/cli`
- Create a new app with name `example`
    - `ng new example`
- Run app
    - `cd example`
    - `ng serve (--open)`
    - Runs on `localhost:4200` by default

### Angular architecture

- Approach for structuring the code behind interfaces
- Model: the data behind an app
    - Notifies vies when it changes
    - Enables views to query the model for data
    - Allows the controller to manipulate data in the model
    - Use JavaScript for loading, parsing, and manipulating data
- View: the visual interface of an app
    - Renders the contents of the model
    - Specifies how the model data should be presented
    - When the model changes, the view must updates it's presentation
    - "Push" approach: the view waits for change notifications (live updating feed)
    - "Pull" approach: the view must ask when it wants new data (pull to refresh)
    - Forwards input to the controller
    - Use HTML and CSS to specify layout
- Controller: the interaction with an app
    - Interprets user input and maps them to actions
    - Tells the model what actions to perform
    - Tells the view if the page should be rendered differently
    - Use event handlers for buttons and input in JQuery

```
      Manipulates
Model <---------- Controller
  | Updates           ^
  V                   | Uses
View --------------> User
          Sees
```

## MVC in angular

### Binding

- Variables in a view can be *bound* to variables and functions in a model or controller
- When a variable in the *model* changes, any references to it in the *view* will also change
    - One-way binding
        - Interpolation: `{{ value }}`
        - Property binding: `[src]="..."`
        - Event binding: `<button (event)="onSave()"> Save </button>`
    - Two-way binding
        - Allow data property to update when user makes changes
        - `<input [(ngModel)]="enteredText" (change)="textChanged()">`

### Angular components

- A component is an interface element
    - Usually larger than "a button" but smaller than  "a page"
    - Usually one which repeats across the interface
- Component terms
    - template: the HTML file representing the view
    - style: the CSS file(s) which indicate how the component should be styled
    - selector: a CSS selector that Angular will use to all instances with this component
- Defines the model, view, and controller for any interface lement
- Make a new component: `ng generate component hello`
- Each component makes a folder consisting of four files
    - `hello.compnent.css` (view)
    - `hello.component.html` (view)
    - `hello.component.spec.ts` (for automated testing; we'll mostly ignore)
    - `hello.component.ts` (model and controller)
- Every app has at least one component
- "Root" component
    - By default, in `app.component.*`
    - Looks like any other HTML page
    - By default, support data binding with `{{ data }}`

#### `app.component.html`

```HTML
<div>
    <h1>
        Welcome to {{ title }}!
    </h1>
</div>
```

#### `app.component.ts`

```TypeScript
import { Component } from '@angular/core';

@Component ({}
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.css']
})
export class AppComponent {
    title = 'example'
}
```

### Directives

#### `*ngFor`

- Repeat an item multiple times
- Can optionalyy specify an index

#### `*ngIf`

- Render a tag if contion is true
- Cn use ternary operator

### Using components

- Components can import other components
- Follow the selector defined in the component's `ts` file
- Can specify inputs: `@Input() attribute:type`
    - Passed as properties if they're dynamic
    - Passed as any other attribute if they're static
- Con specify output properties
    - When adding component, can specify an event to trigger when `clicks()` is called
    - The event will be triggered in the parent component





