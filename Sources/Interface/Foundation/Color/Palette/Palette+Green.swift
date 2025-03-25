import SwiftUI

public extension Palette {
    enum Green: CaseIterable, PaletteProtocol {
        case green99
        case green95
        case green90
        case green80
        case green70
        case green60
        case green50
        case green40
        case green30
        case green20
        case green10
        
        public var color: Color {
            switch self {
            case .green99: Color(0xFBFEFB)
            case .green95: Color(0xE8FCEA)
            case .green90: Color(0xD2F9D6)
            case .green80: Color(0xA6F2AD)
            case .green70: Color(0x79EC85)
            case .green60: Color(0x4DE55C)
            case .green50: Color(0x20DF33)
            case .green40: Color(0x0FBD21)
            case .green30: Color(0x0B8E18)
            case .green20: Color(0x085E10)
            case .green10: Color(0x042F08)
            }
        }
    }
}
