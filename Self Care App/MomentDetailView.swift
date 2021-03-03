//
//  MomentDetailView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct MomentDetailView: View {
    var body: some View {
        VStack {
            GeometryReader { g in
                VStack {
                    Image("p1")
                        .resizable()
                        .frame(height: 300)
                    
                    VStack {
                        HStack {
                            Text("Skincare moment")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(ColorManager.titleTextColor)
                            Spacer()
                            Button(action: {
                                print("Olá")
                            }, label: {
                                Text("Edit")
                                    .foregroundColor(ColorManager.actionButtonColor)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            })
                        } .padding()
                        
                        Text("Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.")
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
                    }
                }.offset(y: -g.frame(in: .global).minY)
            }
        }
    }
}

struct MomentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MomentDetailView()
    }
}
