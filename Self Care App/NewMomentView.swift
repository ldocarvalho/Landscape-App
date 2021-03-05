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
    @State var daysOfWeek : WeekDays = []
    
    @Environment(\.presentationMode) var presentationMode

   // @FetchRequest(entity: Moment.entity(), sortDescriptors: []) var moment: FetchedResults<Moment>
    @Environment(\.managedObjectContext) var moc
    var body : some View {
        let momento = Moment(context: moc)
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
                    momento.title = momentTitle
                    momento.date = Date()
                    momento.daysOfWeek = Int32(daysOfWeek.rawValue)
                    momento.partOfTheDay = Int64(partOfDay)
                       momento.repeatActivity = false
                    momento.selfCareType = Int64(selfCareType)
                    do{
                        try moc.save()
                    }
                    catch{
                        
                    }
                    presentationMode.wrappedValue.dismiss()
                    // editando
//                    moc.performAndWait {
//                        moment[0].title? = "editando"
//                        try? moc.save()
//                    }
                       
                  
                          
                        
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
                           
                            daysOfWeek.toogle(.sunday)
                            
                        }
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("S"))
                        .onTapGesture {
                            daysOfWeek.toogle(.monday)
                        }
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("T"))
                        .onTapGesture {
                            daysOfWeek.toogle(.thursday)
                        }
                    Circle()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.gray)
                        .overlay(Text("Q"))
                        .onTapGesture {
                            daysOfWeek.toogle(.wednesday)
                        }
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("Q"))
                        .onTapGesture {
                            daysOfWeek.toogle(.thursday)
                        }
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("S"))
                        .onTapGesture {
                            daysOfWeek.toogle(.friday)
                        }
                    Circle()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .overlay(Text("S"))
                        .onTapGesture {
                            daysOfWeek.toogle(.saturday)
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
