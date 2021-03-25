//
//  Circle.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 01/03/21.
//

import Foundation
import SwiftUI


struct ContentViewCircle: View {
    @State var progressValueIndividual: Float = 0 //Colocar informação do banco aqui
    @State var progressValueSocial: Float = 0 //Colocar informação do banco aqui
    @State var progressValueHobbies: Float = 0 //Colocar informação do banco aqui
    @State var daysOfWeek : WeekDays = []
    @State var countTotalIndividual : Double = 0
    @State var countTotalHobby : Double = 0
    @State var countTotalSocial : Double = 0
    @State var countIndividual : Double = 0
    @State var countSocial : Double = 0
    @State var countHobby : Double = 0
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moment: FetchedResults<Moment>
    @Environment(\.managedObjectContext) var moc
    
        var body: some View {
            GeometryReader { reader in
                    ZStack {
                        ColorManager.backgroundColor
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        NavigationView {
                            ScrollView(.vertical, showsIndicators: false) {
                                    VStack {
                                        Text(LocalizedStringKey("MyCycles-Label"))
                                            .font(.body)
                                            .fontWeight(.bold)
                                            .foregroundColor(ColorManager.titleTextColor)
                                            .padding([.leading, .trailing, .bottom], 16)
                                            .padding([.top], 32)
                                            .multilineTextAlignment(.center)
                                        VStack {
                                            Circles(progressIndividual: self.$progressValueIndividual,progressSocial: self.$progressValueSocial,progressHobbies: self.$progressValueHobbies)
                                        }.onAppear(perform: {
                                            ProgressOfTheDay()
                                        })
                                        .onDisappear(perform: {
                                           progressValueIndividual = 0
                                           progressValueSocial = 0
                                           progressValueHobbies = 0
                                           countIndividual = 0
                                           countHobby = 0
                                           countSocial = 0
                                           countTotalIndividual = 0
                                           countTotalHobby = 0
                                           countTotalSocial = 0
                                        })
                                        .frame(width: 300.0, height: 350)
                                        .padding(16)
                                        
                                        VStack {
                                            ProgressBar(progressIndividual: $progressValueIndividual,progressHobbies: $progressValueHobbies,progressSocial: $progressValueSocial)
                                            
                                        }
                                        .frame(width: 100, height: 150, alignment: .center)
                                        .padding(8)
                                        Spacer()
                                    }
                            }
                            .navigationTitle(Text("My cycles"))
                        }
                        .frame(width: reader.size.width, alignment: .center)
                }
                .accentColor(Color("NavigationColor"))
                .onAppear(perform:{
                    ProgressOfTheDay()
                })
            }
    }
    
    func ProgressOfTheDay(){
        let weekday = Calendar.current.component(.weekday, from: Date())
        switch(weekday){
        case 1:
            daysOfWeek.insert(.sunday)
        case 2:
            daysOfWeek.insert(.monday)
        case 3:
            daysOfWeek.insert(.thuesday)
        case 4:
            daysOfWeek.insert(.wednesday)
        case 5:
            daysOfWeek.insert(.thursday)
        case 6:
            daysOfWeek.insert(.friday)
        case 7:
            daysOfWeek.insert(.saturday)
        default:
                daysOfWeek.insert(.sunday)
            
        }
        for i in 0 ... moment.count {
            if(i < moment.count){
                if (WeekDays(rawValue: Int(moment[i].daysOfWeek)).contains(daysOfWeek) && moment[i].selfCareType == 1){
                    countTotalIndividual = countTotalIndividual + 1
                    if (moment[i].done){
                           countIndividual = countIndividual + 1
                        }
                    }
                if (WeekDays(rawValue: Int(moment[i].daysOfWeek)).contains(daysOfWeek) && moment[i].selfCareType == 2){
                    countTotalSocial = countTotalSocial + 1
                    if (moment[i].done){
                           countSocial = countSocial + 1
                        }
                    }
                if (WeekDays(rawValue: Int(moment[i].daysOfWeek)).contains(daysOfWeek) && moment[i].selfCareType == 3){
                    countTotalHobby = countTotalHobby + 1
                    if (moment[i].done){
                           countHobby = countHobby + 1
                        }
                    }
            }
        }
        
        progressValueSocial =  countTotalSocial == 0 ?  0 : Float((countSocial/countTotalSocial))
        progressValueIndividual = countTotalIndividual == 0 ?  0 : Float((countIndividual/countTotalIndividual))
        progressValueHobbies = countTotalHobby == 0 ?  0 : Float((countHobby/countTotalHobby))
            
    }
}
     

    struct Circles: View {
        @Binding var progressIndividual : Float
        @Binding var progressSocial: Float
        @Binding var progressHobbies: Float
        var body: some View {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .foregroundColor(ColorManager.purpleCicleBackgroundColor)
                Circle()
                    
                    .trim(from: 0.0, to: CGFloat(min(self.progressIndividual,1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .fill(AngularGradient(gradient: .init(colors: [ColorManager.purpleCicleColor]), center: .center, startAngle: Angle(degrees:270), endAngle: Angle(degrees:360)))
                    .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
                    .rotationEffect(Angle(degrees:270))
                    
                 //   .foregroundColor(ColorManager.purpleCicleColor)
                    
                    
                
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(1)
                    .foregroundColor(ColorManager.pinkCicleBackgroundColor)
                    .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progressSocial,1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
//                    .foregroundColor(ColorManager.pinkCicleColor)
                    .fill(AngularGradient(gradient: .init(colors: [ColorManager.pinkCicleColor]), center: .center, startAngle: Angle(degrees:270), endAngle: Angle(degrees:360)))
                    .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
                    .rotationEffect(Angle(degrees:270))
                    .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(1)
                    .foregroundColor(ColorManager.blueCicleBackgroundColor)
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progressHobbies,1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
//                    .foregroundColor(ColorManager.blueCicleColor)
                    .fill(AngularGradient(gradient: .init(colors: [ColorManager.blueCicleColor]), center: .center, startAngle: Angle(degrees:270), endAngle: Angle(degrees:360)))
                    .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
                    .rotationEffect(Angle(degrees:270))
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

            }
        }
       
    }

    struct ProgressBar: View {
        @Binding var progressIndividual: Float
        @Binding var progressHobbies: Float
        @Binding var progressSocial: Float
        
        var body: some View {
            //VStack{
                
                //barra Individual
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: 300 , height: 40)
                        .opacity(1)
                        .foregroundColor(ColorManager.purpleCicleBackgroundColor)
                        
                    Rectangle().frame(width: min(CGFloat(self.progressIndividual) *  300,  300), height: 40)
                        .foregroundColor(ColorManager.purpleCicleColor)
                        .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
                        .cornerRadius(45.0)                    
                    
                    }.cornerRadius(45.0)
                .overlay(Text("Personal")
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 300, height: 400, alignment: .leading)
                            .padding(.leading, 36)
                            )
                
                //Barra hobbies
                ZStack(alignment: .leading){
                    Rectangle().frame(width: 300 , height: 40)
                        .opacity(1)
                        .foregroundColor(ColorManager.pinkCicleBackgroundColor)
                        
                    Rectangle().frame(width: min(CGFloat(self.progressSocial) *  300,  300), height: 40)
                        .foregroundColor(ColorManager.pinkCicleColor)
                        .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
                        .cornerRadius(45.0)
                }.cornerRadius(45.0)
                .overlay(Text("Social")
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 300, height: 400, alignment: .leading)
                            .padding(.leading, 36)
                            )
                //Barra social
                ZStack(alignment: .leading){
                    Rectangle().frame(width: 300 , height: 40)
                        .opacity(1)
                        .foregroundColor(ColorManager.blueCicleBackgroundColor)
                        
                    Rectangle().frame(width: min(CGFloat(self.progressHobbies) *  300,  300), height: 40)
                        .cornerRadius(45.0)
                        .foregroundColor(ColorManager.blueCicleColor)
                        .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
                }.cornerRadius(45.0)
                .overlay(Text("Physical")
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 300, height: 400, alignment: .leading)
                            .padding(.leading, 36)
                            )
            }
            
            
       // }
    }
    
struct Circle_Preview: PreviewProvider {
    static var previews: some View {
        ContentViewCircle()
    }
}

