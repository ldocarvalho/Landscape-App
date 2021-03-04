//
//  DeleteAlertView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 04/03/21.
//

import SwiftUI

struct DeleteAlertView: View {
    var body: some View {
        VStack {
            Image("p1")
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Are you sure you want to delete this moment?")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .font(.title2)
                .foregroundColor(ColorManager.titleTextColor)
                .frame(width: 250, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("This action cannot be undone and this moment will not count on your cicles anymore.")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(ColorManager.bodyTextColor)
                .font(.body)
                .frame(width: 250, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Cancel")
                        .foregroundColor(ColorManager.titleTextColor)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(ColorManager.secondaryButtonColor)
                .cornerRadius(25.0)
                                
                Button(action: {
                    
                }, label: {
                    Text("Delete")
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

struct DeleteAlertView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAlertView()
    }
}
