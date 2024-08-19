//
//  InfinityTopBar.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

@available(macOS 13.0, *)
public struct MyTopAppBar<C>: View where C: View {
    
    @Environment(\.dismiss) private var dismiss
    
    private let title: String
    private let background: Colorable
    private let content: () -> C
    private let backButtonAction: (() -> Void)?
    private let trailingContent: AnyView
    
    public init(
        title: String,
        background: Colorable,
        backButtonAction: (() -> Void)?,
        trailingContent: AnyView = AnyView(EmptyView()),
        @ViewBuilder content: @escaping () -> C
    ) {
        self.title = title
        self.background = background
        self.backButtonAction = backButtonAction
        self.trailingContent = trailingContent
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            background.box.color
                .ignoresSafeArea()
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    if let backButtonAction {
                        Button {
                            backButtonAction()
                        } label: {
                            Image(icon: .expandLeft)
                                .resizable()
//                                .myIconColor(.textNormal)
                                .frame(width: 28, height: 28)
                                .padding(2)
                        }
                    }
                    Text(title)
                        .myFont(backButtonAction == nil ? .title2B : .headline2M)
//                        .myColor(.textNormal)
                        .padding(.leading, 8)
                    Spacer()
                    trailingContent
                }
                .frame(height: 54)
//                .myBackground(background)
                .padding(.horizontal, 4)
                content()
                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

@available(macOS 13.0, *)
public extension View {
    func myTopBar<TC>(
        _ title: String,
        background: Colorable = Sementic.Background.neutral,
        @ViewBuilder trailingContent: @escaping () -> TC = { EmptyView() },
        backButtonAction: (() -> Void)? = nil
    ) -> some View where TC: View {
        MyTopAppBar(
            title: title,
            background: background,
            backButtonAction: backButtonAction,
            trailingContent: AnyView(trailingContent())
        ) {
            self
        }
    }
}
