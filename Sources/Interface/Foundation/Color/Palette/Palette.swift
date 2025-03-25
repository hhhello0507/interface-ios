import SwiftUI

public protocol PaletteProtocol {
    var color: Color { get }
}

public enum Palette: Int, CaseIterable {
    case neutral
    case red
    case orange
    case yellow
    case green
    case blue
    case purple
    case common
    
    public var hasSaturation: Bool {
        switch self {
        case .neutral, .common:
            false
        default:
            true
        }
    }

    public var allCases: [PaletteProtocol] {
        switch self {
        case .neutral:
            Palette.Neutral.allCases
        case .red:
            Palette.Red.allCases
        case .orange:
            Palette.Orange.allCases
        case .yellow:
            Palette.Yellow.allCases
        case .green:
            Palette.Green.allCases
        case .blue:
            Palette.Blue.allCases
        case .purple:
            Palette.Purple.allCases
        case .common:
            Palette.Common.allCases
        }
    }
}

#Preview {
    let colors = Palette.allCases.map { $0.allCases }
    
    return (
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(colors.indices, id: \.self) { index in
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0) {
                            ForEach(colors[index].indices, id: \.self) { rowIndex in
                                colors[index][rowIndex].color.frame(width: 40, height: 60)
                                    .padding(.vertical, 8)
                            }
                        }
                    }
                }
            }
        }
    )
}
