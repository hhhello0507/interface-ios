import SwiftUI

public struct MyTimePickerPresenter<C: View>: ModalViewProtocol {
    
    private let calendar = {
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "ko-KR")
        return calendar
    }()
    private let hours = Array(0..<24)
    private let minutes = Array(0..<60)
    
    @StateObject private var provider: TimePickerProvider
    @State private var size: CGSize = .zero
    let content: () -> C
    
    init(
        provider: TimePickerProvider,
        @ViewBuilder content: @escaping () -> C
    ) {
        self._provider = .init(wrappedValue: provider)
        self.content = content
    }
    
    private var hour: Int? {
        components.hour
    }
    
    private var minute: Int? {
        components.minute
    }
    
    private var components: DateComponents {
        calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: provider.date)
    }
    
    func dismiss() {
        provider.isPresent = false
    }
    
    public var body: some View {
        BaseModal(
            isPresent: $provider.isPresent,
            content: content
        ) {
            if let timePicker = provider.timePicker {
                VStack(spacing: 16) {
                    Text(timePicker.title)
                        .myFont(.headling2B)
                        .foreground(Colors.Label.strong)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 0) {
                        SnapScrollView(
                            Array(hours.enumerated()),
                            selection: .init {
                                hour ?? 0
                            } set: { hour in
                                var components = components
                                components.hour = hour
                                if let date = calendar.date(from: components) {
                                    provider.date = date
                                }
                            },
                            spacing: 12,
                            showItemCount: 5
                        ) { idx, item in
                            let selected = idx == hour
                            Text("\(item)")
                                .myFont(.title3M)
                                .foreground(
                                    selected
                                    ? Colors.Label.normal
                                    : Colors.Label.alternative
                                )
                                .opacity(selected ? 1 : 0.5)
                                .padding(.horizontal, 20)
                        }
                        Text(":")
                            .myFont(.headling1B)
                            .foreground(Colors.Label.normal)
                        SnapScrollView(
                            Array(minutes.enumerated()),
                            selection: .init {
                                minute ?? 0
                            } set: { minute in
                                var components = components
                                components.minute = minute
                                if let date = calendar.date(from: components) {
                                    provider.date = date
                                }
                            },
                            spacing: 12,
                            showItemCount: 5
                        ) { idx, item in
                            let selected = idx == minute
                            Text("\(item)")
                                .myFont(.title3M)
                                .foreground(
                                    selected
                                    ? Colors.Label.normal
                                    : Colors.Label.alternative
                                )
                                .opacity(selected ? 1 : 0.5)
                                .padding(.horizontal, 20)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background {
                        Rectangle()
                            .fill(Colors.Fill.alternative)
                            .opacity(0.5)
                            .frame(height: 44)
                            .cornerRadius(10, corners: .allCorners)
                    }
                    HStack {
                        Spacer()
                        MyButton.text("선택", foreground: Colors.Primary.normal) {
                            timePicker.action()
                            dismiss()
                        }
                    }
                }
                .padding(24)
                .frame(width: 328)
            }
        }
    }
}

private struct TimePickerPreview: View {
    @StateObject private var provider = TimePickerProvider()
    @State var date = Date.now
    var body: some View {
        MyTimePickerPresenter(provider: provider) {
            VStack {
                Button("Show") {
                    provider.present(.init(title: "외출 일시") {
                        date = provider.date
                    })
                }
                Text("\(Calendar.current.dateComponents([.hour], from: date).hour!)")
                    .foreground(Colors.Label.normal)
                Text("\(Calendar.current.dateComponents([.minute], from: date).minute!)")
                    .foreground(Colors.Label.normal)
            }
        }
        .registerWanted()
    }
}

#Preview {
    TimePickerPreview()
}

#Preview {
    TimePickerPreview()
        .preferredColorScheme(.dark)
}
