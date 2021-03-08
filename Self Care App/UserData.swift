//
//  UserData.swift
//  Self Care App
//
//  Created by Victor Vidal on 01/03/21.
//

import Foundation
import CoreData
import UserNotifications


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

