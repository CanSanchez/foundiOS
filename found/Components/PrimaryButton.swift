
import Foundation
import SwiftUI

//Component for primary style button
struct PrimaryButton: View {
    
    //variable for button title and click function
    var buttonTitle: String
    var buttonFunction: (() -> Void)
    
    var body: some View {
        Button(action: buttonFunction) {
            HStack {
                Text(buttonTitle)
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

#Preview {
    PrimaryButton(buttonTitle: "Get Started") {
        print("submit")
    }
}

