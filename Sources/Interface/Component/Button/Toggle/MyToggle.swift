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
                ? Colors.Primary.normal
                : Colors.Fill.alternative
            )
            .fixedSize()
    }
}

#Preview {
    VStack {
        MyToggle(isOn: .constant(true))
        MyToggle(isOn: .constant(false))
    }
}

#Preview {
    VStack {
        MyToggle(isOn: .constant(true))
        MyToggle(isOn: .constant(false))
    }
    .preferredColorScheme(.dark)
}
