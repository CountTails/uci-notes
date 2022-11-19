# Lecture 14: Hybrid and native architectures

## Mobile-first design

- Plan your design for mobile
- Then make your app *better* with more real estate
    - Add more features
    - Make existing features easier to navigate
- A lot of businesses make mobile-friendly websites before making dedicated apps
- Mobile last: degrades, shoe-horned, short-sighted, crappy
- Mobile first: progressive, future proof, awesome

## Mobile development methods

### Native

- an app designed to work on a specific piece of hardware
- usually built with toos created by the hardware of plarform manufacturer
    - Android Studio for Android, in Java
    - Xcode for iOS, in Swift or Objective-C
- As we thenk of them today, native pps started with the first iPhone
- Released a development platform alongside the hardware

#### iOS

- Development languages
    - Objective-C
    - Cocoa Touch
    - Swift
- These languages were either developed by or pretty much only used by Apple
- Developer lock-in is a Disadvantage? Advantage? Both?
- Development tools
    - Xcode
    - iOS Source Development Kit (SDK)
    - SDK provides access to phone's storage, camera, sensors, etc.
    - 
#### Android 

- Development languages
    - Primarily Java
    - C and C++ via Android Native Development Kit (NDK)
- Align more closely with languages used in other contexts. (Advantage or disadvantage?)
- Development tools
    - Android Studio
    - Android Source Development Kit (SDK)
    - Various IDEs like Eclipse or NetBeans

#### Codebases

- Platform specific
- Cannot use Android SDK on iOS and vice-versa
- Usually require starting to code from scratch

### Hybrid

- Use a common code base to deploy native-like apps on a wide range of platforms
- Two primary approaches
    - WebView app
    - Compiled hybrid app

#### WebView

- Run a webpage written in HTML/CSS/JS on the phone's internal browser
- Load that browser in a lightweight native app
- Ideally, expose some native APIs to the browser
- Essentially app is just a website, allow same/similar code to be used
- WebView app frameworks
    - WebView apps are just websites
    - What do frameworks provide?
        - Common mobile interface elements like sliders and buttons
        - The native app for running the website
        - Some APIs for communicating with platform SDKs

#### Compiled hybrid apps

- Write code in one language and compile it to native code using a hybrid frameworks
- Results in a native app for each platform
- Less freedom to develop

### Progressive web apps

- Intended to "fill the gap" between native apps and web apps
- Really just a website that you can "install" on a phone
- Supported by major browsers and phones
- No associated framework, just a few files to add
    - some information in an manifest
    - relies on everything your browser relies on for other features
- Good PWAs
    - Start fast, stay fast
    - Work in any browser
    - Be responsive to any screen size
    - Provide a custome offline page
    - Be installable

## Choosing a mobile development methods

### Considerations

#### Business

- Development cost/time
- Development concerns
- Available infrastructure

#### Design

- Consistency with platform
- Device capabilities
- Interaction models supported
- Performance and usability

#### Technical

- Programming languages
- Integration with device
- Performance
- Upkeep and maintenance
- Flexibility
- Campatibility

### Strengths and weaknesses

#### Hybrid apps

- Stregths
    - Can share codebase between web and mobile
    - Can save time and effort
    - Easily design for various form factors
    - Access to some device capabilities
- Weaknesses
    - Performance issues
    - Inconsistency with platform
    - Limited access to device capabilities

#### Native apps

- Strengths
    - Consistent experience with platform
    - Leverages full device capabilities
    - Uses native UI elements
- Weaknesses
    - Need to support separate development for each platform
    - Cost of app development and maintenance
    - Need to learn/manage multiple programming languages
    - Need to manage multiple sets of tools

#### Hybrid vs. Native

| Hybrid | Native |
| ------ | ------ |
| Great when time/money is a concern | Great when performance is a concern |
| Need to deploy to multiple platforms | Need to be consistent with a platform |
| Great for lightweight/seasonal apps | Great if app require a lot of resources or device specific capabilities |

#### Progressive web apps

- Strengths
    - No new code or libraries
    - Good when device features are not concerned
- Weaknesses
    - Don't show up in managed app stores
    - Not discoverable through traditional means

## Ionic

- Webview app framework (2013)
- Interface implemented in Angular
    - Recently added support for React and Vue
- Capacitor is the recommended hybrid app runtime for ionic (traditionally Cordova)

### Capacitor

- Provides the native app which opens the webview
- Supports PWAs
- Also provides plugins for connecting to device resources
- Hundreds of plugins (both official and community)

### Ionic native

- A wrapper to bring plugins to Ionic
    - Imported as services
    - Can wrap cordova plugins as wells

### Ionic dev

- Provides a WebView to open up Ionic apps
- Lets you test your Ionic app in a browser

### Ionic components

- Angular-style components for a lot of interface elements common in mobile interfaces
    - Lists
    - Buttons
    - Sliders
    - Tabs
    - Model dialogs
    - Search bars
    - Etc.
- More on this next lecture

## Mobile design principles

### What makes a good experience

- It's not just the UI
    - Experience begins the first time you launch the app or website
- Several components
    - Initial impression
    - User interface
    - Visual design
    - Information presentation
    - The physical device an dhow it is used with the app

### A useful initial view

- Give users clear calls to actions
- Put useful content on the homepage
    - More than just navigation buttons
- Make it easy to get back to the homepage
    - Bottom navbar, side navigation menu

### The "uh-oh" button

- Functions and buttons are often pressed by mistake
- Undo and redo should be easy
- Navigating back a page should be easy
- Breadcrumbs or back buttons (top left)

### Error prevention

- Providing input with small devices is difficult
    - Add as much aid for input as possible
- Add input checks
    - Check digits in phone number of credit card number
- Use appropriate widgets
    - Date/time spinner
    - Sliders

### Follow platform conventions

- Users should not have to wonder whether different words, situations, icons, or actions mean the same thing
- Users hould not have to remember app-specific navigation

