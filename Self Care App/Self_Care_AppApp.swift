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
    let firstUse = UserDefaults.standard.value(forKey: "isFirtUse")
    var body: some Scene {
        WindowGroup {
            if (firstUse ?? true) as! Bool{
                
            }
            else{
                
            }
                ContentView().environment(\.managedObjectContext, container.viewContext)
           
        }
    }
}
