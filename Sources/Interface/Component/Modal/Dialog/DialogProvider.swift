import Foundation

public final class DialogProvider: ObservableObject {
    @Published var isPresent = false
    
    @Published var dialog: Dialog?
    
    public init() {}
    
    public func present(
        _ dialog: Dialog
    ) {
        self.isPresent = true
        
        self.dialog = dialog
    }
}
