//
//  MomentDetailView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct MomentDetailView: View {
    var title : String
    var description : String
    var image : String
    var body: some View {
        
        VStack {
            GeometryReader { g in
                VStack {
                    VStack {
                        Image(image)
                            .resizable()
                            .frame(height: 400)
                    }.offset(y: -g.frame(in: .global).minY)
                    
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                print("Olá")
                            }, label: {
                                Text("Edit")
                                    .foregroundColor(ColorManager.actionButtonColor)
                                    .fontWeight(.bold)
                            })
                        }.padding([.leading, .trailing], 26)
                        .padding(.top, 30)
                        
                        HStack() {
                            Text(title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(ColorManager.titleTextColor)
                            Spacer()
                            
                        } .padding([.leading, .trailing], 16)
                        .padding(.top, 8)
                        
                        Text(description)
                            .font(.body)
                            .padding()
                            .foregroundColor(ColorManager.bodyTextColor)
                        
                        HStack {
                            Text("Is this moment done for today?")
                                .font(.title2)
                                .bold()
                                .foregroundColor(ColorManager.titleTextColor)
                                .padding()
                            Spacer()
                        }.padding(5)
                        
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                Text("Delete moment")
                                    .foregroundColor(ColorManager.titleTextColor)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            })
                            .frame(width: 180, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(ColorManager.secondaryButtonColor)
                            .cornerRadius(25.0)
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Moment done")
                                    .foregroundColor(ColorManager.backgroundColor)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            })
                            .frame(width: 180, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(ColorManager.mainButtonColor)
                            .cornerRadius(25.0)
                        }.padding()
                    }.background(Color.white)
                    .clipShape(CustomCorner())
                    .offset(y: -g.frame(in: .global).minY - 50)
                }
            }
        }
    }
}

//struct MomentDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MomentDetailView()
//    }
//}
