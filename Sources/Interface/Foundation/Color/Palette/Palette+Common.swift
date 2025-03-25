import SwiftUI

public extension Palette {
    enum Common: CaseIterable, PaletteProtocol {
        case common00
        case common100
        
        public var color: Color {
            switch self {
            case .common00: Color(red: 1, green: 1, blue: 1)
            case .common100: Color(red: 0, green: 0, blue: 0)
            }
        }
    }
}
