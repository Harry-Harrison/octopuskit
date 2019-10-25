# OctopusKit QuickStart

**Template and tutorial for the [OctopusKit][repository] game engine.**

1. 🆕 In Xcode 11 or later, create a new **Single View App** project, and choose **User Interface: SwiftUI.**
	
	> ❗️ **Do NOT** create a "Game" project, because that template does not use SwiftUI.

	> Running OctopusKit games on-device requires iOS/iPadOS 13 and macOS Catalina or later.
	
2. 📦 Add OctopusKit as a **Swift Package Manager** Dependency.
    
    > *Xcode File menu » Swift Packages » Add Package Dependency...*
        
    > Enter the URL for the GitHub [repository][repository].
    
3. 📥 **Copy and include** all the contents of the relevant QuickStart subfolder (iOS or macOS) from the OctopusKit package into your project's source folder. 

    > In the Xcode Project Navigator, menu-click on the OctopusKit/QuickStart folder and select "Show in Finder" then just drag the iOS or macOS subfolder into your project folder in the Xcode navigator. 

4. 🖼 Add the `OctopusKitQuickStartView` to the `ContentView.swift` file:

    ```
    var body: some View {
        OctopusKitQuickStartView()
    }
    ```
    	
5. 🚀 Build and run the project to verify that the template works.

6. 👓 Examine the OctopusKitQuickStartView.swift file and dig around in the QuickStart folder to see how everything works, then modify the template for your specific game. 

    > 📁 The main content of the template is in the `TitleState` and `PlayState` folders.

    > 🏷 Filenames are prefixed with a number denoting the order they come in during the application's life cycle. 
	
    > 🔍 Search for comments prefixed with "STEP #" for a quick overview of the flow of execution.

    > 💡 Try out different components from the `Sources/OctopusKit/Components` folder.
    
7. For a detailed explanation of the engine, see the [Usage Guide][usage-guide] in the Documentation folder of the OctopusKit package/repository.

----

[OctopusKit][repository] © 2019 [Invading Octopus][website] • [Apache License 2.0][license]

[repository]: https://github.com/invadingoctopus/octopuskit
[website]: https://invadingoctopus.io
[license]: https://www.apache.org/licenses/LICENSE-2.0.html

[usage-guide]: https://github.com/InvadingOctopus/octopuskit/blob/master/Documentation/Usage%20Guide.md
