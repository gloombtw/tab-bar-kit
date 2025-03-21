//
//  File.swift
//  tab-bar-kit
//
//  Created by Dustin Sapp on 3/20/25.
//

import Combine
import Foundation
import Testing
@testable import tab_bar_kit


@Suite(.tags(.tabBarCoordinator))
struct TabBarCoordinatorTests {
    
    @Test("Test Sending a value on the coordinator")
    func testSendValue() async throws {
        
        // Given
        let coordinator = TabBarCoordinator()
        let indexValue = Int.random(in: 0...1000)
        var cancellables: [AnyCancellable] = []
        
        // When, Then
        await confirmation { confirmation in
            coordinator.selectedTabChangedPublisher
                .sink { index in
                    #expect(index == indexValue)
                    confirmation()
                }
                .store(in: &cancellables)
            coordinator.send(value: indexValue)
        }
    }
}
