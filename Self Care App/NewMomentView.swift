//
//  NewMomentView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 01/03/21.
//

import SwiftUI

struct NewMomentView : View {
    
    @State var momentTitle = ""
    @State var selfCareType = 0
    @State var partOfDay = 0
    @State var daysOfWeek : [Int] = []
    
    @Environment(\.presentationMode) var presentationMode

    @FetchRequest(entity: Moment.entity(), sortDescriptors: []) var moment: FetchedResults<Moment>
    @Environment(\.managedObjectContext) var moc
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
                    
                    let momento = Moment(context: moc)
                    momento.daysOfWeek = Int32(daysOfWeek[0])
                       momento.partOfTheDay = Int32(partOfDay)
                       momento.repeatActivity = false
                    momento.selfCareType = Int32(selfCareType)
                       momento.title = momentTitle
                       do{
                           try moc.save()
                           //moc.delete(momento)
                       }
                       catch{

                       }
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
                            .frame(width: 100/*@END_MENU_TOKEN@*/, height: 100, alignment: /*@START_MENU_TOKEN@*/.center)
                            .cornerRadius(25)
                        Text("Morning")
                    }.padding()
                    .onTapGesture {
                        partOfDay = 1
                    }
                    Spacer()
                    VStack {
                        Image("p1")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                        Text("Afternoon")
                    }.onTapGesture {
                        partOfDay = 2
                    }
                    Spacer()
                    VStack {
                        Image("p1")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                        Text("Evening")
                    }.padding()
                    .onTapGesture {
                        partOfDay = 3
                    }
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
                        .onTapGesture {
                            daysOfWeek.append(0)
                        }
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("S"))
                        .onTapGesture {
                            daysOfWeek.append(1)
                        }
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("T"))
                        .onTapGesture {
                            daysOfWeek.append(2)
                        }
                    Circle()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.gray)
                        .overlay(Text("Q"))
                        .onTapGesture {
                            daysOfWeek.append(3)
                        }
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("Q"))
                        .onTapGesture {
                            daysOfWeek.append(4)
                        }
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("S"))
                        .onTapGesture {
                            daysOfWeek.append(5)
                        }
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("S"))
                        .onTapGesture {
                            daysOfWeek.append(6)
                        }
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
                            .onTapGesture {
                                selfCareType = 1
                            }
                        Text("Individual")
                    }.padding()
                    Spacer()
                    VStack {
                        Image("p2")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                            .onTapGesture {
                                selfCareType = 2
                            }
                        Text("Social")
                    }
                    Spacer()
                    VStack {
                        Image("p2")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                            .onTapGesture {
                                selfCareType = 3
                            }
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
        
        NewMomentView( )
    }
}
