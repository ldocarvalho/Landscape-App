//
//  Self_Care_AppApp.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 25/02/21.
//

import SwiftUI

@main
struct Self_Care_AppApp: App {
    let container = PersistenceController.shared.container
    var body: some Scene {
        WindowGroup {
          ContentView().environment(\.managedObjectContext, container.viewContext)
        }
    }
}
