import SwiftUI

public extension Image {
    static func icon(_ name: Icons) -> Image {
        return Image(name.rawValue, bundle: .module)
    }
}
