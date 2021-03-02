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
                    destination: ContentView(),
                    label: {
                        Button(image: "p1", title: "Momentos")
                    }).buttonStyle(PlainButtonStyle())
                Spacer()
                // adicionar View com ciclos como destination
                NavigationLink(
                    destination: ContentView(),
                    label: {
                        Button(image: "p2", title: "Ciclos")
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
        HStack {
            Text(title)
                .padding()
            Spacer()
        }
        .background(Color(.gray))
        .cornerRadius(15.0)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

