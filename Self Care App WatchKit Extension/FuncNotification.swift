//
//  FuncNotification.swift
//  Self Care App WatchKit Extension
//
//  Created by Victor Vidal on 02/03/21.
//

import Foundation
import UserNotifications
public func scheduleNotifications(hour: Int,minute: Int, weekday:Int,repeats: Bool) {
        
        
       // UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        let category = UNNotificationCategory(identifier: "myCategory", actions: [], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        let content = UNMutableNotificationContent()
        content.title = "teste"
        content.body = "teste"
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "myCategory"
    
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.weekday = weekday
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: repeats)
       // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: repeats)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
}
