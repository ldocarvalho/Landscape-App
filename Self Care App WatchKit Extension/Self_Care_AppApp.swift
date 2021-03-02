//
//  Self_Care_AppApp.swift
//  Self Care App WatchKit Extension
//
//  Created by Lucas Carvalho on 25/02/21.
//

import SwiftUI
import UserNotifications
@main
struct Self_Care_AppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                MenuView()
                
            }
        }
        
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

