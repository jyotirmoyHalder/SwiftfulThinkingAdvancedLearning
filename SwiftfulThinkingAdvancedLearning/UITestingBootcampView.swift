//
//  UITestingBootcampView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 4/11/25.
//

import SwiftUI

class UITestingBootcampViewModel: ObservableObject {
    
    let placeholderText: String = "Add name here..."
    @Published var texFieldText: String = ""
    @Published var currentuserIsSignedIn: Bool = false
    
    func signUpButtonPressed() {
        guard !texFieldText.isEmpty else { return }
        currentuserIsSignedIn = true
    }
}

struct UITestingBootcampView: View {
    
    @StateObject private var vm = UITestingBootcampViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.black]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ZStack {
                if vm.currentuserIsSignedIn {
                    SignedInHomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .trailing))
                }
                
                if !vm.currentuserIsSignedIn {
                    signUpLayer
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
            }
        }
    }
}

#Preview {
    UITestingBootcampView()
}

extension UITestingBootcampView {
    private var signUpLayer: some View {
        VStack {
            TextField(vm.placeholderText, text: $vm.texFieldText)
                .font(.headline)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .accessibilityIdentifier("SignUpTextField")
            
            Button {
                vm.signUpButtonPressed()
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
            }
            .accessibilityIdentifier("SignUpButton")
        }
        .padding()
    }
}


struct SignedInHomeView: View {
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Button {
                    showAlert.toggle()
                } label: {
                    Text("Show welcome alert!")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
                }
                .accessibilityIdentifier("ShowAlertButton")
                .alert("Welcome!", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                        .accessibilityIdentifier("AlertDismissOkButton")
                } message: {
                    Text("Glad to have you here 🎉")
                }
                
                NavigationLink(destination: Text("Destination")) {
                    Text("Navigate")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                }
                .accessibilityIdentifier("NavigationLinkToDestination")
            }
            .padding()
            .navigationTitle("Welcome!")
        }
    }
}
