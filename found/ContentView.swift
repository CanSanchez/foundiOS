import SwiftUI

struct ContentView: View {
        
//State for background gradient animation
    @State private var animateGradient = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                //Animating gradient background
                LinearGradient(colors: [.primaryPurple, .secondaryPurple, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                    .onAppear {
                        withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                    }
                VStack {
                    LottieView(animationFileName: "CatBall", loopMode: .loop)
                        .frame(height: 300)
                    NavigationLink(destination: StartedView()) {
                        Text("Get Started")
                    }
                    .buttonStyle(PrimaryButton())
                }
            }
        }
        .accentColor(.white)
    }
}

//Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
