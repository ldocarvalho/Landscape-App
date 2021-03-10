//
//  RegisterMomentPart4View.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 08/03/21.
//

import SwiftUI

struct RegisterMomentPart4View: View {
    
    @State private var didTapSunday :Bool = true
    @State private var didTapMonday :Bool = true
    @State private var didTapThuesday :Bool = true
    @State private var didTapWednesday :Bool = true
    @State private var didTapThursday :Bool = true
    @State private var didTapFriday :Bool = true
    @State private var didTapSaturday :Bool = true
    
    @Binding var daysOfWeek : WeekDays 
    
    @Binding var showDaysOfWeek :Bool
    
    var body: some View {
        GeometryReader { reader in
            //NavigationView {
                VStack(alignment: .center) {
                    VStack(alignment: .center) {
                        Text("Hi")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(25)
                        Text("What about adding a new self care moment in your routine?")
                            .font(.body)
                            .padding(25)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("Would you like to repeat this moment?")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(ColorManager.bodyTextColor)
                        Toggle("", isOn: $showDaysOfWeek)
                            .toggleStyle(SwitchToggleStyle(tint: ColorManager.switchColor))
                    }.frame(width: reader.size.width*0.9, height: 50, alignment: .leading)

                    
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
                                .overlay(Text("S"))
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
                                .overlay(Text("T"))
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
                                .overlay(Text("Q"))
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
                                .overlay(Text("Q"))
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
                                .overlay(Text("S"))
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
                                .overlay(Text("S"))
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
                    }.padding(8)
                    Spacer()
                }.navigationBarHidden(true)
           // }.frame(width: reader.size.width, height: reader.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

//struct RegisterMomentPart4View_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterMomentPart4View()
//    }
//}
