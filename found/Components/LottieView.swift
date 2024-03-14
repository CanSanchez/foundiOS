import Foundation
import SwiftUI
import Lottie

//View for lottie animations
struct LottieView: UIViewRepresentable {
    
    //file name to be passed from assets
    var animationFileName: String
    let loopMode: LottieLoopMode
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: animationFileName)
        animationView.loopMode = loopMode
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: LottieAnimationView, context: Context) -> CGSize? {
        return proposal.replacingUnspecifiedDimensions()
    }
}
