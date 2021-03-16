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
        UIHostingController(rootView: AvisoView(mensagem: "Self care is not only skincare or yoga. Think about anything in your life that gives you joy and well-being, no matter if it’s calling a friend on the weekends or a meditation session in the morning. There are no rules, just wonder about what makes you happy.",pergunta: "What is self care?")),
        UIHostingController(rootView: AvisoView(mensagem: "The chaotic routine sometimes might let you think there’s no time for you in your day-to-day life. Wonder about what you said you want to do to care for you and in what part of your day you would most likely do it.",pergunta: "How to put self care in your routine?")),
        UIHostingController(rootView: AvisoView(mensagem: "There are many categories of activities that are seen as self care." + "\n\n• Personal activities are the ones you’ll do by yourself and will reinforce your connection with yourself." + "\n• Social activities are the ones you’ll do with other people around you and will stimulate your social interactions." + "\n• Physical activities are the ones you’lldo in order to take care of your physical health,so your mind and body stay tuned in a great sync.", pergunta: "What is self care type?"))
    ]
    
    @State var currentPageIndex = 0
    
    var body: some View {
            VStack() {
                PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
                    .frame(height: 600)
                                    
                VStack {
                    PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                        .padding()
                    Spacer()
                    NavigationLink(destination: MomentsView(), isActive: $View) { EmptyView() }
                }
            }
//        }.navigationBarBackButtonHidden(true)
    }
        
}


struct OnBoardViewPage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewPage()
    }
}
