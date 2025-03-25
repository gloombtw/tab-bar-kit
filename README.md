# tab-bar-kit

SwiftUI tab bar for hybrid projects.

## Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## About the Project

Use SwiftUI Views for your UIKit tab bar and tab items

## Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/yourusername/your-repo.git
   ```

## Usage

Create an instance of the coordinator and tab bar controller
```swift
let coordinator = TabBarCoordinator()
let tabBarController = TaBarViewController(coordinator: coordinator)
```
Add the coordinator to your SwiftUI tab bar view. The tab bar conforms to ObservableObject so it can be injected as an EnvironmentObject 

Add your SwiftUI tab bar view wrapped in AnyView:
```swift
tabBarController.setTabBarView(AnyView(Color.red))
```

Create you tab bar items and add them to the tab bar controller:
```swift
let tabBarItems = [TabBarItem(index: 0, tabRootView: AnyView(Color.red), isNavigationRoot: false)]

tabBarController.setTabBarItems(tabBarItems)
```

## Testing

This project uses Swift Testing for unit and integration tests.

1. Run the tests using the following command:
   ```bash
   swift test
   ```
2. To check for detailed output, run:
   ```bash
   swift test --verbose
   ```
3. Ensure that all tests pass before submitting your changes.

## Contributing

Contributions are welcome! Follow these steps to contribute:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a pull request.

## License

This project is licensed under the MIT License.

```
MIT License

Copyright (c) [2025] [Dustin Sapp]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Contact

Dustin Sapp - [dustintdwp@gmail.com](mailto\:dustintdwp@gmail.com)\
GitHub: [gloombtw](https://github.com/gloombtw)
