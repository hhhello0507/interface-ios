import SwiftUI

public struct MyLinearProgressView: View {
    
    @State private var animatedProgress: CGFloat = 0
    
    private let progress: CGFloat
    private let isEnabled: Bool
    
    private var foregroundColor: Color {
        isEnabled ? .primary(.normal) : .label(.alternative)
    }
    
    public init(
        progress: CGFloat,
        isEnabled: Bool = true
    ) {
        self.progress = progress
        self.isEnabled = isEnabled
    }
    
    public func disabled(_ condition: Bool = true) -> Self {
        .init(
            progress: self.progress,
            isEnabled: !condition
        )
    }
    
    public var body: some View {
        GeometryReader { geometryProxy in
            ZStack(alignment: .leading) {
                Capsule()
                    .foregroundStyle(.line(.normal))
                let width = geometryProxy.size.width
                Capsule()
                    .frame(width: width * animatedProgress)
                    .foregroundStyle(foregroundColor)
                    .opacity(isEnabled ? 1 : 0.4)
            }
        }
        .frame(height: 14)
        .onChange(of: progress) { newValue in
            animatedProgress = newValue
        }
        .onAppear {
            withAnimation(.spring) {
                animatedProgress = progress
            }
        }
    }
}

private struct MyLinearProgressPreview: View {
    
    @State private var progress: CGFloat = 0.5
    
    var body: some View {
        VStack(spacing: 20) {
            MyLinearProgressView(progress: progress)
            MyLinearProgressView(progress: progress)
                .disabled(true)
        }
        .padding()
        .registerWanted()
    }
}

#Preview {
    MyLinearProgressPreview()
}

#Preview {
    MyLinearProgressPreview()
        .preferredColorScheme(.dark)
}
