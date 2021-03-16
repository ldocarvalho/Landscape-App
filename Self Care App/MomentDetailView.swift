//
//  MomentDetailView.swift
//  Self Care App
//
//  Created by Lucas Carvalho on 02/03/21.
//

import SwiftUI

struct MomentDetailView: View {
    var title : String = ""
    var description : String = ""
    var image : String = "p1"
    var id : Int = 0
  
    var texts = ["Personal activities are the ones you’ll do by yourself and will reinforce your connection with yourself.", "Social activities are the ones you’ll do with other people around you and will stimulate your social interactions.", "Physical activities are the ones you’ll do in order to take care of your physical health, so your mind and body stay tuned in a great sync."]
    @State var done : Bool
    @State var shownDeleteAlert = false
    @State var shownDoneAlert = false
    @State var delete = false
    
    @State var View : Bool = false
    @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moment: FetchedResults<Moment>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        GeometryReader { g in
            VStack {
                        VStack {
                            Image(image)
                                .resizable()
//                                .opacity((shownDeleteAlert || shownDoneAlert) ? 0.3 : 1)
                                .blur(radius: (shownDeleteAlert || shownDoneAlert) ? 1 : 0)
                                .frame(width: g.size.width*1.01, height: g.size.width*0.7, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                        }.offset(y: -g.frame(in: .global).minY-10)
                        
                        
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    View.toggle()
                                }, label: {
                                    Text("Edit")
                                        .foregroundColor(ColorManager.actionButtonColor)
                                        .fontWeight(.bold)
                                })
                            }.padding([.leading, .trailing], 26)
                            .padding(.top, 30)
                            
                            HStack() {
                                Text(title)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorManager.titleTextColor)
                                    .frame(width: g.size.width*0.9, height: 80, alignment: .leading)
                                Spacer()
                                
                            } .padding([.leading, .trailing], 20)
                            if !delete{
                                Text(texts[Int(moment[id].selfCareType)-1])
                                    .font(.body)
                                    .foregroundColor(ColorManager.bodyTextColor)
                                    .frame(width: g.size.width*0.9, height: 80, alignment: .leading)
                            }
                            
                            
                            
                            HStack {
                                Text("Is this moment done for today?")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(ColorManager.titleTextColor)
                                Spacer()
                            }.frame(width: g.size.width*0.9, height: 40, alignment: .leading)
                            
                            HStack {
                                Button(action: {
//                                    if showDeleteAlert {
//                                        DeleteAlertView(shown: $showDeleteAlert)
//                                    }
                                    shownDeleteAlert.toggle()
                                   
                                }, label: {
                                    Text("Delete moment")
                                        .foregroundColor(ColorManager.textColorSecondaryButton)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                })
                                .frame(width: g.size.width*0.45, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(ColorManager.secondaryButtonColor)
                                .cornerRadius(25.0)
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    // adicionar salvar na outra view
                                    if(moment[id].done){
                                        
                                    }
                                    else{
                                        shownDoneAlert.toggle()
                                        moment[id].done = true
                                        do{
                                            try moc.save()
                                        }
                                        catch{
                                            
                                        }
                                    }
                                    
                                }, label: {
                                    Text(done ? "Done" : "It's done")
                                        .foregroundColor(ColorManager.textColorMainButton)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                })
                                .frame(width: g.size.width*0.45, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .opacity(done ? 0.4 : 1)
                                .background(ColorManager.mainButtonColor)
                                .cornerRadius(25.0)
                            }
                            .frame(width: g.size.width*0.9, height: 100, alignment: .center)
                            
                            Rectangle()
                                .frame(height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(ColorManager.backgroundColor)
                        }.background(ColorManager.backgroundColor)
                        .clipShape(CustomCorner())
                        .offset(y: -g.frame(in: .global).minY - 50)
//                        .opacity((shownDeleteAlert || shownDoneAlert) ? 0.3 : 1)
                        .blur(radius: (shownDeleteAlert || shownDoneAlert) ? 2 : 0)
                
                
                if shownDeleteAlert {
                    DeleteAlertView(shown: $shownDeleteAlert, delete: $delete, id: id)
                        .offset(y: -g.frame(in: .global).minY - 880).onDisappear(perform: {
                            if delete{
                                moc.delete(moment[id])
                                    do{
                                        try moc.save()
                                    }
                                    catch{

                                    }
                                   
                            }
                            
                        })
                }
                
                if shownDoneAlert {
                    DoneAlertView(shown: $shownDoneAlert)
                        .offset(y: -g.frame(in: .global).minY - 880)
                }
             //   NavigationLink(destination: MainView(), isActive: $delete) { EmptyView() }
                
            }.sheet(isPresented: self.$View, content: {NewMomentView(itsEditing: true, id: id)})
            .background(Color.white)
            .frame(width: g.size.width, alignment: .center)
            .navigationBarHidden((shownDeleteAlert || shownDoneAlert) ? true : false)
        }.background(ColorManager.backgroundColor)
    }
}

struct MomentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MomentDetailView(done: false)
    }
}
