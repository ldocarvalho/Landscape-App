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
    @FetchRequest(entity:Name.entity() , sortDescriptors: []) var nome : FetchedResults<Name>
    @ObservedObject var userSettings = UserSettings()
    var body: some Scene {
        WindowGroup {
            if(nome.count <= 0){
                ContentView().environment(\.managedObjectContext, container.viewContext)
                   
            }
            
            else{
                MainView().environment(\.managedObjectContext, container.viewContext)
            }
           
        }
    }
}
