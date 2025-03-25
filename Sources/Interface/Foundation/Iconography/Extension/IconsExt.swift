//
//  File.swift
//  
//
//  Created by hhhello0507 on 8/21/24.
//

import Foundation

public extension Icons.Visible {
    static func of(_ isHide: Bool) -> Icons.Visible {
        isHide ? Icons.Visible.Hide : Icons.Visible.Show
    }
}
