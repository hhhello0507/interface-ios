//
//  File.swift
//  
//
//  Created by hhhello0507 on 8/19/24.
//

import SwiftUI

public enum ButtonRole: CaseIterable {
    case primary
    case secondary
    case assistive
    case text
    
    var foreground: Color {
        switch self {
        case .primary: .white
        case .secondary: .primary(.normal)
        case .assistive: .label(.neutral)
        case .text: .label(.normal)
        }
    }
    
    var background: Color {
        switch self {
        case .primary: .primary(.normal)
        case .secondary: .primary(.assistive)
        case .assistive: .fill(.neutral)
        case .text: .clear
        }
    }
    
    var strokeForeground: Color {
        switch self {
        case .primary: .primary(.normal)
        case .secondary: .primary(.normal)
        case .assistive: .label(.neutral)
        case .text: .clear
        }
    }
    
    var strokeColor: Color {
        switch self {
        case .primary: .primary(.normal)
        case .secondary: .primary(.assistive)
        case .assistive: .fill(.neutral)
        case .text: .clear
        }
    }
}
