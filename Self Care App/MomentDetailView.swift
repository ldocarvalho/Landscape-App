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
                        .frame(height: 250)
                    
                    VStack {
                        HStack {
                            Text("Title")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Spacer()
                            Button("Edit") {
                                print("Editar momento")
                            }
                        } .padding()
                        
                        Text("Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.")
                            .font(.title3)
                            .padding()
                        
                        Text("Is this moment done for today?")
                            .font(.title3)
                            .bold()
                            .padding()
                        
                        HStack {
                            Button("Delete moment") {
                                print("Deletar momento")
                            }
                            .frame(width: 180, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.gray)
                            .cornerRadius(25.0)
                            
                            Spacer()
                            
                            Button("Moment done") {
                                print("Momento concluído")
                            }
                            .frame(width: 180, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.gray)
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
