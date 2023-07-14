//
//  GPT_VIApp.swift
//  GPT VI
//
//  Created by Ethan McRae on 7/14/23.
//

import SwiftUI

@main
struct GPT_VIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
