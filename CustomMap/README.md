# Google Maps Styling

- Follow these steps to install the sdk: [https://developers.google.com/maps/documentation/ios-sdk/start]
- Once the sdk was setup, I started off my research on the map customization.
    After about a few minutes of surfing, I came across the style reference section of google maps [https://developers.google.com/maps/documentation/ios-sdk/style-reference]. 
    With style options you can customize the presentation of the standard Google map styles, changing the visual display of features like roads, parks, businesses, and other points of interest. As well as changing the style of these features, you can hide features entirely.
    This means that you can emphasize particular components of the map or make the map complement the style of the surrounding page.
    These styles are specified in a json file and then assigned to mapStyle parameter of Google Maps View.

    I know what you are thinking! How do i create this json file? Looks as a tedious job. Well apparently it's not.

- Lucky for us, Google has provided us a interface to actually style the map the way we want. https://mapstyle.withgoogle.com/
- You can hide/unhide the components that are not required from the map like "roads, tunnel's, parks etc" and also customize the appearance of the components. Once you are Done with the customization, Just click on FINISH on the interface and it will present you the json for the styling which you have just completed.
- Copy this json and paste it in a file say "style.json" inside your project directory.
- Now just load this json file and assign it to the mapStyle param of map


```
override func loadView() {
let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 14.0)
let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
 
do {
// Set the map style by passing the URL of the local file.
if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
} else {
NSLog("Unable to find style.json")
}
} catch {
NSLog("One or more of the map styles failed to load. \(error)")
}

self.view = mapView
}
}
```


- NOTE:
-The sample project doesn't include an API key for GoogleMaps SDK. Make sure you get the key and set it in AppDelegate. 
-The steps for doing this can be found in the link https://developers.google.com/maps/documentation/ios-sdk/start


