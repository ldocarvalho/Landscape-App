//
//  MenuView.swift
//  Self Care App WatchKit Extension
//
//  Created by Lucas Carvalho on 01/03/21.
//

import SwiftUI

struct MenuView: View {
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moments: FetchedResults<Moment>
    var body: some View {
        GeometryReader { g in
            VStack {
                Spacer()
                // adicionar View com momentos como destination
                NavigationLink(
                    destination: MomentsView(),
                    label: {
                        Button(image: "Watch-Menu-MomentsIcon", title: "Moments", width: 48, height: 37)
                    }).buttonStyle(PlainButtonStyle())
                Spacer()
                // adicionar View com ciclos como destination
                NavigationLink(
                    destination: ContentView(),
                    label: {
                        Button(image: "Watch-Menu-CyclesIcon", title: "Cycles", width: 47, height: 47)
                    }).buttonStyle(PlainButtonStyle())
                Spacer()
            }.onAppear(perform: {
              //  scheduleNotifications()
            })
        }
    }
}

struct Button : View {
    
    var image : String
    var title : String
    
    var width: Int
    var height: Int
    
    var body : some View {
        GeometryReader { reader in
            HStack {
                Text(title)
                    .fontWeight(.medium)
                    .font(.body)
                    .padding(.leading, 16)
                    .foregroundColor(WatchColorManager.menuTextColor)
                Spacer()
                Image(image)
                    .resizable()
                    .frame(width: CGFloat(width), height: CGFloat(height), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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

