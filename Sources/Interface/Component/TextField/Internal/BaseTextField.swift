//
//  File.swift
//  
//
//  Created by hhhello0507 on 8/21/24.
//

import SwiftUI

internal struct BaseTextField: View {
    
    // MARK: - Parameters
    // text
    private let hint: String
    @Binding private var text: String
    private let font: MyFont
    private let supportText: String?
    
    // state
    private let isSecured: Bool
    private let isEnabled: Bool
    private let isError: Bool
    
    // style
    private let colors: TextFieldColors
    
    init(
        _ hint: String,
        text: Binding<String>,
        font: MyFont,
        supportText: String?,
        isSecured: Bool,
        isEnabled: Bool,
        isError: Bool,
        colors: TextFieldColors
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
    
    var body: some View {
        Group {
            if isSecured {
                SecureField(
                    hint,
                    text: $text,
                    prompt: Text(hint).foreground(colors.hintColor)
                )
            } else {
                TextField(
                    hint,
                    text: $text,
                    prompt: Text(hint).foreground(colors.hintColor)
                )
            }
        }
        // style
        .myFont(font)
        .foreground(colors.foregroundColor)
        .tint(
            isError
            ? colors.errorColor
            : colors.primaryColor
        )
        // interaction
        .disabled(!isEnabled)
        // optimization
#if canImport(UIKit)
        .textInputAutocapitalization(.never)
#endif
        .autocorrectionDisabled()
        .textContentType(.init(rawValue: ""))
    }
}
