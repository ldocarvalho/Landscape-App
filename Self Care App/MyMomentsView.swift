//
//  MyMomentsView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct MyMomentsView: View {
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moment: FetchedResults<Moment>
    let partOfTheDayImage = ["Morning","Afternoon","Night"]
    @State var cards : [Card] = []
        
        
    @State var showModalView = false
    
    var body: some View {
//        NavigationView {
            VStack {
                Spacer(minLength: 30)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 15) {
                        ForEach(cards) { i in
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
                                                 alignment: .topLeading)
                                
                            }
                        }
                        
                    }
                }.navigationBarTitle(Text("Meus momentos"))
                .navigationBarItems(trailing: Button("Add", action: {
                    self.showModalView.toggle()
                }))
                .navigationBarBackButtonHidden(true)
                .sheet(isPresented: self.$showModalView, content: {
                    NewMomentView()
                })
          //  }
            
        }
        .padding(0.0)
        .onAppear() {
            for i in 0 ... moment.count - 1 {
                cards.append(Card(id: 1, image: partOfTheDayImage[Int(moment[i].partOfTheDay ) - 1], title: moment[i].title!, details: "", expand: true))
            }
        }
        
    }
}

struct MyMomentsView_Previews: PreviewProvider {
    static var previews: some View {
        MyMomentsView()
    }
}

