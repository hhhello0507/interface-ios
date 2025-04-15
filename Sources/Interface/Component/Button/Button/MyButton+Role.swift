import SwiftUI

public extension MyButton {
    enum Role: Hashable, CaseIterable {
        case primary
        case secondary
        case assistive
        
        var properties: Self.Properties {
            switch self {
            case .primary:
                    .init(
                        foreground: .white,
                        background: .primary(.normal)
                    )
            case .secondary:
                    .init(
                        foreground: .primary(.normal),
                        background: .primary(.assistive)
                    )
            case .assistive:
                    .init(
                        foreground: .label(.neutral),
                        background: .fill(.neutral)
                    )
            }
        }
    }
}

extension MyButton.Role {
    struct Properties {
        let foreground: Color
        let background: Color
    }
}
