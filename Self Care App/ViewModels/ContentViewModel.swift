//
//  ContentViewModel.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 26/04/21.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Environment(\.managedObjectContext) var userNameData
    @FetchRequest(entity:Name.entity() , sortDescriptors: []) var nome : FetchedResults<Name>
    
    @Published public var userName: String = ""
    @Published public var View: Bool = false
    @Published public var shownEmptyFieldAlert: Bool = false
    
    var name: String {
        return userName
    }
    
    var nextView: Bool {
        return View
    }
    
    var shownAlert: Bool {
        return shownEmptyFieldAlert
    }
    
    func saveName() {
        if(userName.isEmpty) {
            shownEmptyFieldAlert.toggle()
        } else {
            if nome.count > 0{
                userNameData.delete(nome[0])
                    do{
                        try userNameData.save()
                    }
                    catch{ }
            }
            
            let user = Name(context: userNameData)
            user.name = self.userName
            do {
                try userNameData.save()
            }
            catch { print("error") }
            View = true
        }
    }
}
