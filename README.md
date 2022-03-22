# ZemogaMobileTest

## Getting Started

To run this application, please follow the next steps:

1. Clone the Github repository on the main branch https://github.com/CarlosHV010101/ZemogaMobileTest 

2. Open the ZemogaMobileTest.xcodeproj

3. Run the app 

Prerequisites:

1. Building ZemogaMobileTest requires Xcode 9.3 on newer 

2. Building ZemogaMobileTest requires deploy target in iOS 14.0


## Proposed Architecture 

<img width="405" alt="Screen Shot 2022-03-21 at 22 39 52" src="https://user-images.githubusercontent.com/100322385/159409561-d6fd1a12-b45a-4072-af7e-1fca0804c02a.png">

The architecture of this application consists of 3 main layers: view, view model, and repository.

In the part of the view, we will have the different screens and subviews that make it up and that are shown to the user.

The view models will be in charge of providing the view with what is necessary to show it on the screen. In turn, the view models connect to the repository to request the data to be provided to the view.

Finally, the repository is a class that encapsulates the logic for accessing data sources such as the network and the database.


### Swift UI  2.0

This app was developed only with Swift UI version 2.0.

### API 

This app gets the data from the API https://jsonplaceholder.typicode.com/

### Realm 10.20.0

This app uses Realm to storage data 

Reasons Realm was used: 

-Working with Realm is much easier than with CoreData.

-Realm uses its own engine, simple and fast. Thanks to its zero-copy design, Realm is much faster than ORM, and often faster than SQLite either. 





