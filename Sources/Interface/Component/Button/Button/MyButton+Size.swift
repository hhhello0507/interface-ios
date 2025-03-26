import SwiftUI

public extension MyButton {
    enum Size: Hashable, CaseIterable {
        case large
        case medium
        case small
        
        var properties: Self.Properties {
            switch self {
            case .large:
                    .init(
                        horizontalPadding: 24,
                        spacing: 6,
                        height: 46,
                        font: .bodyM,
                        cornerRadius: 10,
                        iconSize: 20
                    )
            case .medium:
                    .init(
                        horizontalPadding: 20,
                        spacing: 5,
                        height: 36,
                        font: .labelM,
                        cornerRadius: 8,
                        iconSize: 16
                    )
            case .small:
                    .init(
                        horizontalPadding: 16,
                        spacing: 4,
                        height: 32,
                        font: .captionM,
                        cornerRadius: 6,
                        iconSize: 14
                    )
            }
        }
    }
}

extension MyButton.Size {
    struct Properties {
        let horizontalPadding: CGFloat
        let spacing: CGFloat
        let height: CGFloat
        let font: MyFont
        let cornerRadius: CGFloat
        let iconSize: CGFloat
    }
}
