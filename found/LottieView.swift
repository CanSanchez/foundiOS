//
//  LottieView.swift
//  found
//
//  Created by Can Sanchez on 2024-03-06.
//

import Foundation
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    var animationFileName: String
    let loopMode: LottieLoopMode
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: animationFileName)
        print(animationFileName)
        animationView.loopMode = loopMode
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: LottieAnimationView, context: Context) -> CGSize? {
        return proposal.replacingUnspecifiedDimensions()
    }
}
