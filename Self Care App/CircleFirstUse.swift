//
//  Circle.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 01/03/21.
//

import Foundation
import SwiftUI


struct ContentViewCircle2: View {
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
                NavigationView {
                    ZStack {
                        ColorManager.backgroundColor
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                
                                VStack {
                                    Text("What about taking care of yourself today? You can do it!")
                                        .font(.body)
                                        .fontWeight(.medium)
                                        .foregroundColor(ColorManager.titleTextColor)
                                        .padding([.leading, .trailing, .bottom], 16)
                                        .padding([.top], 32)
                                        .multilineTextAlignment(.center)
                                    VStack {
                                        Circles(progressIndividual: self.$progressValueIndividual,progressSocial: self.$progressValueSocial,progressHobbies: self.$progressValueHobbies)
                                    }.onAppear(perform: {
                                        ProgressOfTheDay()
                                    })
                                    .frame(width: 300.0, height: 350)
                                    .padding(16)
                                    
                                    
                                    VStack {
                                        ProgressBar(progressIndividual: $progressValueIndividual,progressHobbies: $progressValueHobbies,progressSocial: $progressValueSocial)

                                    }
                                    .frame(width: 100, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(8)
                                    Spacer()
                                }
                            }
                        }.navigationTitle(Text("Meus Ciclos"))
                        .frame(width: reader.size.width*0.9, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        navigationBarHidden(true)
                        
                    }
                }
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
     
    
struct Circle_Preview2: PreviewProvider {
    static var previews: some View {
        ContentViewCircle()
    }
}


