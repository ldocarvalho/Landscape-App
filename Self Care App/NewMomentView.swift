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
    
    @Environment(\.presentationMode) var presentationMode
    
    var body : some View {
        VStack {
            HStack {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }.padding()
                Spacer()
                Text("Add new moment")
                    .fontWeight(.bold)
                Spacer()
                Button("Save") {
                    print("Save")
                }.padding()
            }
            
            Spacer()
                        
            VStack {
                Text("What would you like to do to take care of youself today?")
                    .font(.body)
                    .fontWeight(.bold)
                TextField("Type your self care moment here", text: $momentTitle)
                    .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(15)
            }
            
            VStack {
                Text("In what part of the day would you rather do it?")
                    .font(.body)
                    .fontWeight(.bold)
                HStack {
                    VStack {
                        Image("p1")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                        Text("Morning")
                    }.padding()
                    Spacer()
                    VStack {
                        Image("p1")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                        Text("Afternoon")
                    }
                    Spacer()
                    VStack {
                        Image("p1")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                        Text("Evening")
                    }.padding()
                }
            }
            
            VStack {
                Text("In what days of the week would you rather do it?")
                    .font(.body)
                    .fontWeight(.bold)
                HStack {
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("D"))
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("S"))
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("T"))
                    Circle()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.gray)
                        .overlay(Text("Q"))
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("Q"))
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("S"))
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("S"))
                }
            }
            
            VStack {
                Text("What type of self care are you making?")
                    .font(.body)
                    .fontWeight(.bold)
                HStack {
                    VStack {
                        Image("p2")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                        Text("Individual")
                    }.padding()
                    Spacer()
                    VStack {
                        Image("p2")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                        Text("Social")
                    }
                    Spacer()
                    VStack {
                        Image("p2")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                        Text("Hobby")
                    }.padding()
                }
                
                Rectangle()
                    .frame(width: 400, height: 40, alignment: .leading)
                    .cornerRadius(25.0)
                    .foregroundColor(.gray)
                    .overlay(Text("Would you like to know more about self care?"))
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
