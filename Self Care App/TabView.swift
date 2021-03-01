//
//  TabView.swift
//  Self Care App
//
//  Created by Victor Vidal on 01/03/21.
//
import SwiftUI
struct MainView: View {
    var body: some View {
        TabView {
           ContentView()
             .tabItem {
                Image(systemName: "phone.fill")
                Text("home")
           }
            ContentViewCircle()
             .tabItem {
                Image(systemName: "tv.fill")
                Text("Cicles")
          }
        }
    }
}
