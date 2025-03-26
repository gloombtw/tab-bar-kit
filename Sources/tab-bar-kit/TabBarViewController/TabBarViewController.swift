//
//  TabBarViewController.swift
//  tab-bar-kit
//
//  Created by Dustin Sapp on 3/15/25.
//

import Combine
import Foundation
import UIKit
import SwiftUI

/// A `UITabBarController` that hosts `SwiftUI` views for the tab bar and tab bar items
public final class TabBarViewController<T: TabBarCoordinating, I: TabBarItemProtocol>: UITabBarController, TabBarController where T.CoordinatorValue == Int {

    /// The coordinator that handles the index changing events between the `SwiftUI` view  and the tab bar controller
    internal let coordinator: T

    /// The view controller for the tab bar
    internal var tabBarViewController: UIViewController
    
    internal var bag: [AnyCancellable] = []
    
    internal let tabBarItems: [I]
    
    /// Creates a `TabBarViewController` instance from the specified parameters
    ///
    ///  - Parameters:
    ///     - coordinator: The coordinator that handles the index changing events between the `SwiftUI` view  and the tab bar controller
    public init(coordinator: T, tabBarView: AnyView, tabBarItems: [I]) {
        self.coordinator = coordinator
        self.tabBarViewController = UIHostingController(rootView: tabBarView)
        self.tabBarItems = tabBarItems
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        guard let childView = tabBarViewController.view else {
            return
        }

        tabBar.isHidden = true
        childView.backgroundColor = .clear
        childView.translatesAutoresizingMaskIntoConstraints = false
        addChild(tabBarViewController)
        tabBarViewController.didMove(toParent: self)
        view.addSubview(childView)
        setupConstraints(for: childView)
        subscribeToCoordinator()
        setupTabBarItems()
    }

    private func setupTabBarItems() {
        viewControllers = tabBarItems.map {
            if $0.isNavigationRoot {
                return UINavigationController(rootViewController: UIHostingController(rootView: $0.tabRootView))
            }
            return UIHostingController(rootView: $0.tabRootView)
        }
    }

    // - MARK: Private Functions

    private func setupConstraints(for view: UIView) {
        let constraints = [
            view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40),
            view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

    private func subscribeToCoordinator() {
        coordinator.selectedTabChangedPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] index in
                self?.selectedIndex = index
            }
            .store(in: &bag)
    }
}
