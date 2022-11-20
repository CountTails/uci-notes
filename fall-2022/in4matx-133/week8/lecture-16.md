# Lecture 16: Databases and local storage

## Data storage

- All data lost when sleep tracker app is refreshed
- Not ideal, we need to tell the browser/app to store it

### Local storage

- Android and iOS allow apps to store some data
- Ionic Native provides (good) libraries for using local storage
- Store in key-value pairs where keys are strings and values are any type
- Install with `ionic cordova plugin add cordova-sqlite-storage` or `npm install --save @ionic/storage`

```TypeScript
// Store a key/value pair
storage.set('name', 'Max');

// Or to get a key/value pair
storage.get('age').then(
    (val) => { 
        console.log('Your age is', val);
    }
);
```

### Databases

- Provide reliability (data is still retrievable if device breaks)
- Provide cross-device support(modify same data from a phone and a desktop)
- More than just files in the cloud -- Can be queried to get subsets of data efficiently
- Two main types
    - Relational: MySQL, Postgres
    - Non-relational: MongoDB, Firebase
- Transactions: any add/delete/update/etc. made to a database

#### Relational

- Everything is organized into tables
- Tables contain columns with predefined names and data types
- Tables "relate" to one another by having overlapping or similar columns
- Every data entry is a row of a table

```SQL
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,  
    status TINYINT NOT NULL, priority TINYINT NOT NULL, description TEXT,  
    PRIMARY KEY (task_id)
)  ENGINE=INNODB;
```

#### Non-relational

- Everything is organized into objects
- There is no restrictions on how objects are structured
- Every data entry is an object, or "document"
- No well-defined enforced structure
- Flatter structures are generally better

```JSON
{
// This is a poorly nested data architecture, because iterating the children 
// of the "chats" node to get a list of conversation titles requires  
// potentially downloading hundreds of megabytes of messages  
"chats": {
    "one": {  
        "title": "Historical Tech Pioneers", 
        "messages": {
            "m1": { 
                "sender": "ghopper", 
                "message": "Relay malfunction found. Cause: moth." 
                }, 
            "m2": { ... },  
// a very long list of messages
        } 
    },
    "two": { ... } 
    
    }
}
```

```JSON
{
// Chats contains only meta info about each conversation stored under the chats's unique ID
    "chats": { 
        "one": {
            "title": "Historical Tech Pioneers",
            "lastMessage": "ghopper: Relay malfunction found. Cause: moth." 
            },
        "two": { 
        
        } 
    },

// Messages are separate from data we may want to iterate quickly but still easily paginated and queried, 
// and organized by chat conversation ID  
    "messages": {
        "one": {
            "m1": {
                "name": "eclarke",
                "message": "The relay seems to be malfunctioning." 
            },
            "m2": { 
            
            } 
        },
        "two": {
        
        } 
    }
}
```

## Advantages

### Relational

- Better support for querying
    - Provide languages for querying (SQL)
    - Can ask for specific tables or even join data across tables
- More organized
    - Field types are defined, data more reliably follows that structure
- More reliable
    - Structure enforced when new data is added
    - Transactions are atomic, it makes it easy to get the current state of the database

### Non-relational

- More flexible
    - Structure of data imposes restrictions
    - Adding a new field (column) can mess up  a relational database
- Faster for simple operations
    - Much easier to "watch all the files" than to query and index many rows across multiple tables

## Use cases

### Relational

- Used more in enterprise, large scale applications
    - Important that data conforms to a standard
    - Important to robustly query large amounts of data

### Non-relational

- Tend to be used more in smaller applications
    - Data flexibility is valuable
    - Data is small enough to reliably retrieve and parse

### Database vs. local storage

- Databases are crucial if more than the local device needs access to data
- Some privacy can be preserved if data is only stored locally

## Firebase

### What is it?

- First released in 2011
- Acquired by Google in 2014
- Has features besides databases
    - Media storage
    - Authentication
    - Analytics

### Creating the database

- Create the database and start in "test mode"
    - Anyone will be able to read/write to the database
    - Bad practice in production, database permissions can remedy this
- Firebase documents are organized into *collections*
- Collections are somewhat like tables in relational databases
- But Firebase is non-relational and has no structure requirement
- Multiple documents in the same collection may have different structure

### Setting up the mobile app

- Angular officially supports a Firebase library
    - Works with Ionic, since it is built on top of Angular
- `npm install firebase @angular/fire`
- Add configuration information for your Firebase app to `environment.ts` file in Ionic
- Edit Ionic's `module.ts` to point to this environment information
- Also add AngularFirestoreModule to `module.ts`

### Accessing the database from a mobile app

- `AngularFireStore` is a service and is injected like any other service
- Can retrieve collection by name

```TypeScript
import { AngularFirestore, AngularFirestoreCollection, DocumentData } from '@angular/fire/firestore'; 
import { Observable } from 'rxjs';

export class FirebaseService { 
    collection:AngularFirestoreCollection;

    constructor(db:AngularFirestore) {
        this.collection = db.collection('test-collection'); 
    }
}
```

- Probably want to get data multiple times
- Instead of retrieving the document every time, utilize `Observable` to listen for changes in data

```TypeScript
/* .component.ts */
export class MyApp {  
    testItems: Observable<any[]>; 
    
    constructor(db: AngularFirestore) {
        this.testItems = db.collection('test-collection').valueChanges(); }
}

```

```HTML
<!--.component.html -->

<ul>  
    <li *ngFor="let item of testItems | async">
        {{ item.name }}
    </li> 
</ul>
```

### Add

- Objects can be added asychronously

```TypeScript
export class FirebaseService {
    collection:AngularFirestoreCollection;
    
    constructor(db:AngularFirestore) {
        this.collection = db.collection('test-collection'); 
    }

    addData(data:{}) { 
        this.collection.add(data).then((reference) => {
            console.log("Reference to added data, kind of like a URL");
            console.log(reference);
        });
    } 
}
```

### Delete and update

- string reference can be used to delete or update documents

```TypeScript
deleteDocument(reference:string) { 
    this.collection.doc(reference).delete().then(() => {
        console.log('The document at ' + reference + 'no longer exists'); 
    });
}

updateDocument(reference:string, newData:{}) {
    this.collection.doc(reference).update(newData).then(() => {
        console.log('The document at ' + reference + 'is now ' + newData); 
        });
}
```

### Querying data

- Full dataset might be a large collection

```TypeScript
var citiesRef = db.collection("cities");

citiesRef.doc("SF").set({  
    name: "San Francisco", 
    state: "CA", country: 
    "USA", capital: false, 
    population: 860000,  
    regions: ["west_coast", "norcal"] 
});

citiesRef.doc("LA").set({  
    name: "Los Angeles", 
    state: "CA", 
    country: "USA", 
    capital: false, 
    population: 3900000,  
    regions: ["west_coast", "socal"]
});

citiesRef.doc("DC").set({  
    name: "Washington, D.C.", 
    state: null, 
    country: "USA", 
    capital: true, 
    population: 680000,  
    regions: ["east_coast"] 
});

citiesRef.doc("TOK").set({  
    name: "Tokyo", 
    state: null, 
    country: "Japan", 
    capital: true, 
    population: 9000000,  
    regions: ["kanto", "honshu"] 
});

citiesRef.doc("BJ").set({  
    name: "Beijing", 
    state: null, 
    country: "China", 
    capital: true, 
    population: 21500000,  
    regions: ["jingjinji", "hebei"]
});
```

- Can ask for subsets of those collections

```TypeScript
var citiesRef = db.collection("cities"); 

citiesRef.where("state", "==", "CA"); //SF, LA

citiesRef.where("capital", "==", true); //D.C., Tokyo, Beijing

citiesRef.where("population", "<", 1000000); //LA, Tokyo, Beijing

citiesRef.where("name", ">=", "San Francisco"); //SF, Tokyo, D.C.
```

### Converting TypeScript object to and from JSON

- Firebase expects JSON
- TypeScript objects can easily be converted to and from JSON

```TypeScript
export class DataLog {    
    id:string; 
    values:number[];
    
    toObject():{} {  
        return {
            'id':this.id,
            'value':this.values
        }; 
    }
    
    fromObject(object:{}) { 
        this.id = object['id'];
        this.values = object['value']; }
    }
```

- Non-primitive fields, like dates, may require extra conversion

```TypeScript
export class DataLog {
    date:Date;
    toObject():{} {
        return {
            'date':this.date
        }; 
    }

    fromObject(object:{}) {  
        //Stored as number of milliseconds
        this.date = new Date(object['date'].seconds*1000); 
    }
}
```