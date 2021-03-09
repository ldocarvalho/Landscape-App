//
//  RegisterMomentPart3View.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct RegisterMomentPart3View: View {
    @Binding var typeOfCare : Int
    @State var name : String
  
    var body: some View {
        GeometryReader { reader in
            NavigationView {
                VStack() {
                    VStack(alignment: .center) {
                        Text("Hi, " + name + "!")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom, 8)
                            .foregroundColor(ColorManager.bodyTextColor)
                        Text("What about adding a new self care moment in your routine?")
                            .font(.body)
                            .fontWeight(.medium)
                            .padding([.bottom, .leading, .trailing], 16)
                            .multilineTextAlignment(.center)
                            .foregroundColor(ColorManager.titleTextColor)
                    }
                    
                    VStack {
                        Text("What type of self care are you making?")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(ColorManager.bodyTextColor)
                            .frame(width: reader.size.width*0.9, height: 30, alignment: .leading)
                        HStack {
                            VStack {
                                Image("IndividualImage")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(25)
                            }
                            .onTapGesture {
                                typeOfCare = 1
                            }
                            Spacer()
                            VStack {
                                Image("ImageSocial")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(25)
                            }.onTapGesture {
                                typeOfCare = 2
                            }
                            Spacer()
                            VStack {
                                Image("ImageHobby")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(25)
                            }
                            .onTapGesture {
                                typeOfCare = 3
                            }
                        }.frame(width: reader.size.width*0.9, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }.padding([.leading, .trailing, .top], 16)
                    
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
//                    Spacer()
                }.frame(width: reader.size.width, height: reader.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
}

struct RegisterMomentPart3View_Previews: PreviewProvider {
    @State static var teste = 1
    
    static var previews: some View {
        RegisterMomentPart3View(typeOfCare: $teste, name: "Lorena")
    }
}
