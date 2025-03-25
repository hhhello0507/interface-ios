import SwiftUI

public enum MyElevation {
    case evBlack1
    case evBlack2
    case evBlack3
    
    var color: Colorable {
        switch self {
        case .evBlack1: Colors.Elevation.black1
        case .evBlack2: Colors.Elevation.black2
        case .evBlack3: Colors.Elevation.black3
        }
    }
    
    var radius: CGFloat {
        switch self {
        case .evBlack1: 10
        case .evBlack2: 12
        case .evBlack3: 18
        }
    }
    
    var x: CGFloat {
        0
    }
    
    var y: CGFloat {
        switch self {
        case .evBlack1: 3
        case .evBlack2: 4
        case .evBlack3: 6
        }
    }
}
