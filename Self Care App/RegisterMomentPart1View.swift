//
//  RegisterMomentPart1View.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct RegisterMomentPart1View: View {
    
    @State var momentTitle = ""
    
    var body: some View {
                
        NavigationView {
            VStack(alignment: .center) {
                VStack(alignment: .center) {
                    Text("Hi, Lorena!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(25)
                    Text("What about adding a new self care moment in your routine?")
                        .font(.body)
                        .padding(25)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                }
                VStack {
                    Text("What would you like to do to take care of yourself today?")
                    TextField("Type your self care moment here", text: $momentTitle)
                        .frame(height: 50, alignment: .center)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(15)
                }.padding(25)
                
                Spacer()
            }
        }
    }
}

struct RegisterMomentPart1View_Previews: PreviewProvider {
    static var previews: some View {
        RegisterMomentPart1View()
    }
}
