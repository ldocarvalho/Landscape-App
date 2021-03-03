//
//  MyMomentsView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct MyMomentsView: View {
    
    @State var cards = [
        Card(id: 0, image: "p1", title: "Fazer skincare", details: "Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.", expand: false),
        Card(id: 1, image: "p2", title: "Brincar com meus filhos", details: "Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.", expand: false),
        Card(id: 2, image: "p3", title: "Dormir cedo", details: "Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.", expand: false),
        Card(id: 3, image: "p4", title: "Comer saudável", details: "Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.", expand: false),
        Card(id: 4, image: "p5", title: "Jantar em família", details: "Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.", expand: false)
    ]
        
    @State var moments: [Moment]?
        
    @State var showModalView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 30)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 15) {
                        ForEach(self.cards) { i in
                            NavigationLink(
                                destination: MomentDetailView()) {
                                
                                Image(i.image)
                                    .resizable()
                                    .frame(height: 250)
                                    .cornerRadius(25.0)
                                    .padding(.horizontal)
                                    .overlay(Text(i.title)
                                                .font(.title)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(.white)
                                                .padding(30),
                                             alignment: .topLeading
                                    )
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Meus momentos"))
            .navigationBarItems(trailing: Button("Add", action: {
                self.showModalView.toggle()
            }))
        }
        .onAppear() {
            let dataManager = UserDataManager.shared
            if let savedMoments = dataManager.fetchMoments() {
                self.moments = savedMoments
            } else {
                self.moments = []
            }
        }
        .sheet(isPresented: self.$showModalView, content: {
            NewMomentView()
        })
    }
}

struct MyMomentsView_Previews: PreviewProvider {
    static var previews: some View {
        MyMomentsView()
    }
}

