//
//  File.swift
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
}
