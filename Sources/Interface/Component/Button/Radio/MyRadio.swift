import SwiftUI

public struct MyRadio: View {
    
    private let selected: Bool
    private let isEnabled: Bool
    private let action: () -> Void
    
    public init(
        selected: Bool,
        isEnabled: Bool = true,
        action: @escaping () -> Void
    ) {
        self.selected = selected
        self.isEnabled = isEnabled
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            Group {
                if selected {
                    Circle()
                        .frame(width: 10.5, height: 10.5)
                        .stroke(5.25, content: Colors.Primary.normal.box.color, lineWidth: 5)
                        .foregroundStyle(.clear)
                } else {
                    Circle()
                        .frame(width: 14, height: 14)
                        .stroke(7, content: Colors.Line.normal.box.color, lineWidth: 2)
                        .foregroundStyle(.clear)
                }
            }
            .padding(3)
        }
        .scaledButton()
        .frame(width: 40, height: 40)
        .disabled(!isEnabled)
        .opacity(selected ? 1 : 0.5)
    }
}

#Preview {
    struct RadioPreview: View {
        @State var isChecked: Bool = true
        
        var body: some View {
            VStack(spacing: 20) {
                MyRadio(selected: isChecked) {
                    isChecked.toggle()
                }
                MyRadio(selected: isChecked, isEnabled: false) {
                    isChecked.toggle()
                }
                MyRadio(selected: false) {
                    isChecked.toggle()
                }
            }
            .padding(16)
            .background(Colors.Background.normal)
            .registerWanted()
        }
    }
    return RadioPreview()
}
