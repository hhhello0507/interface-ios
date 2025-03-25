import SwiftUI

public extension View {
    
    @ViewBuilder
    func registerWanted() -> some View {
        let _ = Wanted.register()
        self
    }
}
