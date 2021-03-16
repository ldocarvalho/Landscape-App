//
//  RegisterMomentPart1View.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct RegisterMomentPart1View: View {
    
    @State var momentTitle: String
    @State var name: String
    @State var View : Bool = false
    @State var shownEmptyFieldAlert = false
    var body: some View {
        GeometryReader { reader in
                ZStack {
                    ColorManager.backgroundColor
                        .edgesIgnoringSafeArea(.all)
                    VStack() {
                        Spacer()
                        VStack() {
                            Text("Hi, " + name + "!")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(ColorManager.bodyTextColor)
                                .padding(.bottom, 8)
                            Text("What about adding a new self care moment in your routine?")
                                .font(.body)
                                .fontWeight(.medium)
                                .padding([.leading, .trailing], 16)
                                .multilineTextAlignment(.center)
                                .foregroundColor(ColorManager.titleTextColor)
                        }.frame(height: 115)
                        .blur(radius: shownEmptyFieldAlert ? 8 : 0)
                        VStack {
                            Text("What would you like to do to take care of yourself today?")
                                .foregroundColor(ColorManager.bodyTextColor)
                                .fontWeight(.bold)
                                .frame(width: reader.size.width*0.9, height: 60, alignment: .leading)
                            TextField("Type your self care moment here", text: $momentTitle)
                                .frame(width: reader.size.width*0.9, height: 60, alignment: .center)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(15)
                        }.padding([.leading, .trailing, .top], 16)
                        .blur(radius: shownEmptyFieldAlert ? 8 : 0)
//                        Spacer()
                        Button(action: {
                            if(momentTitle.isEmpty){
                                shownEmptyFieldAlert.toggle()
                            }
                            else{
                                View.toggle()
                            }
                            
                        }) {
                            Text("Continue")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }.frame(width: reader.size.width*0.4, height: 40, alignment: .center)
                        .background(ColorManager.mainButtonColor)
                        .cornerRadius(25.0)
                        .padding(.top, 10)
                        NavigationLink(destination: RegisterMomentPart2View(partOfTheDay: 0, name: name, momentTitle: momentTitle), isActive: $View) { EmptyView() }
                    
                        Spacer()
                        
                        Image("iOS - OnboardingImage")
                            .resizable()
                            .frame(width: reader.size.width, height: 315, alignment: .bottom)
                            .padding(.bottom, -50)
                    } .blur(radius: shownEmptyFieldAlert ? 8 : 0)
                    .frame(width: reader.size.width, alignment: .center)
                    .navigationBarHidden(true)
              
//                    .padding(.top,10)
                    if shownEmptyFieldAlert {
                        EmptyFieldView(shown: $shownEmptyFieldAlert)
                            .offset(y: 0)
                    }
                }.onTapGesture {
                    hideKeyboard()
                }
        }
    }
    
    func getName() -> String{
        return momentTitle
    }
}

struct RegisterMomentPart1View_Previews: PreviewProvider {
    @State static var teste = ""
    
    static var previews: some View {
        RegisterMomentPart1View(momentTitle: "", name: "Lorena")
    }
}
