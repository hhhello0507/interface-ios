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
        .background(.background(.normal))
        .clipShape(.rect(cornerRadius: 18))
    }
    
    @ViewBuilder
    private var heading: some View {
        HStack(spacing: 0) {
            Text(title)
                .myFont(.headling1B)
                .foregroundStyle(.label(.normal))
            Spacer()
            if headingAction != nil {
                Image.icon(.ExpandArrow)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 12, height: 12)
                    .rotationEffect(.degrees(180))
                    .foregroundStyle(.label(.assistive))
            }
        }
        .padding(.horizontal, 6)
        .background(.background(.normal))
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
    .registerWanted()
}
