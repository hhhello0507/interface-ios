//
//  SwiftUIView.swift
//  
//
//  Created by hhhello0507 on 9/3/24.
//

import SwiftUI

public struct AppleSignInButton: View {
    
    private let action: () -> Void
    
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 8) {
                Image(icon: Icons.Color.AppleLogo)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 18, height: 22)
                    .foreground(Colors.Static.white)
                Text("Apple로 계속하기")
                    .myFont(.bodyM)
                    .foreground(Colors.Static.white)
            }
            .frame(height: 52)
            .frame(maxWidth: .infinity)
            .background(Colors.Static.black)
            .cornerRadius(8, corners: .allCorners)
        }
        .scaledButton()
    }
}

#Preview {
    AppleSignInButton {
        
    }
    .registerWanted()
}
