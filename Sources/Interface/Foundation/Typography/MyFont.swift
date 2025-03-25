import SwiftUI

public enum MyFont: CaseIterable {
    case title1B
    case title1M
    case title1R
    
    case title2B
    case title2M
    case title2R
    
    case title3B
    case title3M
    case title3R
    
    case headling1B
    case headling1M
    case headling1R
    
    case headling2B
    case headling2M
    case headling2R
    
    case headlineB
    case headlineM
    case headlineR
    
    case bodyB
    case bodyM
    case bodyR
    
    case labelB
    case labelM
    case labelR
    
    case captionB
    case captionM
    case captionR
}

#Preview {
    VStack {
        ForEach(MyFont.allCases, id: \.self) {
            Text("테스트")
                .myFont($0)
        }
    }
    .registerWanted()
}
