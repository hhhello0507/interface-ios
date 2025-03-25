import SwiftUI

public enum CustomPalette {
    public static var primary99 = Palette.Blue.blue99.color
    public static var primary95 = Palette.Blue.blue95.color
    public static var primary90 = Palette.Blue.blue90.color
    public static var primary80 = Palette.Blue.blue80.color
    public static var primary70 = Palette.Blue.blue70.color
    public static var primary60 = Palette.Blue.blue60.color
    public static var primary50 = Palette.Blue.blue50.color
    public static var primary40 = Palette.Blue.blue40.color
    public static var primary30 = Palette.Blue.blue30.color
    public static var primary20 = Palette.Blue.blue20.color
    public static var primary10 = Palette.Blue.blue10.color
}

extension CustomPalette {
    public final class Provider: ObservableObject {
        @Published var update: Bool = false
        
        public init() {}
        
        public func updateColor(
            pallete: Palette
        ) {
            guard pallete.hasSaturation else { return }
            let colors = pallete.allCases
            CustomPalette.primary99 = colors[0].color
            CustomPalette.primary95 = colors[1].color
            CustomPalette.primary90 = colors[2].color
            CustomPalette.primary80 = colors[3].color
            CustomPalette.primary70 = colors[4].color
            CustomPalette.primary60 = colors[5].color
            CustomPalette.primary50 = colors[6].color
            CustomPalette.primary40 = colors[7].color
            CustomPalette.primary30 = colors[8].color
            CustomPalette.primary20 = colors[9].color
            CustomPalette.primary10 = colors[10].color
            update.toggle()
        }
        
        public func updateColor(
            primary99: PaletteProtocol? = nil,
            primary95: PaletteProtocol? = nil,
            primary90: PaletteProtocol? = nil,
            primary80: PaletteProtocol? = nil,
            primary70: PaletteProtocol? = nil,
            primary60: PaletteProtocol? = nil,
            primary50: PaletteProtocol? = nil,
            primary40: PaletteProtocol? = nil,
            primary30: PaletteProtocol? = nil,
            primary20: PaletteProtocol? = nil,
            primary10: PaletteProtocol? = nil
        ) {
            if let primary99 {
                CustomPalette.primary99 = primary99.color
            }
            if let primary95 {
                CustomPalette.primary95 = primary95.color
            }
            if let primary90 {
                CustomPalette.primary90 = primary90.color
            }
            if let primary80 {
                CustomPalette.primary80 = primary80.color
            }
            if let primary70 {
                CustomPalette.primary70 = primary70.color
            }
            if let primary60 {
                CustomPalette.primary60 = primary60.color
            }
            if let primary50 {
                CustomPalette.primary50 = primary50.color
            }
            if let primary40 {
                CustomPalette.primary40 = primary40.color
            }
            if let primary30 {
                CustomPalette.primary30 = primary30.color
            }
            if let primary20 {
                CustomPalette.primary20 = primary20.color
            }
            if let primary10 {
                CustomPalette.primary10 = primary10.color
            }
            update.toggle()
        }
    }
    
    public struct Presenter<C: View>: View {
        @ObservedObject private var provider: Provider
        @State private var update: Bool = false
        
        private let content: () -> C
        
        public init(
            provider: Provider,
            content: @escaping () -> C
        ) {
            self._provider = ObservedObject(wrappedValue: provider)
            self.content = content
        }
        
        public var body: some View {
            content()
                .id(update)
                .environmentObject(provider)
        }
    }
}

@available(iOS 17.0, macOS 14.0, *)
#Preview {
    @Previewable @StateObject var provider = CustomPalette.Provider()
    
    let colors: [[Color]] = [
        [
            CustomPalette.primary99,
            CustomPalette.primary95,
            CustomPalette.primary90,
            CustomPalette.primary80,
            CustomPalette.primary70,
            CustomPalette.primary60,
            CustomPalette.primary50,
            CustomPalette.primary40,
            CustomPalette.primary30,
            CustomPalette.primary20,
            CustomPalette.primary10
        ]
    ]
    
    return (
        CustomPalette.Presenter(provider: provider) {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(colors.indices, id: \.self) { index in
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                ForEach(colors[index], id: \.self) {
                                    $0.frame(width: 40, height: 60)
                                        .padding(.vertical, 8)
                                }
                            }
                        }
                    }
                    Button("Change 1") {
                        provider.updateColor(
                            primary99: Palette.Orange.orange99,
                            primary95: Palette.Orange.orange95,
                            primary90: Palette.Orange.orange90,
                            primary80: Palette.Orange.orange80,
                            primary70: Palette.Orange.orange70,
                            primary60: Palette.Orange.orange60,
                            primary50: Palette.Orange.orange50,
                            primary40: Palette.Orange.orange40,
                            primary30: Palette.Orange.orange30,
                            primary20: Palette.Orange.orange20,
                            primary10: Palette.Orange.orange10
                        )
                    }
                    Button("Change 2") {
                        provider.updateColor(pallete: .green)
                    }
                }
            }
        }
    )
}
