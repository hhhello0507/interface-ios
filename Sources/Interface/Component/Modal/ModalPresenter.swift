import SwiftUI

public struct MyModalProvider<C: View>: View {
    
    private let dialogProvider: DialogProvider
    private let content: () -> C
    
    public init(
        dialogProvider: DialogProvider,
        @ViewBuilder content: @escaping () -> C
    ) {
        self.dialogProvider = dialogProvider
        self.content = content
    }
    
    public var body: some View {
        MyDialogPresenter(provider: dialogProvider) {
            content()
                .environmentObject(dialogProvider)
        }
    }
}
