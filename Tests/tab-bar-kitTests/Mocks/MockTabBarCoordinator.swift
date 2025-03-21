//
//  File.swift
//  tab-bar-kit
//
//  Created by Dustin Sapp on 3/20/25.
//

import Foundation
import Combine
@testable import tab_bar_kit

class MockTabBarCoordinator: TabBarCoordinating {
    
    public var selectedTabChangedPublisher: AnyPublisher<Int, Never>
    
    public init(selectedTabChangedPublisher: AnyPublisher<Int, Never>) {
        self.selectedTabChangedPublisher = selectedTabChangedPublisher
    }
    
    public func send(value: Int) {
        // no op
    }
}
