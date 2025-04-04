//
//  _assignmentApp.swift
//  5assignment
//
//  Created by Alua Smanova on 04.04.2025.
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
