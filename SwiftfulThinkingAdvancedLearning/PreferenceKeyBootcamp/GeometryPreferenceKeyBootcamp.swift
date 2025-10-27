//
//  GeometryPreferenceKeyBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 27/10/25.
//

import SwiftUI

struct GeometryPreferenceKeyBootcamp: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
                .padding()
            
            Spacer()
            
            HStack {
                Rectangle()
                
                GeometryReader { geo in
                    Rectangle()
                        .updateRectangleGeoSize(geo.size)
                }
                
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self) { newSize in
            self.rectSize = newSize
        }
    }
}

#Preview {
    GeometryPreferenceKeyBootcamp()
}

extension View {
    func updateRectangleGeoSize(_ size: CGSize) -> some View {
        preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}

struct RectangleGeometrySizePreferenceKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    
}
