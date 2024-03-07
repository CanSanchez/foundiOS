//
//  ContentView.swift
//  found
//
//  Created by Can Sanchez on 2024-02-28.
//

import SwiftUI

struct ContentView: View {
        
    @State private var animateGradient = false
    @State private var isStarted = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.primaryPurple, .secondaryPurple, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
                }
            if !isStarted {
                VStack {
                    LottieView(animationFileName: "CatBall", loopMode: .loop)
                        .frame(height: 300)
                    
                    Button {
                        isStarted.toggle()
                    } label: {
                        HStack {
                            Text("Get Started")
                                .font(.headline)
                        }
                        .fixedSize()
                        .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(.primaryPurple)
                    .shadow(radius: 7, x: 1, y: 3)
                }
            } else {
                VStack {
                    Text("Tell us what happened?")
                    Button {
                        print("test")
                    } label: {
                        HStack {
                            Text("I lost a pet")
                                .font(.headline)
                        }
                        .fixedSize()
                        .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(.primaryPurple)
                    .shadow(radius: 7, x: 1, y: 3)
                    Button {
                        print("test")
                    } label: {
                        HStack {
                            Text("I found a pet")
                                .font(.headline)
                        }
                        .fixedSize()
                        .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(.primaryPurple)
                    .shadow(radius: 7, x: 1, y: 3)
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
