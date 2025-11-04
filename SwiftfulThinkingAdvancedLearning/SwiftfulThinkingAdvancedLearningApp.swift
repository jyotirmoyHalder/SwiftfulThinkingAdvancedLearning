//
//  SwiftfulThinkingAdvancedLearningApp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 23/10/25.
//

import SwiftUI

@main
struct SwiftfulThinkingAdvancedLearningApp: App {
//    @State private var store = Store() // need to add for working apptabBarView
    
    let currentUserIsSignedIn: Bool
    
    init() {
//        let userIsSignedIn: Bool = CommandLine.arguments.contains("-UITest_startSignedIn") ? true : false
        let userIsSignedIn: Bool = ProcessInfo.processInfo.arguments.contains("-UITest_startSignedIn") ? true : false
//        let value = ProcessInfo.processInfo.environment["-UITest_startSignedIn2"]
//        let userIsSignedIn: Bool = value == "true" ? true : false
        self.currentUserIsSignedIn = userIsSignedIn
    }
    
    var body: some Scene {
        WindowGroup {
//            AnyTransitionBootcamp()
            
//            AppTabBarView2()
//            .environment(store)

//            DragAndDropWithTransferable()
            
//            ReorderAList()
            
            UITestingBootcampView(currentUserIsSignedIn: currentUserIsSignedIn)
        }
    }
}
