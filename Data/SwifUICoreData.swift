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
//    static let shared = PersistenceController()
    // Storage for Core Data
    let container: NSPersistentContainer
//        = {
//        let container = NSPersistentContainer(name: "UserData")
//
////         if inMemory {
//            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
//       //  }
//
//        guard let description = container.persistentStoreDescriptions.first else {
//            fatalError("###\(#function): Failed to retrieve a persistent store description")
//        }
//
//        description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
//        description.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
//        description.cloudKitContainerOptions?.databaseScope = .private
//
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                fatalError("Error: \(error.localizedDescription)")
//            }
//        }
//
//        container.viewContext.automaticallyMergesChangesFromParent = true
//        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
//
//        return container
//    }()
 
    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    
    init(inMemory: Bool = true) {
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
    
    func saveName(name: String) {
        let context = container.viewContext
        
        let savedName = NSEntityDescription.insertNewObject(forEntityName: "Name", into: context) as! Name
        savedName.name = name
        savedName.firstUse = true

        if context.hasChanges {
            do {
                try context.save()
            } catch {
            }
        }
    }
    
    func saveMoment(momentTitle: String, daysOfWeek: Int32, partOfTheDay: Int64, repeatActivity: Bool, selfCareType: Int64, done: Bool) {
        let context = container.viewContext
        
        let savedMoment = NSEntityDescription.insertNewObject(forEntityName: "Moment", into: context) as! Moment
        savedMoment.title = momentTitle
        savedMoment.date = Date()
        savedMoment.daysOfWeek = daysOfWeek
        savedMoment.partOfTheDay = partOfTheDay
        savedMoment.repeatActivity = false
        savedMoment.selfCareType = Int64(selfCareType)
        savedMoment.done = false

    }
    
    func fetchMoments() -> [Moment] {
//        @FetchRequest(entity: Moment.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Moment.date, ascending: true )]) var moments: FetchedResults<Moment>
        let context = container.viewContext
        
        let fetchRequest = NSFetchRequest<Moment>(entityName: "Moment")
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Moment.date, ascending: true)]
        
        do {
            let moments = try context.fetch(fetchRequest)
            return moments
        } catch {
            print(error)
            return []
        }
    }
}
