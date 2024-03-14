import SwiftUI

struct ContentView: View {
        
//State for background gradient animation
    @State private var animateGradient = false
//State for "Get Started" to navigate to reporting page
    @State private var isStarted = false
//State to go to Lost Form View
    @State private var isReportingLost = false
//State to go to Found Form View
    @State private var isReportingFound = false
    

    var body: some View {
        
        ZStack {
            //Animating gradient background
            LinearGradient(colors: [.primaryPurple, .secondaryPurple, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
                }
            //After index page, choose to report lost or found pets, or skip to home
            if !isStarted {
                VStack {
                    LottieView(animationFileName: "CatBall", loopMode: .loop)
                        .frame(height: 300)
                    PrimaryButton(buttonTitle: "Get Started") {
                        isStarted.toggle()
                    }
                }
            } else {
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
                            // Button to go to Lost Form View
                            PrimaryButton(buttonTitle: "I lost a pet") {
                                isReportingLost.toggle()
                            }
                                .navigationDestination(isPresented: $isReportingLost, destination: {LostFormView()})
                            // Button to go to Found Form View
                            PrimaryButton(buttonTitle: "I found a pet") {
                                isReportingFound.toggle()
                            }
                                .navigationDestination(isPresented: $isReportingFound, destination: {LostFormView()})
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
    }
}

//Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
