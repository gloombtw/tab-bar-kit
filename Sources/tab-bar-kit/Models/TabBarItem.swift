//
//  File.swift
//  tab-bar-kit
//
//  Created by Dustin Sapp on 3/15/25.
//

import Foundation
import SwiftUI

public struct TabBarItem: TabBarItemProtocol {

    public let id: UUID

    public let index: Int

    public let tabRootView: AnyView
    
    public let isNavigationRoot: Bool
}
