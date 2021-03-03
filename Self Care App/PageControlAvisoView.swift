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
        UIHostingController(rootView: AvisoView(mensagem: "mensagem 1",pergunta: "dale?")),
        UIHostingController(rootView: AvisoView(mensagem: "mensagem 2",pergunta: "dale?")),
        UIHostingController(rootView: AvisoView(mensagem: "mensagem 3", pergunta: "dale?"))
    ]
    
    @State var currentPageIndex = 0
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
                    .frame(height: 600)
                    .padding()
                VStack {
                    PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                        
                    NavigationLink(destination: MomentsView(), isActive: $View) { EmptyView() }
                    Spacer()
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
        
}


struct OnBoardViewPage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewPage()
    }
}


///------------------------------------------------------------


//--------------------------------------------

