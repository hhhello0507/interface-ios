import SwiftUI

public enum MyShadowType {
    case neutral10
    case neutral20
    case neutral30
    
    var color: Color {
        switch self {
        case .neutral10: .black.opacity(0.2)
        case .neutral20: .black.opacity(0.4)
        case .neutral30: .black.opacity(0.6)
        }
    }
    
    var radius: CGFloat {
        switch self {
        case .neutral10: 10
        case .neutral20: 12
        case .neutral30: 18
        }
    }
    
    var x: CGFloat {
        0
    }
    
    var y: CGFloat {
        switch self {
        case .neutral10: 3
        case .neutral20: 4
        case .neutral30: 6
        }
    }
}
