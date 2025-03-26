//
//  InfinityTopBar.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct TopAppBarButton {
    public let icon: Image
    public let action: () -> Void
    
    public init(icon: Image, action: @escaping () -> Void) {
        self.icon = icon
        self.action = action
    }
}

public enum TopAppBarType {
    case `default`
    case small
}

@available(iOS 15.0, macOS 12.0, *)
public struct MyNavigationBar<C, TC>: View where C: View, TC: View {
    private let edgeInsets = EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15)
    
    @Environment(\.dismiss) private var dismiss
    
    private let title: String
    private let type: TopAppBarType
    private let background: Color
    private let buttons: [TopAppBarButton]
    private let trailingContent: () -> TC
    private let content: (EdgeInsets) -> C
    
    public static func `default`(
        title: String,
        background: Color = .background(.normal),
        buttons: [TopAppBarButton] = [],
        @ViewBuilder trailingContent: @escaping () -> TC = { EmptyView() },
        @ViewBuilder content: @escaping (EdgeInsets) -> C
    ) -> Self {
        self.init(
            title: title,
            type: .default,
            background: background,
            buttons: buttons,
            trailingContent: trailingContent,
            content: content
        )
    }

    public static func small(
        title: String,
        background: Color = .background(.normal),
        buttons: [TopAppBarButton] = [],
        @ViewBuilder trailingContent: @escaping () -> TC = { EmptyView() },
        @ViewBuilder content: @escaping (EdgeInsets) -> C
    ) -> Self {
        self.init(
            title: title,
            type: .small,
            background: background,
            buttons: buttons,
            trailingContent: trailingContent,
            content: content
        )
    }

    public var body: some View {
        if #available(macOS 13.0, *) {
            makeBody().navigationBarBackButtonHidden()
        } else {
            makeBody()
        }
    }
    
    @ViewBuilder
    private func makeBody() -> some View {
        ZStack {
            // Background
            background
                .ignoresSafeArea()
            
            // Screen
            VStack(spacing: 0) {
                // Top app bar
                HStack(spacing: 0) {
                    if type == .small {
                        Button {
                            dismiss()
                        } label: {
                            Image.icon(.ExpandArrow)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundStyle(.label(.normal))
                                .frame(width: 24, height: 24)
                                .padding(12)
                        }
                    }
                    
                    if type == .default {
                        Spacer().frame(width: 8)
                    }
                    Text(title)
                        .myFont(type == .default ? .title1B : .headlineM)
                        .foregroundStyle(.label(.normal))
                    Spacer()
                    ForEach(buttons.indices, id: \.self) {
                        makeButton(button: buttons[$0])
                    }
                    trailingContent()
                }
                .frame(height: 54)
                .background(background)
                .padding(.horizontal, 4)
                content(edgeInsets)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }
    
    func makeButton(button: TopAppBarButton) -> some View {
        Button {
            button.action()
        } label: {
            button.icon
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundStyle(.label(.alternative))
                .opacity(0.5)
                .padding(12)
        }
    }
}

#Preview {
    MyNavigationBar.default(
        title: "제목",
        buttons: [
            .init(icon: .icon(.Person)) {
                
            }
        ]
    ) { _ in
        
    }
    .registerWanted()
}

#Preview {
    MyNavigationBar.small(title: "제목") { _ in
        
    }
    .registerWanted()
    .preferredColorScheme(.dark)
}
