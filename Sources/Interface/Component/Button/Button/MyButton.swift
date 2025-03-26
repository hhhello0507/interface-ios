import SwiftUI

public struct MyButton: View {
    
    // MARK: - Parameters
    private let size: ButtonSize
    private let text: String
    private let role: ButtonRole
    private let leadingIcon: Image?
    private let trailingIcon: Image?
    private let foreground: Color?
    private let isEnabled: Bool
    private let isLoading: Bool
    private let isRounded: Bool
    private let isStroke: Bool
    private let expanded: Bool
    private let action: () -> Void
    
    private var mergedEnabled: Bool {
        isEnabled && !isLoading
    }
    
    private var adjustedForeground: Color {
        if let foreground {
            foreground
        } else {
            isStroke ? role.strokeForeground : role.foreground
        }
    }
    
    public init(
        _ text: String,
        size: ButtonSize = .larger,
        role: ButtonRole = .primary,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        foreground: Color? = nil,
        isEnabled: Bool = true,
        isLoading: Bool = false,
        isRounded: Bool = false,
        isStroke: Bool = false,
        expanded: Bool = false,
        action: @escaping () -> Void
    ) {
        self.size = size
        self.text = text
        self.role = role
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.foreground = foreground
        self.isEnabled = isEnabled
        self.isLoading = isLoading
        self.isRounded = isRounded
        self.isStroke = isStroke
        self.expanded = expanded
        self.action = action
    }
    
    public var body: some View {
        Button {
            guard mergedEnabled else { return }
            action()
        } label: {
            HStack(spacing: size.spacing) {
                if let leadingIcon {
                    makeIcon(icon: leadingIcon)
                }
                Text(text)
                    .myFont(size.font)
                    .foregroundStyle(adjustedForeground)
                    .fixedSize()
                if let trailingIcon {
                    makeIcon(icon: trailingIcon)
                }
            }
            .frame(maxWidth: expanded ? .infinity : nil)
            .padding(.horizontal, size.horizontalPadding)
            .frame(height: size.height)
            .opacity(!isLoading ? 1 : 0)
            .background(isStroke ? .clear : role.background)
            .cornerRadius(isRounded ? size.height / 2 : size.cornerRadius)
            .strokeBorder(isRounded ? size.height / 2 : size.cornerRadius, content: role.strokeColor, lineWidth: isStroke ? 1 : 0)
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
    
    func makeIcon(icon: Image) -> some View {
        icon
            .resizable()
            .renderingMode(.template)
            .frame(width: size.iconSize, height: size.iconSize)
            .foregroundStyle(adjustedForeground)
    }
}

private struct ButtonPreview: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(ButtonRole.allCases, id: \.self) {
                    MyButton("Button", role: $0) {}
                }
                ForEach(ButtonRole.allCases, id: \.self) { role in
                    VStack(spacing: 24) {
                        ForEach(ButtonSize.allCases, id: \.self) { size in
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
                                MyButton("Button", size: size, role: role, leadingIcon: .icon(.Blank), trailingIcon: .icon(.Blank), isEnabled: false) {}
                                MyButton("Button", size: size, role: role, leadingIcon: .icon(.Blank), trailingIcon: .icon(.Blank), isRounded: true) {}
                                MyButton("Button", size: size, role: role, leadingIcon: .icon(.Blank), trailingIcon: .icon(.Blank), isRounded: true, isStroke: true) {}
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
