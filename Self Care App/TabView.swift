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
                NavigationView{
                    MyMomentsView()
                }.navigationBarBackButtonHidden(false)
                .tabItem {
                   Image(systemName: "tv.fill")
                   Text("Moments")
                }
                ContentViewCircle()
                 .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Cycles")
              }
        }
    }
}
