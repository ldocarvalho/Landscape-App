//
//  DoneAlertView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 09/03/21.
//

import SwiftUI

struct DoneAlertView: View {
    
    @Binding var shown: Bool
    
    var body: some View {
        VStack {
            Image("DoneIcon")
                .resizable()
                .frame(width: 55, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top, 8)
            Text(LocalizedStringKey("DoneAlert-Title"))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .font(.title2)
                .foregroundColor(ColorManager.titleTextColor)
                .frame(width: 280, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 8)
            Text(LocalizedStringKey("DoneAlert-Body"))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(ColorManager.bodyTextColor)
                .font(.body)
                .frame(width: 280, alignment: .center)
            
            HStack {
                Button(action: {
                    shown.toggle()
                }, label: {
                    Text(LocalizedStringKey("DoneAlert-Button"))
                        .foregroundColor(ColorManager.textColorMainButton)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(ColorManager.mainButtonColor)
                .cornerRadius(25.0)
            }.padding()
        }
        .frame(width: 350, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(ColorManager.backgroundColor)
        .cornerRadius(30.0)
        .clipped()
    }
}

struct DoneAlertView_Previews: PreviewProvider {
    static var previews: some View {
        DoneAlertView(shown: .constant(false))
    }
}
