public struct MyAlertButton {
    public let title: String
    public let action: () -> Void
    
    public init(_ title: String, action: @escaping () -> Void = {}) {
        self.title = title
        self.action = action
    }
    
    @resultBuilder
    struct Builder {
        static func buildBlock(
            _ components: MyAlertButton...
        ) -> [MyAlertButton] {
            return components
        }
    }
}
