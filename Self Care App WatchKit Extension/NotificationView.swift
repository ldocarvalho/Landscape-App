//
//  NotificationView.swift
//  Self Care App WatchKit Extension
//
//  Created by Lucas Carvalho on 25/02/21.
//

import SwiftUI

struct NotificationView: View {
    var title: String = "Você já fez o 'Momentinho de skincare' esta manhã?"
    
    var body: some View {
        VStack {
            VStack {
                Text(title)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 160, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .frame(width: 160, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(WatchColorManager.menuBackgroundColor)
            .cornerRadius(15.0)
                             
            Spacer()
            
            HStack {
                Text("Não")
                    .frame(width: 75, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(WatchColorManager.noButtonColor)
                    .cornerRadius(15.0)
                Text("Sim")
                    .frame(width: 75, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(WatchColorManager.menuTextColor)
                    .foregroundColor(.black)
                    .cornerRadius(15.0)
            }
        }
    }
}



struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
