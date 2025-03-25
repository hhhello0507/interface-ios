//
//  SwiftUIView.swift
//
//
//  Created by hhhello0507 on 9/3/24.
//

import SwiftUI

public struct GoogleSignInButton: View {
    
    private let action: () -> Void
    
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 8) {
                Image(icon: Icons.Color.GoogleLogo)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Google로 계속하기")
                    .myFont(.bodyM)
                    .foreground(Colors.Static.black)
            }
            .frame(height: 52)
            .frame(maxWidth: .infinity)
            .background(Colors.Static.white)
            .cornerRadius(8, corners: .allCorners)
            .stroke(8, content: Color(0xFFE6E6E6))
        }
        .scaledButton()
    }
}

#Preview {
    GoogleSignInButton {
        
    }
    .registerWanted()
}
