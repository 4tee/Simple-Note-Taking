# Simple-Note-Taking
This repo is an iOS app that is written in SwiftUI to demonstrate the SwiftUI components and Core Data for a simple note taking app. It includes adding new note, editing existing note and removing note.


## How to setup
This project setup is done in
- Mac OS (Big Sur)
- XCode 12.4
- Swift 5.3.2


## Features Involved
1. Adding new note in a sheet (by tapping on + (plus) icon) at top right corner
2. Editing note in a new screen (navigate)
3. Delete note with Swipe
4. Listing of notes

## Interteresting Facts

### @Environment vs @State vs @StateObject vs @Observable
- @State property wrapper allows SwiftUI to manage the memory with the view lifecyle automatically.
- @ObservedObject allows for more complex properties and might be shared across multiple views. In this sample project, the core data `Note` is an @ObservedObject that conforms to `ObservableObject` protocol.
- @StateObject is somewhere between @State and @ObservedObject. The difference between @StateObject and @ObservedObject is the ownership of the object. The rule is that whichever view is the first to create the object must use @StateObject and all other views must use @ObservedObject.
- @EnvironmentObject allows sharing across the app. If one changes, it changes for the rest. In this code, we are using `managedObjectContext` as the @EnvironmentObject.

### SwiftUI vs UIKit
- It depends.
- Even thought SwiftUI is new, but it is still limited in API coverage. Many of the UI components are still not fully covered in term of functionality. For example, TextEditor has no hint, while TextFiled can contain hint. It can be overcome with ZStack and another Text, however, it is not an idle.
- You can wrap the UIKit to be used in SwiftUI.


## Improvement to be made

The app is a functionally working prototype. I have picked an easy, but bad way to make this as PoC app to demostrate the SwiftUI. However, it should not be used in production.

Due to time limitation, I couldn't work on some of the stuffs, especially making the app more loosly couple and allows it more testable. There is a number of code smells that I could recommend :

1. @FetchRequest inside the View - The data should not tie to the View. The data should be injected from ViewModel and ViewModel can contain a data repository protocol. In this way, we can swap to any data soure which implements data repository protocol. For example, the data can come from Core Data or network data, etc.

2. UI Testing - I have skipped UI Testing. I would recommend doing it after the item 1.


### Screenshots

![alt Add Note](https://i.imgur.com/VxMNm0U.png)
![alt Edit Note](https://i.imgur.com/FnPtF2E.png)
![alt Delete Note](https://i.imgur.com/iYOlVpO.png)
![alt List Note](https://i.imgur.com/jHyuKTi.png)
