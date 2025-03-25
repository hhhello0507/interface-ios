import SwiftUI

public struct MyButton: View {
    
    // MARK: - Parameters
    private let size: ButtonSize
    private let text: String
    private let role: ButtonRole
    private let leadingIcon: Iconable?
    private let trailingIcon: Iconable?
    private let foreground: Colorable?
    private let isEnabled: Bool
    private let isLoading: Bool
    private let isRounded: Bool
    private let isStroke: Bool
    private let expanded: Bool
    private let action: () -> Void
    
    private var mergedEnabled: Bool {
        isEnabled && !isLoading
    }
    
    private var adjustedForeground: Colorable {
        if let foreground {
            foreground
        } else {
            isStroke ? role.strokeForeground : role.foreground
        }
    }
    
    public init(
        size: ButtonSize = .larger,
        _ text: String,
        role: ButtonRole = .primary,
        leadingIcon: Iconable? = nil,
        trailingIcon: Iconable? = nil,
        foreground: Colorable? = nil,
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
    
    public static func text(
        _ text: String,
        leadingIcon: Iconable? = nil,
        trailingIcon: Iconable? = nil,
        foreground: Colorable? = nil,
        isEnabled: Bool = true,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) -> Self {
        Self.init(
            size: .larger,
            text,
            role: .text,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            foreground: foreground,
            isEnabled: isEnabled,
            isLoading: isLoading,
            isRounded: false,
            isStroke: false,
            expanded: false,
            action: action
        )
    }
    
    public func size(_ size: ButtonSize) -> Self {
        .init(
            size: size,
            self.text,
            role: role,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            foreground: foreground,
            isEnabled: isEnabled,
            isLoading: isLoading,
            isRounded: isRounded,
            isStroke: isStroke,
            expanded: expanded,
            action: action
        )
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
                    .foreground(adjustedForeground)
                    .fixedSize()
                if let trailingIcon {
                    makeIcon(icon: trailingIcon)
                }
            }
            .frame(maxWidth: expanded ? .infinity : nil)
            .padding(.horizontal, size.horizontalPadding)
            .frame(height: size.height)
            .opacity(!isLoading ? 1 : 0)
            .background(isStroke ? Colors.Static.clear : role.background)
            .cornerRadius(isRounded ? size.height / 2 : size.cornerRadius)
            .stroke(isRounded ? size.height / 2 : size.cornerRadius, content: role.strokeColor.box.color, lineWidth: isStroke ? 1 : 0)
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
    
    func makeIcon(icon: Iconable) -> some View {
        Image(icon: icon)
            .resizable()
            .renderingMode(.template)
            .frame(width: size.iconSize, height: size.iconSize)
            .foreground(adjustedForeground)
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
                                    role: role,
                                    leadingIcon: Icons.ETC.Blank,
                                    trailingIcon: Icons.ETC.Blank,
                                    expanded: true
                                ) {}.size(size)
                                MyButton(
                                    "Button",
                                    role: role,
                                    leadingIcon: Icons.ETC.Blank,
                                    trailingIcon: Icons.ETC.Blank
                                ) {}.size(size)
                                MyButton(
                                    "Button",
                                    role: role,
                                    leadingIcon: Icons.ETC.Blank,
                                    trailingIcon: Icons.ETC.Blank,
                                    isLoading: true
                                ) {}.size(size)
                                MyButton("Button", role: role, leadingIcon: Icons.ETC.Blank, trailingIcon: Icons.ETC.Blank, isEnabled: false) {}.size(size)
                                MyButton("Button", role: role, leadingIcon: Icons.ETC.Blank, trailingIcon: Icons.ETC.Blank, isRounded: true) {}.size(size)
                                MyButton("Button", role: role, leadingIcon: Icons.ETC.Blank, trailingIcon: Icons.ETC.Blank, isRounded: true, isStroke: true) {}.size(size)
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
