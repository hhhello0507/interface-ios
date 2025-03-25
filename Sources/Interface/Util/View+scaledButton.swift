import SwiftUI

struct MyAnimationButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .addPressAnimation(configuration.isPressed)
    }
}

extension View {
    func addPressAnimation(_ isPressed: Bool) -> some View {
        self
            .opacity(isPressed ? 0.64 : 1)
            .scaleEffect(isPressed ? 0.97 : 1)
            .animation(.timingCurve(0.11, 0.9, 0.265, 0.945, duration: 0.3), value: isPressed)
            .disabled(isPressed)
    }
    
    func scaledButton() -> some View {
        self
            .buttonStyle(MyAnimationButton())
    }
}
