//
//  DeleteAlertView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 04/03/21.
//

import SwiftUI

struct DeleteAlertView: View {
        
    @Binding var shown: Bool
    @Binding var delete: Bool
    @State var id : Int
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moment: FetchedResults<Moment>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        VStack {
            Image("DeleteIcon")
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top, 8)
            Text(LocalizedStringKey("DeleteAlert-Title"))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .font(.title2)
                .foregroundColor(ColorManager.titleTextColor)
                .frame(width: 280, alignment: .center)
                .padding(.bottom, 8)
            Text(LocalizedStringKey("DeleteAlert-Body"))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(ColorManager.bodyTextColor)
                .font(.body)
                .frame(width: 280, alignment: .center)
            
            HStack {
                Button(action: {
                    shown.toggle()
                }, label: {
                    Text(LocalizedStringKey("DeleteAlert-Button1"))
                        .foregroundColor(ColorManager.textColorSecondaryButton)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(ColorManager.secondaryButtonColor)
                .cornerRadius(25.0)
                                
                Button(action: {
//                    moc.delete(moment[id])
//                    do{
//                        try moc.save()
//                    }
//                    catch{
//
//                    }
                    delete.toggle()
                    shown.toggle()
                    
                }, label: {
                    Text(LocalizedStringKey("DeleteAlert-Button2"))
                        .foregroundColor(ColorManager.textColorMainButton)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(ColorManager.mainButtonColor)
                .cornerRadius(25.0)
               
            }.padding()
        }.frame(width: 350, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(ColorManager.backgroundColor)
        .cornerRadius(30.0)
        .clipped()
    }
}

struct DeleteAlertView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAlertView(shown: .constant(false), delete: .constant(false), id: 0)
    }
}
