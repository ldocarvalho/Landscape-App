//
//  RegisterMomentPart3View.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct RegisterMomentPart3View: View {
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
                    Text("What type of self care are you making?")
                        .font(.body)
                        .fontWeight(.bold)
                    HStack {
                        VStack {
                            Image("p4")
                                .resizable()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .cornerRadius(25)
                            Text("Individual")
                        }.padding()
                        Spacer()
                        VStack {
                            Image("p4")
                                .resizable()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .cornerRadius(25)
                            Text("Social")
                        }
                        Spacer()
                        VStack {
                            Image("p4")
                                .resizable()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .cornerRadius(25)
                            Text("Hobby")
                        }.padding()
                    }
                }
                Spacer()
            }
        }
    }
}

struct RegisterMomentPart3View_Previews: PreviewProvider {
    static var previews: some View {
        RegisterMomentPart3View()
    }
}
