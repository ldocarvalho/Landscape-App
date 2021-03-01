//
//  ContentView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 25/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var userName: String = ""
    var body: some View {
        VStack {
            VStack {
                Text("Qual o seu nome?")
                    .padding()
                TextField("", text: $userName).frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(15)
            }
            Button(action: {
                //colocar ação aqui
               print("a \(userName)")
            }) {
                VStack{
                    Text("Continuar")
                    
                }
                
            }.frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        ContentView()
    }
}
