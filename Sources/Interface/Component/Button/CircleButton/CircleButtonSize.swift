import SwiftUI

public enum CircleButtonSize: CaseIterable {
    case large
    case medium
    case small
    
    var size: CGFloat {
        switch self {
        case .large: 48
        case .medium: 34
        case .small: 24
        }
    }
    
    var iconSize: CGFloat {
        switch self {
        case .large: 22
        case .medium: 20
        case .small: 18
        }
    }
}
