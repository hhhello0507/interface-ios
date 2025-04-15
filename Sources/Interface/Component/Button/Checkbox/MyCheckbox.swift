import SwiftUI

public struct MyCheckbox: View {
    @Environment(\.isEnabled) private var isEnabled
    @Binding private var isOn: Bool
    
    public init(
        isOn: Binding<Bool>
    ) {
        self._isOn = isOn
    }
    
    public var body: some View {
        Button {
            isOn.toggle()
        } label: {
            Group {
                if isOn {
                    Image.icon(.CheckLine)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 14, height: 14)
                        .foregroundStyle(.white)
                        .padding(2)
                        .background {
                            if isOn {
                                Color.primary(.normal)
                                    .clipShape(.rect(cornerRadius: 4))
                                    .opacity(isEnabled ? 1 : 0.5)
                            }
                        }
                } else {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.clear)
                        .strokeBorder(4, content: .line(.normal), lineWidth: 2)
                        .frame(width: 18, height: 18)
                        .opacity(isEnabled ? 1 : 0.5)
                }
            }
            .padding(3)
            .frame(width: 40, height: 40)
        }
        .scaledButton()
    }
}

private struct CheckboxPreview: View {
    @State var isChecked: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            MyCheckbox(isOn: $isChecked)
            MyCheckbox(isOn: $isChecked).disabled(true)
        }
        .padding(16)
        .background(.background(.normal))
        .registerWanted()
    }
}

#Preview {
    CheckboxPreview()
}

#Preview {
    CheckboxPreview()
        .preferredColorScheme(.dark)
}
