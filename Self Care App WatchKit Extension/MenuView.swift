//
//  MenuView.swift
//  Self Care App WatchKit Extension
//
//  Created by Lucas Carvalho on 01/03/21.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        GeometryReader { g in
            VStack {
                Spacer()
                // adicionar View com momentos como destination
                NavigationLink(
                    destination: MomentsView(),
                    label: {
                        Button(image: "p1", title: "Moments")
                    }).buttonStyle(PlainButtonStyle())
                Spacer()
                // adicionar View com ciclos como destination
                NavigationLink(
                    destination: ContentView(),
                    label: {
                        Button(image: "p1", title: "Cycles")
                    }).buttonStyle(PlainButtonStyle())
                Spacer()
            }.onAppear(perform: {
                scheduleNotifications()
            })
        }
    }
}

struct Button : View {
    
    var image : String
    var title : String
    
    var body : some View {
        GeometryReader { reader in
            HStack {
                Text(title)
                    .padding()
                    .font(.title3)
                    .foregroundColor(WatchColorManager.menuTextColor)
                Spacer()
                Image(image)
                    .resizable()
                    .frame(width:30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
            }
            .frame(width: reader.size.width, height: reader.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(WatchColorManager.menuBackgroundColor)
            .cornerRadius(15.0)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

