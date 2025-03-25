#if canImport(UIKit)
import SwiftUI
import UIKit

public extension ColorBox {
    var color: Color {
        Color(UIColor {
            if $0.userInterfaceStyle == .dark {
                UIColor(dark)
            } else {
                UIColor(light)
            }
        })
    }
}
#endif
