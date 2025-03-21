//
//  File.swift
//  tab-bar-kit
//
//  Created by Dustin Sapp on 3/15/25.
//

import Foundation
import Combine

/// Definition for a simple coordinator that is able to be used as an `EnvironmentObject`
public protocol TabBarCoordinating: ObservableObject {
    /// The type of value being sent
    associatedtype CoordinatorValue
    
    /// The publisher that handles the selected tab changing event
    var selectedTabChangedPublisher: AnyPublisher<CoordinatorValue, Never> { get }
    
    /// Sends the value to the coordinator for processing
    ///
    ///  - ParameterS:
    ///     - value: The value being sent by the publisher. `UITabBarController` expects an integer based index to navigate between tabs,
    ///              but a custom wrapper type may be used.
    func send(value: CoordinatorValue)
}
