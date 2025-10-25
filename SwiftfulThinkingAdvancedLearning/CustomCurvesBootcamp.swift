//
//  CustomCurvesBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 25/10/25.
//

import SwiftUI

struct CustomCurvesBootcamp: View {
    var body: some View {
        WaterShape()
            .fill(
                LinearGradient(
                    colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
//            .stroke(lineWidth: 5)
//            .frame(width: 200, height: 200)
            .ignoresSafeArea()
        
    }
}

#Preview {
    CustomCurvesBootcamp()
}

struct ArcSample: Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path
                .addArc(
                    center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.height / 2,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 40),
                    clockwise: true
                )
        }
    }
}

struct ShapeWithArc: Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            // top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            // mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            // bottom
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.height / 2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: false)
            
            // mid left
//            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            
            // top left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }
    }
}

struct QuadSample: Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path
                .addQuadCurve(
                    to: CGPoint(x: rect.midX, y: rect.midY),
                    control: CGPoint(x: rect.maxX, y: rect.minY)
                )
            path.addQuadCurve(to: .zero, control: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct WaterShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            
            path
                .addQuadCurve(
                    to: CGPoint(x: rect.midX, y: rect.midY),
                    control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.40)
                )
            
            path
                .addQuadCurve(
                    to: CGPoint(x: rect.maxX, y: rect.midY),
                    control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.60)
                )
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}
