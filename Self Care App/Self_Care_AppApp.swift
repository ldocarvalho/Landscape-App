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
    @ObservedObject var userSettings = UserSettings()
    var body: some Scene {
        WindowGroup {
            
            if(userSettings.firstUse){
                ContentView().environment(\.managedObjectContext, container.viewContext)
                
            }
            else{
                MainView().environment(\.managedObjectContext, container.viewContext)
            }
           
        }
    }
}
