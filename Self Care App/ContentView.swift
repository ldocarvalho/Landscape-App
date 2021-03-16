//
//  ContentView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 25/02/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var userNameData
   // @FetchRequest(entity:Name.entity() , sortDescriptors: []) var nome : FetchedResults<Name>
    @State public var userName: String = ""
    @State var View : Bool = false
    var body: some View {
        GeometryReader { reader in
            NavigationView{
                ZStack {
                    ColorManager.backgroundColor
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        VStack {
                            Text("How would you like to be called?")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(ColorManager.titleTextColor)
                                .multilineTextAlignment(.center)
                                .frame(width: reader.size.width*0.9, height: 100, alignment: .center)
                            
                            TextField("Type your name here", text: $userName)
                                .frame(width: reader.size.width*0.8, height: 50, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(15)
                                .padding(16)
                        }
                        
                        Button(action: {
                            //colocar ação aqui
                            let user = Name(context: userNameData)
                            user.name = self.userName
                            user.firstUse = true
                            do{
                                try userNameData.save()
                                
                            }
                            catch{
                                print("error")
                            }
                            View = true
                        }) {
                            VStack{
                                Text("Continue")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                
                            }
                        }.frame(width: reader.size.width*0.4, height: 40, alignment: .center)
                        .background(ColorManager.mainButtonColor)
                        .cornerRadius(25.0)
                        NavigationLink(destination: RegisterMomentPart1View(momentTitle: "", name: userName), isActive: $View) { EmptyView() }
                        Spacer()
                        Image("iOS - OnboardingImage")
                            .resizable()
                            .frame(width: reader.size.width, height: 315, alignment: .center)
                    } .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                }.onTapGesture {
                    hideKeyboard()
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
