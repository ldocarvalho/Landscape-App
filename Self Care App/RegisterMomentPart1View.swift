//
//  RegisterMomentPart1View.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct RegisterMomentPart1View: View {
    
    @Binding var momentTitle: String
    @State var name: String
    
    var body: some View {
        GeometryReader { reader in
            NavigationView {
                VStack() {
                    VStack() {
                        Text("Hi, " + name + "!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(ColorManager.bodyTextColor)
                            .padding(.bottom, 8)
                        Text("What about adding a new self care moment in your routine?")
                            .font(.body)
                            .fontWeight(.medium)
                            .padding([.bottom, .leading, .trailing], 16)
                            .multilineTextAlignment(.center)
                            .foregroundColor(ColorManager.titleTextColor)
                    }
                    VStack {
                        Text("What would you like to do to take care of yourself today?")
                            .foregroundColor(ColorManager.bodyTextColor)
                            .fontWeight(.bold)
                        TextField("Type your self care moment here", text: $momentTitle)
                            .frame(width: reader.size.width*0.9, height: 60, alignment: .center)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(15)
                    }.padding([.leading, .trailing], 16)
                    .padding(.top, 50)
                    
//                    Button(action: {
//                        
//                    }, label: {
//                        Text("Continue")
//                            .foregroundColor(.white)
//                            .fontWeight(.bold)
//                    }).frame(width: reader.size.width*0.4, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                    .background(ColorManager.mainButtonColor)
//                    .cornerRadius(25.0)
//                    .padding(.top, 25)
                    
                    Spacer()
                    
                }.frame(width: reader.size.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    func getName() -> String{
        return momentTitle
    }
}

struct RegisterMomentPart1View_Previews: PreviewProvider {
    @State static var teste = ""
    
    static var previews: some View {
        RegisterMomentPart1View(momentTitle: $teste, name: "Lorena")
    }
}
