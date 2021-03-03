//
//  MomentsView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 01/03/21.
//

import SwiftUI

struct MomentsView : View {
    var body: some View {
        NavigationView {
            CardScrollView()
        }.navigationTitle("Title")
    }
}

struct MomentsView_Previews: PreviewProvider {
    static var previews: some View {
        MomentsView()
    }
}

struct CardDetailsView : View {
    
    @Binding var data : Card
    @Binding var test : Bool
    
    var body : some View {
        VStack {
            Image(self.data.image)
                .resizable()
                .frame(height: self.data.expand ? 450 : 250)
                .cornerRadius(self.data.expand ? 0 : 25)
            
            if self.data.expand {
                HStack {
                    Text (self.data.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding()
                
                Text(self.data.details)
                    .padding(.horizontal)
            }
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal, self.data.expand ? 0 : 20)
        .contentShape(Rectangle())
    }
}

struct CardScrollView : View {
    
    @State var data = [
        Card(id: 0, image: "p1", title: "Alemanha", details: "Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.", expand: false),
        Card(id: 1, image: "p2", title: "Alemanha", details: "Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.", expand: false),
        Card(id: 2, image: "p3", title: "Alemanha", details: "Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.", expand: false),
        Card(id: 3, image: "p4", title: "Alemanha", details: "Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.", expand: false),
        Card(id: 4, image: "p5", title: "Alemanha", details: "Fusce ligula lacus, dictum vel velit id, facilisis semper nisi. Vestibulum eu feugiat enim. Etiam sagittis quam nec risus egestas, eget pulvinar elit efficitur.", expand: false)
    ]
    
    @State var test = false
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(0..<self.data.count) { i in
                        GeometryReader { g in
                            CardDetailsView(data: self.$data[i], test: self.$test)
                            .padding(.horizontal, self.data[i].expand ? 0 : 15)
                            .offset(y: self.data[i].expand ? -g.frame(in: .global).minY : 0)
                                .opacity(self.test ? (self.data[i].expand ? 1 : 0) : 1)                    .frame(height: 250)

                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
                                    self.test.toggle()
                                    self.data[i].expand.toggle()
                                }
                            }
                        }
                        .frame(height: self.data[i].expand ? UIScreen.main.bounds.height : 250)
                        .simultaneousGesture(DragGesture(minimumDistance: self.data[i].expand ? 0 : 500).onChanged({ (_) in
                                print("dragging")
                        }))
                    }
                }
            }
        }
    }
}

struct Card : Identifiable {
    var id : Int
    var image: String
    var title: String
    var details : String
    var expand: Bool
}
