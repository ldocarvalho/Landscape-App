//
//  PageControlOnboard.swift
//  Self Care App
//
//  Created by Victor Vidal on 02/03/21.
//

import Foundation
import SwiftUI



struct OnboardingViewPage: View {
    @State var View = false
    
    var subviews = [
        UIHostingController(rootView: AvisoView(mensagem: LocalizedStringKey("Info-1-Answer"),pergunta: LocalizedStringKey("Info-1-Question"))),
        UIHostingController(rootView: AvisoView(mensagem: LocalizedStringKey("Info-2-Answer"),pergunta: LocalizedStringKey("Info-2-Question"))),
        UIHostingController(rootView: AvisoView(mensagem: LocalizedStringKey("Info-3-Answer"),pergunta: LocalizedStringKey("Info-3-Question")))
    ]
    
    @State var currentPageIndex = 0
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        GeometryReader { reader in
            ZStack {
                ColorManager.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack() {
                    PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
                        .frame(height: 550)

                    PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                        .padding()
                        .frame(width: 80, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(ColorManager.cardColor)
                        .cornerRadius(25.0)
                    NavigationLink(destination: MomentsView(), isActive: $View) { EmptyView() }
                    
                    Spacer()
                }
                .frame(width: reader.size.width, height: reader.size.height*0.8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(false)
                .onDisappear(perform:{
                    print("a")
                })
            }

//            .navigationBarTitleDisplayMode(.inline)
        }
//        }.navigationBarBackButtonHidden(true)
    }
}


struct OnBoardViewPage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewPage()
    }
}
