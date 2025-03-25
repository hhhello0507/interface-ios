import SwiftUI

public extension Palette {
    enum Neutral: CaseIterable, PaletteProtocol {
        case neutral99
        case neutral97
        case neutral95
        case neutral90
        case neutral80
        case neutral70
        case neutral60
        case neutral50
        case neutral40
        case neutral30
        case neutral25
        case neutral20
        case neutral15
        case neutral10
        case neutral7
        case neutral5
        
        public var color: Color {
            switch self {
            case .neutral99: Color(0xFCFCFD)
            case .neutral97: Color(0xF6F6F7)
            case .neutral95: Color(0xF2F2F3)
            case .neutral90: Color(0xE4E4E5)
            case .neutral80: Color(0xC8C8CC)
            case .neutral70: Color(0xACACB2)
            case .neutral60: Color(0x919199)
            case .neutral50: Color(0x767680)
            case .neutral40: Color(0x5E5E66)
            case .neutral30: Color(0x47474D)
            case .neutral25: Color(0x3B3B40)
            case .neutral20: Color(0x2F2F33)
            case .neutral15: Color(0x252528)
            case .neutral10: Color(0x19191B)
            case .neutral7: Color(0x111113)
            case .neutral5: Color(0x0C0C0D)
            }
        }
    }
}
