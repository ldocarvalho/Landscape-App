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
    @State var daysOfWeek : WeekDays = []
    @State var showDaysOfWeek : Bool = false
   // @ObservedObject var userSettings = UserSettings()
    @Environment(\.managedObjectContext) var moc
    @Environment(\.managedObjectContext) var moment
    @FetchRequest(entity:Name.entity() , sortDescriptors: []) var nome : FetchedResults<Name>
    
    @State var name : String
    
    var body: some View {
        let subviews = [
            UIHostingController(rootView: RegisterMomentPart1View(momentTitle: $title,name: name )),
            UIHostingController(rootView: RegisterMomentPart2View(partOfTheDay: $partOfTheDay,name: name)),
            UIHostingController(rootView: RegisterMomentPart4View(name: name, daysOfWeek: $daysOfWeek, showDaysOfWeek: $showDaysOfWeek)),
            UIHostingController(rootView: RegisterMomentPart3View(typeOfCare: $typeOfCare,name: name))
        ]
        //NavigationView{
        
        GeometryReader { reader in
            ZStack {
                ColorManager.backgroundColor
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack() {
                    VStack {
                        PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
                            .frame(width: reader.size.width, height: reader.size.height*0.55, alignment: .center)
                        
                        Button(action: {
                            if(RegisterMomentPart3View(typeOfCare: $typeOfCare, name: name).typeOfCare != 0){
                                let momento = Moment(context: moment)
                                momento.date = Date()
                                momento.daysOfWeek = Int32(Int(daysOfWeek.rawValue))
                                momento.title = title
                                momento.partOfTheDay = Int64(partOfTheDay)
                                momento.selfCareType =  Int64(RegisterMomentPart3View(typeOfCare: $typeOfCare, name: name).typeOfCare)
                                momento.repeatActivity = showDaysOfWeek
                                
                                do{
                                   try  moment.save()
                                //   UserDefaults.standard.set(false, forKey: "isFirtUse")
                                }
                                catch{
                                    
                                }
                                UserDefaults.standard.set(false, forKey: "isFirtUse")
                                UserDefaults.standard.set(Date(), forKey:"creationTime")
                                if self.currentPageIndex == 3 {
                                    self.View = true

                                }
                                
                            }
                            if(!RegisterMomentPart4View(name: name, daysOfWeek: $daysOfWeek, showDaysOfWeek: $showDaysOfWeek).daysOfWeek.isEmpty){
                                
                                
                                if self.currentPageIndex == 2 {
                                    daysOfWeek.union(RegisterMomentPart4View(name: name, daysOfWeek: $daysOfWeek, showDaysOfWeek: $showDaysOfWeek).daysOfWeek)
                                    showDaysOfWeek = RegisterMomentPart4View(name: name, daysOfWeek: $daysOfWeek, showDaysOfWeek: $showDaysOfWeek).showDaysOfWeek
                                    currentPageIndex += 1

                                }
                                
                            }
                            
                            if(RegisterMomentPart2View(partOfTheDay: $partOfTheDay, name: name).partOfTheDay != 0){
                                
                                
                                if self.currentPageIndex == 1 {
                                    partOfTheDay = RegisterMomentPart2View(partOfTheDay: $partOfTheDay, name: name).partOfTheDay
                                    currentPageIndex += 1

                                }
                                
                            }
                            
                            if(RegisterMomentPart1View(momentTitle: $title, name: name).momentTitle != ""){
                               
                                  
                                if self.currentPageIndex == 0 {
                                    title = RegisterMomentPart1View(momentTitle: $title, name: name).momentTitle
                                    currentPageIndex += 1

                                }
                                
                            }
                            
                        }) {
                            Text("Continue")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }.frame(width: reader.size.width*0.4, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(ColorManager.mainButtonColor)
                        .cornerRadius(25.0)
                        .padding(.top, -10)
                        
                        //PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                            
                        NavigationLink(destination: MainView(), isActive: $View) { EmptyView() }
                        
                    }
                    .frame(width: reader.size.width, height: reader.size.height*0.55, alignment: .center)
                    .padding(.top, 35)
//                    .padding(.bottom, -20)

                    VStack {
                        Image("iOS - OnboardingImage")
                            .resizable()
                            .frame(width: reader.size.width, height: 315, alignment: .center)
                            //.padding(.bottom, 60)
                    }
                    .frame(width: reader.size.width, height: reader.size.height*0.5, alignment: .center)
                }
                .navigationBarBackButtonHidden(true)
                .frame(width: reader.size.width, height: reader.size.height, alignment: .top)
                .navigationBarHidden(true)
                .padding(.top,20)

            }
            
        }
            
       // }.navigationBarBackButtonHidden(true)
    }
        
}


struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(name: "Lorena")
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
        control.currentPageIndicatorTintColor = UIColor.white
        control.pageIndicatorTintColor = UIColor.gray

        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPageIndex
    }
    
}

