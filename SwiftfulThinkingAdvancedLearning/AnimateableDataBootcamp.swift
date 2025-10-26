//
//  AnimateableDataBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 26/10/25.
//

import SwiftUI

struct AnimateableDataBootcamp: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: animate ? 60 : 0)
//            RectangleWithSingleCornerAnimation(cornerRadius: animate ? 300 : 0)
            Pacman(offsetAmount: animate ? 20 : 0)
//                .stroke(style: StrokeStyle())
                .frame(width: 200, height: 200)
        }
        .onAppear {
            withAnimation(Animation.easeInOut.repeatForever()) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    AnimateableDataBootcamp()
}

struct RectangleWithSingleCornerAnimation: Shape {
    
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
//    nonisolated func path(in rect: CGRect) -> Path {
//        Path { path in
//            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
//            path.addLine(to: CGPoint(x: rect.minX, y: cornerRadius))
////            path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
//
//            path
//                .addArc(
//                    center: CGPoint(
//                        x: cornerRadius,
//                        y: cornerRadius
//                    ),
//                    radius: cornerRadius,
//                    startAngle: Angle(
//                        degrees: 360
//                    ),
//                    endAngle: Angle(
//                        radians: 0
//                    ),
//                    clockwise: false
//                )
//            path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
//            path
//                .addArc(
//                    center: CGPoint(
//                        x: rect.maxX - cornerRadius,
//                        y: rect.maxY - cornerRadius
//                    ),
//                    radius: cornerRadius,
//                    startAngle: Angle(
//                        degrees: 0
//                    ),
//                    endAngle: Angle(
//                        radians: 360
//                    ),
//                    clockwise: false
//                )
//            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
//            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        }
//    }
    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            // Start from bottom-left corner
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: cornerRadius))

            // 🔵 Top-left corner arc
            path.addArc(
                center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(180),
                endAngle: .degrees(270),
                clockwise: false
            )

            // Top edge
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))

            // 🔵 Top-right (or bottom-right depending on layout) corner arc
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(0),
                endAngle: .degrees(90),
                clockwise: false
            )

            // Close the shape
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }

}

struct Pacman: Shape {
    
    var offsetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { offsetAmount }
        set { offsetAmount = newValue }
        
    }
    
    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: offsetAmount),
                endAngle: Angle(degrees: 360 - offsetAmount),
                clockwise: false
            )
        }
    }
}
