import SwiftUI

public struct AppleSignInButton: View {
    private let action: () -> Void
    
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image.icon(.AppleLogo)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 18, height: 22)
                    .foregroundStyle(.white)
                Text("Apple로 계속하기")
                    .myFont(.bodyM)
                    .foregroundStyle(.white)
            }
            .frame(height: 52)
            .frame(maxWidth: .infinity)
            .background(.black)
            .clipShape(.rect(cornerRadius: 8))
        }
        .scaledButton()
    }
}

#Preview {
    AppleSignInButton {
    }
    .registerWanted()
}
