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
    
    @State var shownEmptyFieldAlert = false
    
    @State var info = false
    
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moment: FetchedResults<Moment>
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    
    var body : some View {
 
        NavigationView{
            GeometryReader { reader in
                ZStack {
                    ColorManager.backgroundColor
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    VStack {
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Cancel")
                                    .foregroundColor(ColorManager.actionButtonColor)
                                    .fontWeight(.medium)
                            }).padding()
                            Spacer()
                            Text("Add new moment")
                                .fontWeight(.bold)
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
                                    
                                    presentationMode.wrappedValue.dismiss()
                                    
                                    do {
                                        try moc.save()
                                    }
                                    catch {
                                    }
                                    
                                }
                                else{
                                    if (momentTitle == "" || partOfDay == 0 || selfCareType == 0 || daysOfWeek == []) {
                                        shownEmptyFieldAlert.toggle()
                                    } else {
                                        let momento = Moment(context: moc)
                                        momento.title = momentTitle
                                        momento.date = Date()
                                        momento.daysOfWeek = Int32(Int(daysOfWeek.rawValue))
                                        momento.partOfTheDay = Int64(partOfDay)
                                        momento.repeatActivity = showDaysOfWeek
                                        momento.selfCareType = Int64(selfCareType)
                                        momento.done = false
                                        
                                        presentationMode.wrappedValue.dismiss()
                                        
                                        do {
                                            try moc.save()
                                        }
                                        catch {
                                        }
                                    }
                                    
                                }
                                // editando
                                //                    moc.performAndWait {
                                //                        moment[0].title? = "editando"
                                //                        try? moc.save()
                                //                    }
                            }, label: {
                                Text("Save")
                                    .foregroundColor(ColorManager.actionButtonColor)
                                    .fontWeight(.bold)
                            }).padding()
                        }.padding(8)
                        .blur(radius: shownEmptyFieldAlert ? 8 : 0)
//                        .opacity(shownEmptyFieldAlert ? 0.3 : 1)
                        
                        ScrollView(.vertical) {
                            VStack {
                                Text("What would you like to care for yourself today?")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorManager.bodyTextColor)
                                    .frame(width: reader.size.width*0.9, height: 50, alignment: .leading)
                                TextField("Type your self care moment here", text: $momentTitle)
                                    .foregroundColor(ColorManager.bodyTextColor)
                                    
                                    .frame(width: reader.size.width*0.9, height: 10, alignment: .leading)
                                    .padding()
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .cornerRadius(15)
                            }.padding(8)
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
                            
                            VStack {
                                Text("In what part of the day would you rather do it?")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorManager.bodyTextColor)
                                    .frame(width: reader.size.width*0.9, height: 50, alignment: .leading)
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
                                Text("Would you like to do it in other days?")
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
                                        Text("In what days of the week would you like to do it?")
                                            .font(.body)
                                            .fontWeight(.bold)
                                            .foregroundColor(ColorManager.bodyTextColor)
                                            .frame(width: reader.size.width*0.9, height: 50, alignment: .leading)
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
                                        }
                                    }
                                }
                                
                                
                            }.padding(showDaysOfWeek ? 8 : 0)
                            
                            VStack {
                                Text("What type of self care are you making?")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorManager.bodyTextColor)
                                    .frame(width: reader.size.width*0.9, height: 50, alignment: .leading)
                                
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
                            NavigationLink(destination: OnboardingViewPage(), isActive: $info) { EmptyView() }
                            Rectangle()
                                .frame(width: 350, height: 40, alignment: .leading)
                                .cornerRadius(25.0)
                                .foregroundColor(ColorManager.switchColor)
                                .overlay(Text("Would you like to know more about self care?").font(.system(size: 16))
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
                }
            }.navigationBarHidden(true)
        }.accentColor(Color("NavigationColor"))
    }
}

struct NewMomentView_Previews: PreviewProvider {
    static var previews: some View {
        NewMomentView(itsEditing: false, id: 0)
    }
}


