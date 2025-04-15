import SwiftUI

public struct MyRadio: View {
    @Environment(\.isEnabled) private var isEnabled
    
    private let selected: Bool
    private let action: () -> Void
    
    public init(
        selected: Bool,
        action: @escaping () -> Void
    ) {
        self.selected = selected
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Circle()
                .strokeBorder(selected ? .primary(.normal) : .line(.normal), lineWidth: selected ? 5 : 2)
                .frame(width: 18, height: 18)
                .foregroundStyle(.clear)
                .padding(3)
                .padding(8)
                .frame(width: 40, height: 40)
        }
        .scaledButton()
        .opacity(isEnabled ? 1 : 0.5)
    }
}

private struct RadioPreview: View {
    @State var isChecked: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            MyRadio(selected: isChecked) {
                isChecked.toggle()
            }
            MyRadio(selected: isChecked) {
                isChecked.toggle()
            }
            .disabled(true)
            MyRadio(selected: false) {
                isChecked.toggle()
            }
        }
        .padding(16)
        .background(.background(.normal))
        .registerWanted()
    }
}

#Preview {
    RadioPreview()
}

#Preview {
    RadioPreview()
        .preferredColorScheme(.dark)
}
