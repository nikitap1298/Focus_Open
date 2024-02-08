//
//  CoreDataModel.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import CloudKit
import CoreData
import SwiftUI

@MainActor
public class CoreDataModel: ObservableObject {
    
    @Published var selectedTask: TaskEntity?
    
    static let shared = CoreDataModel()
    let context = PersistenceController.shared.container.viewContext
    
    private var taskList: FetchedResultList<TaskEntity>
    private var _privatePersistentStore: NSPersistentStore?

    private var ckContainer: CKContainer {
        let storeDescription = PersistenceController.shared.container.persistentStoreDescriptions.first
        guard let identifier = storeDescription?.cloudKitContainerOptions?.containerIdentifier else {
            fatalError("Unable to get container identifier")
        }
        return CKContainer(identifier: identifier)
    }
    
    private var privatePersistentStore: NSPersistentStore {
        guard let privateStore = _privatePersistentStore else {
            fatalError("Private store is not set")
        }
        return privateStore
    }
    
    init() {
        _privatePersistentStore = PersistenceController.shared.container.persistentStoreCoordinator.persistentStores.first
        
        taskList = FetchedResultList(context: context,
                                       filter: nil,
                                     sortDescriptors: [NSSortDescriptor(keyPath: \TaskEntity.createdAt, ascending: true)])
        
        taskList.willChange = { [weak self] in
            self?.objectWillChange.send()
        }
    }
    
    // MARK: - Tasks
    var tasks: [TaskEntity] {
        return taskList.items
    }
    
    func setSelectedTask(_ task: TaskEntity) {
        selectedTask = task
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch {
            fatalError("Error during savingContext: \(error.localizedDescription)")
        }
    }
}
