//
//  NotificationView.swift
//  Self Care App WatchKit Extension
//
//  Created by Lucas Carvalho on 25/02/21.
//

import SwiftUI

struct NotificationView: View {
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moment: FetchedResults<Moment>
    var title: String = "Você já fez o 'Momentinho de skincare' hoje?"
    
    var body: some View {
        GeometryReader { g in
            VStack {
                VStack {
                    Image("Morning")
                        .resizable()
                        .frame(width: g.size.width*0.8, height: g.size.height*0.35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(5.0)
                    Text(title)
    //                    .font(.caption2)
                        .font(.system(size: 12, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 140, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .frame(width: g.size.width, height: g.size.height*0.8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(WatchColorManager.menuBackgroundColor)
                .cornerRadius(15.0)
                                 
                Spacer()
                
                HStack {
                    Text("Não")
                        .frame(width: g.size.width*0.4, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(WatchColorManager.noButtonColor)
                        .cornerRadius(15.0)
                        .onTapGesture {
                            
                        }
                    Text("Sim")
                        .frame(width: g.size.width*0.4, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(WatchColorManager.menuTextColor)
                        .foregroundColor(.black)
                        .cornerRadius(15.0)
                        .onTapGesture {
                            
                        }
                }
            }
        }
    }
}



struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
