//
//  File.swift
//  
//
//  Created by hhhello0507 on 8/21/24.
//

import SwiftUI

public struct TextFieldColors {
    // defaut
    public let hintColor: Color
    public let strokeColor: Color

    // unfocused
    public let foregroundColor: Color
    public let iconColor: Color

    // focused
    public let primaryColor: Color // for indicator color
    
    // error
    public let errorColor: Color
    
    public static let `default` = TextFieldColors(
        hintColor: .label(.assistive),
        strokeColor: .line(.normal),
        foregroundColor: .label(.assistive), // TODO: fix dummy
        iconColor: .label(.alternative),
        primaryColor: .primary(.normal),
        errorColor: Palette.red50
    )
}
