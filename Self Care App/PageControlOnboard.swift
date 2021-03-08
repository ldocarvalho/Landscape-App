//
//  PageControlOnboard.swift
//  Self Care App
//
//  Created by Victor Vidal on 02/03/21.
//

import Foundation
import SwiftUI



struct OnboardingView: View {
    @State var View = false
    @State var title = ""
    @State var partOfTheDay = 0
    @State var typeOfCare = 0
    @State var currentPageIndex = 0
    @ObservedObject var userSettings = UserSettings()
    @Environment(\.managedObjectContext) var moc
    @Environment(\.managedObjectContext) var moment
    @FetchRequest(entity:Name.entity() , sortDescriptors: []) var nome : FetchedResults<Name>
    
    
    var body: some View {
        let subviews = [
            UIHostingController(rootView: RegisterMomentPart1View(momentTitle: $title,name: nome[0].name! )),
            UIHostingController(rootView: RegisterMomentPart2View(partOfTheDay: $partOfTheDay,name: nome[0].name!)),
            UIHostingController(rootView: RegisterMomentPart3View(typeOfCare: $typeOfCare,name: nome[0].name!))
        ]
        //NavigationView{
            
            VStack(alignment: .leading) {
                PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
                    .frame(height: 600)
                    .padding()
                VStack {
                   
                    Button(action: {
                       
                        
                        if(RegisterMomentPart3View(typeOfCare: $typeOfCare, name: nome[0].name!).typeOfCare != 0){
                            let momento = Moment(context: moment)
                            momento.date = Date()
                            momento.daysOfWeek = 1
                            momento.title = title
                            momento.partOfTheDay = Int64(partOfTheDay)
                            momento.selfCareType =  Int64(RegisterMomentPart3View(typeOfCare: $typeOfCare, name: nome[0].name!).typeOfCare)
                            momento.done = false
                            nome[0].firstUse = false
                            
                            do{
                               try moc.save()
                               try  moment.save()
                                
                            }
                            catch{
                                
                            }
                            UserDefaults.standard.set(false, forKey: "isFirtUse")
                            if self.currentPageIndex == 2 {
                                self.View = true

                            }
                            
                        }
                        
                        if(RegisterMomentPart2View(partOfTheDay: $partOfTheDay, name: nome[0].name!).partOfTheDay != 0){
                            
                            
                            if self.currentPageIndex == 1 {
                                partOfTheDay = RegisterMomentPart2View(partOfTheDay: $partOfTheDay, name: nome[0].name!).partOfTheDay
                                currentPageIndex += 1

                            }
                            
                        }
                        
                        if(RegisterMomentPart1View(momentTitle: $title, name: nome[0].name!).momentTitle != ""){
                           
                              
                            if self.currentPageIndex == 0 {
                                title = RegisterMomentPart1View(momentTitle: $title, name: nome[0].name!).momentTitle
                                currentPageIndex += 1

                            }
                            
                        }
                        
                    }) {
                        Text("Continuar")
                            .padding()
                    }.background(Color.purple)
                    .padding(20)
                    .foregroundColor(.white)
                    
                    PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                        Spacer()
                    NavigationLink(destination: MyMomentsView(), isActive: $View) { EmptyView() }
                    Spacer()
                    
                }
            }.navigationBarBackButtonHidden(true)
       // }.navigationBarBackButtonHidden(true)
    }
        
}


struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


///------------------------------------------------------------

struct PageViewController: UIViewControllerRepresentable {
    
    @Binding var currentPageIndex: Int
    
    var viewControllers: [UIViewController]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [viewControllers[currentPageIndex]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var parent: PageViewController

        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            //retrieves the index of the currently displayed view controller
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                 return nil
             }
            
            //shows the last view controller when the user swipes back from the first view controller
            if index == 0 {
                return parent.viewControllers.last
            }
 
            //show the view controller before the currently displayed view controller
            return parent.viewControllers[index - 1]
            
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            //retrieves the index of the currently displayed view controller
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                return nil
            }
            //shows the first view controller when the user swipes further from the last view controller
            if index + 1 == parent.viewControllers.count {
                return parent.viewControllers.first
            }
            //show the view controller after the currently displayed view controller
            return parent.viewControllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.viewControllers.firstIndex(of: visibleViewController)
            {
                parent.currentPageIndex = index
            }
        }
    }
    
}

//--------------------------------------------
struct PageControl: UIViewRepresentable {
    
    var numberOfPages: Int
    
    @Binding var currentPageIndex: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPageIndicatorTintColor = UIColor.orange
        control.pageIndicatorTintColor = UIColor.gray

        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPageIndex
    }
    
}

