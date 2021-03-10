//
//  MyMomentsView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct MyMomentsView: View {
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moment: FetchedResults<Moment>
    
    let partOfTheDayImage = ["iOS - PersonalIllustrationMorning","iOS - PersonalIllustrationAfternoon","iOS - PersonalIllustrationEvening"]
    
    let partOfTheDayImages = [["iOS - PersonalIllustrationMorning","iOS - PersonalIllustrationAfternoon","iOS - PersonalIllustrationEvening"], ["iOS - SocialIllustrationMorning","iOS - SocialIllustrationAfternoon","iOS - SocialIllustrationEvening"], ["iOS - PhysicalIllustrationMorning","iOS - PhysicalIllustrationAfternoon","iOS - PhysicalIllustrationEvening"]]
    
    let partOfTheDayImagesDetail = [["iOS - PersonalIllustrationMorningDetail","iOS - PersonalIllustrationAfternoonDetail","iOS - PersonalIllustrationEveningDetail"], ["iOS - SocialIllustrationMorningDetail","iOS - SocialIllustrationAfternoonDetail","iOS - SocialIllustrationEveningDetail"], ["iOS - PhysicalIllustrationMorningDetail","iOS - PhysicalIllustrationAfternoonDetail","iOS - PhysicalIllustrationEveningDetail"]]
    
    @State private var selectedCategory = 0
        
    @State var showModalView : Bool = false
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                ColorManager.backgroundColor
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Picker("Favorite Color", selection: $selectedCategory, content: {
                        Text("Personal").tag(0)
                        Text("Social").tag(1)
                        Text("Physical").tag(2)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .background(ColorManager.segmentColor)
                    .cornerRadius(8.0)
                    .padding(20)
                    .frame(width: reader.size.width*0.95)
                    .sheet(isPresented: self.$showModalView, content: {

                        NewMomentView(itsEditing: false, id: 0)
                    })

                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 15) {
                            ForEach((0...moment.count), id: \.self) { i in
                                if (i < moment.count && WeekDays(rawValue: Int(moment[i].daysOfWeek)).contains(CurrentDay()) && moment[i].selfCareType == selectedCategory + 1){
                                    NavigationLink(
                                        destination: MomentDetailView(title: moment[i].title!, description: "", image: partOfTheDayImagesDetail[Int(moment[i].selfCareType) - 1][Int(moment[i].partOfTheDay) - 1],id: i )) {
                                        Image(partOfTheDayImages[Int(moment[i].selfCareType) - 1][Int(moment[i].partOfTheDay) - 1])
                                                .resizable()
                                                .frame(height: 223)
                                                .cornerRadius(30.0)
                                                .padding(.horizontal)
                                                .opacity(moment[i].done ? 0.3 : 1)
                                                .overlay(Text(moment[i].title!)
                                                            .font(.largeTitle)
                                                            .fontWeight(.medium)
                                                            .foregroundColor(.white)
                                                            .padding(.top, 30)
                                                            .padding(.leading, 40),
                                                         alignment: .topLeading)
                                            .padding(.bottom, 16)
                                    }
                                }
                                
                            }
                        }
                    }.frame(width: reader.size.width)
                }
                .navigationBarTitle(Text("Meus momentos"))
                .navigationBarItems(trailing:
                        Button(action: {
                            self.showModalView.toggle()
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundColor(ColorManager.actionButtonColor)
                                .imageScale(.large)
                        })
//                                        Button("Add", action: {
//                    self.showModalView.toggle()
//                })
                )
                .navigationBarBackButtonHidden(true)
                .frame(width: reader.size.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(0.0)
            }
        }
    }
}

struct MyMomentsView_Previews: PreviewProvider {
    static var previews: some View {
        MyMomentsView()
    }
}

