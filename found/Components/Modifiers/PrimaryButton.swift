
import Foundation
import SwiftUI

//Configuration for primary style button
struct PrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fixedSize()
            .padding()
            .background(Color(.primaryPurple))
            .foregroundStyle(.white)
            .font(.headline)
            .clipShape(Capsule())
            .shadow(radius: 7, x: 1, y: 3)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

//Preview
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Button("Press Me") {
                    print("Button pressed!")
                }
                .buttonStyle(PrimaryButton())
    }
}
