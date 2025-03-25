//
//  File.swift
//  
//
//  Created by hhhello0507 on 8/19/24.
//

import Foundation

public enum ButtonRole: CaseIterable {
    case primary
    case secondary
    case assistive
    case text
    
    var foreground: Colorable {
        switch self {
        case .primary: Colors.Static.white
        case .secondary: Colors.Primary.normal
        case .assistive: Colors.Label.neutral
        case .text: Colors.Label.normal
        }
    }
    
    var background: Colorable {
        switch self {
        case .primary: Colors.Primary.normal
        case .secondary: Colors.Primary.assistive
        case .assistive: Colors.Fill.neutral
        case .text: Colors.Static.clear
        }
    }
    
    var strokeForeground: Colorable {
        switch self {
        case .primary: Colors.Primary.normal
        case .secondary: Colors.Primary.normal
        case .assistive: Colors.Label.neutral
        case .text: Colors.Static.clear
        }
    }
    
    var strokeColor: Colorable {
        switch self {
        case .primary: Colors.Primary.normal
        case .secondary: Colors.Primary.assistive
        case .assistive: Colors.Fill.neutral
        case .text: Colors.Static.clear
        }
    }
}
