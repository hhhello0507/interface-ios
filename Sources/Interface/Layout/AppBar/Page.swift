import SwiftUI

public struct Page {
    public let content: AnyView
    public let icon: Iconable
    public let text: String
    
    @resultBuilder
    public struct Builder {
        public static func buildBlock(
            _ components: Page...
        ) -> [Page] {
            return components
        }
    }
    
    public init<C: View>(
        icon: Iconable,
        text: String,
        @ViewBuilder content: @escaping () -> C
    ) {
        self.icon = icon
        self.text = text
        self.content = AnyView(content())
    }
}

public extension View {
    func page(icon: Iconable, text: String) -> Page {
        Page(icon: icon, text: text) { self }
    }
}
