//
//  HeroRandomizerApp.swift
//  HeroRandomizer
//
//  Created by Alua Smanova on 07.03.2025.
//

import SwiftUI

@main
struct HeroRandomizerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
