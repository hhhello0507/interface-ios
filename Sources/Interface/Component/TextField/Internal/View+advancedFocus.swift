//
//  File.swift
//  
//
//  Created by hhhello0507 on 8/21/24.
//

import SwiftUI

internal struct AdvancedFocusViewModifier: ViewModifier {
    @FocusState private var focused: Bool
    
    func body(content: Content) -> some View {
        content
            .focused($focused)
            .onTapGesture {
                focused = true
            }
    }
}

internal extension View {
    func advancedFocus() -> some View {
        self.modifier(AdvancedFocusViewModifier())
    }
}
