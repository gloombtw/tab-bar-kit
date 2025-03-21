//
//  File.swift
//  tab-bar-kit
//
//  Created by Dustin Sapp on 3/20/25.
//

import Combine
@testable import tab_bar_kit
import Foundation
import Testing
import SwiftUI

@Suite(.tags(.tabBarController))
@MainActor
struct TabBarControllerTests {
    
    @Test("Test initalizer")
    func testInit() {

        // Given
        let subject = PassthroughSubject<Int, Never>().eraseToAnyPublisher()
        let coordinator = MockTabBarCoordinator(selectedTabChangedPublisher: subject)
        let tabBarController = TabBarViewController(coordinator: coordinator)
        
        // When, Then
        #expect(tabBarController.coordinator != nil)
        #expect(tabBarController.tabBarViewController == nil)
    }
    
    @Test("Test setting up tab bar view")
    func testTabBarViewSetup() throws {
        // Given
        let subject = PassthroughSubject<Int, Never>().eraseToAnyPublisher()
        let coordinator = MockTabBarCoordinator(selectedTabChangedPublisher: subject)
        let tabBarController = TabBarViewController(coordinator: coordinator)
        let view = AnyView(Color.red)
        
        // When
        tabBarController.setTabBarView(tabBarView: view)
        let viewController = try #require(tabBarController.tabBarViewController)
        
        // Then
        #expect(viewController is UIHostingController<AnyView>)
    }
    
    @Test("Test setting up tab bar items", arguments: [true, false])
    func testTabBarItemSetup(isNavigationRoot: Bool) throws {
        // Given
        let subject = PassthroughSubject<Int, Never>().eraseToAnyPublisher()
        let coordinator = MockTabBarCoordinator(selectedTabChangedPublisher: subject)
        let tabBarController = TabBarViewController(coordinator: coordinator)
        let tabBarItem = TabBarItem(id: .init(), index: 0, tabRootView: AnyView(Color.red), isNavigationRoot: isNavigationRoot)
        let tabBarItems = [tabBarItem]
        
        // When
        tabBarController.setTabBarItems(tabBarItems: tabBarItems)
        let viewControllers = try #require(tabBarController.viewControllers)
        let tabController = try #require(viewControllers.first)
        
        // Then
        switch isNavigationRoot {
        case true:
            #expect(tabController is UINavigationController)
        case false:
            #expect(tabController is UIHostingController<AnyView>)
        }
    }
}
