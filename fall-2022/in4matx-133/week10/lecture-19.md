# Lecture 19: Beyond web and mobile & wrap-up

## What is a wearable computer?

- A computer on the body that is:
    - Always on
    - Always accessible
    - Always connected
- Other actions
    - It augments the user actions
    - Is aware of the user and their surrounding

## Body and head-mounted wearables

### Google glass

- Commercial smart glasses released in 2013
    - Technology lead by Thad Starner, part of the MIT group
- Front facing camera, rear facing display
- Gyroscope/accelerometer/magnometer
- Natural language input capabilities
- Privacy and safety concerns prevented take-off in the consumer space
- Lives on in enterprise space
    - New version released in 2017
    - Used in manufacturing and healthcare

## Wrist-worn wearables

### Fitbit (2011)

- One of the first commercially successful digital pedometers
- Early versions were hip-worn, now almost exclusively wrist-worn
- Current models are "fitness-first" smartwatches
    - Activitiy prominently included on the home screen
- Acquired by Google in 2019

### Pebble (2013)

- Arguably the first commercially successful smartwatch
    - Two of the most funded Kickstarter projects ever
- E-ink display lead to high battery life (a week vs. a day)
- Paired with a phone via bluetooth
    - Could retrieve email, control music, receive notifications, etc
- Acquired by Fitbit in 2016

### Apple watch (2015)

- From the onset, intended to be a "second screen" companion to iOS devices
- Original versions could do almost nothing without pairing to an iOS device
- Apps add secondary component to an existing iOS app

## Design recommendations for wrist-worn wearables

### One visual thought per screen

- Real estate is extremely valuable on watches
- Shrinking a mobile application will create a bad experience
- Keep words and interactions to a minimum

### Reduce input options

- Have only a couple of buttons per screen
- This may mean a watch app has fewer features than a mobile app
    - That's OK!
    - The watch augments the experience
- Consider voice input when longer interaction is needed

### Some apps don't need a watch interface

- For some apps, a watch app may not add to the experience
- Focus on use cases that make sense
    - Quick input
    - Glanceable feedback

### Questions to consider

- Would a watch app add anything to my mobile app?
    - Is there timely information the app needs to provide?
    - Can it be shown in a very small format?
    - Are there simple controls to the app that would be added to a watch?
- Do I have the resources/time to do this?
    - Currently limited market impact, but growing
- What type of interaction do you want the user to have?

### Implementing watch apps

- Requires native development (for now)
    - WatchKit for iOS, Wear Os for Android
- Requires a companion iOS or Android app for building/deploying though may be able to run as a standalone
- However, you can develop a hybrid mobile app and connect it to a native watch app

## Rethinking the user interface

- Tangible interactions
- Cooperative interactions
- Mixed ability interfaces

## Reflecting on INF133

### Technology changes quickly

First came IonDev (deprecated) then [Flutter](https://flutter.dev)

- A hybrid framework for building Android and iOS apps
- Goal: higher performance
- Written in Dart, an object oriented language Google has been pushing
    - Downside: new language
- Includes libraries for some native resources (Camera/photos)
    - May be more reliable than Ionic

### Search before you build

- Do not reinvent the wheel
- Use interfaces, algorithms, animations, etc. that have been created by other people

### Build by example

- Learn from others 
- Read source code on webpages, GitHub, and StackOverflow
- Use the element inspector in your browser to see someone's design or implementation

### Build for accessibility

- Keep in mind who you are designing for
- Make sure your app works for
    - All users
    - All browsers
    - All devices

### Build with caution

- Use version control 
- Test while you build
- Iteratively refine and debug

### Build a solid foundation

- A new framework **will** come out next year
    - Or next month or next week
- But some fundamental principles unite them all
    - Separating interface from data and interaction, for example

## Applying this course in practice

### Product design process

1) Ideate
2) Refine
3) Design
4) Implement
5) Test
6) Deploy

### User interface implementation

- Has the power to turn ideas into reality
- Often dictates design decisions and timelines, for better or for worse
- Either you will implement or you will communicate with colleagues who implement interfaces

## What will do when you graduate?

## User experience design

- Follow principles of web, mobile, AR design
    - Responsive design
    - Error prevention
    - Give clear instruction
- Be conversational in web and mobile programming
    - Be able to understand what tasks are easy and hard
    - And understand when a developer is BSing something
- Style a webpage
    - Use CSS and SASS to change a design and even add animations

### Front-end engineer

- Build a webpage in plain HTML
    - Make it responsive with Bootstrap
- Use a framework to build a richer application
    - Angular for a web frontend
    - Ionic for a mobile frontend
- Style a webpage
    - Use CSS and SASS to change a desing and even add animations

### Back-end engineer

- Build a web server
    - Allow it to respond to requests from a front-end interface
    - Allow it to make requests to API's made by other developers
- Follow authentication and authorization protocols
    - Enable users to sign
- Use a database
    - Data can persist between sessions

### Academic researchers

Explain some key problems in a couple areas

- Ubiquitous computing
- Human performance
- Mixed reality design
- Smartphone system security
- Wearable computing
- Augmented and virtual reality

### Software consultancy

- Process and analyze data
    - Retrieve it from an API
    - Parse and process it to answer your question
- Visualize data
    - Use an appropriate tool for the task

### Something unrelated

- Make a portfolio to show off your skills
    - Selling yourself is key
- Judge new devices and apps that come along
    - Is this solving a real problem?
    - Is this well designed?

### Other skills

- Git and GitHub
- Package management in npm
- Visualization in Vega-lite
- Gestural control