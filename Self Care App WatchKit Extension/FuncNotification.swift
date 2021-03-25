//
//  FuncNotification.swift
//  Self Care App WatchKit Extension
//
//  Created by Victor Vidal on 02/03/21.
//

import Foundation
import UserNotifications
import CoreData
public func scheduleNotifications(hour: Int, minute: Int, weekday: Int, repeats: Bool, title: String, body: String) {
        
        
       // UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
//        let category = UNNotificationCategory(identifier: "myCategory", actions: [], intentIdentifiers: [], options: [])
//        UNUserNotificationCenter.current().setNotificationCategories([category])
    
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
//        content.categoryIdentifier = "myCategory"
    
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.weekday = weekday
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
       // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: repeats)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
}


