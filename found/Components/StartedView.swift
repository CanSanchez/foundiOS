//
//  StartedView.swift
//  found
//
//  Created by Can Sanchez on 2024-04-19.
//

import Foundation
import SwiftUI

//View for the list of found and lost pets data
struct StartedView: View {
    //State for background gradient animation
        @State private var animateGradient = false
    //State for "Get Started" to navigate to reporting page
        @State private var isStarted = false
    //State to go to Lost Form View
        @State private var isReportingLost = false
    //State to go to Found Form View
        @State private var isReportingFound = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(colors: [.primaryPurple, .secondaryPurple, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                    .onAppear {
                        withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                    }
                VStack (spacing: 10) {
                    LottieView(animationFileName: "BlackCat", loopMode: .loop)
                        .frame(height: 300)
                    Text("Tell us what happened?")
                    NavigationLink(destination: LostFormView()) {
                        Text("I lost a pet")
                    }
                    .buttonStyle(PrimaryButton())
                    // Button to go to Found Form View
                    NavigationLink(destination: LostFormView()) {
                        Text("I found a pet")
                    }
                    .buttonStyle(PrimaryButton())
                    // Navigation Link to go to Home View
                    NavigationLink(destination: HomeView()) {
                        Text("Skip to Home")
                            .underline()
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        }
        .accentColor(.white)
    }
}

//Preview
struct StartedView_Previews: PreviewProvider {
    static var previews: some View {
        StartedView()
            .environmentObject(Network())
    }
}
