import SwiftUI

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
    private let url: URL?
    private let type: AvatarType
    
    public init(
        url: URL?,
        type: AvatarType
    ) {
        self.url = url
        self.type = type
    }
    
    public var body: some View {
        if let url {
            AsyncImage(url: url) { phase in
                phase.image?
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: type.size, height: type.size)
            .clipShape(.circle)
        } else {
            label
        }
    }
    
    @ViewBuilder
    private var label: some View {
        Circle()
            .foregroundStyle(.fill(.alternative))
            .frame(width: type.size, height: type.size)
            .overlay {
                Image.icon(.Person)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.fill(.assistive))
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
                MyAvatar(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9SRRmhH4X5N2e4QalcoxVbzYsD44C-sQv-w&s"), type: $0)
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
