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
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moment: FetchedResults<Moment>
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    
    var body : some View {
 
        GeometryReader { reader in
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
                            moment[id].repeatActivity = false
                            moment[id].selfCareType = Int64(selfCareType)
                            presentationMode.wrappedValue.dismiss()
                        }
                        else{
                            let momento = Moment(context: moc)
                            momento.title = momentTitle
                            momento.date = Date()
                            momento.daysOfWeek = Int32(Int(daysOfWeek.rawValue))
                            momento.partOfTheDay = Int64(partOfDay)
                            momento.repeatActivity = false
                            momento.selfCareType = Int64(selfCareType)
                            presentationMode.wrappedValue.dismiss()
                            
                        }
                        do{
                            try moc.save()
                        }
                        catch{
                            
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
                
                ScrollView(.vertical) {
                    VStack {
                        Text("What would you like to care for yourself today?")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(ColorManager.bodyTextColor)
                            .frame(width: reader.size.width*0.9, height: 50, alignment: .leading)
                        TextField("Type your self care moment here", text: $momentTitle)
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
                                didTapSunday = true
                            }
                            else if (daysOfWeek.contains(.monday)){
                                didTapMonday.toggle()
                            }
                            else if (daysOfWeek.contains(.thuesday)){
                                didTapThuesday.toggle()
                            }
                            else if (daysOfWeek.contains(.thursday)){
                                didTapThursday.toggle()
                            }
                            else if (daysOfWeek.contains(.wednesday)){
                                didTapWednesday.toggle()
                            }
                            else if (daysOfWeek.contains(.friday)){
                                didTapFriday.toggle()
                            }
                            else if (daysOfWeek.contains(.saturday)){
                                didTapSaturday.toggle()
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
                                Image("ButtonMorning")
                                    .resizable()
                                    .frame(width: 100/*@END_MENU_TOKEN@*/, height: 110, alignment: /*@START_MENU_TOKEN@*/.center)
                                    .cornerRadius(25)
                               // Text("Morning")
                            }.padding()
                            .opacity( didTapMornig ? 1 : 0.3)
                            .onTapGesture {
                                partOfDay = 1
                                if(partOfDay == 1){
                                    didTapMornig = true
                                    didTapAfternoon = false
                                    didTapNight = false
                                }
                                
                                
                            }
                            
                            VStack {
                                Image("ButtonAfternoon")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(25)
                            }.opacity(didTapAfternoon ? 1 : 0.3)
                            .onTapGesture {
                                partOfDay = 2
                                if(partOfDay == 2){
                                    didTapMornig = false
                                    didTapAfternoon = true
                                    didTapNight = false
                                }
                                
                            }
                            VStack {
                                Image("ButtonNight")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(25)
                            }.padding()
                            .opacity( didTapNight ? 1 : 0.3)
                            .onTapGesture {
                                partOfDay = 3
                                if(partOfDay == 3){
                                    didTapMornig = false
                                    didTapAfternoon = false
                                    didTapNight = true
                                }
                                
                            }
                        }.frame(width: reader.size.width*0.9, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }.padding(8)
                    
                    VStack {
                        Text("In what days of the week would you like to do it?")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(ColorManager.bodyTextColor)
                            .frame(width: reader.size.width*0.9, height: 50, alignment: .leading)

                        HStack {
                            Circle()
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(didTapSunday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                .overlay(Text("D"))
                                .onTapGesture {
                                   
                                    daysOfWeek.toogle(.sunday)
                                    didTapSunday.toggle()
                                    
                                }
                            Circle()
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(didTapMonday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                .overlay(Text("S"))
                                .onTapGesture {
                                    daysOfWeek.toogle(.monday)
                                    didTapMonday.toggle()
                                }
                            Circle()
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(didTapThuesday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                .overlay(Text("T"))
                                .onTapGesture {
                                    daysOfWeek.toogle(.thuesday)
                                    didTapThuesday.toggle()
                                }
                            Circle()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(didTapWednesday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                .overlay(Text("Q"))
                                .onTapGesture {
                                    daysOfWeek.toogle(.wednesday)
                                    didTapWednesday.toggle()
                                }
                            Circle()
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(didTapThursday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                .overlay(Text("Q"))
                                .onTapGesture {
                                    daysOfWeek.toogle(.thursday)
                                    didTapThursday.toggle()
                                }
                            Circle()
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(didTapFriday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                .overlay(Text("S"))
                                .onTapGesture {
                                    daysOfWeek.toogle(.friday)
                                    didTapFriday.toggle()
                                }
                            Circle()
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(didTapSaturday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                                .overlay(Text("S"))
                                .onTapGesture {
                                    daysOfWeek.toogle(.saturday)
                                    didTapSaturday.toggle()
                                }
                        }
                    }.padding(8)
                    
                    VStack {
                        Text("What type of self care are you making?")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(ColorManager.bodyTextColor)
                            .frame(width: reader.size.width*0.9, height: 50, alignment: .leading)

                        HStack {
                            VStack {
                                Image("IndividualImage")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .opacity(didTapIndividual ? 1 : 0.3)
                                    .cornerRadius(25)
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
                                Image("ImageSocial")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .opacity(didTapSocial ? 1 : 0.3)
                                    .cornerRadius(25)
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
                                Image("ImageHobby")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(25)
                                    .opacity(didTapHobbys ? 1 : 0.3)
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
                        }.frame(width: reader.size.width*0.9, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }.padding(8)
                    
                    Rectangle()
                        .frame(width: 350, height: 40, alignment: .leading)
                        .cornerRadius(25.0)
                        .foregroundColor(ColorManager.switchColor)
                        .overlay(Text("Would you like to know more about self care?").font(.system(size: 16)).foregroundColor(ColorManager.bodyTextColor).fontWeight(.medium))
                        .padding(8)
                }
                
                Spacer()
            }.frame(width: reader.size.width, height: reader.size.height, alignment: .center)
            
        }
    }
}

struct NewMomentView_Previews: PreviewProvider {
    static var previews: some View {
        NewMomentView(itsEditing: false, id: 0)
    }
}


