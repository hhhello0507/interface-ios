//
//  File.swift
//  
//
//  Created by hhhello0507 on 8/21/24.
//

import Foundation

public struct TextFieldColors {
    // defaut
    public let hintColor: Colorable
    public let strokeColor: Colorable

    // unfocused
    public let foregroundColor: Colorable
    public let iconColor: Colorable

    // focused
    public let primaryColor: Colorable // for indicator color
    
    // error
    public let errorColor: Colorable
    
    public static let `default` = TextFieldColors(
        hintColor: Colors.Label.assistive,
        strokeColor: Colors.Line.normal,
        foregroundColor: Colors.Label.strong,
        iconColor: Colors.Label.alternative,
        primaryColor: Colors.Primary.normal,
        errorColor: Colors.Status.negative
    )
}
