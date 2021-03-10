//
//  MomentsView.swift
//  Self Care App WatchKit Extension
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct MomentsView: View {
    
    @State private var currentPage = 0
    
    var pages = ["Personal", "Social", "Physical"]
    
    var body: some View {
        GeometryReader { g in
            VStack() {
                VStack {
                    PagerManager(pageCount: 3, currentIndex: $currentPage) {
                        ListPersonalView()
                        ListSocialView()
                        ListPhysicalView()
                    }
                    .navigationTitle(pages[currentPage])
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
    
    let partOfTheDayImages = ["Watch-Moments-MorningIcon","Watch-Moments-AfternoonIcon","Watch-Moments-EveningIcon"]
    
    let partOfTheDayImagesDetail = [["Watch-PersonalMorningDetail","Watch-PersonalAfternoonDetail","Watch-PersonalEveningDetail"], ["Watch-SocialMorningDetail","Watch-SocialAfternoonDetail","Watch-SocialEveningDetail"], ["Watch-PhysicalMorningDetail","Watch-PhysicalAfternoonDetail","Watch-PhysicalEveningDetail"]]

        
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
                        ForEach(0...moments.count , id: \.self) { i in
                            if (i < moments.count && WeekDays(rawValue: Int(moments[i].daysOfWeek)).contains(CurrentDay()) && moments[i].selfCareType ==  1) {
                                NavigationLink(destination: NotificationView(title: moments[i].title!, image: partOfTheDayImagesDetail[Int(moments[i].selfCareType) - 1][Int(moments[i].partOfTheDay) - 1], id: i)) {
                                    VStack {
//                                        HStack {
//                                            Text("Personal")
//                                                .font(.system(size: 10, weight: .semibold))
//                                                .frame(width: 100, height: 10, alignment: .leading)
//                                                .foregroundColor(WatchColorManager.menuTextColor)
//                                            Spacer()
//                                        }.padding([.leading, .top], 8)
                                        HStack {
                                            Text(moments[i].title!)
                                                .font(.system(size: 12, weight: .semibold))
                                                .frame(width: 100, height: 40, alignment: .leading)
                                            Image(partOfTheDayImages[Int(moments[i].partOfTheDay) - 1])
                                                .resizable()
                                                .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        }.padding([.leading, .trailing, .bottom], 8)
                                    }.opacity(moments[i].done ? 0.4 : 1)
                                }
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

//MomentDetailView(title: moment[i].title!, description: "", image: partOfTheDayImagesDetail[Int(moment[i].selfCareType) - 1][Int(moment[i].partOfTheDay) - 1],id: i)

struct ListSocialView: View {
    
    let partOfTheDayImages = ["Watch-Moments-MorningIcon","Watch-Moments-AfternoonIcon","Watch-Moments-EveningIcon"]
    
    let partOfTheDayImagesDetail = [["Watch-PersonalMorningDetail","Watch-PersonalAfternoonDetail","Watch-PersonalEveningDetail"], ["Watch-SocialMorningDetail","Watch-SocialAfternoonDetail","Watch-SocialEveningDetail"], ["Watch-PhysicalMorningDetail","Watch-PhysicalAfternoonDetail","Watch-PhysicalEveningDetail"]]

    
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moments: FetchedResults<Moment>
    
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
                        ForEach(0...moments.count , id: \.self) { i in
                            if (i < moments.count && WeekDays(rawValue: Int(moments[i].daysOfWeek)).contains(CurrentDay()) && moments[i].selfCareType ==  2) {
                                NavigationLink(destination: NotificationView(title: moments[i].title!, image: partOfTheDayImagesDetail[Int(moments[i].selfCareType) - 1][Int(moments[i].partOfTheDay) - 1], id: i)) {
                                    VStack {
//                                        HStack {
//                                            Text("Social")
//                                                .font(.system(size: 10, weight: .semibold))
//                                                .frame(width: 100, height: 10, alignment: .leading)
//                                                .foregroundColor(WatchColorManager.menuTextColor)
//                                            Spacer()
//                                        }.padding([.leading, .top], 8)
                                        HStack {
                                            Text(moments[i].title!)
                                                .font(.system(size: 12, weight: .semibold))
                                                .frame(width: 100, height: 40, alignment: .leading)
                                            Image(partOfTheDayImages[Int(moments[i].partOfTheDay) - 1])
                                                .resizable()
                                                .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        }.padding([.leading, .trailing, .bottom], 8)
                                    }.opacity(moments[i].done ? 0.4 : 1)
                                }
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
    
    let partOfTheDayImages = ["Watch-Moments-MorningIcon","Watch-Moments-AfternoonIcon","Watch-Moments-EveningIcon"]
    
    let partOfTheDayImagesDetail = [["Watch-PersonalMorningDetail","Watch-PersonalAfternoonDetail","Watch-PersonalEveningDetail"], ["Watch-SocialMorningDetail","Watch-SocialAfternoonDetail","Watch-SocialEveningDetail"], ["Watch-PhysicalMorningDetail","Watch-PhysicalAfternoonDetail","Watch-PhysicalEveningDetail"]]


    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moments: FetchedResults<Moment>
    
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
                        ForEach(0...moments.count , id: \.self) { i in
                            if (i < moments.count && WeekDays(rawValue: Int(moments[i].daysOfWeek)).contains(CurrentDay()) && moments[i].selfCareType ==  3) {
                                NavigationLink(destination: NotificationView(title: moments[i].title!, image: partOfTheDayImagesDetail[Int(moments[i].selfCareType) - 1][Int(moments[i].partOfTheDay) - 1], id: i)) {
                                    VStack {
//                                        HStack {
//                                            Text("Physical")
//                                                .font(.system(size: 10, weight: .semibold))
//                                                .frame(width: 100, height: 10, alignment: .leading)
//                                                .foregroundColor(WatchColorManager.menuTextColor)
//                                            Spacer()
//                                        }.padding([.leading, .top], 8)
                                        HStack {
                                            Text(moments[i].title!)
                                                .font(.system(size: 12, weight: .semibold))
                                                .frame(width: 100, height: 40, alignment: .leading)
                                            Image(partOfTheDayImages[Int(moments[i].partOfTheDay) - 1])
                                                .resizable()
                                                .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        }.padding([.leading, .trailing, .bottom], 8)
                                    }.opacity(moments[i].done ? 0.4 : 1)
                                }
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


