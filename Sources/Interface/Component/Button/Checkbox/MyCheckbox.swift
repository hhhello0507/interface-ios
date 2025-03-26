import SwiftUI

public struct MyCheckbox: View {
    
    @Binding private var isOn: Bool
    private let isEnabled: Bool
    
    public init(
        isOn: Binding<Bool>,
        isEnabled: Bool = true
    ) {
        self._isOn = isOn
        self.isEnabled = isEnabled
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
                                    .cornerRadius(4)
                                    .opacity(isEnabled ? 1 : 0.5)
                            }
                        }
                } else {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.clear)
                        .strokeBorder(4, content: .line(.normal), lineWidth: 2)
                        .frame(width: 16, height: 16)
                        .opacity(isEnabled ? 1 : 0.5)
                }
            }
            .padding(3)
        }
        .scaledButton()
        .frame(width: 40, height: 40)
        .disabled(!isEnabled)
    }
}

#Preview {
    struct CheckboxPreview: View {
        @State var isChecked: Bool = true
        
        var body: some View {
            VStack(spacing: 20) {
                MyCheckbox(isOn: $isChecked)
                MyCheckbox(isOn: $isChecked, isEnabled: false)
            }
            .padding(16)
            .background(.background(.normal))
            .registerWanted()
        }
    }
    return CheckboxPreview()
}
