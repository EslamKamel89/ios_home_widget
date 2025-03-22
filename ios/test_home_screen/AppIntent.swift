//
//  AppIntent.swift
//  test_home_screen
//
//  Created by eslam kamel on 20/03/2025.
//

import WidgetKit
import AppIntents

@available(iOS 16.0, *)
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
    
    func perform() async -> some IntentResult {
            return .result()
        }
}
