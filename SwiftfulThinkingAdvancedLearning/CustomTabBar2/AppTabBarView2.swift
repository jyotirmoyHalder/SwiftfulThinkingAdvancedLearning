//
//  AppTabBarView2.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 29/10/25.
//

import SwiftUI

struct AppTabBarView2: View {
    
    enum Tabs: String {
        case home, favorites, profile, family, search, newspaper, vacations, planning, taken, actions
        
        var customizationID: String {
            "com.jyotirmoyhalder.SwiftfulThinkingAdvancedLearning.\(rawValue)"
        }
    }
    
    @State private var selection: Tabs = .home
    @AppStorage("TabCustomizations")
    private var customization: TabViewCustomization
    
    var body: some View {
//        defaultTabView
        devaultTabView2
    }
    
}

#Preview {
    AppTabBarView2()
}

extension AppTabBarView2 {
    
    
    // new method
    private var devaultTabView2: some View {
        TabView(selection: $selection) {
            Tab("Home", systemImage: "house", value: .home) {
                VStack {
                    Text("Home View")
                    Button("Go Profile") {
                        selection = .profile
                    }
                }
            }
            .customizationID(Tabs.home.customizationID)
            
            Tab("Favorites", systemImage: "heart", value: Tabs.favorites) {
                VStack {
                    Text("Go to Newspaper")
                    Button("Go to Newspaper") {
                        selection = .newspaper
                    }
                }
            }
            .customizationID(Tabs.favorites.customizationID)
            
            Tab("Profile", systemImage: "person", value: .profile) {
                VStack {
                    Text("Profile View")
                    Button("Go Home") {
                        selection = .home
                    }
                }
            }
            .tabPlacement(.sidebarOnly)
            .customizationID(Tabs.profile.customizationID)
            
            Tab("Family", systemImage: "figure.and.child.holdinghands", value: Tabs.family) {
                Text("Family View")
            }
            .customizationID(Tabs.family.customizationID)
            
            Tab(value: Tabs.search, role: .search) {
                Text("Search Content")
            }
            .customizationID(Tabs.search.customizationID)
            
            Tab("Newspaper", systemImage: "newspaper", value: .newspaper) {
                Text("Newspaper related content.")
            }
            .tabPlacement(.pinned)
            .customizationID(Tabs.newspaper.customizationID)
            
            TabSection("Vacations") {
                Tab("Planned", systemImage: "airplane", value: Tabs.planning) {
                    Text("Planned Vacations")
                }
                .customizationID(Tabs.planning.customizationID)
                
                Tab("Taken", systemImage: "checklist", value: Tabs.taken) {
                    Text("Taken Vacations")
                }
                .customizationID(Tabs.taken.customizationID)
            }
            .customizationID(Tabs.vacations.customizationID)
            .sectionActions {
                Button("Reset Tabs", systemImage: "arrow.trianglehead.counterclockwise.rotate.90") {
                    customization.resetSectionOrder()
                }
            }
            .customizationID(Tabs.actions.customizationID)
            
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($customization)
        .tabViewSidebarHeader {
            Label("My Stuff", systemImage: "star")
                .font(.title)
                .bold()
                .foregroundStyle(.green)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .tabViewSidebarFooter {
            Text("Enjoy your stuff")
        }
        .tabViewSidebarBottomBar {
            Button {
                
            } label: {
                Image(systemName: "envelope.fill")
                    .padding()
                    .foregroundStyle(.white)
                    .background(Circle().fill(.blue))
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    // old method which has been deprecated in iOS 18
//    private var defaultTabView: some View {
//        TabView(selection: $selection) {
//            Color.red
//                .tabItem {
//                    Image(systemName: "house")
//                    Text("Home")
//                }
//            Color.orange
//                .tabItem {
//                    Image(systemName: "heart")
//                    Text("Favorite")
//                }
//            Color.blue
//                .tabItem {
//                    Image(systemName: "person")
//                    Text("Profile")
//                }
//        }
//    }
    
}
