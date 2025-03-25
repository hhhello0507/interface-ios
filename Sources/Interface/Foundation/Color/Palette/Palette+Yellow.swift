import SwiftUI

public extension Palette {
    enum Yellow: CaseIterable, PaletteProtocol {
        case yellow99
        case yellow95
        case yellow90
        case yellow80
        case yellow70
        case yellow60
        case yellow50
        case yellow40
        case yellow30
        case yellow20
        case yellow10
        
        public var color: Color {
            switch self {
            case .yellow99: Color(0xFFFEFA)
            case .yellow95: Color(0xFFFAE5)
            case .yellow90: Color(0xFFF5CC)
            case .yellow80: Color(0xFFEB99)
            case .yellow70: Color(0xFFE066)
            case .yellow60: Color(0xFFD633)
            case .yellow50: Color(0xFFCC00)
            case .yellow40: Color(0xCCA300)
            case .yellow30: Color(0x997A00)
            case .yellow20: Color(0x665200)
            case .yellow10: Color(0x332900)
            }
        }
    }
}
