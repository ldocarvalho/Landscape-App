//
//  FuncNotification.swift
//  Self Care App WatchKit Extension
//
//  Created by Victor Vidal on 02/03/21.
//

import Foundation
import UserNotifications
import CoreData
 func scheduleNotifications(hour: Int, weekday: WeekDays, repeats: Bool) {
        
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
//        let category = UNNotificationCategory(identifier: "myCategory", actions: [], intentIdentifiers: [], options: [])
//        UNUserNotificationCenter.current().setNotificationCategories([category])
    if(PersistenceController.shared.IsMomentToday(daysOfWeek: weekday)){
        let content = UNMutableNotificationContent()
        content.title = "atividade"
        content.body = "Texto se tiver atividade"
        content.sound = UNNotificationSound.default
//        content.categoryIdentifier = "myCategory"
    
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.weekday =  Calendar.current.component(.weekday, from: Date()) + 1
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
       // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: repeats)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    else{
        let content = UNMutableNotificationContent()
        content.title = "Nao atividade"
        content.body = "Texto se nao tiver atividade"
        content.sound = UNNotificationSound.default
//        content.categoryIdentifier = "myCategory"
    
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.weekday = Calendar.current.component(.weekday, from: Date()) + 1
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
       // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: repeats)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}


