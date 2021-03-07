//
//  MomentDetailView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct MomentDetailView: View {
    var title : String = "lallalalalalalasldkdkalsdlksksd"
    var description : String = "lallalalalalalasldkdkalsdlksklallalalalalalaslkdkdfkdkmsskmkdmedkmeekmkdxmskxdmcfkcmdkmkxmdckcmkdkdkalsdlksksdsd"
    var image : String = "p1"
    var id : Int = 0
    @State var View : Bool = false
    var body: some View {
        GeometryReader { g in
            VStack {
                        VStack {
                            Image(image)
                                .resizable()
                                .frame(width: g.size.width, height: g.size.height*0.4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }.offset(y: -g.frame(in: .global).minY)
                        
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    View.toggle()
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
                                    .frame(width: g.size.width*0.9, height: 100, alignment: .leading)
                                Spacer()
                                
                            } .padding([.leading, .trailing], 16)
                            .padding(.top, 8)
                            
                            Text(description)
                                .font(.body)
                                .foregroundColor(ColorManager.bodyTextColor)
                                .frame(width: g.size.width*0.9, height: 100, alignment: .leading)
                            
                            HStack {
                                Text("Is this moment done for today?")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(ColorManager.titleTextColor)
                                Spacer()
                            }.frame(width: g.size.width*0.9, height: 40, alignment: .leading)
                            
                            HStack {
                                Button(action: {
                                    
                                }, label: {
                                    Text("Delete moment")
                                        .foregroundColor(ColorManager.titleTextColor)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                })
                                .frame(width: g.size.width*0.45, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(ColorManager.secondaryButtonColor)
                                .cornerRadius(25.0)
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                }, label: {
                                    Text("Moment done")
                                        .foregroundColor(ColorManager.backgroundColor)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                })
                                .frame(width: g.size.width*0.45, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(ColorManager.mainButtonColor)
                                .cornerRadius(25.0)
                            }
                            .frame(width: g.size.width*0.9, height: 100, alignment: .center)
                        }.background(Color.white)
                        .clipShape(CustomCorner())
                        .offset(y: -g.frame(in: .global).minY - 50)
            }.sheet(isPresented: self.$View, content: {NewMomentView(itsEditing: true, id: id)})
            .frame(width: g.size.width, alignment: .center)
        }
    }
}

struct MomentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MomentDetailView()
    }
}
