//
//  TabBarItemProtocol.swift
//  tab-bar-kit
//
//  Created by Dustin Sapp on 3/15/25.
//

import Foundation
import SwiftUI

/// Definition for a tab bar item
public protocol TabBarItemProtocol: Identifiable {
    /// Notifies the tab bar's controller if the root needs to be a `UINavigationController`.
    var isNavigationRoot: Bool { get }
    
    /// The root view of the tab
    var tabRootView: AnyView { get }
    
    /// The zero based index of the view in the tab bar
    var index: Int { get }
    
    /// The icon for the tab item
    var image: Image { get }
}
