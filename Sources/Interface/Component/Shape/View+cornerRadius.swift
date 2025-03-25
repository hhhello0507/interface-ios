import SwiftUI

public extension View {
    func cornerRadius(_ radius: CGFloat, corners: RoundedCornerShape.RectCorner) -> some View {
        clipShape(RoundedCornerShape(radius: radius, corners: corners))
    }
    
    func stroke<Content>(
        _ radius: CGFloat,
        corners: RoundedCornerShape.RectCorner = .allCorners,
        content: Content,
        lineWidth: CGFloat = 1
    ) -> some View where Content: ShapeStyle {
        let roundedCorner = RoundedCornerShape(radius: radius, corners: corners)
        return self
            .clipShape(roundedCorner)
            .overlay {
                roundedCorner
                    .stroke(content, lineWidth: lineWidth)
            }
    }
    
    func stroke(
        _ radius: CGFloat,
        corners: RoundedCornerShape.RectCorner = .allCorners,
        color: Colorable,
        lineWidth: CGFloat = 1
    ) -> some View {
        let roundedCorner = RoundedCornerShape(radius: radius, corners: corners)
        return self
            .clipShape(roundedCorner)
            .overlay {
                roundedCorner
                    .stroke(color.box.color, lineWidth: lineWidth)
            }
    }
}
