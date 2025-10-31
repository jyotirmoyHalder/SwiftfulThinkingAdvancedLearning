//
//  CustomTabBarView2.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 30/10/25.
//

import SwiftUI

struct CustomTabBarView23: View {
    
    let tabs: [TabBarItem2]
    @State var selectedTab: TabBarItem2
    @State private var localSelection: TabBarItem2 = .message
    @Namespace private var namespace
    
    var body: some View {
        tabBar
            .onChange(of: selectedTab) { _, newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

#Preview {
    
    let tabs: [TabBarItem2] = [.home, .favorite, .message]
    
    VStack {
        Spacer()
        CustomTabBarView23(tabs: tabs, selectedTab: .home)
        Spacer()
    }
}

extension CustomTabBarView23 {
    
    private func tabView2(tab: TabBarItem2) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.rawValue)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundStyle(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.3))
                        .matchedGeometryEffect(id: "tabItemsTab", in: namespace)
                }
            }
        )

    }
    
    private var tabBar: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        )
        .padding()
    }
    
    private func switchToTab(tab: TabBarItem2) {
        selectedTab = tab
    }
}
