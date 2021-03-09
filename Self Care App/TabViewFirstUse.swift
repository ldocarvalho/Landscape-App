//
//  TabViewFirstUse.swift
//  Self Care App
//
//  Created by Victor Vidal on 09/03/21.
//

import SwiftUI
struct MainViewFirstUse: View {
    @State var showModalView : Bool = false
    var body: some View {
        
            TabView {
                MyMomentsView( showModalView: showModalView)
                    .navigationBarBackButtonHidden(true)
                    
                    .navigationBarBackButtonHidden(true)
                    .tabItem {
                    Image(systemName:  "tv.fill")
                    Text("Home")
                    
                }
                ContentViewCircle()
                 .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Cicles")
              }
           
       
        }.navigationBarTitle(Text("Meus momentos"))
         .navigationBarBackButtonHidden(true)
         .navigationBarItems(trailing: Button("Add", action: {
                MyMomentsView(showModalView: false).showModalView.toggle()
         }))
            
            
        
    }

}
