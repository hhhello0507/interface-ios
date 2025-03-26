import SwiftUI

public extension Color {
    init(_ hex: UInt, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

public extension View {
    func strokeBorder(_ cornerRadius: CGFloat = 0, content: Color, lineWidth: CGFloat = 1) -> some View {
        self
            .clipShape(.rect(cornerRadius: cornerRadius))
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(content, lineWidth: lineWidth)
            }
    }
}
