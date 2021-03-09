//
//  RegisterMomentPart2View.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI


struct RegisterMomentPart2View: View {
    @Binding  var partOfTheDay: Int
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
                        Text("In what part of the day would you rather do it?")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(ColorManager.bodyTextColor)
                            .frame(width: reader.size.width*0.9, height: 60, alignment: .leading)
                        HStack {
                            VStack {
                                Image("ButtonMorning")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(25)
                            }.padding()
                            .onTapGesture {
                                partOfTheDay = 1
                            }
                            VStack {
                                Image("ButtonAfternoon")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(25)
                            }.onTapGesture {
                                partOfTheDay = 2
                            }
                            VStack {
                                Image("ButtonNight")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(25)
                            }.padding()
                            .onTapGesture {
                                partOfTheDay = 3
                            }
                        }.frame(width: reader.size.width*0.9, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }.padding([.leading, .trailing, .top], 16)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Continue")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }).frame(width: reader.size.width*0.4, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(ColorManager.mainButtonColor)
                    .cornerRadius(25.0)
                    .padding(.top, 25)
                    Spacer()
                }.frame(width: reader.size.width, height: reader.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct RegisterMomentPart2View_Previews: PreviewProvider {
    @State static var teste = 1
    
    static var previews: some View {
        RegisterMomentPart2View(partOfTheDay: $teste, name: "Lorena")
    }
}
