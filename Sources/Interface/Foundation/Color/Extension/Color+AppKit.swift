#if canImport(AppKit)
import SwiftUI
import AppKit

public extension ColorBox {
    var color: Color {
        if let appearance = NSApplication.shared.effectiveAppearance.bestMatch(from: [.darkAqua, .aqua, .vibrantDark, .vibrantLight]) {
            if [.darkAqua, .vibrantDark].contains(appearance) {
                dark
            } else {
                light
            }
        } else {
            light
        }
    }
}
#endif
