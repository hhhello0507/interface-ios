import SwiftUI
import Combine

public protocol SegmentedButtonProtocol: Hashable {
    var text: String { get }
}

public struct MySegmentedButton<T: SegmentedButtonProtocol>: View {
    
    private let data: [T]
    @Namespace private var animation
    @State private var selection: Binding<T>
    @State private var selected: T
    @State private var animatedSelection: T
    
    public init(
        _ data: [T],
        selection: Binding<T>
    ) {
        self.data = data
        self.selection = selection
        let selected = selection.wrappedValue
        self.selected = selected
        self.animatedSelection = selected
    }
    
    public var body: some View {
        HStack(spacing: 4) {
            ForEach(data, id: \.self) { item in
                let isSelected = animatedSelection == item
                Button {
                    if selected != item {
                        selected = item
                    }
                } label: {
                    Text(item.text)
                        .myFont(.headlineM)
                        .foregroundStyle(.label(.normal))
                        .opacity(isSelected ? 1 : 0.5)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background {
                            if isSelected {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.fill(.assistive))
                                    .matchedGeometryEffect(id: "background", in: animation)
                                    .shadow(.neutral10)
                            } else {
                                Color.fill(.neutral)
                            }
                        }
                }
                .scaledButton()
                .zIndex(isSelected ? 1 : 0)
            }
        }
        .padding(4)
        .frame(height: 48)
        .frame(maxWidth: .infinity)
        .background(.fill(.neutral))
        .cornerRadius(12)
        .onChange(of: selected) { newValue in
            selection.wrappedValue = newValue
            withAnimation(.spring(duration: 0.2)) {
                animatedSelection = newValue
            }
        }
        .onReceive(Just(selection)) { newValue in
            withAnimation(.spring(duration: 0.2)) {
                selected = newValue.wrappedValue
            }
        }
    }
}

private struct SegmentedButtonPreview: View {
    
    struct Item: SegmentedButtonProtocol {
        var text: String
    }
    
    let data = [
        Item(text: "Label1"),
        Item(text: "Label2")
    ]
    
    @State private var selection = Item(text: "Label1")
    
    var body: some View {
        MySegmentedButton(data, selection: $selection)
    }
}

#Preview {
    SegmentedButtonPreview()
}

#Preview {
    SegmentedButtonPreview()
        .preferredColorScheme(.dark)
}
