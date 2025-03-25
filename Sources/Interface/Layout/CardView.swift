import SwiftUI

public struct MyCardView<C>: View where C: View {
    
    let title: String
    let headingAction: (() -> Void)?
    let content: () -> C
    
    public init(
        title: String,
        headingAction: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> C
    ) {
        self.title = title
        self.headingAction = headingAction
        self.content = content
    }
    
    public var body: some View {
        VStack(spacing: 10) {
            if let headingAction {
                Button {
                    headingAction()
                } label: {
                    heading
                }
                .scaledButton()
            } else {
                heading
            }
            content()
        }
        .padding(16)
        .background(Colors.Background.normal)
        .cornerRadius(18, corners: .allCorners)
    }
    
    @ViewBuilder
    private var heading: some View {
        HStack(spacing: 0) {
            Text(title)
                .myFont(.headling1B)
                .foreground(Colors.Label.normal)
            Spacer()
            if headingAction != nil {
                Image(icon: Icons.Arrow.ExpandArrow)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 12, height: 12)
                    .rotationEffect(.degrees(180))
                    .foreground(Colors.Label.assistive)
            }
        }
        .padding(.horizontal, 6)
        .background(Colors.Background.normal)
    }
}

#Preview {
    MyCardView(title: "Title") {
        print("WOW")
    } content: {
        Text("Label")
            .padding(.vertical, 20)
    }
    .padding(.horizontal, 15)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Colors.Background.neutral)
    .registerWanted()
}
