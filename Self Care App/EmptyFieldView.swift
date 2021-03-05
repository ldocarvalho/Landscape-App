//
//  EmptyFieldView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 05/03/21.
//

import SwiftUI

struct EmptyFieldView: View {
    var body: some View {
        VStack {
            Image("p1")
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
                .frame(width: 250, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            HStack {
                Button(action: {
                }, label: {
                    Text("OK")
                        .foregroundColor(ColorManager.backgroundColor)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(ColorManager.mainButtonColor)
                .cornerRadius(25.0)
            }.padding()
        }
    }
}

struct EmptyFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFieldView()
    }
}
