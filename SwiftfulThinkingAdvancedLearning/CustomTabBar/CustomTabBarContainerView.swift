//
//  CustomTabBarContainerView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 27/10/25.
//

import SwiftUI
//
//struct TabView2<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {
//    
//}
//
//struct TabView3<SelectionValue: Hashable, Content: View> : View {
//    
//}

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
            }
            CustomTabBarView(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { newValue in
            self.tabs = newValue
        }
    }
}

#Preview {
    
    let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: Color.red),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.blue),
        TabBarItem(iconName: "person", title: "Profile", color: Color.green),
    ]
    
    CustomTabBarContainerView(selection: .constant(tabs.first!)) {
        Color.red
    }
}
