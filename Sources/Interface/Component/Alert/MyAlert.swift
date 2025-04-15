import SwiftUI

public struct MyAlert {
    public let title: LocalizedStringKey
    public let message: Text?
    public let buttons: [MyAlertButton]
    
    public init(title: LocalizedStringKey, message: Text?, buttons: [MyAlertButton]) {
        self.title = title
        self.message = message
        self.buttons = buttons
    }
}
