import SwiftUI
import Combine

public struct MyAlertView: View {
    // MARK: Constant
    let animationDuration: CGFloat = 0.2
    
    // MARK: State
    @State private var scaleEffect: CGFloat = 1.2
    @State var opacity: Double = 0.0
    
    // MARK: Parameter
    @Binding var isPresented: Bool
    let alert: MyAlert
    
    func dismiss() {
        withAnimation(.easeOut(duration: animationDuration)) {
            opacity = 0
            scaleEffect = 1.1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
            isPresented = false
        }
    }
    
    public var body: some View {
        ZStack {
            Color.black
                .opacity(0.2 * opacity)
                .ignoresSafeArea()
            
            alertView
                .background(.background(.normal))
                .clipShape(.rect(cornerRadius: 16))
                .scaleEffect(scaleEffect)
                .opacity(opacity)
        }
        .onAppear {
            withAnimation(.easeOut(duration: animationDuration)) {
                opacity = 1
                scaleEffect = 1
            }
        }
    }
    
    @ViewBuilder
    private var alertView: some View {
        VStack(spacing: 18) {
            header
            buttons
        }
        .padding(18)
        .frame(width: 328)
    }
    
    @ViewBuilder
    private var header: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 12) {
                Text(alert.title)
                    .myFont(.title3B)
                    .foregroundStyle(.label(.normal))
                if let message = alert.message {
                    message
                        .myFont(.bodyM)
                        .foregroundStyle(.label(.alternative))
                }
            }
            Spacer()
        }
        .padding(6)
    }
    
    @ViewBuilder
    private var buttons: some View {
        HStack(spacing: 8) {
            if alert.buttons.count == 0 {
                Spacer()
                MyButton("닫기", size: .medium, role: .assistive, action: dismiss)
            } else if alert.buttons.count == 1 {
                let alertButton = alert.buttons.first!
                Spacer()
                MyButton(alertButton.title, size: .medium, role: .assistive) {
                    alertButton.action()
                    dismiss()
                }
            } else if alert.buttons.count >= 2 {
                let buttons = alert.buttons
                let (primaryButton, secondaryButton) = (buttons[0], buttons[1])
                MyButton(secondaryButton.title, role: .assistive, expanded: true) {
                    secondaryButton.action()
                    dismiss()
                }
                MyButton(primaryButton.title, expanded: true) {
                    primaryButton.action()
                    dismiss()
                }
            }
        }
    }
}
