//
//  ContentView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 25/02/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var userNameData
    @FetchRequest(entity:Name.entity() , sortDescriptors: []) var nome : FetchedResults<Name>
    @State public var userName: String = ""
    @State var View : Bool = false
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                VStack {
                    Text("Qual o seu nome?")
                        .padding()
                    TextField("", text: $userName).frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(15)
                }
                Button(action: {
                    //colocar ação aqui
                    let user = Name(context: userNameData)
                    user.name = self.userName
                    user.firstUse = true
                    do{
                        try userNameData.save()
                    
                    }
                    catch{
                       print("error")
                    }
                    View = true
                }) {
                    VStack{
                        Text("Continuar")
                        
                    }
                    
                }.frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(15)
                NavigationLink(destination: OnboardingView(), isActive: $View) { EmptyView() }
                Spacer()
            }
            
        }.navigationBarBackButtonHidden(true)
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        ContentView()
    }
}
