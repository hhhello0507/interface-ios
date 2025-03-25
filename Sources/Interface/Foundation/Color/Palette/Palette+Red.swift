import SwiftUI

public extension Palette {
    enum Red: CaseIterable, PaletteProtocol {
        case red99
        case red95
        case red90
        case red80
        case red70
        case red60
        case red50
        case red40
        case red30
        case red20
        case red10
        
        public var color: Color {
            switch self {
            case .red99: Color(0xFEFBFB)
            case .red95: Color(0xFCE9E9)
            case .red90: Color(0xF9D2D2)
            case .red80: Color(0xF2A6A6)
            case .red70: Color(0xFF6666)
            case .red60: Color(0xEB4747)
            case .red50: Color(0xEE2B2B)
            case .red40: Color(0xBD0F0F)
            case .red30: Color(0x8E0B0B)
            case .red20: Color(0x5E0808)
            case .red10: Color(0x2F0404)
            }
        }
    }
}
