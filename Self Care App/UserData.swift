//
//  UserData.swift
//  Self Care App
//
//  Created by Victor Vidal on 01/03/21.
//

import Foundation
import CoreData
import UserNotifications
import Combine

class UserSettings: ObservableObject {
    @Published var firstUse: Bool {
            didSet {
                UserDefaults.standard.set(firstUse, forKey: "isFirtUse")
            }
        }
    
    init() {
        self.firstUse = UserDefaults.standard.object(forKey: "isFirstUse") as? Bool ?? true
    }
}

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
func CurrentDay() -> WeekDays{
    var daysOfWeek : WeekDays = []
    let weekday = Calendar.current.component(.weekday, from: Date())
    switch(weekday){
    case 1:
        daysOfWeek.insert(.sunday)
        return daysOfWeek
    case 2:
        daysOfWeek.insert(.monday)
        return daysOfWeek
    case 3:
        daysOfWeek.insert(.thuesday)
        return daysOfWeek
    case 4:
        daysOfWeek.insert(.wednesday)
        return daysOfWeek
    case 5:
        daysOfWeek.insert(.thursday)
        return daysOfWeek
    case 6:
        daysOfWeek.insert(.friday)
        return daysOfWeek
    case 7:
        daysOfWeek.insert(.saturday)
        return daysOfWeek
    default:
        daysOfWeek.insert(.sunday)
        return daysOfWeek
        
    }

}
