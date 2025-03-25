import SwiftUI

public extension Palette {
    enum Orange: CaseIterable, PaletteProtocol {
        case orange99
        case orange95
        case orange90
        case orange80
        case orange70
        case orange60
        case orange50
        case orange40
        case orange30
        case orange20
        case orange10
        
        public var color: Color {
            switch self {
            case .orange99: Color(0xFFFDFA)
            case .orange95: Color(0xFEF5E6)
            case .orange90: Color(0xFEEACD)
            case .orange80: Color(0xFCD69C)
            case .orange70: Color(0xFBC16A)
            case .orange60: Color(0xFAAC38)
            case .orange50: Color(0xF99806)
            case .orange40: Color(0xC77905)
            case .orange30: Color(0x955B04)
            case .orange20: Color(0x633D03)
            case .orange10: Color(0x321E01)
            }
        }
    }
}
