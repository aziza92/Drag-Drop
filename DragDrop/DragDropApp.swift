//
//  DragDropApp.swift
//  DragDrop
//
//  Created by KARMANI Aziza on 18/09/2023.
//

import SwiftUI

@main
struct DragDropApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(CitiesViewModel())
        }
    }
}
