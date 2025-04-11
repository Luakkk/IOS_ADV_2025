//
//  _assignmentApp.swift
//  6assignment
//
//  Created by Alua Smanova on 11.04.2025.
//

import SwiftUI

@main
struct _assignmentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
