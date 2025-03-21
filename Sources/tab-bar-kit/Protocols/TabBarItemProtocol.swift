//
//  File.swift
//  tab-bar-kit
//
//  Created by Dustin Sapp on 3/15/25.
//

import Foundation

/// Definition for a tab bar item
public protocol TabBarItemProtocol: Identifiable {
    /// Notifies the tab bar's controller if the root needs to be a `UINavigationController`.
    var isNavigationRoot: Bool { get }
}
