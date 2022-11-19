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

```HTML
<ion-header>
  <ion-toolbar>
    <ion-title>My Navigation Bar</ion-title> 
  </ion-toolbar>
</ion-header>

<ion-content padding> Content here...
</ion-content>

<ion-footer>
  <ion-toolbar>
    <ion-title>Footer</ion-title>
  </ion-toolbar>
</ion-footer>
```

### Items

- `<ion-item>` is the most basic component
    - Essentially a `<div>`
    - can hold text, images, and other things
    - Has a  css "block" style, so it shos up as a row
- Lots of other components can be added into `<ion-item>`

```HTML
 <!-- Default Item -->
<ion-item>
  <ion-label>
    Item
  </ion-label>
</ion-item>
```

### Icons

- Can add labels or fun flavor
- Ionic provides a default set

```HTML
<ion-item>
    <ion-badge color="primary">11</ion-badge> 
</ion-item>  
<ion-item>
    <ion-badge color="secondary">22</ion-badge> 
</ion-item>  
<ion-item>
    <ion-icon name="heart"></ion-icon> 
</ion-item>  
<ion-item>
    <ion-icon name="moon"></ion-icon> 
</ion-item>  
<ion-item>
    <ion-badge color="secondary"> 
        <ion-icon name="moon"></ion-icon>
    </ion-badge>
</ion-item>
```

### Input

- Ionic provides a lot of common input fileds
    - DateTime
    - Chekcbox
    - Button
    - Text input
    - And much more
- Should always be placed in a `<ion-item>`
- Utilizes two-way binding `[(ngModel)]`

```HTML
<ion-item>  
    <ion-label>Date</ion-label>  
    <ion-datetime display-format="MM/DD/YYYY"> </ion-datetime>
</ion-item>
```

### Lists

- Display rows of information
- Can provides some structure to items
- Styling lists over individual items is quite handy

```HTML
<ion-list>
  <ion-item>
    <ion-label>Input</ion-label>
    <ion-input></ion-input>
  </ion-item>
  <ion-item>
    <ion-label>Toggle</ion-label>
    <ion-toggle slot="end"></ion-toggle> 
  </ion-item>  
  <ion-item>
    <ion-label>Radio</ion-label>
    <ion-radio slot="end"></ion-radio> 
  </ion-item>  
  <ion-item>
    <ion-label>Checkbox</ion-label>
    <ion-checkbox slot="start"></ion-checkbox> 
  </ion-item>
</ion-list>
```

- Can contain tags other than `<ion-item>`
- `<ion-card>` can provide a "card" layout for presenting information

```HTML
<ion-list>
  <ion-card>
    <ion-card-header>  
      <ion-card-subtitle>Card Subtitle</ion-card-subtitle> 
      <ion-card-title>Card Title</ion-card-title>
    </ion-card-header>
    <ion-card-content>Card content</ion-card-content>
  </ion-card>

  <ion-card>
    <ion-item>
      <ion-icon name="pin" slot="start"></ion-icon>  
      <ion-label>ion-item in a card, icon left, button right</ion-label> 
      <ion-button fill="outline" slot="end">View</ion-button>
    </ion-item>
  </ion-card>
</ion-list>
```

### Modals

- Intended for quick entry or alerts
- Apear over the app's main contents
- Two different styles
    - Modal dialogs (toasts, alerts)
    - Modal pages (components)
- Usually triggered in model or controller (`.ts`) rather than view (`.html`)

### Dialogs

```HTML
<!--HTML-->
<ion-button expand="full" color="primary" (click)="presentToast()">Send Toast</ion-button> 
```

```TypeScript

import { ToastController } from '@ionic/angular';

export class HomePage {  
    /*Inject ToastController*/  
    constructor(public toastController: ToastController) {}

    presentToast() { this.toastController.create({
        message: 'Hello, world!',
        duration: 2000 }).then((toast) => {
            toast.present();
         });
    } 
}
```

#### Pages

- Opens up a new page over the current page
    - All pages are components themselves
- Useful for small entry, mor flexible than dialogs
- Any pages instantiated in the modal/controller (`.ts`) must be added to the `entryComponents` and the `declarations` in `app.module.ts`
    - Resolves `No component factory found` error

```TypeScript
import { ModalController } from '@ionic/angular'; 
import { ModalPage } from '../modal/modal.page';

export class HomePage {  
    constructor(public modalController: ModalController) {}

    presentModal() { this.modalController.create({
        component: ModalPage,
        componentProps: { name: "IN4MATX 133" } }).then((modal) => {
            modal.present();
        });
    } 
}
```

```HTML
<ion-content padding>  
    Hello, {{name}}!  
    <ion-button (click)="dismiss()">Dismiss</ion-button>
</ion-content>
```

```TypeScript
import { ModalController } from '@ionic/angular';

export class ModalPage implements OnInit {  
    @Input() name:string;  
    constructor(public modalController:ModalController) { }

    dismiss() {
        this.modalController.dismiss(); 
    }
}
```

To get data from a modal page

- pass the data to the `modalController.dismiss` method
- handle the data in the page that creates the modal when the promise from `modal.onDidDismiss` resolves

## Routing

- URL routes defines in `app.routing.module.ts`
- But there is no browser bar in an app

### Method 1

- redefine the `href` attribute
- Can be placed on an Ionic component

```HTMl
<ion-content padding >  
    <ion-button href="page2">Go to page 2</ion-button>
</ion-content>
```

### Method 2

- Use `NavController`
- Makes it easy to implement undo

```TypeScript
import { NavController } from '@ionic/angular'; 

export class HomePage {
    constructor(public navCtrl: NavController) {}

    goToPage2() {
        this.navCtrl.navigateForward('/page2'); 
    }
    
    back() {
        this.navCtrl.back(); }
}
```

