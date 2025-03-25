#if canImport(UIKit)
import UIKit

public extension Wanted.Weight {
    var weight: UIFont.Weight {
        switch self {
        case .Black: .black
        case .Bold: .bold
        case .ExtraBlack: .black
        case .ExtraBold: .heavy
        case .Medium: .medium
        case .Regular: .regular
        case .SemiBold: .semibold
        }
    }
}
#endif
