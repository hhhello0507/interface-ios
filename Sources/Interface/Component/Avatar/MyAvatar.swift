import SwiftUI
import NukeUI

public enum AvatarType: CaseIterable {
    case smaller
    case small
    case medium
    case large
    case larger
    
    var size: CGFloat {
        switch self {
        case .smaller: 20
        case .small: 28
        case .medium: 32
        case .large: 42
        case .larger: 64
        }
    }
}

public struct MyAvatar: View {
    
    private let url: String?
    private let type: AvatarType
    
    public init(
        _ url: String? = nil,
        type: AvatarType
    ) {
        self.url = url
        self.type = type
    }
    
    public var body: some View {
        if let url {
            LazyImage(url: .init(string: url)) { state in
                if let image = state.image {
                   image
               } else if state.error != nil {
                   label
               } else {
                   EmptyView() // TODO: Add Shimmer
               }
            }
            .processors([.resize(size: .init(width: type.size, height: type.size), unit: .pixels)])
            .clipShape(Circle())
        } else {
            label
        }
    }
    
    @ViewBuilder
    private var label: some View {
        Circle()
            .foreground(Colors.Fill.alternative)
            .frame(width: type.size, height: type.size)
            .overlay {
                Image(icon: Icons.Feature.Person)
                    .resizable()
                    .renderingMode(.template)
                    .foreground(Colors.Fill.assistive)
                    .frame(width: type.size, height: type.size)
                    .offset(y: type.size / 6.0)
            }
            .clipShape(Circle())
    }
}

private struct AvatarPreview: View {
    var body: some View {
        VStack {
            ForEach(AvatarType.allCases, id: \.self) {
                MyAvatar(type: $0)
            }
        }
        .registerWanted()
    }
}

#Preview {
    AvatarPreview()
}

#Preview {
    AvatarPreview()
        .preferredColorScheme(.dark)
}
