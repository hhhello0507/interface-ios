import SwiftUI

@available(iOS 13.0, macOS 12.0, *)
public struct MyBottomAppBar: View {
    @Binding private var selection: Int
    private let pages: [Page]
    
    public init(
        selection: Binding<Int>,
        @Page.Builder pages: () -> [Page]
    ) {
        self._selection = selection
        self.pages = pages()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            ZStack {
                ForEach(pages.indices, id: \.self) { index in
                    pages[index].content
                        .opacity(index == selection ? 1 : 0)
                }
            }
            Divider()
                .foreground(Colors.Line.alternative)
            bottomBarBar
        }
    }
    
    @ViewBuilder
    private var bottomBarBar: some View {
        HStack(spacing: 0) {
            ForEach(pages.indices, id: \.self) { idx in
                let page = pages[idx]
                let selected = selection == idx
                Button {
                    if !selected {
                        selection = idx
                    }
                } label: {
                    MyBottomAppBarItem(page: page, isSelected: selected)
                        .frame(maxWidth: .infinity)
                        .background(Colors.Background.neutral)
                }
                .scaledButton()
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .padding(.horizontal, -1)
        .padding(.bottom, -1)
        .background(Colors.Background.neutral)
#if canImport(UIKit)
        .onChange(of: selection) { _ in
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
        }
#endif
    }
}

#Preview {
    struct BottomAppBarPreview: View {
        @State private var selection = 0
        
        var body: some View {
            MyBottomAppBar(selection: $selection) {
                Text("WOW")
                    .page(icon: Icons.ETC.Blank, text: "Tab")
                Color.blue
                    .page(icon: Icons.ETC.Blank, text: "Tab")
                Color.orange
                    .page(icon: Icons.ETC.Blank, text: "Tab")
                EmptyView()
                    .page(icon: Icons.ETC.Blank, text: "Tab")
                EmptyView()
                    .page(icon: Icons.ETC.Blank, text: "Tab")
            }
        }
    }
    
    return BottomAppBarPreview()
        .registerWanted()
}
