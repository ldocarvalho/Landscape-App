//
//  TabView.swift
//  Self Care App
//
//  Created by Victor Vidal on 01/03/21.
//
import SwiftUI

struct MainView: View {
    @State private var selection = 0
   
    var body: some View {
        
            TabView (selection: $selection){
                NavigationView{
                    MyMomentsView()
                }.navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .accentColor(Color("NavigationColor"))
                .tabItem {
                    selection == 0 ? Image("TabBarMomentsIconSelected") : Image("TabBarMomentsIconDesselected")
                    
                   Text(LocalizedStringKey("My moments"))
                    
                }.tag(0)
               
                ContentViewCircle()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                 .tabItem {
                    selection == 1 ? Image("TabBarCyclesIconSelected") : Image( "TabBarCyclesIconDesselected")
                    
                    Text(LocalizedStringKey("My cycles"))
                 }.tag(1)
        }.navigationBarHidden(true)
        .foregroundColor(.red)
        .navigationBarBackButtonHidden(true)
            .accentColor(Color("TabViewColor"))
    }
}