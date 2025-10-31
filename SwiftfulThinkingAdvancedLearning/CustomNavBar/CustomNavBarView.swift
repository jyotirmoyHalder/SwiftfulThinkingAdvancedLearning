//
//  CustomNavBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 31/10/25.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding()
        .tint(.white)
        .foregroundStyle(.white)
        .font(.headline)
        .background(Color.blue.ignoresSafeArea(edges: .top))
    }
}

#Preview {
    VStack {
        CustomNavBarView(showBackButton: true, title: "Title Here", subtitle: "Subtitle Here")
        Spacer()
    }
}


extension CustomNavBarView {
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
}
