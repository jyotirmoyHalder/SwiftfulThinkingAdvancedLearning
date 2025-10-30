//
//  CustomTabBarItem2.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 30/10/25.
//

import SwiftUI

enum TabBarItem2:String , Hashable{
    case home = "Home"
    case profile = "Profile"
    case favorite = "Favorite"
    case message = "Message"
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .profile:
            return "person.circle"
        case .favorite:
            return "heart"
        case .message:
            return "envelope"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return .blue
        case .profile:
            return .green
        case .favorite:
            return .red
        case .message:
            return .yellow
        }
    }
}
