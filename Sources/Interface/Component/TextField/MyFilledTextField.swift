//
//  File.swift
//  
//
//  Created by hhhello0507 on 8/22/24.
//

import SwiftUI

public struct MyFilledTextField: View {
    
    @State private var isHide = false
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
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Label")
                .myFont(.labelM)
                .foreground(
                    isError
                    ? colors.errorColor
                    : focused
                    ? colors.primaryColor
                    : colors.hintColor
                )
            HStack(spacing: 0) {
                BaseTextField(
                    hint,
                    text: $text,
                    font: font,
                    supportText: supportText,
                    isSecured: isSecured,
                    isEnabled: isEnabled,
                    isError: isError,
                    colors: .default
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
            .padding(.leading, 16)
            .padding(.trailing, 12)
            .frame(height: 48)
            .padding(.vertical, 4)
            .background(Colors.Background.normal.box.color, in: RoundedRectangle(cornerRadius: 12))
            .overlay {
                Rectangle()
                    .fill(.clear)
                    .stroke(
                        12,
                        color: isError
                        ? colors.errorColor
                        : focused
                        ? colors.primaryColor
                        : colors.strokeColor
                    )
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
                        .offset(y: 20)
                }
            }
            .focused($focused)
            .advancedFocus()
            .opacity(isEnabled ? 1 : 0.5)
        }
    }
}

private struct TextFieldPreview: View {
    @State private var text = ""
    var body: some View {
        VStack(spacing: 40) {
            MyFilledTextField("Label", text: $text, supportText: "Support Text")
            MyFilledTextField("Label", text: $text, supportText: "Support Text", isSecured: true, isError: true)
            MyFilledTextField("Label", text: $text, supportText: "Support Text", isEnabled: false)
        }
        .padding(.horizontal, 15)
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

