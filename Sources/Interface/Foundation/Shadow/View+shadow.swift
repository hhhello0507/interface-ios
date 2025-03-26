import SwiftUI

public extension View {
    func shadow(_ type: MyShadowType) -> some View {
        self
            .shadow(color: type.color, radius: type.radius, x: type.x, y: type.y)
    }
}
