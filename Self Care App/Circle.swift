//
//  Circle.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 01/03/21.
//

import Foundation
import SwiftUI


struct ContentViewCircle: View {
    @State var progressValueIndividual: Float = 0.4 //Colocar informação do banco aqui
    @State var progressValueSocial: Float = 0.65 //Colocar informação do banco aqui
    @State var progressValueHobbies: Float = 0.73 //Colocar informação do banco aqui
        
        var body: some View {
            NavigationView{
                ZStack {
                    Color.yellow
                        .opacity(0.1)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("What about taking care of yourself today? You can do it!")
                            .font(.body)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(ColorManager.titleTextColor)
                            .padding([.leading, .trailing, .bottom], 16)
                            .padding([.top], 32)
                            .multilineTextAlignment(.center)
                        Circles(progressIndividual: self.$progressValueIndividual,progressSocial: self.$progressValueSocial,progressHobbies: self.$progressValueHobbies)
                             .frame(width: 300.0, height: 300.0)
                            .padding([.leading, .trailing, .top, .bottom], 16)
                        Spacer()
                        ProgressBar(progressIndividual: $progressValueIndividual,progressHobbies: $progressValueHobbies,progressSocial: $progressValueSocial).frame(height: 20)
                        Spacer()
                    }
                }.navigationTitle(Text("Meus Ciclos"))
            }
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
                    .opacity(0.3)
                    .foregroundColor(Color.red)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progressIndividual,1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(ColorManager.purpleCicleColor)
                    .rotationEffect(Angle(degrees:270))
                    .animation(.linear)
                
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(Color.blue)
                    .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progressSocial,1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(ColorManager.pinkCicleColor)
                    .rotationEffect(Angle(degrees:270))
                    .animation(.linear)
                    .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(Color.purple)
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progressHobbies,1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(ColorManager.blueCicleColor)
                    .rotationEffect(Angle(degrees:270))
                    .animation(.linear)
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        

            }
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
                    Rectangle().frame(width: 300 , height: 20)
                        .opacity(0.3)
                        .foregroundColor(ColorManager.purpleCicleBackgroundColor)
                        
                    Rectangle().frame(width: min(CGFloat(self.progressIndividual) *  300,  300), height: 20)
                        .foregroundColor(ColorManager.purpleCicleColor)
                        .animation(.linear)
                    
                    
                    }.cornerRadius(45.0)
                //Barra hobbies
                ZStack(alignment: .leading){
                    Rectangle().frame(width: 300 , height: 20)
                        .opacity(0.3)
                        .foregroundColor(ColorManager.pinkCicleBackgroundColor)
                        
                    Rectangle().frame(width: min(CGFloat(self.progressHobbies) *  300,  300), height: 20)
                        .foregroundColor(ColorManager.pinkCicleColor)
                        .animation(.linear)
                }.cornerRadius(45.0)
                //Barra social
                ZStack(alignment: .leading){
                    Rectangle().frame(width: 300 , height: 20)
                        .opacity(0.3)
                        .foregroundColor(ColorManager.blueCicleBackgroundColor)
                        
                    Rectangle().frame(width: min(CGFloat(self.progressSocial) *  300,  300), height: 20)
                        .foregroundColor(ColorManager.blueCicleColor)
                        .animation(.linear)
                }.cornerRadius(45.0)
            }
            
            
        }
    }
    
struct Circle_Preview: PreviewProvider {
    static var previews: some View {
        ContentViewCircle()
    }
}

