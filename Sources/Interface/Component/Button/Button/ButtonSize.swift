import SwiftUI

public enum ButtonSize: Hashable, CaseIterable {
    public static var allCases: [ButtonSize] = [
        .larger,
        .large,
        .medium,
        .small
    ]
    
    case larger
    case large
    case medium
    case small
    
    var horizontalPadding: CGFloat {
        switch self {
        case .larger: 24
        case .large: 20
        case .medium: 16
        case .small: 12
        }
    }
    
    var spacing: CGFloat {
        switch self {
        case .larger: 6
        case .large: 5
        case .medium: 4
        case .small: 3
        }
    }
    
    var height: CGFloat {
        switch self {
        case .larger: 56
        case .large: 48
        case .medium: 38
        case .small: 32
        }
    }
    
    var font: MyFont {
        switch self {
        case .larger: .bodyM
        case .large: .bodyM
        case .medium: .labelM
        case .small: .captionM
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .larger: 12
        case .large: 10
        case .medium: 8
        case .small: 6
        }
    }
    
    var iconSize: CGFloat {
        switch self {
        case .larger: 22
        case .large: 20
        case .medium: 18
        case .small: 16
        }
    }
}
