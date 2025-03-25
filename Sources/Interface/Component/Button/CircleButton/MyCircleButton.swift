import SwiftUI

public struct MyCircleButton: View {
    
    // MARK: - Parameters
    private let size: CircleButtonSize
    private let role: ButtonRole
    private let icon: Iconable
    private let isEnabled: Bool
    private let isLoading: Bool
    private let isStroke: Bool
    private let action: () -> Void
    
    private var mergedEnabled: Bool {
        isEnabled && !isLoading
    }
    
    private var adjustedForeground: Colorable {
        isStroke ? role.strokeForeground : role.foreground
    }
    
    public init(
        size: CircleButtonSize = .large,
        role: ButtonRole = .primary,
        icon: Iconable,
        isEnabled: Bool = true,
        isLoading: Bool = false,
        isStroke: Bool = false,
        action: @escaping () -> Void
    ) {
        self.size = size
        self.role = role
        self.icon = icon
        self.isEnabled = isEnabled
        self.isLoading = isLoading
        self.isStroke = isStroke
        self.action = action
    }
    
    public func size(_ size: CircleButtonSize) -> Self {
        .init(
            size: size,
            role: role,
            icon: icon,
            isEnabled: isEnabled,
            isLoading: isLoading,
            isStroke: isStroke,
            action: action
        )
    }
    
    public var body: some View {
        Button {
            guard mergedEnabled else { return }
            action()
        } label: {
            Image(icon: icon)
                .resizable()
                .renderingMode(.template)
                .foreground(adjustedForeground)
                .opacity(!isLoading ? 1 : 0)
                .frame(width: size.iconSize, height: size.iconSize)
                .frame(width: size.size, height: size.size)
                .background(isStroke ? Colors.Static.clear : role.background)
                .stroke(size.size / 2, content: role.strokeColor.box.color, lineWidth: isStroke ? 1 : 0)
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
}

private struct ButtonPreview: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(ButtonRole.allCases, id: \.self) { role in
                    HStack {
                        ForEach(CircleButtonSize.allCases, id: \.self) { size in
                            VStack {
                                MyCircleButton(role: role, icon: Icons.ETC.Blank) {}.size(size)
                                MyCircleButton(role: role, icon: Icons.ETC.Blank, isLoading: true) {}.size(size)
                                MyCircleButton(role: role, icon: Icons.ETC.Blank, isEnabled: false) {}.size(size)
                                MyCircleButton(role: role, icon: Icons.ETC.Blank) {}.size(size)
                                MyCircleButton(role: role, icon: Icons.ETC.Blank, isStroke: true) {}.size(size)
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
