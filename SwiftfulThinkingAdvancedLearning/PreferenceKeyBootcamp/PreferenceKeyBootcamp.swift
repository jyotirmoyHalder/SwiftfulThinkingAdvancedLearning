//
//  PreferenceKeyBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 27/10/25.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    
    @State private var text: String = "Hello, World!"
    
    var body: some View {
        NavigationView {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("Navigation Title")
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            self.text = value
        }
    }
}

extension View {
    func customTitle(_ title: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: title)
    }
}

#Preview {
    PreferenceKeyBootcamp()
}

struct SecondaryScreen: View {
    
    let text: String
    @State private var newValue: String = "what are you doing"
    
    var body: some View {
        Text(text)
//            .onAppear(perform: getDataFromDatabase)
//            .onTapGesture {
//                newValue = "some new value"
//            }
            .customTitle(newValue)
    }
    
    func getDataFromDatabase() {
        // download
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.newValue = "new value from database"
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
struct CustomBoolPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}
