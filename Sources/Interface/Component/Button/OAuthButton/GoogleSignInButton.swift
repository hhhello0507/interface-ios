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
                Image.icon(.GoogleLogo)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Google로 계속하기")
                    .myFont(.bodyM)
                    .foregroundStyle(.black)
            }
            .frame(height: 52)
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(.rect(cornerRadius: 8))
            .strokeBorder(8, content: Color(0xFFE6E6E6), lineWidth: 1)
        }
        .scaledButton()
    }
}

#Preview {
    GoogleSignInButton {
        
    }
    .registerWanted()
}
