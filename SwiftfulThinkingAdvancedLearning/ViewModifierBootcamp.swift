//
//  ViewModifierBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 24/10/25.
//

import SwiftUI


struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
    }
}

extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
    
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, World!")
                .font(.headline)
                .withDefaultButtonFormatting(backgroundColor: .orange)
            
            
            Text("Hello, everyone!")
                .font(.subheadline)
                .withDefaultButtonFormatting()

            
            Text("Hello !!!")
                .font(.title)
                .withDefaultButtonFormatting(backgroundColor: .pink)

        }
        .padding()
    }
}

#Preview {
    ViewModifierBootcamp()
}
