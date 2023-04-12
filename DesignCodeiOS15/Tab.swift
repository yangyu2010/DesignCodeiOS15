//
//  Tab.swift
//  DesignCodeiOS15
//
//  Created by Yu Yang on 4/12/23.
//

import SwiftUI

struct Tab: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
}

var tabItems = [
    Tab(text: "Learn Now", icon: "house"),
    Tab(text: "Explore", icon: "magnifyingglass"),
    Tab(text: "Notifications", icon: "bell"),
    Tab(text: "Library", icon: "rectangle.stack")
]
