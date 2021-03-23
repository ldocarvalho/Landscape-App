//
//  NotificationView.swift
//  Self Care App WatchKit Extension
//
//  Created by Lucas Carvalho on 25/02/21.
//

import SwiftUI

struct NotificationView: View {
    
    var title: String = ""
    var image : String = ""
    var id : Int
    @State var View: Bool = false
    
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moment: FetchedResults<Moment>
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        GeometryReader { g in
            VStack {
                VStack {
                    Image(image)
                        .resizable()
                        .frame(width: g.size.width*0.8, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(5.0)
                        .padding(.bottom, 4)
                        .background(NavigationLink(destination: MenuView(), isActive: $View) { EmptyView()})
                    Text("Question \(title)")
    //                    .font(.caption2)
                        .font(.system(size: 13, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 140, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .frame(width: g.size.width, height: g.size.height*0.8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(WatchColorManager.menuBackgroundColor)
                .cornerRadius(15.0)
               
                Spacer()
               
                HStack {
                    Text(LocalizedStringKey("No"))
                        .frame(width: g.size.width*0.4, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(WatchColorManager.noButtonColor)
                        .cornerRadius(15.0)
                        .onTapGesture {
                            View.toggle()
                        }
                    Text(LocalizedStringKey("Yes"))
                        .frame(width: g.size.width*0.4, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(WatchColorManager.menuTextColor)
                        .foregroundColor(.black)
                        .cornerRadius(15.0)
                        .onTapGesture {
                            moment[id].done = true
                            do{
                                try moc.save()
                            }
                            catch{
                            }
                            View.toggle()
                    }
                    
                }
               
            }.navigationBarTitle(Text(LocalizedStringKey("Moments")))
        }
    }
}



//struct NotificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationView()
//    }
//}
