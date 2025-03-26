//
//  TabBarItem.swift
//  tab-bar-kit
//
//  Created by Dustin Sapp on 3/15/25.
//

import Foundation
import SwiftUI

/// The representation of a tab bar item
public struct TabBarItem: TabBarItemProtocol {

    /// The identifier for `Identifiable` conformance
    public let id: UUID = UUID()

    /// The positional index of the tab bar item in the tab bar
    public let index: Int

    /// The `SwiftUI` view at the root
    public let tabRootView: AnyView
    
    /// Denotes if the `UIHostingcontroller` needs to be backed by a `UINavigationController`
    public let isNavigationRoot: Bool
    
    /// Creates a `TabBarItem` instance from the following parameters:
    ///
    /// - Parameters:
    ///     - index: zero based index for the tab bar item.
    ///     - tabRootView: `SwiftUI` view that will be the root wrapped in `AnyView`
    ///     - isNavigationRoot: denotes if the `UIHostingController` will be wrapped in a `UINavigationController`
    public init(index: Int, tabRootView: AnyView, isNavigationRoot: Bool) {
        self.index = index
        self.tabRootView = tabRootView
        self.isNavigationRoot = isNavigationRoot
    }
}
