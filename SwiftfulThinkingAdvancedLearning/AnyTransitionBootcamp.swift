//
//  AnyTransitionBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 25/10/25.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
        
    var rotation: Double
    let screenSize: CGSize
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? screenSize.width : 0,
                y: rotation != 0 ? screenSize.height : 0)
    }
    
//    private var currentScreen: UIScreen {
//        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen  ?? .main
//    }
}

extension AnyTransition {
    
//    static var rotating : AnyTransition {
//        return AnyTransition.modifier(
//            active: RotateViewModifier(rotation: 180, screenSize: screenSize),
//            identity: RotateViewModifier(rotation: 0, screenSize: screenSize))
//    }
    
    static func rotating(screenSize: CGSize) -> AnyTransition {
        AnyTransition.modifier(
            active: RotateViewModifier(rotation: 180, screenSize: screenSize),
            identity: RotateViewModifier(rotation: 0, screenSize: screenSize))
    }
    
    static func rotatteOn(screenSize: CGSize) -> AnyTransition {
        AnyTransition.asymmetric(
            insertion: .rotating(screenSize: screenSize),
            removal: .move(edge: .leading))
    }
}

struct AnyTransitionBootcamp: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                
                if showRectangle {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 250, height: 350)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
    //                    .modifier(RotateViewModifier(rotation: 30))
    //                    .transition(.move(edge: .leading))
//                        .transition(AnyTransition.rotating.animation(.easeInOut))
//                        .transition(.rotating(screenSize: proxy.size))
                        .transition(.rotatteOn(screenSize: proxy.size))
                }
                
                Spacer()
                
                Text("Click Me!")
                    .withDefaultButtonFormatting()
                    .padding(.horizontal, 40)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            showRectangle.toggle()
                        }
                    }
            }
        }
    }
}

#Preview {
    AnyTransitionBootcamp()
}
