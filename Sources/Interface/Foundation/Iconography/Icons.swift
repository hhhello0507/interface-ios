import SwiftUI

public enum Icons: String, CaseIterable {
    case Detail
    case ExpandArrow
    case NormalArrow
    case StopArrow
    case CurveArrow
    case CrossLine
    case CrossRing
    case CrossFill
    case AddLine
    case AddRing
    case AddFill
    case ExclamationLine
    case ExclamationFill
    case HeartLine
    case HeartFill
    case RadioLine
    case RadioFill
    case CheckLine
    case CheckRing
    case CheckFill
    case BookmarkLine
    case BookmarkFill
    case Show
    case Hide
    case Alarm
    case AlarmDisabled
    case Book
    case Calendar
    case Camera
    case Chat
    case Crown
    case Home
    case Manage
    case Moon
    case Person
    case Ping
    case Send
    case Setting
    case Star
    case Trash
    case Utensils
    case Pen
    case AddEmoji
    case Blank
    case Copy
    case File
    case Logout
    case LoudSpeaker
    case Photo
    case Search
    case Substack
    case Write
    case AppleLogo
    case GoogleLogo
}

#Preview {
    ScrollView {
        LazyVStack(spacing: 4) {
            ForEach(Icons.allCases, id: \.rawValue) {
                Image.icon($0)
            }
        }
        .padding(8)
    }
}
