# Lecture 12: Separation in Angular

## A "large" client interface

- Loading lots of libraries can be slow and expensive
- So Angular supports sectioning parts of projects into distinct modules

### Angular modules

- Segment code into a library, similar to a JS library
- A component only imports the modules it needs
- By default, each Angular app has one module: `app.module.ts`
- But an app can create multiple modules to section off code
- `ng generate module [name]`
- Modules can *import* other modules
- Modules also *declare* which components they use
    - When creating a new component, it is automatically gets added to the declarations for the root module

```TypeScript
import { BrowserModule } from '@angular/platform-browser'; 
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module'; 
import { AppComponent } from './app.component';  
import { HelloComponent } from './hello/hello.component'; 
import { DayComponent } from './day/day.component';

@NgModule({ declarations: [
    AppComponent,
    HelloComponent,
    DayComponent
], imports: [
    BrowserModule,
    AppRoutingModule
],
    providers: [
],
bootstrap: [AppComponent] 
})
export class AppModule { }
```

- `BrowserModule` is include by default
    - Required to run any app in the browser
- When creating an Angular project, can specify whether a *Routing* module should be created
    - Routing: defines what URIs to send to what endpoints
    - For Angular, defines what URIs to send to what components

### Angular routing

Can be found in `app-routing.module.ts`

```TypeScript
import { NgModule } from '@angular/core';  
import { Routes, RouterModule } from '@angular/router';  
import { ArtistPageComponent } from './pages/artist-page/artist-page.component'; import { TrackPageComponent } from './pages/track-page/track-page.component'; 
import { AlbumPageComponent } from './pages/album-page/album-page.component'; 
import { HomePageComponent } from './pages/home-page/home-page.component';

const routes: Routes = [
   {  path: 'artist/:id', component: ArtistPageComponent},
   {  path: 'track/:id', component: TrackPageComponent},
   {  path: 'album/:id', component: AlbumPageComponent},
   {  path: '', component: HomePageComponent}  
];

@NgModule({  
imports: [
    RouterModule.forRoot(routes)
    ], 
exports: [
    RouterModule
    ]
})  
export class AppRoutingModule { }
```

### Retrieving route in a component

```TypeScript
import { Component, OnInit } from '@angular/core'; 
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-album-page',
  templateUrl: './album-page.component.html',
  styleUrls: ['./album-page.component.css']

})  
export class AlbumPageComponent implements OnInit {

    constructor(private route: ActivatedRoute) { } //Injecting a service


    ngOnInit() {  
        // Retrieve the id from the URI
        var albumId = this.route.snapshot.paramMap.get('id');
    }
}
```

### Angular services

- Anything not associated with a specific view should be turned into a *service*
    - Getting data from an API
    - Parsing URIs for routing information
- Helps keep components lightweight
- Services can be *injected* into a component (importing)
- To inject, import the service and retrieve it as a parameter in the constructor
- `ng generate service [name]`

```TypeScript
import { Component, OnInit } from '@angular/core'; 
import { ActivatedRoute } from '@angular/router'; //Importing a service

@Component({  
selector: 'app-album-page',  
templateUrl: './album-page.component.html', styleUrls: ['./album-page.component.css']

})  
export class AlbumPageComponent implements OnInit {

    constructor(private route: ActivatedRoute) { } //Injecting it

    ngOnInit() {  
        // Service can be referenced later
        var albumId = this.route.snapshot.paramMap.get('id');
    }
}
```

```TypeScript
import { Injectable } from '@angular/core';  //Defined as injectable
import { HttpClient, HttpHeaders } from '@angular/common/http';
//Services can inject other services

@Injectable({  
providedIn: 'root' //What module(s) can use this service

})  
export class SpotifyService {
    baseUrl:string = 'http://localhost:8888'; 
    constructor(private http:HttpClient) { } //HttpClient injected

    private sendRequestToExpress(endpoint:string) {

    } 
}
```

```TypeScript
import { Component, OnInit } from '@angular/core';  
import { ActivatedRoute } from '@angular/router';  
//import  service via file structure's relative path
import { SpotifyService } from '../../services/spotify.service'; 

@Component({
  selector: 'app-album-page',
  templateUrl: './album-page.component.html',
  styleUrls: ['./album-page.component.css']

})  
export class AlbumPageComponent implements OnInit {

    // inject it like any other service
    constructor(private route: ActivatedRoute,
                private spotifyService:SpotifyService) {
                 
    }
```

### Angular classes

- Plain-old classes can also be made in Angular
- Any processing or munging you need to do
- `ng generate class [name]`

```TypeScript
export class Dataparser {
    public constructor() { console.log('Hello, world!');
    } 
}
```

### Importing a class

- Import class via file structure's relative path
- Instantiate it like any other class

```TypeScript
import { Component, OnInit, Input } from '@angular/core'; 
import { Dataparser } from '../dataparser';

@Component({  
selector: 'app-day', 
templateUrl: './day.component.html',
styleUrls: ['./day.component.css']
})
export class DayComponent implements OnInit {
    @Input() today:string;
    days = ["Sunday", 
            "Monday", 
            "Tuesday", 
            "Wednesday", 
            "Thursday", 
            "Friday", 
            "Saturday"];

    constructor() {  
        var data = new Dataparser();

    }

    ngOnInit() {

    } 
}
```

### Importing a library

- Since Angular is in TypeScript, it can use any JavaScript or TypeScript library
- Install as normal with npm: `npm install [packagename]`
    - If you want TypeScript typings, don't forget to install `@types/[packagename]`

```TypeScript
import * as chroma from 'chroma-js'; 

export class Dataparser {
    constructor() {
        console.log(chroma('royalblue')); //#4169e1
    }
}
```

## Angular's file structure

- Angular projects generate a *lot* of files
- There are 77 for the starter code of A3
- Most are boilerplate

```
a3-spotify-browser
├── client
│   ├── README.md
│   ├── angular.json
│   ├── karma.conf.js
│   ├── package-lock.json
│   ├── package.json
│   ├── src
│   │   ├── app
│   │   │   ├── app-routing.module.ts
│   │   │   ├── app.component.css
│   │   │   ├── app.component.html
│   │   │   ├── app.component.spec.ts
│   │   │   ├── app.component.ts
│   │   │   ├── app.module.ts
│   │   │   ├── components
│   │   │   │   ├── about
│   │   │   │   │   ├── about.component.css
│   │   │   │   │   ├── about.component.html
│   │   │   │   │   ├── about.component.spec.ts
│   │   │   │   │   └── about.component.ts
│   │   │   │   ├── carousel
│   │   │   │   │   ├── carousel.component.css
│   │   │   │   │   ├── carousel.component.html
│   │   │   │   │   ├── carousel.component.spec.ts
│   │   │   │   │   └── carousel.component.ts
│   │   │   │   ├── carousel-card
│   │   │   │   │   ├── carousel-card.component.css
│   │   │   │   │   ├── carousel-card.component.html
│   │   │   │   │   ├── carousel-card.component.spec.ts
│   │   │   │   │   └── carousel-card.component.ts
│   │   │   │   ├── search
│   │   │   │   │   ├── search.component.css
│   │   │   │   │   ├── search.component.html
│   │   │   │   │   ├── search.component.spec.ts
│   │   │   │   │   └── search.component.ts
│   │   │   │   ├── thermometer
│   │   │   │   │   ├── thermometer.component.css
│   │   │   │   │   ├── thermometer.component.html
│   │   │   │   │   ├── thermometer.component.spec.ts
│   │   │   │   │   └── thermometer.component.ts
│   │   │   │   └── track-list
│   │   │   │       ├── track-list.component.css
│   │   │   │       ├── track-list.component.html
│   │   │   │       ├── track-list.component.spec.ts
│   │   │   │       └── track-list.component.ts
│   │   │   ├── data
│   │   │   │   ├── album-data.ts
│   │   │   │   ├── artist-data.ts
│   │   │   │   ├── profile-data.ts
│   │   │   │   ├── resource-data.ts
│   │   │   │   ├── track-data.ts
│   │   │   │   └── track-feature.ts
│   │   │   ├── pages
│   │   │   │   ├── album-page
│   │   │   │   │   ├── album-page.component.css
│   │   │   │   │   ├── album-page.component.html
│   │   │   │   │   ├── album-page.component.spec.ts
│   │   │   │   │   └── album-page.component.ts
│   │   │   │   ├── artist-page
│   │   │   │   │   ├── artist-page.component.css
│   │   │   │   │   ├── artist-page.component.html
│   │   │   │   │   ├── artist-page.component.spec.ts
│   │   │   │   │   └── artist-page.component.ts
│   │   │   │   ├── home-page
│   │   │   │   │   ├── home-page.component.css
│   │   │   │   │   ├── home-page.component.html
│   │   │   │   │   ├── home-page.component.spec.ts
│   │   │   │   │   └── home-page.component.ts
│   │   │   │   └── track-page
│   │   │   │       ├── track-page.component.css
│   │   │   │       ├── track-page.component.html
│   │   │   │       ├── track-page.component.spec.ts
│   │   │   │       └── track-page.component.ts
│   │   │   └── services
│   │   │       ├── spotify.service.spec.ts
│   │   │       └── spotify.service.ts
│   │   ├── assets
│   │   │   └── unknown.jpg
│   │   ├── environments
│   │   │   ├── environment.prod.ts
│   │   │   └── environment.ts
│   │   ├── favicon.ico
│   │   ├── index.html
│   │   ├── main.ts
│   │   ├── polyfills.ts
│   │   ├── styles.css
│   │   └── test.ts
│   ├── tsconfig.app.json
│   ├── tsconfig.json
│   └── tsconfig.spec.json
├── readme.txt
└── webserver
    ├── app.js
    ├── bin
    │   └── www
    ├── package-lock.json
    ├── package.json
    └── routes
        └── index.js

22 directories, 77 files

```

