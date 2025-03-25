import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif

public protocol Colorable {
    var box: ColorBox { get }
}

public struct ColorBox {
    public let light: Color
    public let dark: Color
    public init(_ light: PaletteProtocol, _ dark: PaletteProtocol) {
        self.light = light.color
        self.dark = dark.color
    }
    
    public init(_ light: Color, _ dark: Color) {
        self.light = light
        self.dark = dark
    }
}

public enum Colors {
    private typealias P = Palette
    public enum Label: Colorable, CaseIterable {
        case normal, strong, neutral, alternative, assistive, disable
        public var box: ColorBox {
            switch self {
            case .normal: ColorBox(P.Neutral.neutral5, P.Neutral.neutral99)
            case .strong: ColorBox(P.Common.common100, P.Common.common00)
            case .neutral: ColorBox(P.Neutral.neutral25, P.Neutral.neutral95)
            case .alternative: ColorBox(P.Neutral.neutral40, P.Neutral.neutral90)
            case .assistive: ColorBox(P.Neutral.neutral50, P.Neutral.neutral70)
            case .disable: ColorBox(P.Neutral.neutral97, P.Neutral.neutral30)
            }
        }
    }
    public enum Line: Colorable, CaseIterable {
        case normal, neutral, alternative
        public var box: ColorBox {
            switch self {
            case .normal: ColorBox(P.Neutral.neutral90, P.Neutral.neutral50)
            case .neutral: ColorBox(P.Neutral.neutral95, P.Neutral.neutral30)
            case .alternative: ColorBox(P.Neutral.neutral97, P.Neutral.neutral25)
            }
        }
    }
    public enum Fill: Colorable, CaseIterable {
        case normal, neutral, alternative, assistive
        public var box: ColorBox {
            switch self {
            case .normal: ColorBox(P.Neutral.neutral97, P.Neutral.neutral20)
            case .neutral: ColorBox(P.Neutral.neutral95, P.Neutral.neutral25)
            case .alternative: ColorBox(P.Neutral.neutral90, P.Neutral.neutral30)
            case .assistive: ColorBox(P.Common.common00, P.Neutral.neutral60)
            }
        }
    }
    public enum Background: Colorable, CaseIterable {
        case normal, neutral, alternative
        public var box: ColorBox {
            switch self {
            case .normal: ColorBox(P.Common.common00, P.Neutral.neutral15)
            case .neutral: ColorBox(P.Neutral.neutral99, P.Neutral.neutral10)
            case .alternative: ColorBox(P.Neutral.neutral99, P.Neutral.neutral7)
            }
        }
    }
    public enum Elevation: Colorable, CaseIterable {
        case black1, black2, black3
        public var box: ColorBox {
            switch self {
            case .black1: ColorBox(Color.black.opacity(0.02), Color(0xCCCCD6, opacity: 0.02))
            case .black2: ColorBox(Color.black.opacity(0.04), Color(0xCCCCD6, opacity: 0.04))
            case .black3: ColorBox(Color.black.opacity(0.06), Color(0xCCCCD6, opacity: 0.06))
            }
        }
    }
    public enum Static: Colorable, CaseIterable {
        case white, black, clear
        public var box: ColorBox {
            switch self {
            case .white: ColorBox(P.Common.common00, P.Common.common00)
            case .black: ColorBox(P.Common.common100, P.Common.common100)
            case .clear: ColorBox(.clear, .clear)
            }
        }
    }
    public enum Primary: Colorable, CaseIterable {
        case normal, alternative, assistive
        public var box: ColorBox {
            switch self {
            case .normal: ColorBox(CustomPalette.primary50, CustomPalette.primary50)
            case .alternative: ColorBox(CustomPalette.primary50.opacity(0.65), CustomPalette.primary50.opacity(0.65))
            case .assistive: ColorBox(CustomPalette.primary50.opacity(0.2), CustomPalette.primary50.opacity(0.2))
            }
        }
    }
    public enum Status: Colorable, CaseIterable {
        case negative, cautionary, positive
        public var box: ColorBox {
            switch self {
            case .negative: ColorBox(P.Red.red50, P.Red.red50)
            case .cautionary: ColorBox(P.Yellow.yellow50, P.Yellow.yellow50)
            case .positive: ColorBox(P.Green.green50, P.Green.green50)
            }
        }
    }
}

private struct ColorsPreview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(Colors.Label.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
                ForEach(Colors.Line.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
                ForEach(Colors.Fill.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
                ForEach(Colors.Background.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
                ForEach(Colors.Elevation.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
                ForEach(Colors.Static.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
                ForEach(Colors.Primary.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
            }
        }
    }
}

#Preview {
    ColorsPreview()
}

#Preview {
    ColorsPreview()
        .preferredColorScheme(.dark)
}
