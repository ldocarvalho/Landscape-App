//
//  SwifUICoreData.swift
//  Self Care App
//
//  Created by Victor Vidal on 03/03/21.
//

import Foundation
import SwiftUI
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()
    // Storage for Core Data
    let container: NSPersistentContainer
 
    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentCloudKitContainer(name: "UserData")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        guard let description = container.persistentStoreDescriptions.first else {
                    fatalError("###\(#function): Failed to retrieve a persistent store description")
            }
        
        description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        description.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        description.cloudKitContainerOptions?.databaseScope = .private
        
    
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }
    func IsMomentToday(daysOfWeek:WeekDays) -> Bool{
        let context = container.viewContext
        
        let fetchRequest = NSFetchRequest<Moment>(entityName: "Moment")
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Moment.date, ascending: true)]
        
        do {
            let moments = try context.fetch(fetchRequest)
            for i in 0 ... moments.count {
                if(i < moments.count && (WeekDays(rawValue: Int(moments[i].daysOfWeek)).contains(daysOfWeek))){
                    return true
                }
            }
        } catch {
            print(error)
            return false
        }
        return false
    }
    func userName() -> String{
        let context = container.viewContext
        
        let fetchRequest = NSFetchRequest<Name>(entityName: "Name")
        
        do {
            let moments = try context.fetch(fetchRequest)
            return moments[0].name as! String
        } catch {
            print(error)
            return ""
        }
        return ""
    }
}
