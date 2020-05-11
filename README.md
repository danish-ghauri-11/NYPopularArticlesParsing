# NYPopularArticlesParsing
Swift 5.0+ and SwiftUI based Sample to Parse API of Popular Articles of Newyork Times. 

# Requirements:
1. Xcode-11.4+
2. iOS-13.0+
3. CocoaPods

# Installation Guide:
1. Download or clone source code.
2. Open terminal and Goto the folder of project.
3. Write "pod install" and press enter.

# Details
This project is based on MVVM architecture using Swift 5.0+ and SwiftUI based user Interfaces. Following are some of the highlighted points and foldering of this project. Also includes few unit test cases(XCTestCase) for testing proper mapping of data from json to model.

1. Models folder within the app contains model classes for saving parsed data as objects.
2. ScreenViews folder contains UI views of the screens created in this project.
3. ScreenViewsModelController folder contains ViewsModel to fetch and populate data objects according to the view requirements.
4. HelpersAndManagers folder contains a web manager that will manage API requests like GET, POST, DELETE etc. I have created only GET request in this project as per the requirement. Also with that any helpers like project constants etc reside in this folder.
5. GeneralViews folder contains those views that are going to be shared/common among different screen views. In this case I have added Loader View.
