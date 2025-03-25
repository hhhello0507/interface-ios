import SwiftUI

public protocol Iconable {
    var rawValue: String { get }
}

public enum Icons {
    public enum Detail: String, Iconable, CaseIterable {
        case Detail
    }
    
    public enum Arrow: String, Iconable, CaseIterable {
        case ExpandArrow, NormalArrow, StopArrow, CurveArrow
    }
    
    public enum Cross: String, Iconable, CaseIterable {
        case CrossLine, CrossRing, CrossFill
    }
    
    public enum Add: String, Iconable, CaseIterable {
        case AddLine, AddRing, AddFill
    }
    
    public enum Exclamation: String, Iconable, CaseIterable {
        case ExclamationLine, ExclamationFill
    }
    
    public enum Mark: String, Iconable, CaseIterable {
        case HeartLine, HeartFill
        case RadioLine, RadioFill
        case CheckLine, CheckRing, CheckFill
        case BookmarkLine, BookmarkFill
    }
    
    public enum Visible: String, Iconable, CaseIterable {
        case Show, Hide
    }
    
    public enum Alarm: String, Iconable, CaseIterable {
        case Alarm, AlarmDisabled
    }
    
    public enum Feature: String, Iconable, CaseIterable {
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
    }
    
    public enum ETC: String, Iconable , CaseIterable {
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
    }
    
    public enum Color: String, Iconable, CaseIterable {
        case AppleLogo
        case GoogleLogo
    }
}

#Preview {
    struct IconsPreview: View {
        let icons: [any Iconable]
        var body: some View {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 4) {
                    ForEach(icons, id: \.rawValue) {
                        Image(icon: $0)
                    }
                }
                .padding(.vertical, 16)
            }
        }
    }
    return ScrollView {
        LazyVStack(spacing: 4) {
            IconsPreview(icons: Icons.Detail.allCases)
            IconsPreview(icons: Icons.Arrow.allCases)
            IconsPreview(icons: Icons.Cross.allCases)
            IconsPreview(icons: Icons.Add.allCases)
            IconsPreview(icons: Icons.Exclamation.allCases)
            IconsPreview(icons: Icons.Mark.allCases)
            IconsPreview(icons: Icons.Visible.allCases)
            IconsPreview(icons: Icons.Alarm.allCases)
            IconsPreview(icons: Icons.Feature.allCases)
            IconsPreview(icons: Icons.ETC.allCases)
            IconsPreview(icons: Icons.Color.allCases)
        }
        .padding(8)
    }
}
