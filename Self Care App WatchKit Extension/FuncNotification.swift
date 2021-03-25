//
//  FuncNotification.swift
//  Self Care App WatchKit Extension
//
//  Created by Victor Vidal on 02/03/21.
//

import Foundation
import UserNotifications
import CoreData
import SwiftUI

 func scheduleNotifications(hour: Int, weekday: WeekDays, repeats: Bool) {
        
    let userName = PersistenceController.shared.userName()
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
//        let category = UNNotificationCategory(identifier: "myCategory", actions: [], intentIdentifiers: [], options: [])
//        UNUserNotificationCenter.current().setNotificationCategories([category])
    if(PersistenceController.shared.IsMomentToday(daysOfWeek: weekday)){
        let content = UNMutableNotificationContent()
        content.title = userName + NSLocalizedString("Have-Title", comment: "Notification Title")
        content.body = NSLocalizedString("Have-Body", comment: "Notification Body")
        content.sound = UNNotificationSound.default
//        content.categoryIdentifier = "myCategory"
    
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.weekday =  Calendar.current.component(.weekday, from: Date()) + 1
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: repeats)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    else{
        let content = UNMutableNotificationContent()
        content.title = userName + NSLocalizedString("DontHave-Title", comment: "Notification Title")
        content.body = NSLocalizedString("DontHave-Body", comment: "Notification Body")
        content.sound = UNNotificationSound.default
//        content.categoryIdentifier = "myCategory"
    
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.weekday = Calendar.current.component(.weekday, from: Date()) + 1
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: repeats)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}


