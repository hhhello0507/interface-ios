import SwiftUI

public extension View {
    func myFont(_ myFont: MyFont) -> some View {
        self.font(myFont.font)
    }
}
