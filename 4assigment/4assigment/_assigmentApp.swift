//
//  _assigmentApp.swift
//  4assigment
//
//  Created by Alua Smanova on 25.03.2025.
//

import SwiftUI

@main
struct _assigmentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
