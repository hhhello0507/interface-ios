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
        let color: Colorable = isSelected ? Colors.Primary.normal : Colors.Label.assistive
        HStack {
            Spacer()
            VStack(spacing: 0) {
                Image(icon: page.icon)
                    .resizable()
                    .renderingMode(.template)
                    .foreground(color)
                    .frame(width: 28, height: 28)
                Text(page.text)
                    .font(.wanted(.Regular, size: 10))
                    .foreground(color)
            }
            .padding(.vertical, 4)
            .opacity(isSelected ? 1 : 0.5)
            Spacer()
        }
    }
}
