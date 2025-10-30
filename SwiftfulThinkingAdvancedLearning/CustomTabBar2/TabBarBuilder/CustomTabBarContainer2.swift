//
//  CustomTabBarContainer2.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 30/10/25.
//

import SwiftUI

struct CustomTabBarContainer2<Content: View>: View {
    
    @State private var tabs: [TabBarItem2] = []
    @Binding var selectedTab: TabBarItem2
    let content: Content
    
    init(selectedTab: Binding<TabBarItem2>,@ViewBuilder content: () -> Content) {
        self._selectedTab = selectedTab
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            
            CustomTabBarView2(tabs: tabs, selectedTab: $selectedTab)
        }
        .onPreferenceChange(CustomBarItemPreferenceKey2.self) { newValue in
            tabs = newValue
        }
    }
}

#Preview {
    
    let tabs: [TabBarItem2] = [.home, .favorite, .message]

    CustomTabBarContainer2(selectedTab: .constant(tabs.first!), content: {
        Color.red
    })
}
