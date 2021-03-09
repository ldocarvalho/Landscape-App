//
//  Self_Care_AppApp.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 25/02/21.
//

import SwiftUI

@main
struct Self_Care_AppApp: App {
    let container = PersistenceController().container
//    @FetchRequest(entity:Name.entity() , sortDescriptors: []) var nome : FetchedResults<Name>
//    @ObservedObject var userSettings = UserSettings()
    
    init() {
        print(PersistenceController().fetchMoments())
    }
    
    var body: some Scene {
        WindowGroup {
//            if(nome.count <= 0){
//                ContentView().environment(\.managedObjectContext, container.viewContext)
//
//            }
//
//            else{
//                MainView().environment(\.managedObjectContext, container.viewContext)
//            }
            ContentView().environment(\.managedObjectContext, container.viewContext)
        }
    }
}
