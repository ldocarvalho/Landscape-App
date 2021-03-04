//
//  NewMomentView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 01/03/21.
//

import SwiftUI

struct NewMomentView : View {
    
    @State var momentTitle = ""
    @State var partOfDay = 0
    
    @State var showDaysOfWeek: Bool = true

    @Environment(\.presentationMode) var presentationMode
    
    
    var body : some View {
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
                    print("Oi")
                }, label: {
                    Text("Save")
                        .foregroundColor(ColorManager.actionButtonColor)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

                }).padding()
            }
                               
            VStack {
                HStack {
                    Text("What would you like to do to take care of yourself today?")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(ColorManager.bodyTextColor)
                    Spacer()
                }.padding([.leading, .trailing, .bottom], 8)
                .padding(.top, 16)
                TextField("Type your self care moment here", text: $momentTitle)
                    .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(15)
                    .padding([.leading, .trailing], 8)
            }
            
            VStack {
                HStack {
                    Text("In what part of the day would you rather do it?")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(ColorManager.bodyTextColor)

                    Spacer()
                }.padding([.leading, .trailing, .bottom], 8)
                .padding(.top, 16)
                HStack {
                    VStack {
                        Image("p1")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                    }.padding()
                    Spacer()
                    VStack {
                        Image("p1")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                    }
                    Spacer()
                    VStack {
                        Image("p1")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                    }.padding()
                }.padding([.leading, .trailing], 8)
            }
            
            VStack {
                HStack {
                    Text("Would you like to repear this moment?")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(ColorManager.bodyTextColor)
                    Spacer()
                    Toggle("", isOn: $showDaysOfWeek)
                        .toggleStyle(SwitchToggleStyle(tint: ColorManager.switchColor))
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(8)

                }
            }.padding([.leading, .trailing], 8)
                        
            VStack {
                HStack {
                    Text("In what days of the week would you rather do it?")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(ColorManager.bodyTextColor)
                }.padding([.leading, .trailing, .bottom], 8)
                .padding(.top, 16)
                HStack {
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("D").foregroundColor(ColorManager.bodyTextColor))
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("S").foregroundColor(ColorManager.bodyTextColor))
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("T").foregroundColor(ColorManager.bodyTextColor))
                    Circle()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.gray)
                        .overlay(Text("Q").foregroundColor(ColorManager.bodyTextColor))
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("Q").foregroundColor(ColorManager.bodyTextColor))
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("S").foregroundColor(ColorManager.bodyTextColor))
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("S").foregroundColor(ColorManager.bodyTextColor))
                }.padding([.leading, .trailing], 8)
            }
            
            VStack {
                HStack {
                    Text("What type of self care are you making?")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(ColorManager.bodyTextColor)

                    Spacer()
                } .padding([.leading, .trailing, .bottom], 8)
                .padding(.top, 16)
                HStack {
                    VStack {
                        Image("p2")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                    }.padding()
                    Spacer()
                    VStack {
                        Image("p2")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                    }
                    Spacer()
                    VStack {
                        Image("p2")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                    }.padding()
                } .padding([.leading, .trailing], 8)
                
                VStack {
                    Rectangle()
                        .frame(width: 400, height: 40, alignment: .leading)
                        .cornerRadius(25.0)
                        
                        .foregroundColor(ColorManager.switchColor)
                        .overlay(Text("Would you like to know more about self care?")
                                    .foregroundColor(ColorManager.bodyTextColor)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/))
                }.padding([.leading, .trailing], 4)
            }
            Spacer()
        }.padding()
    }
}

struct NewMomentView_Previews: PreviewProvider {
    static var previews: some View {
        NewMomentView()
    }
}
