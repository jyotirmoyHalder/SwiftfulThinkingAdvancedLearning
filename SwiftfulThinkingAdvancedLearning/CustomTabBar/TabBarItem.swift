//
//  TabBarItem.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 28/10/25.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case home, profile, favorites, messages
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .profile:
            return "person"
        case .favorites:
            return "heart"
        case .messages:
            return "message"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .profile:
            return "Profile"
        case .favorites:
            return "Favorites"
        case .messages:
            return "Messages"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return Color.blue
        case .profile:
            return Color.orange
        case .favorites:
            return Color.red
        case .messages:
            return Color.pink
        }
    }
}
