//
//  SimpleNoteTakingApp.swift
//  SimpleNoteTaking
//
//  Created by Dr.Ash on 19/3/21.
//

import SwiftUI

@main
struct SimpleNoteTakingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
