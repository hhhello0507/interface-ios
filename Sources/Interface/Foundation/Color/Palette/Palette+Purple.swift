import SwiftUI

public extension Palette {
    enum Purple: CaseIterable, PaletteProtocol {
        case purple99
        case purple95
        case purple90
        case purple80
        case purple70
        case purple60
        case purple50
        case purple40
        case purple30
        case purple20
        case purple10
        
        public var color: Color {
            switch self {
            case .purple99: Color(0xFCFAFF)
            case .purple95: Color(0xF1E6FE)
            case .purple90: Color(0xE3CDFE)
            case .purple80: Color(0xC79CFC)
            case .purple70: Color(0xAB6AFB)
            case .purple60: Color(0x8F38FA)
            case .purple50: Color(0x7306F9)
            case .purple40: Color(0x5C05C7)
            case .purple30: Color(0x450495)
            case .purple20: Color(0x2E0363)
            case .purple10: Color(0x170132)
            }
        }
    }
}
