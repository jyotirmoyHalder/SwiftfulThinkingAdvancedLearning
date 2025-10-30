//
//  AppTabBarView2.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 30/10/25.
//

import SwiftUI

struct AppTabBarSecondView: View {
    
    @State private var selectedTab: TabBarItem2 = .favorite
    
    var body: some View {
        CustomTabBarContainer2(selectedTab: $selectedTab) {
            Color.red
                .tabBarItem2(tab: .home, selectedTab: $selectedTab)
            
            Color.blue
                .tabBarItem2(tab: .message, selectedTab: $selectedTab)
            
            Color.orange
                .tabBarItem2(tab: .profile, selectedTab: $selectedTab)
            
            Color.pink
                .tabBarItem2(tab: .favorite, selectedTab: $selectedTab)

        }
    }
}

#Preview {
    AppTabBarSecondView()
}
