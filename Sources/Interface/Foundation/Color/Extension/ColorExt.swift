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

public extension Text {
    func foreground(_ color: Colorable) -> Text {
        self.foregroundColor(color.box.color)
    }
}

public extension View {
    func foreground(_ color: Colorable) -> some View {
        self.foregroundStyle(color.box.color)
    }
    
    func background(_ color: Colorable) -> some View {
        self.background(color.box.color)
    }
    
    func tint(_ color: Colorable) -> some View {
        self.tint(color.box.color)
    }
}

public extension Shape {
    func fill(_ color: Colorable) -> some View {
        self.fill(color.box.color)
    }
}
