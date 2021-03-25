//
//  NewMomentView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 01/03/21.
//

import SwiftUI

struct NewMomentView : View {
    
    @State var itsEditing : Bool
    @State var id : Int
    @State var momentTitle = ""
    @State var selfCareType = 0
    @State var partOfDay = 0
    @State var daysOfWeek : WeekDays = []
    @State private var didTapSunday :Bool = true
    @State private var didTapMonday :Bool = true
    @State private var didTapThuesday :Bool = true
    @State private var didTapWednesday :Bool = true
    @State private var didTapThursday :Bool = true
    @State private var didTapFriday :Bool = true
    @State private var didTapSaturday :Bool = true
    @State private var didTapMornig :Bool = true
    @State private var didTapAfternoon :Bool = true
    @State private var didTapNight :Bool = true
    @State private var didTapIndividual :Bool = true
    @State private var didTapSocial :Bool = true
    @State private var didTapHobbys :Bool = true
    
    @State var showDaysOfWeek : Bool = false
    
    @State var showCharactersMessage: Bool = false
    
    @State var shownEmptyFieldAlert = false
    
    @State var info = false
    @State var infoBack = true
    
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moment: FetchedResults<Moment>
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    
    var body : some View {
 
        NavigationView{
            GeometryReader { reader in
                ZStack {
                    ColorManager.backgroundColor
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                     
                        NavigationLink(destination: OnboardingViewPage(), isActive: $info) { EmptyView() }
                    

                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text(LocalizedStringKey("NewMoment-Button1"))
                                    .foregroundColor(ColorManager.actionButtonColor)
                                    .fontWeight(.medium)
                            }).padding()
                            Spacer()
                            Text(LocalizedStringKey("NewMoment-Label-1"))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(ColorManager.bodyTextColor)
                            Spacer()
                            
                            Button(action: {
                                if(itsEditing){
                                    moment[id].title = momentTitle
                                    moment[id].daysOfWeek = Int32(daysOfWeek.rawValue)
                                    moment[id].partOfTheDay = Int64(partOfDay)
                                    moment[id].repeatActivity = showDaysOfWeek
                                    moment[id].selfCareType = Int64(selfCareType)
                                    moment[id].done = false
                                    
                                   
                                    
                                    do {
                                        try moc.save()
                                    }
                                    catch {
                                    }
                                    presentationMode.wrappedValue.dismiss()
                                }
                                else{
                                    if (momentTitle == "" || partOfDay == 0 || selfCareType == 0 || (daysOfWeek == [] && showDaysOfWeek)) {
                                        shownEmptyFieldAlert.toggle()
                                    } else {
                                        let momento = Moment(context: moc)
                                        momento.title = momentTitle
                                        momento.date = Date()
                                        if(showDaysOfWeek){
                                            momento.daysOfWeek = Int32(Int(daysOfWeek.rawValue))
                                        }
                                        else{
                                            ProgressOfTheDay()
                                            momento.daysOfWeek = Int32(Int(daysOfWeek.rawValue))
                                        }
                                        
                                        momento.partOfTheDay = Int64(partOfDay)
                                        momento.repeatActivity = showDaysOfWeek
                                        momento.selfCareType = Int64(selfCareType)
                                        momento.done = false
                                        
                                       
                                        
                                        do {
                                            scheduleNotifications(hour: 12, weekday: NextDay(), repeats: false)
                                            try moc.save()
                                            
                                        }
                                        catch {
                                        }
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                    
                                }
                                // editando
                                //                    moc.performAndWait {
                                //                        moment[0].title? = "editando"
                                //                        try? moc.save()
                                //                    }
                            }, label: {
                                Text(LocalizedStringKey("NewMoment-Button2"))
                                    .foregroundColor(ColorManager.actionButtonColor)
                                    .fontWeight(.bold)
                            }).padding()
                        }.padding(8)
                        .blur(radius: shownEmptyFieldAlert ? 8 : 0)
//                        .opacity(shownEmptyFieldAlert ? 0.3 : 1)
                        
                        ScrollView(.vertical) {
                            VStack {
                                Text(LocalizedStringKey("Onboarding-2-Label-Question"))
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorManager.bodyTextColor)
                                    .frame(width: reader.size.width*0.9, height: 70, alignment: .leading)
                                TextField(LocalizedStringKey("Onboarding-2-Placeholder-Name"), text: $momentTitle)
                                    .onChange(of: self.momentTitle, perform: { value in
                                        if value.count >= 25 {
                                            self.momentTitle = String(value.prefix(25))
                                            showCharactersMessage = true
                                        } else {
                                            showCharactersMessage = false
                                        }
                                    })
                                    .foregroundColor(ColorManager.bodyTextColor)
                                    .frame(width: reader.size.width*0.9, height: 10, alignment: .leading)
                                    .padding()
                                    .textFieldStyle(CircularTextFieldStyle())
                                    .cornerRadius(15)
                            }
                            .padding([.leading, .trailing, .top], 8)
                            .padding(.bottom, 4)
                            .onAppear() {
                                if (itsEditing) {
                                    momentTitle = moment[id].title!
                                    selfCareType = Int(moment[id].selfCareType)
                                    partOfDay = Int(moment[id].partOfTheDay)
                                    daysOfWeek = WeekDays(rawValue: Int(moment[id].daysOfWeek))
                                    showDaysOfWeek = moment[id].repeatActivity
                                    //comparando part do dia
                                    if(partOfDay == 1){
                                        didTapMornig = true
                                        didTapAfternoon = false
                                        didTapNight = false
                                    }
                                    else if(partOfDay == 2){
                                        didTapMornig = false
                                        didTapAfternoon = true
                                        didTapNight = false
                                    }
                                    else if(partOfDay == 3){
                                        didTapMornig = false
                                        didTapAfternoon = false
                                        didTapNight = true
                                    }
                                    // comparando cuidado
                                    if(selfCareType == 1){
                                        didTapSocial = false
                                        didTapHobbys = false
                                        didTapIndividual = true
                                    }
                                    else if(selfCareType == 2){
                                        didTapSocial = true
                                        didTapHobbys = false
                                        didTapIndividual = false
                                    }
                                    else if(selfCareType == 3){
                                        didTapSocial = false
                                        didTapHobbys = true
                                        didTapIndividual = false
                                    }
                                    // vendo das da semana
                                    
                                    if (daysOfWeek.contains(.sunday)){
                                        didTapSunday = false
                                    }
                                    if (daysOfWeek.contains(.monday)){
                                        didTapMonday = false
                                    }
                                    if (daysOfWeek.contains(.thuesday)){
                                        didTapThuesday = false
                                    }
                                    if (daysOfWeek.contains(.thursday)){
                                        didTapThursday = false
                                    }
                                    if (daysOfWeek.contains(.wednesday)){
                                        didTapWednesday = false
                                    }
                                    if (daysOfWeek.contains(.friday)){
                                        didTapFriday = false
                                    }
                                    if (daysOfWeek.contains(.saturday)){
                                        didTapSaturday = false
                                    }
                                }
                            }
                            
                            if showCharactersMessage {
                                withAnimation {
                                    VStack {
                                        Text(LocalizedStringKey("Characters"))
                                            .font(.system(size: 14))
                                            .foregroundColor(ColorManager.actionButtonColor)
                                    }
                                    .frame(width: reader.size.width*0.9, height: 10, alignment: .leading)
                                }
                            }
                            
                            VStack {
                                Text(LocalizedStringKey("Onboarding-3-Label-Question"))
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorManager.bodyTextColor)
                                    .frame(width: reader.size.width*0.9, height: 70, alignment: .leading)
                                HStack {
                                    VStack {
                                        Image("iOS-MorningIcon")
                                            .resizable()
                                            .frame(width: 96/*@END_MENU_TOKEN@*/, height: 112, alignment: /*@START_MENU_TOKEN@*/.center)
                                            .cornerRadius(15)
                                        // Text("Morning")
                                    }.padding()
                                    .opacity( didTapMornig ? 1 : 0.4)
                                    .onTapGesture {
                                        partOfDay = 1
                                        if(partOfDay == 1){
                                            didTapMornig = true
                                            didTapAfternoon = false
                                            didTapNight = false
                                        }
                                        
                                        
                                    }
                                    
                                    VStack {
                                        Image("iOS-AfternoonIcon")
                                            .resizable()
                                            .frame(width: 96, height: 112, alignment: .center)
                                            .cornerRadius(15)
                                    }.opacity(didTapAfternoon ? 1 : 0.4)
                                    .onTapGesture {
                                        partOfDay = 2
                                        if(partOfDay == 2){
                                            didTapMornig = false
                                            didTapAfternoon = true
                                            didTapNight = false
                                        }
                                        
                                    }
                                    VStack {
                                        Image("iOS-EveningIcon")
                                            .resizable()
                                            .frame(width: 96, height: 112, alignment: .center)
                                            .cornerRadius(15)
                                    }.padding()
                                    .opacity( didTapNight ? 1 : 0.4)
                                    .onTapGesture {
                                        partOfDay = 3
                                        if(partOfDay == 3){
                                            didTapMornig = false
                                            didTapAfternoon = false
                                            didTapNight = true
                                        }
                                        
                                    }
                                }.frame(width: reader.size.width*0.9, height: 110, alignment: .center)
                            }.padding(8)
                            
                            HStack {
                                Text(LocalizedStringKey("Onboarding-4-Label-Question1"))
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorManager.bodyTextColor)
                                Spacer()
                                Toggle("", isOn: $showDaysOfWeek)
                                    .toggleStyle(SwitchToggleStyle(tint: ColorManager.switchColor))
                                    .frame(width: 40)
                            }.frame(width: reader.size.width*0.9, height: 60, alignment: .leading)
                            .padding(.top, 10)
                            .padding([.leading, .trailing], 10)
                            
                           
                            VStack {
                                if showDaysOfWeek {
                                    withAnimation {
                                        Text(LocalizedStringKey("Onboarding-4-Label-Question2"))
                                            .font(.body)
                                            .fontWeight(.bold)
                                            .foregroundColor(ColorManager.bodyTextColor)
                                            .frame(width: reader.size.width*0.9, height: 70, alignment: .leading)
                                    }
                                }
                                
                                if showDaysOfWeek {
                                    withAnimation {
                                        HStack {
                                            Circle()
                                                .frame(width: 40, height: 40, alignment: .center)
                                                .foregroundColor(didTapSunday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                                .overlay(Text("S")
                                                            .foregroundColor(ColorManager.daysOfWeekColor)
                                                            .fontWeight(.medium))
                                                .onTapGesture {
                                                    if (daysOfWeek.contains(.sunday)){
                                                        daysOfWeek.remove(.sunday)
                                                    }
                                                    else{
                                                        daysOfWeek.insert(.sunday)
                                                    }
                                                    didTapSunday.toggle()
                                                    
                                                }
                                            Circle()
                                                .frame(width: 40, height: 40, alignment: .center)
                                                .foregroundColor(didTapMonday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                                .overlay(Text("M")
                                                            .foregroundColor(ColorManager.daysOfWeekColor)
                                                            .fontWeight(.medium))
                                                .onTapGesture {
                                                    if (daysOfWeek.contains(.monday)){
                                                        daysOfWeek.remove(.monday)
                                                    }
                                                    else{
                                                        daysOfWeek.insert(.monday)
                                                    }
                                                    didTapMonday.toggle()
                                                }
                                            Circle()
                                                .frame(width: 40, height: 40, alignment: .center)
                                                .foregroundColor(didTapThuesday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                                .overlay(Text("T")
                                                            .foregroundColor(ColorManager.daysOfWeekColor)
                                                            .fontWeight(.medium))
                                                .onTapGesture {
                                                    if (daysOfWeek.contains(.thuesday)){
                                                        daysOfWeek.remove(.thuesday)
                                                    }
                                                    else{
                                                        daysOfWeek.insert(.thuesday)
                                                    }
                                                    didTapThuesday.toggle()
                                                }
                                            Circle()
                                                .frame(width: 40, height: 40, alignment: .center)
                                                .foregroundColor(didTapWednesday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                                .overlay(Text("W")
                                                            .foregroundColor(ColorManager.daysOfWeekColor)
                                                            .fontWeight(.medium))
                                                .onTapGesture {
                                                    if (daysOfWeek.contains(.wednesday)){
                                                        daysOfWeek.remove(.wednesday)
                                                    }
                                                    else{
                                                        daysOfWeek.insert(.wednesday)
                                                    }
                                                    didTapWednesday.toggle()
                                                }
                                            Circle()
                                                .frame(width: 40, height: 40, alignment: .center)
                                                .foregroundColor(didTapThursday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                                .overlay(Text("T")
                                                            .foregroundColor(ColorManager.daysOfWeekColor)
                                                            .fontWeight(.medium))
                                                .onTapGesture {
                                                    if (daysOfWeek.contains(.thursday)){
                                                        daysOfWeek.remove(.thursday)
                                                    }
                                                    else{
                                                        daysOfWeek.insert(.thursday)
                                                    }
                                                    didTapThursday.toggle()
                                                }
                                            Circle()
                                                .frame(width: 40, height: 40, alignment: .center)
                                                .foregroundColor(didTapFriday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                                .overlay(Text("F")
                                                            .foregroundColor(ColorManager.daysOfWeekColor)
                                                            .fontWeight(.medium))
                                                .onTapGesture {
                                                    if (daysOfWeek.contains(.friday)){
                                                        daysOfWeek.remove(.friday)
                                                    }
                                                    else{
                                                        daysOfWeek.insert(.friday)
                                                    }
                                                    didTapFriday.toggle()
                                                }
                                            Circle()
                                                .frame(width: 40, height: 40, alignment: .center)
                                                .foregroundColor(didTapSaturday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                                .overlay(Text("S")
                                                            .foregroundColor(ColorManager.daysOfWeekColor)
                                                            .fontWeight(.medium))
                                                .onTapGesture {
                                                    if (daysOfWeek.contains(.saturday)){
                                                        daysOfWeek.remove(.saturday)
                                                    }
                                                    else{
                                                        daysOfWeek.insert(.saturday)
                                                    }
                                                    didTapSaturday.toggle()
                                                }
                                        }.onAppear(perform: {
                                            if showDaysOfWeek && !itsEditing{
                                                didTapSunday = true
                                                didTapMonday = true
                                                didTapThuesday = true
                                                didTapWednesday = true
                                                didTapThursday = true
                                                didTapFriday = true
                                                didTapSaturday = true
                                            }
                                        })
                                    }
                                }
                                
                                
                            }.padding(showDaysOfWeek ? 8 : 0)
                            
                            VStack {
                                Text(LocalizedStringKey("Onboarding-5-Label-Question"))
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorManager.bodyTextColor)
                                    .frame(width: reader.size.width*0.9, height: 70, alignment: .leading)
                                
                                HStack {
                                    VStack {
                                        Image("iOS-PersonalIcon")
                                            .resizable()
                                            .frame(width: 96/*@END_MENU_TOKEN@*/, height: 112, alignment: /*@START_MENU_TOKEN@*/.center)
                                            .opacity(didTapIndividual ? 1 : 0.4)
                                            .cornerRadius(15)
                                            .onTapGesture {
                                                selfCareType = 1
                                                if(selfCareType == 1){
                                                    didTapSocial = false
                                                    didTapHobbys = false
                                                    didTapIndividual = true
                                                }
                                                
                                            }
                                        //Text("Individual")
                                    }.padding()
                                    Spacer()
                                    VStack {
                                        Image("iOS-SocialIcon")
                                            .resizable()
                                            .frame(width: 96, height: 112, alignment: .center)
                                            .opacity(didTapSocial ? 1 : 0.4)
                                            .cornerRadius(15)
                                            .onTapGesture {
                                                selfCareType = 2
                                                if(selfCareType == 2){
                                                    didTapSocial = true
                                                    didTapHobbys = false
                                                    didTapIndividual = false
                                                }
                                                
                                            }
                                        //Text("Social")
                                    }
                                    Spacer()
                                    VStack {
                                        Image("iOS-PhysicalIcon")
                                            .resizable()
                                            .frame(width: 96, height: 112, alignment: .center)
                                            .cornerRadius(15)
                                            .opacity(didTapHobbys ? 1 : 0.4)
                                            .onTapGesture {
                                                selfCareType = 3
                                                if(selfCareType == 3){
                                                    didTapSocial = false
                                                    didTapHobbys = true
                                                    didTapIndividual = false
                                                }
                                                
                                            }
                                        //Text("Hobby")
                                    }.padding()
                                }.frame(width: reader.size.width*0.9, height: 110, alignment: .center)
                            }.padding(8)
                            
                           
                            
                            
                            Rectangle()
                                .frame(width: 350, height: 40, alignment: .leading)
                                .cornerRadius(25.0)
                                .foregroundColor(ColorManager.switchColor)
                                .overlay(Text(LocalizedStringKey("NewMoment-Label-Question")).font(.system(size: 16))
                                .foregroundColor(ColorManager.daysOfWeekColor)
                                .fontWeight(.medium))
                                .padding([.top, .bottom], 12)
                                .padding(8)
                                .onTapGesture {
                                    info.toggle()
                                    
                                }
                        }
                        .blur(radius: shownEmptyFieldAlert ? 8 : 0)
//                        .opacity(shownEmptyFieldAlert ? 0.3 : 1)

                        
                        Spacer()
                    }.frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                    
                    if shownEmptyFieldAlert {
                        EmptyFieldView(shown: $shownEmptyFieldAlert)
                            .offset(y: 0)
                    }
                }.onTapGesture {
                    hideKeyboard()
                }
            }.navigationBarHidden(true)
            .onTapGesture {
                hideKeyboard()
            }
        }.accentColor(Color("NavigationColor"))
        .onTapGesture {
            hideKeyboard()
        }
    }
    func ProgressOfTheDay(){
        let weekday = Calendar.current.component(.weekday, from: Date())
        switch(weekday){
        case 1:
            daysOfWeek.insert(.sunday)
        case 2:
            daysOfWeek.insert(.monday)
        case 3:
            daysOfWeek.insert(.thuesday)
        case 4:
            daysOfWeek.insert(.wednesday)
        case 5:
            daysOfWeek.insert(.thursday)
        case 6:
            daysOfWeek.insert(.friday)
        case 7:
            daysOfWeek.insert(.saturday)
        default:
                daysOfWeek.insert(.sunday)
            
        }
    }
}
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
struct NewMomentView_Previews: PreviewProvider {
    static var previews: some View {
        NewMomentView(itsEditing: false, id: 0)
    }
}


