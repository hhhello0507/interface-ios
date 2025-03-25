import SwiftUI
import Combine

public struct MyDialogPresenter<C: View>: ModalViewProtocol {
    
    @StateObject private var provider: DialogProvider
    
    let content: () -> C
    
    public init(
        provider: DialogProvider,
        @ViewBuilder content: @escaping () -> C
    ) {
        self._provider = .init(wrappedValue: provider)
        self.content = content
    }
    
    func dismiss() {
        provider.isPresent = false
    }
    
    public var body: some View {
        BaseModal(
            isPresent: $provider.isPresent,
            content: content
        ) {
            if let dialog = provider.dialog {
                VStack(spacing: 18) {
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            Text(dialog.title)
                                .myFont(.headling2B)
                                .foreground(Colors.Label.strong)
                            if let message = dialog.message {
                                Text(message)
                                    .myFont(.bodyM)
                                    .foreground(Colors.Label.alternative)
                            }
                        }
                        Spacer()
                    }
                    .padding(6)
                    HStack(spacing: 8) {
                        if let secondaryButton = dialog.secondaryButton {
                            if let primaryButton = dialog.primaryButton {
                                MyButton(secondaryButton.title, role: .assistive, expanded: true) {
                                    secondaryButton.action()
                                    dismiss()
                                }
                                MyButton(primaryButton.title, expanded: true) {
                                    primaryButton.action()
                                    dismiss()
                                }
                            } else {
                                HStack {
                                    Spacer()
                                    MyButton.text(secondaryButton.title, foreground: Colors.Primary.normal) {
                                        secondaryButton.action()
                                        dismiss()
                                    }
                                    .size(.medium)
                                }
                            }
                        } else {
                            HStack {
                                Spacer()
                                if let primaryButton = dialog.primaryButton {
                                    MyButton.text(primaryButton.title, foreground: Colors.Primary.normal) {
                                        primaryButton.action()
                                        dismiss()
                                    }
                                    .size(.medium)
                                } else {
                                    
                                    MyButton.text("닫기", foreground: Colors.Primary.normal) {
                                        dismiss()
                                    }
                                    .size(.medium)
                                }
                            }
                        }
                    }
                }
                .padding(18)
                .frame(width: 328)
            }
        }
    }
}

#Preview {
    struct DialogPreview: View {
        @StateObject private var provider = DialogProvider()
        var body: some View {
            MyDialogPresenter(provider: provider) {
                VStack {
                    Button("Show 1") {
                        provider.present(
                            .init(
                                title: "제목을 입력해주세요",
                                message: "본문을 입력해주세요",
                                primaryButton: .init("확인") {
                                    
                                },
                                secondaryButton: .init("취소") {
                                    
                                }
                            )
                        )
                    }
                    Button("Show 2") {
                        provider.present(
                            .init(
                                title: "제목을 입력해주세요",
                                message: "본문을 입력해주세요"
                            )
                        )
                    }
                    Button("Show 3") {
                        provider.present(
                            .init(title: "와우")
                            .primaryButton("Hello") {
                                print("WOW")
                            }
                        )
                    }
                }
            }
            .registerWanted()
        }
    }
    return DialogPreview()
}
