//
//  SwiftUIView.swift
//  
//
//  Created by hhhello0507 on 8/20/24.
//

import SwiftUI

public struct MyRowView: View {
    
    private let title: String
    private let description: String?
    private let action: () -> Void
    
    public init(
        _ title: String,
        description: String? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.description = description
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 8) {
                Text(title)
                    .myFont(.headlineM)
                    .foreground(Colors.Label.normal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                if let description {
                    Text(description)
                        .myFont(.bodyM)
                        .foreground(Colors.Label.assistive)
                }
                Image(icon: Icons.Arrow.ExpandArrow)
                    .resizable()
                    .renderingMode(.template)
                    .foreground(Colors.Label.alternative)
                    .frame(width: 12, height: 12)
                    .rotationEffect(.degrees(180))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Colors.Background.normal)
        }
        .scaledButton()
    }
}

#Preview {
    MyRowView("Title", description: "Description") {
        print("WOW")
    }
    .registerWanted()
}
