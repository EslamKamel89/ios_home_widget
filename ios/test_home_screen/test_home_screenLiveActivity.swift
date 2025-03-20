//
//  test_home_screenLiveActivity.swift
//  test_home_screen
//
//  Created by eslam kamel on 20/03/2025.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct test_home_screenAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct test_home_screenLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: test_home_screenAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension test_home_screenAttributes {
    fileprivate static var preview: test_home_screenAttributes {
        test_home_screenAttributes(name: "World")
    }
}

extension test_home_screenAttributes.ContentState {
    fileprivate static var smiley: test_home_screenAttributes.ContentState {
        test_home_screenAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: test_home_screenAttributes.ContentState {
         test_home_screenAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: test_home_screenAttributes.preview) {
   test_home_screenLiveActivity()
} contentStates: {
    test_home_screenAttributes.ContentState.smiley
    test_home_screenAttributes.ContentState.starEyes
}
