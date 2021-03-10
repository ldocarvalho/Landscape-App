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
            Text("You cannot save a new moment with empty fields")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .font(.title2)
                .foregroundColor(ColorManager.titleTextColor)
                .frame(width: 250, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Saving a moment requires that all the fields are filled.")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(ColorManager.bodyTextColor)
                .font(.body)
                .frame(width: 250, height: 80, alignment: .center)
            
            HStack {
                Button(action: {
                    shown.toggle()
                }, label: {
                    Text("OK")
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
