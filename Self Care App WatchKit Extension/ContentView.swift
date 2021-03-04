//
//  ContentView.swift
//  Self Care App WatchKit Extension
//
//  Created by Lucas Carvalho on 25/02/21.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @State private var currentPage = 0
    
    var body: some View {
        VStack{
            PagerManager(pageCount: 2, currentIndex: $currentPage) {
                CirclesView()
                ProgressBarView()
            }
            HStack{
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(currentPage==1 ? Color.gray:Color.white)
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(currentPage==1 ? Color.white:Color.gray)
            }
        }
    }
}

struct CirclesView : View {
    
    @State var progressValueIndividual: Float = 0.65 //Colocar informação do banco aqui
    @State var progressValueSocial: Float = 0.65 //Colocar informação do banco aqui
    @State var progressValueHobbies: Float = 0.65 //Colocar informação do banco aqui

    
    var body: some View {
        VStack {
            Circles(progressIndividual: self.$progressValueIndividual,progressSocial: self.$progressValueSocial,progressHobbies: self.$progressValueHobbies)
                 .frame(width: 100.0, height: 100.0)
                 .padding(25.0)
        }.frame(width: 100, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct Circles: View {
    @Binding var progressIndividual : Float
    @Binding var progressSocial: Float
    @Binding var progressHobbies: Float
    var body: some View {
        ZStack {
//            Circle()
//                .stroke(lineWidth: 10.0)
//                .opacity(0.3)
//                .foregroundColor(Color.red)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progressIndividual,1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(WatchColorManager.purpleCicleColor)
                .rotationEffect(Angle(degrees:270))
                .animation(.linear)
            
//            Circle()
//                .stroke(lineWidth: 10.0)
//                .opacity(0.3)
//                .foregroundColor(Color.blue)
//                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progressSocial,1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(WatchColorManager.pinkCicleColor)
                .rotationEffect(Angle(degrees:270))
                .animation(.linear)
                .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
//            Circle()
//                .stroke(lineWidth: 10.0)
//                .opacity(0.3)
//                .foregroundColor(Color.purple)
//                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progressHobbies,1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(WatchColorManager.blueCicleColor)
                .rotationEffect(Angle(degrees:270))
                .animation(.linear)
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    

        }
    }
}

struct ProgressBarView : View {
    
    @State var progressValueIndividual: Float = 0.65 //Colocar informação do banco aqui
    @State var progressValueSocial: Float = 0.65 //Colocar informação do banco aqui
    @State var progressValueHobbies: Float = 0.65 //Colocar informação do banco aqui

    
    var body: some View {
        VStack {
            ProgressBar(progressIndividual: $progressValueIndividual,progressHobbies: $progressValueHobbies,progressSocial: $progressValueSocial).frame(height: 10)
        }.frame(width: 100, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct ProgressBar: View {
    @Binding var progressIndividual: Float
    @Binding var progressHobbies: Float
    @Binding var progressSocial: Float
    
    var body: some View {
        VStack{
            //barra Individual
            ZStack(alignment: .leading) {
                Rectangle().frame(width: 150 , height: 20)
                    .opacity(0.3)
                    .foregroundColor(WatchColorManager.purpleCicleBackgroundColor)
                    .background(WatchColorManager.purpleCicleBackgroundColor)
               
                    
                Rectangle().frame(width: min(CGFloat(self.progressIndividual) * 150,  150), height: 20)
                    .foregroundColor(WatchColorManager.purpleCicleColor)
                    .animation(.linear)
                    .overlay(Text("Individual")
                                .bold()
                                .font(.caption2))
                
                }.cornerRadius(45.0)
                .padding(.bottom, 8)
            
            //Barra social
            ZStack(alignment: .leading){
                Rectangle().frame(width: 150 , height: 20)
                    .opacity(0.3)
                    .foregroundColor(WatchColorManager.pinkCicleBackgroundColor)
                    .background(WatchColorManager.pinkCicleBackgroundColor)
                    
                Rectangle().frame(width: min(CGFloat(self.progressHobbies) *  150,  150), height: 20)
                    .foregroundColor(WatchColorManager.pinkCicleColor)
                    .animation(.linear)
                    .overlay(Text("Social")
                                .bold()
                                .font(.caption2))

            }.cornerRadius(45.0)
            .padding(.bottom, 8)

            
            
            //Barra hobbies
            ZStack(alignment: .leading){
                Rectangle().frame(width: 150 , height: 20)
                    .opacity(0.3)
                    .background(WatchColorManager.blueCicleColor)
                    
                Rectangle().frame(width: min(CGFloat(self.progressSocial) *  150,  150), height: 20)
                    .foregroundColor(WatchColorManager.blueCicleColor)
                    .animation(.linear)
                    .overlay(Text("Hobbies")
                                .bold()
                                .font(.caption2))

            }.cornerRadius(45.0)
        }
        
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
