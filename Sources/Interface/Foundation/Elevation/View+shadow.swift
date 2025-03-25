import SwiftUI

public extension View {
    func shadow(_ ev: MyElevation) -> some View {
        self
            .shadow(color: ev.color.box.color, radius: ev.radius, x: ev.x, y: ev.y)
    }
}
