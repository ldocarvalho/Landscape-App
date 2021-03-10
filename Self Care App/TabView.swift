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
                }.navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .tabItem {
                   Image(systemName: "tv.fill")
                    
                   Text("Moments")
                }
                ContentViewCircle().navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                 .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Cycles")
                 }
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
