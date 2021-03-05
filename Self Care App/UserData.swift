//
//  UserData.swift
//  Self Care App
//
//  Created by Victor Vidal on 01/03/21.
//

import Foundation
import CoreData
import UserNotifications

//internal struct UserDataManager{
//    static let shared = UserDataManager()
//
//    let persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "Moment")
//        container.loadPersistentStores { (storeDescription, error) in
//            if let error = error {
//                fatalError("erro de load \(error)")
//            }
//        }
//        return container
//    }()
////    public class Moment {
////        var partOfTheDay: Int = 0
////        var selfCareType: Int
////        var title: String
////        var repeatActivity: Bool
////        var daysOfWeek: [Int]
////
////
//////        init(atividade: String, descriçao: String, ilustração: UIImage, mood : Int) {
//////            self.atividade = atividade
//////            self.descriçao = descriçao
//////            self.ilustração = ilustração
//////            self.mood = mood
//////        }
////
////
////    }
//
//    func createMoment(partOfTheDay: Int?, selfCareType: Int?, title: String?, repeatActivity: Bool?, daysOfWeek:[Int]?) -> Moment? {
//
//                let context = persistentContainer.viewContext
//                let userDetails = NSEntityDescription.insertNewObject(forEntityName: "Moment", into: context) as! Moment
//
//                userDetails.partOfTheDay = Int32(partOfTheDay!)
//                userDetails.selfCareType = Int32(selfCareType!)
//                userDetails.title = title
//                userDetails.repeatActivity = repeatActivity!
//                userDetails.daysOfWeek = daysOfWeek as NSObject?
//
//                do {
//                    try context.save()
//                    return userDetails
//                } catch let createError {
//                    print("Failed to create: \(createError)")
//                }
//
//                return nil
//           }
//
//    func fetchMoments() -> [Moment]? {
//            let context = persistentContainer.viewContext
//            let fetchRequest = NSFetchRequest<Moment>(entityName: "Moment")
//
//        do{
//            let momentsList = try context.fetch(fetchRequest)
//            return momentsList
//        } catch let error{
//            print("Fetch Failed: \(error)")
//        }
//        return nil
//    }
//    func updatMomets(Moment: Moment){
//                let context = persistentContainer.viewContext
//              do{
//                    try context.save()
//                    } catch let updateError {
//                        print("Failed to update: \(updateError)")
//                }
//            }
//    func deleteMoment(investigation: Moment){
//                let context = persistentContainer.viewContext
//              context.delete(investigation)
//              do{
//                 try context.save()
//                 } catch let deleteError {
//               print("Failed to delete: \(deleteError)")
//               }
//            }
//    func scheduleNotifications() {
//            
//            
//            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
//            let content = UNMutableNotificationContent()
//            content.title = "teste"
//            content.body = "teste"
//            content.sound = UNNotificationSound.default
//
//            var dateComponents = DateComponents()
//            dateComponents.hour = 14
//            dateComponents.minute = 45
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//    //        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//            UNUserNotificationCenter.current().add(request)
//    }
//
//
struct WeekDays: OptionSet {
    let rawValue: Int

    static let sunday    = WeekDays(rawValue: 1 << 0)
    static let monday  = WeekDays(rawValue: 1 << 1)
    static let thuesday  = WeekDays(rawValue: 1 << 2)
    static let wednesday  = WeekDays(rawValue: 1 << 3)
    static let thursday  = WeekDays(rawValue: 1 << 4)
    static let friday  = WeekDays(rawValue: 1 << 5)
    static let saturday  = WeekDays(rawValue: 1 << 6)
    

   // static let express: ShippingOptions = [.nextDay, .secondDay]
    //static let all: WeekDays = [.sunday, .monday, .thuesday]
    mutating func toogle(_ daysOfWeek:WeekDays){
        if(daysOfWeek.contains(daysOfWeek)){
            self.remove(daysOfWeek)
        }
        else{
            self.insert(daysOfWeek)
        }
    }
   
}
