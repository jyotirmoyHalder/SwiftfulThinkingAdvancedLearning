//
//  CustomBarItemPreferenceKey2.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 30/10/25.
//

import SwiftUI

struct CustomBarItemPreferenceKey2: PreferenceKey {
    static var defaultValue: [TabBarItem2] = []
    
    static func reduce(value: inout [TabBarItem2], nextValue: () -> [TabBarItem2]) {
        value += nextValue()
    }
}

struct TabViewModifier2: ViewModifier {
    
    let tab: TabBarItem2
    @Binding var selectedTab: TabBarItem2
    
    func body(content: Content) -> some View {
        content
            .opacity(selectedTab == tab ? 1 : 0)
            .preference(key: CustomBarItemPreferenceKey2.self, value: [tab])
    }
}

extension View {
    func tabBarItem2(tab: TabBarItem2, selectedTab: Binding<TabBarItem2>) -> some View {
        modifier(TabViewModifier2(tab: tab, selectedTab: selectedTab))
    }
}

