//
//  AppNavBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 31/10/25.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.yellow.opacity(0.3).ignoresSafeArea()
                
                CustomNavLink(
                    destination:
                        Text("Destination")
                        .customNavigationTitle("Destination title")
                        .customNavigationSubtitle("subtitle")
                ) {
                    Text("Navigate")
                }
            }
            .customNavBarItems(title: "New Title", subtitle: "Subtitle!!", backbuttonHidden: true)
        }
    }
}

#Preview {
    AppNavBarView()
}

extension AppNavBarView {
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.red.ignoresSafeArea()
                
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigate")
                }
            }
            .navigationTitle("Nav Title Here")
        }
    }
}
