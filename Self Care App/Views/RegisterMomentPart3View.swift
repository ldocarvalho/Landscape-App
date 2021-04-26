//
//  RegisterMomentPart3View.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct RegisterMomentPart3View: View {
    @State var typeOfCare : Int
    @State var name : String
    @State var shownEmptyFieldAlert = false
    @State private var didTapIndividual :Bool = true
    @State private var didTapSocial :Bool = true
    @State private var didTapHobbys :Bool = true
    @State var daysOfWeek : WeekDays
    @State  var partOfTheDay: Int
    @State var momentTitle: String
    @State var showDaysOfWeek :Bool
    @State var View : Bool = false
    @Environment(\.managedObjectContext) var moc
    @Environment(\.managedObjectContext) var moment
    var body: some View {
        GeometryReader { reader in
                ZStack {
                    ColorManager.backgroundColor
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    VStack() {
                        Spacer()
                        VStack(alignment: .center) {
                            Text("Hi, " + name + "!")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.bottom, 8)
                                .foregroundColor(ColorManager.bodyTextColor)
                            Text(LocalizedStringKey("Onboarding-2-Label-Welcome"))
                                .font(.body)
                                .fontWeight(.medium)
                                .padding([.leading, .trailing], 16)
                                .multilineTextAlignment(.center)
                                .foregroundColor(ColorManager.titleTextColor)
                        }.frame(height: 115)
                        .blur(radius: shownEmptyFieldAlert ? 8 : 0)
                        
                        VStack {
                            Text(LocalizedStringKey("Onboarding-5-Label-Question"))
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(ColorManager.bodyTextColor)
                                .multilineTextAlignment(.center)
                                .frame(width: reader.size.width*0.9, height: 70, alignment: .center)
                            HStack {
                                VStack {
                                    Image("iOS-PersonalIcon")
                                        .resizable()
                                        .frame(width: 96, height: 112, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(15)
                                }
                                .padding()
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
                                }
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
                                .padding()
                                .opacity(didTapHobbys ? 1 : 0.4)
                                .onTapGesture {
                                    typeOfCare = 3
                                    if(typeOfCare == 3){
                                        didTapSocial = false
                                        didTapHobbys = true
                                        didTapIndividual = false
                                    }
                                    
                                }
                            }.frame(width: reader.size.width*0.9, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .navigationBarHidden(true)
                            .padding(.top,0)
                        }.padding([.leading, .trailing, .top], 16)
                        .blur(radius: shownEmptyFieldAlert ? 8 : 0)
//                        Spacer()
                        Button(action: {
//                            print(momentTitle)
//                            print(daysOfWeek)
//                            print(partOfTheDay)
//                            print(showDaysOfWeek)
//                            print(typeOfCare)
                            if(typeOfCare == 0){
                                shownEmptyFieldAlert.toggle()
                            }
                            else{
                                let momento = Moment(context: moment)
                                momento.date = Date()
                                momento.daysOfWeek = Int32(daysOfWeek.rawValue)
                                momento.title = momentTitle
                                momento.partOfTheDay = Int64(partOfTheDay)
                                momento.selfCareType =  Int64(typeOfCare)
                                momento.repeatActivity = showDaysOfWeek
                                
                                do{
                                    try  moment.save()
                                }
                                catch{
                                
                                }
                                UserDefaults.standard.set(false, forKey: "isFirtUse")
                                UserDefaults.standard.set(Date(), forKey:"creationTime")
                                View.toggle()
                            }
                            
                            
                        }) {
                            Text(LocalizedStringKey("Onboarding-1-Button-Name"))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }.frame(width: reader.size.width*0.4, height: 40, alignment: .center)
                        .background(ColorManager.mainButtonColor)
                        .cornerRadius(25.0)
                        .padding(.top, 10)
                        NavigationLink(destination: MainView(), isActive: $View) { EmptyView() }
                        Spacer()
                        Image("iOS - OnboardingImage")
                            .resizable()
                            .frame(width: reader.size.width, height: 315, alignment: .bottom)
                            .padding(.bottom, -50)
                    }.blur(radius: shownEmptyFieldAlert ? 8 : 0)
                    .frame(width: reader.size.width, alignment: .center)
                    
                    if shownEmptyFieldAlert {
                        EmptyFieldView(shown: $shownEmptyFieldAlert)
                            .offset(y: 0)
                    }
                }
        }
    }
}

struct RegisterMomentPart3View_Previews: PreviewProvider {
    @State static var teste = 1
    
    static var previews: some View {
        RegisterMomentPart3View(typeOfCare: 1, name: "", daysOfWeek: [], partOfTheDay: 1, momentTitle: "", showDaysOfWeek: false)
    }
}