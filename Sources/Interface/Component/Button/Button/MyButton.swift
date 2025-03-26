import SwiftUI

public struct MyButton: View {
    @Environment(\.isEnabled) private var isEnabled
    
    // MARK: - Parameters
    private let text: String
    private let size: Self.Size
    private let role: Self.Role
    private let leadingIcon: Image?
    private let trailingIcon: Image?
    private let isLoading: Bool
    private let expanded: Bool
    private let action: () -> Void
    
    private var mergedEnabled: Bool {
        isEnabled && !isLoading
    }
    
    public init(
        _ text: String,
        size: Self.Size = .large,
        role: Self.Role = .primary,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        isLoading: Bool = false,
        expanded: Bool = false,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.size = size
        self.role = role
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isLoading = isLoading
        self.expanded = expanded
        self.action = action
    }
    
    public var body: some View {
        let sizeProperties = size.properties
        let roleProperties = role.properties
        Button {
            guard mergedEnabled else { return }
            action()
        } label: {
            HStack(spacing: sizeProperties.spacing) {
                if let leadingIcon {
                    makeIcon(icon: leadingIcon)
                }
                Text(text)
                    .myFont(sizeProperties.font)
                    .foregroundStyle(roleProperties.foreground)
                    .fixedSize()
                if let trailingIcon {
                    makeIcon(icon: trailingIcon)
                }
            }
            .frame(maxWidth: expanded ? .infinity : nil)
            .padding(.horizontal, sizeProperties.horizontalPadding)
            .frame(height: sizeProperties.height)
            .opacity(!isLoading ? 1 : 0)
            .background(roleProperties.background)
            .clipShape(.rect(cornerRadius: sizeProperties.cornerRadius))
            .opacity(mergedEnabled ? 1 : 0.5)
        }
        .disabled(!mergedEnabled)
        .scaledButton()
        .overlay {
            if isLoading {
                ProgressView()
            }
        }
    }
    
    @ViewBuilder
    func makeIcon(icon: Image) -> some View {
        let sizeProperties = size.properties
        let roleProperties = role.properties
        icon
            .resizable()
            .renderingMode(.template)
            .frame(width: sizeProperties.iconSize, height: sizeProperties.iconSize)
            .foregroundStyle(roleProperties.foreground)
    }
}

private struct ButtonPreview: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(MyButton.Role.allCases, id: \.self) {
                    MyButton("Button", role: $0) {}
                }
                ForEach(MyButton.Role.allCases, id: \.self) { role in
                    VStack(spacing: 24) {
                        ForEach(MyButton.Size.allCases, id: \.self) { size in
                            VStack {
                                MyButton(
                                    "Button",
                                    size: size,
                                    role: role,
                                    leadingIcon: .icon(.Blank),
                                    trailingIcon: .icon(.Blank),
                                    expanded: true
                                ) {}
                                MyButton(
                                    "Button",
                                    size: size,
                                    role: role,
                                    leadingIcon: .icon(.Blank),
                                    trailingIcon: .icon(.Blank)
                                ) {}
                                MyButton(
                                    "Button",
                                    size: size,
                                    role: role,
                                    leadingIcon: .icon(.Blank),
                                    trailingIcon: .icon(.Blank),
                                    isLoading: true
                                ) {}
                                MyButton("Button", size: size, role: role, leadingIcon: .icon(.Blank), trailingIcon: .icon(.Blank)) {}.disabled(true)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 15)
        }
        .registerWanted()
    }
}

#Preview {
    ButtonPreview()
}

#Preview {
    ButtonPreview()
        .preferredColorScheme(.dark)
}
