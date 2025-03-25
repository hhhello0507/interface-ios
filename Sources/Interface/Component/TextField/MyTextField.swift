import SwiftUI

public struct MyTextField: View {
    
    @State private var isHide = true
    @FocusState private var focused
    
    // MARK: - parameters
    private let hint: String
    @Binding private var text: String
    private let font: MyFont
    private let supportText: String?
    private let isSecured: Bool
    private let isEnabled: Bool
    private let isError: Bool
    private let colors: TextFieldColors
    
    public init(
        _ hint: String = "",
        text: Binding<String>,
        font: MyFont = .headlineM,
        supportText: String? = nil,
        isSecured: Bool = false,
        isEnabled: Bool = true,
        isError: Bool = false,
        colors: TextFieldColors = .default
    ) {
        self.hint = hint
        self._text = text
        self.font = font
        self.supportText = supportText
        self.isSecured = isSecured
        self.isEnabled = isEnabled
        self.isError = isError
        self.colors = colors
    }
    
    // MARK: - View
    public var body: some View {
        HStack(spacing: 0) {
            BaseTextField(
                hint,
                text: $text,
                font: font,
                supportText: supportText,
                isSecured: isSecured && isHide,
                isEnabled: isEnabled,
                isError: isError,
                colors: colors
            )
            TextFieldIcon(
                isHide: isHide,
                isSecured: isSecured,
                isEnabled: !text.isEmpty,
                isError: isError,
                colors: colors
            ) {
                if isSecured {
                    isHide.toggle()
                } else {
                    text = ""
                }
            }
        }
        .frame(height: 43)
        .padding(.vertical, 4)
        // Layout
        .overlay {
            Rectangle()
                .foreground(
                    isError
                    ? colors.errorColor
                    : focused
                    ? colors.primaryColor
                    : colors.strokeColor
                )
                .frame(height: 1)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .overlay {
            if let supportText {
                Text(supportText)
                    .myFont(.labelM)
                    .foreground(
                        isError
                        ? colors.errorColor
                        : colors.foregroundColor
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .offset(y: 24)
            }
        }
        .focused($focused)
        .advancedFocus()
        .opacity(isEnabled ? 1 : 0.5)
    }
}

private struct TextFieldPreview: View {
    @State private var text = ""
    var body: some View {
        VStack(spacing: 20) {
            MyTextField("Label", text: $text, supportText: "Support Text")
            MyTextField("Label", text: $text, supportText: "Support Text", isSecured: true, isError: true)
            MyTextField("Label", text: $text, isEnabled: false)
        }
        .registerWanted()
    }
}

#Preview {
    TextFieldPreview()
}

#Preview {
    TextFieldPreview()
        .preferredColorScheme(.dark)
}
