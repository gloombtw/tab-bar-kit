//
//  File.swift
//  tab-bar-kit
//
//  Created by Dustin Sapp on 3/15/25.
//

import Foundation
import Combine

/// The coordinator to receive and publish values for when the bar bar selection changed
public class TabBarCoordinator: TabBarCoordinating {
    
    /// Exposed publsher to receive values from
    public private(set) var selectedTabChangedPublisher: AnyPublisher<Int, Never>

    private let _selectedTabChangedPublisher: PassthroughSubject<Int, Never>
    /// Creates a `TabBarCoordinator` instance.
    public init() {
        self._selectedTabChangedPublisher = PassthroughSubject<Int, Never>()
        self.selectedTabChangedPublisher = _selectedTabChangedPublisher.eraseToAnyPublisher()
    }
    
    /// Sends the `TabBarItem`s index to the publisher notifiying the tab bar's controller that the selected index has changed
    ///
    ///  - Parameters:
    ///     - value: Integer based index of the `TabBarItem`
    public func send(value: Int) {
        _selectedTabChangedPublisher.send(value)
    }
}
