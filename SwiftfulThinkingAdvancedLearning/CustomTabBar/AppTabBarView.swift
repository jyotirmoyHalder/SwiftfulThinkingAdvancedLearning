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
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
// old version code which has be deprecaed. but we are usingn for this tutrial practice purpose
//        defaultTabView
        
        
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            Color.blue
                .tabBarItem(tab: .favorites, selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: .profile, selection: $tabSelection)
            
            Color.orange
                .tabBarItem(tab: .messages, selection: $tabSelection)
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
