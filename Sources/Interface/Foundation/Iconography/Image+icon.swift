import SwiftUI

public extension Image {
    init(icon: Iconable) {
        self = Image(icon.rawValue, bundle: .module)
    }
}
