//
//  ContentView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 25/02/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        GeometryReader { reader in
            NavigationView{
                ZStack {
                    ColorManager.backgroundColor
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        VStack {
                            Text(LocalizedStringKey("Onboarding-1-Label-Name"))
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(ColorManager.titleTextColor)
                                .multilineTextAlignment(.center)
                                .frame(width: reader.size.width*0.9, height: 100, alignment: .center)
                            
                            TextField(LocalizedStringKey("Onboarding-1-Placeholder-Name"), text: $viewModel.userName)
                                .frame(width: reader.size.width*0.8, height: 50, alignment: .center)
                                .textFieldStyle(CircularTextFieldStyle())
                                .padding(16)
                        }.blur(radius: viewModel.shownEmptyFieldAlert ? 8 : 0)
                        
                        Button(action: {                           
                            viewModel.saveName()
                        }) {
                            VStack{
                                Text(LocalizedStringKey("Onboarding-1-Button-Name"))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                
                            }
                        }.frame(width: reader.size.width*0.4, height: 40, alignment: .center)
                        .background(ColorManager.mainButtonColor)
                        .cornerRadius(25.0)
                        NavigationLink(destination: RegisterMomentPart1View(momentTitle: "", name: viewModel.name), isActive: $viewModel.View) { EmptyView() }
                        Spacer()
                        Image("iOS - OnboardingImage")
                            .resizable()
                            .frame(width: reader.size.width, height: reader.size.height*0.38, alignment: .center)
                    } .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                    .blur(radius: viewModel.shownEmptyFieldAlert ? 8 : 0)
                    
                    if viewModel.shownEmptyFieldAlert {
                        EmptyFieldView(shown: $viewModel.shownEmptyFieldAlert)
                            .offset(y: 0)
                    }
                }.onTapGesture {
                    hideKeyboard()
                    viewModel.shownEmptyFieldAlert = false
                }
            }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .accentColor(Color("NavigationColor"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        ContentView()
    }
}

struct CircularTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.leading, 10)
            .padding(5)
            .background(LinearGradient(gradient: Gradient(colors: [ColorManager.textFieldColor, ColorManager.textFieldColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
    }
}
