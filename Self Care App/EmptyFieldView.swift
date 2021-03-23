//
//  EmptyFieldView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 05/03/21.
//

import SwiftUI

struct EmptyFieldView: View {
    
    @Binding var shown: Bool
    
    var body: some View {
        VStack {
            Image("DeleteIcon")
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top, 8)
            Text(LocalizedStringKey("EmptyFieldAlert-Title"))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .font(.title2)
                .foregroundColor(ColorManager.titleTextColor)
                .frame(width: 280, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(LocalizedStringKey("EmptyFieldAlert-Body"))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(ColorManager.bodyTextColor)
                .font(.body)
                .frame(width: 280, height: 80, alignment: .center)
            
            HStack {
                Button(action: {
                    shown.toggle()
                }, label: {
                    Text(LocalizedStringKey("EmptyFieldAlert-Button"))
                        .foregroundColor(ColorManager.textColorMainButton)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(ColorManager.mainButtonColor)
                .cornerRadius(25.0)
            }.padding()
        }
        .frame(width: 350, height: 370, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(ColorManager.backgroundColor)
        .cornerRadius(30.0)
        .clipped()
    }
}

struct EmptyFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFieldView(shown: .constant(false))
    }
}
