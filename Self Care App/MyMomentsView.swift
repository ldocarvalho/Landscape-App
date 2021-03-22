//
//  MyMomentsView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI
import CoreData
struct MyMomentsView: View {
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moment: FetchedResults<Moment>
    @Environment(\.managedObjectContext) var moc
    @State var daysOfWeek : WeekDays = []
    let partOfTheDayImage = ["iOS - PersonalIllustrationMorning","iOS - PersonalIllustrationAfternoon","iOS - PersonalIllustrationEvening"]
    
    let partOfTheDayImages = [["iOS - PersonalIllustrationMorning","iOS - PersonalIllustrationAfternoon","iOS - PersonalIllustrationEvening"], ["iOS - SocialIllustrationMorning","iOS - SocialIllustrationAfternoon","iOS - SocialIllustrationEvening"], ["iOS - PhysicalIllustrationMorning","iOS - PhysicalIllustrationAfternoon","iOS - PhysicalIllustrationEvening"]]
    
    let partOfTheDayImagesDetail = [["iOS - PersonalIllustrationMorningDetail","iOS - PersonalIllustrationAfternoonDetail","iOS - PersonalIllustrationEveningDetail"], ["iOS - SocialIllustrationMorningDetail","iOS - SocialIllustrationAfternoonDetail","iOS - SocialIllustrationEveningDetail"], ["iOS - PhysicalIllustrationMorningDetail","iOS - PhysicalIllustrationAfternoonDetail","iOS - PhysicalIllustrationEveningDetail"]]
    
    @State private var selectedCategory = 0
        
    @State var showModalView : Bool = false
    
    @State var itsEmpty : Bool = false
    
    @State private var didTapSunday :Bool = true
    @State private var didTapMonday :Bool = true
    @State private var didTapThuesday :Bool = true
    @State private var didTapWednesday :Bool = true
    @State private var didTapThursday :Bool = true
    @State private var didTapFriday :Bool = true
    @State private var didTapSaturday :Bool = true
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                ColorManager.backgroundColor
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Picker("Favorite Color", selection: $selectedCategory, content: {
                        Text("Personal").tag(0)
                        Text("Social").tag(1)
                        Text("Physical").tag(2)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .background(ColorManager.segmentColor)
                    .cornerRadius(8.0)
                    .padding(20)
                    .frame(width: reader.size.width*0.95)
                    .sheet(isPresented: self.$showModalView, content: {

                        NewMomentView(itsEditing: false, id: 0)
                    })
                    HStack {
                        Circle()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(didTapSunday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                            .overlay(Text("S")
                                        .foregroundColor(ColorManager.daysOfWeekColor)
                                        .fontWeight(.medium))
                            .onTapGesture {
                                daysOfWeek.formIntersection([])
                           
                                    daysOfWeek.insert(.sunday)
                                    didTapSunday = false
                                    didTapMonday = true
                                    didTapThuesday = true
                                    didTapWednesday = true
                                    didTapThursday = true
                                    didTapFriday = true
                                    didTapSaturday = true
                                
//                                didTapSunday.toggle()

                            }
                        Circle()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(didTapMonday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                            .overlay(Text("M")
                                        .foregroundColor(ColorManager.daysOfWeekColor)
                                        .fontWeight(.medium))
                            .onTapGesture {
                                daysOfWeek.formIntersection([])
                               
                                    daysOfWeek.insert(.monday)
                                    didTapSunday = true
                                    didTapMonday = false
                                    didTapThuesday = true
                                    didTapWednesday = true
                                    didTapThursday = true
                                    didTapFriday = true
                                    didTapSaturday = true
                                
//                                didTapMonday.toggle()
                            }
                        Circle()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(didTapThuesday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                            .overlay(Text("T")
                                        .foregroundColor(ColorManager.daysOfWeekColor)
                                        .fontWeight(.medium))
                            .onTapGesture {
                              
                                daysOfWeek.formIntersection([])
                                
                            
                                    daysOfWeek.insert(.thuesday)
                                    didTapSunday = true
                                    didTapMonday = true
                                    didTapThuesday = false
                                    didTapWednesday = true
                                    didTapThursday = true
                                    didTapFriday = true
                                    didTapSaturday = true
                                
//                                didTapThuesday.toggle()
                            }
                        Circle()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(didTapWednesday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                            .overlay(Text("W")
                                        .foregroundColor(ColorManager.daysOfWeekColor)
                                        .fontWeight(.medium))
                            .onTapGesture {
                                daysOfWeek.formIntersection([])
                                
                                    daysOfWeek.insert(.wednesday)
                                    didTapSunday = true
                                    didTapMonday = true
                                    didTapThuesday = true
                                    didTapWednesday = false
                                    didTapThursday = true
                                    didTapFriday = true
                                    didTapSaturday = true
                                
//                                didTapWednesday.toggle()
                            }
                        Circle()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(didTapThursday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                            .overlay(Text("T")
                                        .foregroundColor(ColorManager.daysOfWeekColor)
                                        .fontWeight(.medium))
                            .onTapGesture {
                                daysOfWeek.formIntersection([])
                              
                                    daysOfWeek.insert(.thursday)
                                    didTapSunday = true
                                    didTapMonday = true
                                    didTapThuesday = true
                                    didTapWednesday = true
                                    didTapThursday = false
                                    didTapFriday = true
                                    didTapSaturday = true
                                
//                                didTapThursday.toggle()
                            }
                        Circle()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(didTapFriday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                            .overlay(Text("F")
                                        .foregroundColor(ColorManager.daysOfWeekColor)
                                        .fontWeight(.medium))
                            .onTapGesture {
                                daysOfWeek.formIntersection([])
                                
                                    daysOfWeek.insert(.friday)
                                    didTapSunday = true
                                    didTapMonday = true
                                    didTapThuesday = true
                                    didTapWednesday = true
                                    didTapThursday = true
                                    didTapFriday = false
                                    didTapSaturday = true
                                
//                                didTapFriday.toggle()
                            }
                        Circle()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(didTapSaturday ? Color("DayButtonColorUnselected") : Color("DayButtonColorSelected"))
                            .overlay(Text("S")
                                        .foregroundColor(ColorManager.daysOfWeekColor)
                                        .fontWeight(.medium))
                            .onTapGesture {
                                daysOfWeek.formIntersection([])
                                
                                    daysOfWeek.insert(.saturday)
                                    didTapSunday = true
                                    didTapMonday = true
                                    didTapThuesday = true
                                    didTapWednesday = true
                                    didTapThursday = true
                                    didTapFriday = true
                                    didTapSaturday = false
                                
//                                didTapSaturday.toggle()
                            }
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 15) {
                            if (itsMomentsEmpty(selectedCategory: selectedCategory)){
                                Image("Nada")
                                    .padding(.top, 40)
                            }
                            ForEach((0...moment.count), id: \.self) { i in
                                if (i < moment.count && (WeekDays(rawValue: Int(moment[i].daysOfWeek)).contains(daysOfWeek) ) && moment[i].selfCareType == selectedCategory + 1){
                                    NavigationLink(
                                        destination: MomentDetailView(title: moment[i].title!, description: "", image: partOfTheDayImagesDetail[Int(moment[i].selfCareType) - 1][Int(moment[i].partOfTheDay) - 1],id: i, done: moment[i].done )) {
                                        Image(partOfTheDayImages[Int(moment[i].selfCareType) - 1][Int(moment[i].partOfTheDay) - 1])
                                                .resizable()
                                                .frame(height: 223)
                                                .cornerRadius(30.0)
                                                .padding(.horizontal)
                                                .opacity(moment[i].done ? 0.3 : 1)
                                                .overlay(Text(moment[i].title!)
                                                            .font(.largeTitle)
                                                            .fontWeight(.medium)
                                                            .foregroundColor(.white)
                                                            .padding(.top, 30)
                                                            .frame(width: reader.size.width*0.65, alignment: .leading)
                                                            .padding(.leading, 40),
                                                         alignment: .topLeading)
                                            .padding(.bottom, 16)
                                    }
                                } 
                            }
                        }.onAppear(perform:{
                            
                        })
                    }.frame(width: reader.size.width)
                    .onAppear(perform:{
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
                        if let date = UserDefaults.standard.object(forKey: "creationTime") as? Date {
                            if let diff = Calendar.current.dateComponents([.weekday], from: date, to: Date()).weekday, diff != 0{
                                for i in 0 ... moment.count {
                                    if(i < moment.count){
                                        if (WeekDays(rawValue: Int(moment[i].daysOfWeek)).contains(daysOfWeek)  ){
                                            
                                            moment[i].done = false
                                            }
                                        UserDefaults.standard.removeObject(forKey: "creationTime")
                                        UserDefaults.standard.setValue(Date(), forKey: "creationTime")
                                    }
                                }
                                do{
                                    try moc.save()
                                }
                                catch{
                                    
                                }

                            }
                        }
                    })
                }
                .navigationBarTitle(Text("My moments"))
                .navigationBarItems(trailing:
                        Button(action: {
                            self.showModalView.toggle()
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundColor(ColorManager.actionButtonColor)
                                .imageScale(.large)
                        })
                        .padding(8)
//                                        Button("Add", action: {
//                    self.showModalView.toggle()
//                })
                )
                .navigationBarBackButtonHidden(true)
                .frame(width: reader.size.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(0.0)
                .onAppear(perform:{
                    let weekday = Calendar.current.component(.weekday, from: Date())
                    switch(weekday){
                    case 1:
                        didTapSunday = false
                        break
                    case 2:
                        didTapMonday = false
                        break
                    case 3:
                        didTapThuesday = false
                        break
                    case 4:
                        didTapWednesday = false
                        break
                    case 5:
                        didTapThursday = false
                        break
                    case 6:
                        didTapFriday = false
                        break
                    case 7:
                        didTapFriday = false
                        break
                    default:
                        didTapSaturday = false
                        break
                        
                    }
                })
            }
        }
    }
    func itsMomentsEmpty(selectedCategory: Int) -> Bool{
        for i in 0 ... moment.count {
           if ( i < moment.count && WeekDays(rawValue: Int(moment[i].daysOfWeek)).contains(daysOfWeek) && moment[i].selfCareType == selectedCategory + 1){
               return false
           }
       }
       return true
   }
}

struct MyMomentsView_Previews: PreviewProvider {
    static var previews: some View {
        MyMomentsView()
    }
}

