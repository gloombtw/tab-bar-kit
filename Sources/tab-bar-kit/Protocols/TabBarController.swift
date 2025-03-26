//
//  TabBarController.swift
//  tab-bar-kit
//
//  Created by Dustin Sapp on 3/15/25.
//

import Foundation
import SwiftUI
import UIKit

/// Definition of a custom `UIKit` to `SwiftUI` TabBar
protocol TabBarController: UITabBarController {
    
    /// The type of coodinator conforming to the `TabBarCoordinating` protocol.
    associatedtype Coordinator: TabBarCoordinating
    
    /// The type of tab bar item conforming to `TabBarItemProtocol`
    associatedtype TabItem: TabBarItemProtocol
    
    /// The coordinator that will notify the `TabBarController` that a tab item has been selected.
    var coordinator: Coordinator { get }
    
    /// The tab bar items of the tab bar
    var tabBarItems: [TabItem] { get }
    
    /// The view controller that will host the `SwiftUI.View` for the tab bar.
    var tabBarViewController: UIViewController { get }
}
