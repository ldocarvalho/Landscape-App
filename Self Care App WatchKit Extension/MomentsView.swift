//
//  MomentsView.swift
//  Self Care App WatchKit Extension
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct MomentsView: View {
    
    @State private var currentPage = 0
    
    var body: some View {
        GeometryReader { g in
            VStack() {
                VStack {
                    PagerManager(pageCount: 3, currentIndex: $currentPage) {
                        ListPersonalView()
                        ListSocialView()
                        ListPhysicalView()
                    }
                }.frame(width: g.size.width, height: g.size.height*0.999, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                HStack{
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(currentPage==0 ? Color.white:Color.gray)
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(currentPage==1 ? Color.white:Color.gray)
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(currentPage==2 ? Color.white:Color.gray)
                }
            }
        }
    }
}

struct ListPersonalView: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let y = proxy.frame(in: .global).minY
        
        let diff = abs(y)
        
        if diff < 100 {
            scale = 1 + (diff) / 500
        }
        
        return scale
    }
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moments: FetchedResults<Moment>
    var body: some View {
        GeometryReader { g in 
//            let scale = getScale(proxy: g)
            ScrollView(.vertical) {
                    VStack(spacing: 5) {
                        ForEach(0...moments.count - 1, id: \.self) { i in
//                            if (i < moments.count && WeekDays(rawValue: Int(moments[i].daysOfWeek)).contains(CurrentDay()) && moments[i].selfCareType == selectedCategory + 1) {
                                VStack {
                                    HStack {
                                        Text("Personal")
                                            .font(.system(size: 10, weight: .semibold))
                                            .frame(width: 100, height: 10, alignment: .leading)
                                            .foregroundColor(WatchColorManager.menuTextColor)
                                        Spacer()
                                    }.padding([.leading, .top], 8)
                                    HStack {
                                        Text(moments[i].title!)
                                            .font(.system(size: 12, weight: .semibold))
                                            .frame(width: 100, height: 40, alignment: .leading)
                                        Image("p1")
                                            .resizable()
                                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    }.padding([.leading, .trailing, .bottom], 8)
                                }
//                            }
                        }.background(WatchColorManager.menuBackgroundColor)
                        .cornerRadius(15.0)
                        .frame(width: g.size.width*0.9, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }.padding([.bottom, .leading,.trailing], 8)
                .padding(.top, 5)
            }
        }
    }
}

struct ListSocialView: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let y = proxy.frame(in: .global).minY
        
        let diff = abs(y)
        
        if diff < 100 {
            scale = 1 + (diff) / 500
        }
        
        return scale
    }
    
    var body: some View {
        GeometryReader { g in
//            let scale = getScale(proxy: g)
            ScrollView(.vertical) {
                    VStack(spacing: 5) {
                        ForEach(0..<6) { moment in
                            VStack {
                                HStack {
                                    Text("Social")
                                        .font(.system(size: 10, weight: .semibold))
                                        .frame(width: 100, height: 10, alignment: .leading)
                                        .foregroundColor(WatchColorManager.menuTextColor)
                                    Spacer()
                                }.padding([.leading, .top], 8)
                                HStack {
                                    Text("Skincare moment")
                                        .font(.system(size: 12, weight: .semibold))
                                        .frame(width: 100, height: 40, alignment: .leading)
                                    Image("p1")
                                        .resizable()
                                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }.padding([.leading, .trailing, .bottom], 8)
                            }
                        }.background(WatchColorManager.menuBackgroundColor)
                        .cornerRadius(15.0)
                        .frame(width: g.size.width*0.9, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }.padding([.bottom, .leading,.trailing], 8)
                    .padding(.top, 5)
            }
        }
    }
}

struct ListPhysicalView: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let y = proxy.frame(in: .global).minY
        
        let diff = abs(y)
        
        if diff < 100 {
            scale = 1 + (diff) / 500
        }
        
        return scale
    }
    
    var body: some View {
        GeometryReader { g in
//            let scale = getScale(proxy: g)
            ScrollView(.vertical) {
                    VStack(spacing: 5) {
                        ForEach(0..<6) { moment in
                            VStack {
                                HStack {
                                    Text("Physical")
                                        .font(.system(size: 10, weight: .semibold))
                                        .frame(width: 100, height: 10, alignment: .leading)
                                        .foregroundColor(WatchColorManager.menuTextColor)
                                    Spacer()
                                }.padding([.leading, .top], 8)
                                HStack {
                                    Text("Skincare moment")
                                        .font(.system(size: 12, weight: .semibold))
                                        .frame(width: 100, height: 40, alignment: .leading)
                                    Image("p1")
                                        .resizable()
                                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }.padding([.leading, .trailing, .bottom], 8)
                            }
                        }.background(WatchColorManager.menuBackgroundColor)
                        .cornerRadius(15.0)
                        .frame(width: g.size.width*0.9, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }.padding([.bottom, .leading,.trailing], 8)
                    .padding(.top, 5)
            }
        }
    }
}

struct MomentsView_Previews: PreviewProvider {
    static var previews: some View {
        MomentsView()
    }
}


