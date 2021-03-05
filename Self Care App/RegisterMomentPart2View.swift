//
//  RegisterMomentPart2View.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI


struct RegisterMomentPart2View: View {
    @Binding  var partOfTheDay: Int
    @State var name: String
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                VStack(alignment: .center) {
                    Text("Hi, " + name )
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(25)
                    Text("What about adding a new self care moment in your routine?")
                        .font(.body)
                        .padding(25)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
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
                        .onTapGesture {
                            partOfTheDay = 1
                        }
                        Spacer()
                        VStack {
                            Image("p2")
                                .resizable()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .cornerRadius(25)
                            Text("Afternoon")
                        }.onTapGesture {
                            partOfTheDay = 2
                        }
                        Spacer()
                        VStack {
                            Image("p3")
                                .resizable()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .cornerRadius(25)
                            Text("Evening")
                        }.padding()
                        .onTapGesture {
                            partOfTheDay = 3
                        }
                    }
                }.onAppear(perform: {
                  
                
                    
                    
                })
                
                Spacer()
            }
        }
    }
}

//struct RegisterMomentPart2View_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterMomentPart2View()
//    }
//}
