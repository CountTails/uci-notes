# Lecture 17: Device resources and sensors

## Ionic + Capacitor

- Capacitor provides libraries for connecting to device resources in the form of **plugins**
- Possible to use Capacitor alongside ionic native wrapping Cordova plugins
- Hundreds of plugins available (official and community)

### Setup

- Adding capacitor: `cd [project_folder && ionic integrations enable capacitor`
- Capacitor builds native "projects" based on web build (folder www): `ionic build`
- After ionic builds, use Capacitor to create native projects: `ionic capacitor add [andriod | ios]`
- After each significant code changes, need to update native project
    - `ionic capacitor copy [android | ios]`

### Deployment

- The sync command with both copy and update plugins and dependencies for both Android and iOS
    - `ionic cap[acitor] sync`
- Commands to open native project using native IDEs: `ionic cap[acitor] open [android | ios]`
- Live reloads keeps native IDE in sync with ionic project and updates deployed emulators
    - `ionic cap[acitor] run [android | ios] -I --external`

### Platform

- Ionic has injectible service for detecting what platform(s) the app is running on
- Platforms anr not mutually exclusive
    - Mobile, iOS, Android
    - iPad, tablet

## Capacitor plugins

- Few maintained officially
    - Camera
    - Local notification
    - Sharing
- Others maintained by community

### Taking a picture

- To use webcam, install PWA lib: `npm install @ionic/pwa-elements`

1) import PWA lib in `main.ts`

```TypeScript
import { defineCustomElements } from '@ionic/pwa-elements/loader'; 

// Call the element loader after the platform has been bootstrapped
defineCustomElements(window)
```

2) Import plugins from Capacitor

```TypeScript
import {
    Plugins,
    CameraResultType,
    CameraPhoto,
    CameraSource,
  } from '@capacitor/core';
  
const { Camera } = Plugins;
```

3) Use plugins to use camera

```TypeScript
async takePicture() {
    const image = await Camera.getPhoto({
        quality: 90,
        allowEditing: true,
        resultType: CameraResultType.Uri
    });  
    // image.webPath will contain a path that can be set as an image src. 
    // You can access the original file using image.path, which can be  
    // passed to the Filesystem API to read the raw data of the image,  
    // if desired (or pass resultType: CameraResultType.Base64 to getPhoto) 
    var imageUrl = image.webPath;  
    // Can be set to the src of an image now  
    imageElement.src = imageUrl;
}
```


### Local notification

- Goal: send a notification to the phone
- Could remind someone to journal their sleepiness, for example

1) Import Plugin in a service or component

```TypeScript
import { Plugins } from '@capacitor/core';
const { LocalNotifications } = Plugins;
```

2) Prompt user to authorize notifications

```TypeScript
async ngOnInit() {
      await LocalNotifications.requestPermission();
}
```

3) Send notifications

```TypeScript
const notifs = await LocalNotifications.schedule({
    notifications: [
        {      
            title: "Title",
            body: "Body",
            id: 1,
            schedule: { 
                at: new Date(Date.now() + 1000 * 5) // Can be schedule for the future
            },
            sound: null,
            attachments: null,
            actionTypeId: "",
            extra: null
        }
    ] 
});

console.log('scheduled notifications', notifs)
```

### Sharing

- Goal: export data from your app to a social app on the device
- Uses Web Share API
- Support is nuanced
- Use feature detection rather than assume a particular method is supported

1) Import plugin

```TypeScript
import { Plugins } from '@capacitor/core';
const { Share } = Plugins;
```

2) Call `Share.share()` with content to be shared

```TypeScript
let shareRet = await Share.share({
    title: 'See cool stuff',
    text: 'Really awesome thing you need to see right meow',
    url: 'http://ionicframework.com/',
    dialogTitle: 'Share with buddies'
});
```

## Plugin issues

- Many issues with Capacitor plugins
- Only a limited set  of functionalities are available
- Plugins may be unreliable

### Premier plugins

- The company behind Ionic maintains a set of plugins
- Presumably more reliable, but comes at a cost

### Comparing to react native plugins

- React native includes a few libraries for accessing device resources
- The rest are installed through plugins which look similar to Ionic's
- Used and installed in roughly the same way: install and link
    - `npm install react-native-sensors`
    - `react-native link react-native-sensors`
    - `npm install react-native-notification`
    - (manual linking in Xcode or Android build required)

## Thoughs on native resources

- The state of native support is OK, but improving year to year
- You could fork a broken/incomplete plugin and patch it yourself
- Clear downside of building hybrid apps
    - Device libraries can't be used directly
    - Either need to rely on community libraries or fill in the missing pieces
- Hybrid apps and PWA remain popular for development
- Accessing native resources should become easier in the future

## Sensors

- Modern phones include a lot of sensors
    - Accelerometers: Axis-based motion sensing. (Measures acceleration in a particular direction)
    - Gyroscope: Measures device orientation. (Can measure device rotation where accelerometer cannot)
    - Magnometer: Identifies cardinal direction (Can be a compass when used with Gyroscope)
    - GPS: Identify where on the planet you are
    - Proximity sensor: how close/far an object is
    - Ambient light: measures how bright a room is
    - Near field communication (NFC): allow nearby objects to communicate
- Sensors can be re-appropriated
    - Microphone: measure noise, infer sleep quality
    - Camera: barcode or QR scanner
    - Accelerometer: pedometer
    - Touchscreen: pressure