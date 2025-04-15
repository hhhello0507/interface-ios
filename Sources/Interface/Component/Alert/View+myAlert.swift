import SwiftUI

// ref: https://stackademic.com/blog/custom-alert-in-swiftui-df860da27e57
public struct MyAlertViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    let alert: MyAlert
    
    public func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                if #available(iOS 16.4, *) {
                    MyAlertView(isPresented: $isPresented, alert: alert)
                        .presentationBackground(.clear)
                } else {
                    MyAlertView(isPresented: $isPresented, alert: alert)
                        .background(ClearBackground())
                }
            }
            .transaction { transaction in
                transaction.disablesAnimations = true
            }
    }
}

public extension View {
    func myAlert(
        _ title: LocalizedStringKey,
        isPresented: Binding<Bool>,
        @MyAlertButton.Builder actions: () -> [MyAlertButton] = { [] }
    ) -> some View {
        let alert = MyAlert(
            title: title,
            message: nil,
            buttons: actions()
        )
        return self
            .modifier(MyAlertViewModifier(isPresented: isPresented, alert: alert))
    }
    
    func myAlert(
        _ title: LocalizedStringKey,
        isPresented: Binding<Bool>,
        @MyAlertButton.Builder actions: () -> [MyAlertButton] = { [] },
        message: () -> Text
    ) -> some View {
        let alert = MyAlert(
            title: title,
            message: message(),
            buttons: actions()
        )
        return self
            .modifier(MyAlertViewModifier(isPresented: isPresented, alert: alert))
    }
}

#Preview {
    struct MyAlertPreview: View {
        @State private var showAlert1 = false
        @State private var showAlert2 = false
        @State private var showAlert3 = false
        @State private var showAlert4 = false
        
        var body: some View {
            VStack(spacing: 8) {
                Button("Show 1") {
                    showAlert1 = true
                }
                Button("Show 2") {
                    showAlert2 = true
                }
                Button("Show 3") {
                    showAlert3 = true
                }
                Button("Show 4") {
                    showAlert4 = true
                }
                Spacer()
            }
            .myAlert("제목을 입력해주세요", isPresented: $showAlert1) {
                MyAlertButton("확인") {}
                MyAlertButton("취소") {}
            } message: {
                Text("본문을 입력해주세요")
            }
            .myAlert("제목을 입력해주세요", isPresented: $showAlert2) {
                Text("본문을 입력해주세요")
            }
            .myAlert("제목을 입력해주세요", isPresented: $showAlert3) {
                MyAlertButton("확인") {
                    print("확인")
                }
            }
            .myAlert("제목을 입력해주세요", isPresented: $showAlert4)
            .registerWanted()
        }
    }
    return MyAlertPreview()
}
