import SwiftUI

struct MyBottomAppBarItem: View {
    private let page: Page
    private let isSelected: Bool
    
    init(
        page: Page,
        isSelected: Bool
    ) {
        self.page = page
        self.isSelected = isSelected
    }
    
    var body: some View {
        let color: Color = isSelected ? .primary(.normal) : .label(.assistive)
        HStack {
            Spacer()
            VStack(spacing: 0) {
                page.icon
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(color)
                    .frame(width: 28, height: 28)
                Text(page.text)
                    .font(.wanted(.Regular, size: 10))
                    .foregroundStyle(color)
            }
            .padding(.vertical, 4)
            .opacity(isSelected ? 1 : 0.5)
            Spacer()
        }
    }
}
