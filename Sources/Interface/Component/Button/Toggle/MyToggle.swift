import SwiftUI

public struct MyToggle: View {
    @Binding var isOn: Bool
    
    public init(
        isOn: Binding<Bool>
    ) {
        self._isOn = isOn
    }
    
    public var body: some View {
        Toggle("", isOn: $isOn)
            .tint(
                isOn
                ? .primary(.normal)
                : .fill(.alternative)
            )
            .fixedSize()
    }
}

private struct TogglePreview: View {
    var body: some View {
        VStack {
            MyToggle(isOn: .constant(true))
            MyToggle(isOn: .constant(false))
        }
    }
}

#Preview {
    TogglePreview()
}

#Preview {
    TogglePreview()
        .preferredColorScheme(.dark)
}
