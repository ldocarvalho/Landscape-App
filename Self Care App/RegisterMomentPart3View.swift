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
    
    @State private var didTapIndividual :Bool = true
    @State private var didTapSocial :Bool = true
    @State private var didTapHobbys :Bool = true

  
    var body: some View {
        GeometryReader { reader in
            NavigationView {
                ZStack {
                    ColorManager.backgroundColor
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
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
                                .frame(width: reader.size.width*0.9, height: 60, alignment: .leading)
                            HStack {
                                VStack {
                                    Image("iOS-PersonalIcon")
                                        .resizable()
                                        .frame(width: 96, height: 112, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(15)
                                }
                                .opacity(didTapIndividual ? 1 : 0.4)
                                .cornerRadius(15)
                                .onTapGesture {
                                    typeOfCare = 1
                                    if(typeOfCare == 1){
                                        didTapSocial = false
                                        didTapHobbys = false
                                        didTapIndividual = true
                                    }
                                    
                                }
                                Spacer()
                                VStack {
                                    Image("iOS-SocialIcon")
                                        .resizable()
                                        .frame(width: 96, height: 112, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(15)
                                }.padding()
                                .opacity(didTapSocial ? 1 : 0.4)
                                .cornerRadius(15)
                                .onTapGesture {
                                    typeOfCare = 2
                                    if(typeOfCare == 2){
                                        didTapSocial = true
                                        didTapHobbys = false
                                        didTapIndividual = false
                                    }
                                    
                                }
                                Spacer()
                                VStack {
                                    Image("iOS-PhysicalIcon")
                                        .resizable()
                                        .frame(width: 96, height: 112, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(15)
                                }
                                .opacity(didTapHobbys ? 1 : 0.4)
                                .onTapGesture {
                                    typeOfCare = 3
                                    if(typeOfCare == 3){
                                        didTapSocial = false
                                        didTapHobbys = true
                                        didTapIndividual = false
                                    }
                                    
                                }
                            }.frame(width: reader.size.width*0.8, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }.padding([.leading, .trailing, .top], 16)
                        
                        Spacer()
                        
                    }.frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                }
                
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
