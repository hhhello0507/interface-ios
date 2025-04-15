import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif

private protocol Colorable {
    var box: ColorBox { get }
}

private struct ColorBox {
    public let light: Color
    public let dark: Color
    
    public init(_ light: Color, _ dark: Color) {
        self.light = light
        self.dark = dark
    }
}


private extension Colorable {
    var color: Color {
#if canImport(UIKit)
        Color(UIColor {
            if $0.userInterfaceStyle == .dark {
                UIColor(box.dark)
            } else {
                UIColor(box.light)
            }
        })
#elseif canImport(AppKit)
        if let appearance = NSApplication.shared.effectiveAppearance.bestMatch(from: [.darkAqua, .aqua, .vibrantDark, .vibrantLight]) {
            if [.darkAqua, .vibrantDark].contains(appearance) {
                box.dark
            } else {
                box.light
            }
        } else {
            box.light
        }
#endif
    }
}

public enum Colors {
    private typealias P = Palette
    public enum Label: Colorable, CaseIterable {
        case normal, neutral, alternative, assistive, disable
        fileprivate var box: ColorBox {
            switch self {
            case .normal: ColorBox(P.neutral5, P.neutral99)
            case .neutral: ColorBox(P.neutral25, P.neutral80)
            case .alternative: ColorBox(P.neutral60, P.neutral70)
            case .assistive: ColorBox(P.neutral80, P.neutral50)
            case .disable: ColorBox(P.neutral90, P.neutral30)
            }
        }
    }
    public enum Line: Colorable, CaseIterable {
        case normal, alternative
        fileprivate var box: ColorBox {
            switch self {
            case .normal: ColorBox(P.neutral90, P.neutral25)
            case .alternative: ColorBox(P.neutral95, P.neutral30)
            }
        }
    }
    public enum Fill: Colorable, CaseIterable {
        case normal, neutral, alternative, assistive
        fileprivate var box: ColorBox {
            switch self {
            case .normal: ColorBox(P.neutral97, P.neutral20)
            case .neutral: ColorBox(P.neutral95, P.neutral25)
            case .alternative: ColorBox(P.neutral90, P.neutral30)
            case .assistive: ColorBox(.white, P.neutral40)
            }
        }
    }
    public enum Background: Colorable, CaseIterable {
        case normal, alternative
        fileprivate var box: ColorBox {
            switch self {
            case .normal: ColorBox(.white, P.neutral10)
            case .alternative: ColorBox(P.neutral97, P.neutral5)
            }
        }
    }
    public enum Primary: Colorable, CaseIterable {
        case normal, alternative, assistive
        fileprivate var box: ColorBox {
            switch self {
            case .normal: ColorBox(Palette.blue50, Palette.blue50)
            case .alternative: ColorBox(Palette.blue50.opacity(0.64), Palette.blue50.opacity(0.64))
            case .assistive: ColorBox(Palette.blue50.opacity(0.24), Palette.blue50.opacity(0.2))
            }
        }
    }
}

public extension ShapeStyle where Self == Color {
    static func label(_ color: Colors.Label) -> Color {
        color.color
    }
    
    static func line(_ color: Colors.Line) -> Color {
        color.color
    }
    
    static func fill(_ color: Colors.Fill) -> Color {
        color.color
    }
    
    static func background(_ color: Colors.Background) -> Color {
        color.color
    }
    
    static func primary(_ color: Colors.Primary) -> Color {
        color.color
    }
}

private struct ColorsPreview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("Label")
                ForEach(Colors.Label.allCases, id: \.self) {
                    $0.color.frame(height: 30)
                }
                
                Text("Line")
                ForEach(Colors.Line.allCases, id: \.self) {
                    $0.color.frame(height: 30)
                }
                
                Text("Fill")
                ForEach(Colors.Fill.allCases, id: \.self) {
                    $0.color.frame(height: 30)
                }
                
                Text("Background")
                ForEach(Colors.Background.allCases, id: \.self) {
                    $0.color.frame(height: 30)
                }
                
                Text("Primary")
                ForEach(Colors.Primary.allCases, id: \.self) {
                    $0.color.frame(height: 30)
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
