import SwiftUI

public extension Palette {
    enum Blue: CaseIterable, PaletteProtocol {
        case blue99
        case blue95
        case blue90
        case blue80
        case blue70
        case blue60
        case blue50
        case blue40
        case blue30
        case blue20
        case blue10
        
        public var color: Color {
            switch self {
            case .blue99: Color(0xFAFDFF)
            case .blue95: Color(0xE5F3FF)
            case .blue90: Color(0xCCE8FF)
            case .blue80: Color(0x99D1FF)
            case .blue70: Color(0x66B9FF)
            case .blue60: Color(0x33A2FF)
            case .blue50: Color(0x008BFF)
            case .blue40: Color(0x006FCC)
            case .blue30: Color(0x005399)
            case .blue20: Color(0x003866)
            case .blue10: Color(0x001C33)
            }
        }
    }
}
