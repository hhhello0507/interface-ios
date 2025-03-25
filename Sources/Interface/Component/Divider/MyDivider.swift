import SwiftUI

public enum DividerType {
    case small
    case medium
    case large
    
    var height: CGFloat {
        switch self {
        case .small: 1
        case .medium: 8
        case .large: 14
        }
    }
}

public struct MyDivider: View {
    
    private let type: DividerType
    
    public init(
        type: DividerType = .small
    ) {
        self.type = type
    }
    
    public var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: type.height)
            .foreground(Colors.Line.normal)
    }
}

#Preview {
    VStack {
        MyDivider()
        MyDivider(type: .medium)
        MyDivider(type: .large)
    }
}
