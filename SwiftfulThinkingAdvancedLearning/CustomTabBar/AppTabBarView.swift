//
//  AppTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 27/10/25.
//

import SwiftUI

// Generics
// ViewBuilder
// PreferenceKey
// MatchedGeometryEffect

struct AppTabBarView: View {
    
    @State private var selection: String = "Home"
    @State private var tabSelection: TabBarItem = TabBarItem(iconName: "house", title: "Home", color: Color.red)
    
    var body: some View {
// old version code which has be deprecaed. but we are usingn for this tutrial practice purpose
//        defaultTabView
        
        
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
                .tabBarItem(tab: TabBarItem(iconName: "house", title: "Home", color: Color.red), selection: $tabSelection)
            
            Color.blue
                .tabBarItem(tab: TabBarItem(iconName: "heart", title: "Favorites", color: Color.blue), selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: TabBarItem(iconName: "person", title: "Profile", color: Color.green), selection: $tabSelection)
        }
        
        // new version code
//        TabView {
//            Tab("Home", systemImage: "house") {
//                Color.red
//            }
////            .customizationID("com.myApp.home")
//            
//            Tab("Favorites", systemImage: "heart") {
//                Color.blue
//            }
//
//            TabSection("Categories") {
//                Tab("Climate", systemImage: "fan") {
//                    Color.pink
//                }
//                Tab("Profile", systemImage: "person") {
//                    Color.orange
//                }
//            }
//        }
    }
}

#Preview {
    AppTabBarView()
}

extension AppTabBarView {
    private var defaultTabView: some View {
        TabView(selection: $selection) {
           Color.red
               .tabItem {
                   Image(systemName: "house")
                   Text("Home")
               }
           Color.blue
               .tabItem {
                   Image(systemName: "heart")
                   Text("Favorites")
               }
           Color.orange
               .tabItem {
                   Image(systemName: "person")
                   Text("Profile")
               }
       }
    }
           
}
