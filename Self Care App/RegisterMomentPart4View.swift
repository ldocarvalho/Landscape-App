//
//  RegisterMomentPart4View.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 08/03/21.
//

import SwiftUI

struct RegisterMomentPart4View: View {
    
    @State var name : String
    
    @State private var didTapSunday :Bool = true
    @State private var didTapMonday :Bool = true
    @State private var didTapThuesday :Bool = true
    @State private var didTapWednesday :Bool = true
    @State private var didTapThursday :Bool = true
    @State private var didTapFriday :Bool = true
    @State private var didTapSaturday :Bool = true
    
    @State var daysOfWeek : WeekDays
    @State  var partOfTheDay: Int
    @State var momentTitle: String
    @State var showDaysOfWeek :Bool
    @State var View : Bool
    
    var body: some View {
        GeometryReader { reader in
            //NavigationView {
            ZStack {
                ColorManager.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack() {
                    Spacer()
                    VStack(alignment: .center) {
                        Text("Hi, " + name + "!")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom, 8)
                            .foregroundColor(ColorManager.bodyTextColor)
                        Text("What about adding a new self care moment in your routine?")
                            .font(.body)
                            .fontWeight(.medium)
                            .padding([.leading, .trailing], 16)
                            .multilineTextAlignment(.center)
                            .foregroundColor(ColorManager.titleTextColor)
                    }.frame(height: 115)
                    
                    HStack {
                        Text("Would you like to repeat the activity?")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(ColorManager.bodyTextColor)
                        Spacer()
                        Toggle("", isOn: $showDaysOfWeek)
                            .toggleStyle(SwitchToggleStyle(tint: ColorManager.switchColor))
                            .frame(width: 40)
                    }.frame(width: reader.size.width*0.9, height: 60, alignment: .leading)
                    .padding(.top, 10)

                    
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
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                        .padding(.top,0)
                        .navigationBarHidden(true)
                    }.padding([.leading, .trailing, .top], 16)
//                    Spacer()
                    Button(action: {
                        View.toggle()
                    }) {
                        Text("Continue")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }.frame(width: reader.size.width*0.4, height: 40, alignment: .center)
                    .background(ColorManager.mainButtonColor)
                    .cornerRadius(25.0)
                    .padding(.top, 10)
                    NavigationLink(destination: RegisterMomentPart3View(typeOfCare: 0, name: name, daysOfWeek: daysOfWeek, partOfTheDay: partOfTheDay, momentTitle: momentTitle, showDaysOfWeek: false), isActive: $View) { EmptyView() }
                    
                    Spacer()
                    Image("iOS - OnboardingImage")
                        .resizable()
                        .frame(width: reader.size.width, height: 315, alignment: .bottom)
                        .padding(.bottom, -50)
                }
                .frame(width: reader.size.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

//struct RegisterMomentPart4View_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterMomentPart4View()
//    }
//}
