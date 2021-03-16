//
//  RegisterMomentPart2View.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI


struct RegisterMomentPart2View: View {
    @State  var partOfTheDay: Int
    @State var name: String
    @State var momentTitle: String
    @State private var didTapMornig :Bool = true
    @State private var didTapAfternoon :Bool = true
    @State private var didTapNight :Bool = true
    @State var View : Bool = false
    @State var shownEmptyFieldAlert = false
    var body: some View {
        GeometryReader { reader in
                ZStack {
                    ColorManager.backgroundColor
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    VStack() {
                        Spacer()
                        VStack() {
                            Text("Hi, " + name + "!")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(ColorManager.bodyTextColor)
                                .padding(.bottom, 8)
                            Text("What about adding a new self care moment in your routine?")
                                .font(.body)
                                .fontWeight(.medium)
                                .padding([.leading, .trailing], 16)
                                .multilineTextAlignment(.center)
                                .foregroundColor(ColorManager.titleTextColor)
                        }.frame(height: 115)
                        .blur(radius: shownEmptyFieldAlert ? 8 : 0)
                        VStack {
                            Text("In what part of the day would you rather do it?")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(ColorManager.bodyTextColor)
                                .frame(width: reader.size.width*0.9, height: 60, alignment: .leading)
                            HStack {
                                VStack {
                                    Image("iOS-MorningIcon")
                                        .resizable()
                                        .frame(width: 96, height: 112, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(15)
                                }.padding()
                                .opacity(didTapMornig ? 1 : 0.4)
                                .onTapGesture {
                                    partOfTheDay = 1
                                    if(partOfTheDay == 1){
                                        didTapMornig = true
                                        didTapAfternoon = false
                                        didTapNight = false
                                    }
                                }
                                
                                Spacer()
                                VStack {
                                    Image("iOS-AfternoonIcon")
                                        .resizable()
                                        .frame(width: 96, height: 112, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(15)
                                }.opacity(didTapAfternoon ? 1 : 0.4)
                                .onTapGesture {
                                    partOfTheDay = 2
                                    if(partOfTheDay == 2){
                                        didTapMornig = false
                                        didTapAfternoon = true
                                        didTapNight = false
                                    }
                                }
                                Spacer()
                                VStack {
                                    Image("iOS-EveningIcon")
                                        .resizable()
                                        .frame(width: 96, height: 112, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(15)
                                }.padding()
                                .opacity(didTapNight ? 1 : 0.4)
                                .onTapGesture {
                                    partOfTheDay = 3
                                    if(partOfTheDay == 3){
                                        didTapMornig = false
                                        didTapAfternoon = false
                                        didTapNight = true
                                    }
                                    
                                }
                            }.frame(width: reader.size.width*0.9, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .navigationBarHidden(true)
                            .padding(.top,0)
                        }.padding([.leading, .trailing, .top], 16)
                        .blur(radius: shownEmptyFieldAlert ? 8 : 0)
//                        Spacer
                        Button(action: {
                            if(partOfTheDay == 0){
                                shownEmptyFieldAlert.toggle()
                            }
                            else{
                                View.toggle()
                            }
                        }) {
                            Text("Continue")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }.frame(width: reader.size.width*0.4, height: 40, alignment: .center)
                        .background(ColorManager.mainButtonColor)
                        .cornerRadius(25.0)
                        .padding(.top, 10)
                        
                        NavigationLink(destination: RegisterMomentPart4View(name: name, daysOfWeek: [], partOfTheDay: partOfTheDay, momentTitle: momentTitle, showDaysOfWeek: false, View: false), isActive: $View) { EmptyView() }
                        Spacer()
                        Image("iOS - OnboardingImage")
                            .resizable()
                            .frame(width: reader.size.width, height: 315, alignment: .bottom)
                            .padding(.bottom, -50)
                    }.frame(width: reader.size.width, alignment: .center)
                    .blur(radius: shownEmptyFieldAlert ? 8 : 0)
                    if shownEmptyFieldAlert {
                        EmptyFieldView(shown: $shownEmptyFieldAlert)
                            .offset(y: 0)
                    }
                    
                }
        }
    }
}

struct RegisterMomentPart2View_Previews: PreviewProvider {
    @State static var teste = 1
    
    static var previews: some View {
        RegisterMomentPart2View(partOfTheDay: teste, name: "Lorena", momentTitle: "")
    }
}
