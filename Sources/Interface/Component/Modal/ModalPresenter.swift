import SwiftUI

public struct MyModalProvider<C: View>: View {
    
    private let dialogProvider: DialogProvider
    private let datePickerProvider: DatePickerProvider
    private let timePickerProvider: TimePickerProvider
    private let content: () -> C
    
    public init(
        dialogProvider: DialogProvider,
        datePickerProvider: DatePickerProvider,
        timePickerProvider: TimePickerProvider,
        @ViewBuilder content: @escaping () -> C
    ) {
        self.dialogProvider = dialogProvider
        self.datePickerProvider = datePickerProvider
        self.timePickerProvider = timePickerProvider
        self.content = content
    }
    
    public var body: some View {
        MyDialogPresenter(provider: dialogProvider) {
            MyDatePickerPresenter(provider: datePickerProvider) {
                MyTimePickerPresenter(provider: timePickerProvider) {
                    content()
                        .environmentObject(dialogProvider)
                        .environmentObject(datePickerProvider)
                        .environmentObject(timePickerProvider)
                }
            }
        }
    }
}
