//
//  TaskEntityProtocol.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

protocol TaskEntityProtocol {
    func createTask(coreDataModel: CoreDataModel, initialTime: Int) async
    func updateRemainingTimeAndIsFinished(coreDataModel: CoreDataModel, remainingTime: Int) async
}

extension TaskEntityProtocol {
    @MainActor func createTask(coreDataModel: CoreDataModel, initialTime: Int) async {
        let newTask = TaskEntity(context: coreDataModel.context)
        newTask.id = UUID()
        newTask.initialTime = Int16(initialTime)
        newTask.remainingTime = Int16(initialTime)
        newTask.createdAt = Date.now
        newTask.isFinished = false
        newTask.name = "Task: \(Date.now)"
        
        coreDataModel.saveContext()
        coreDataModel.setSelectedTask(newTask)
    }
    
    @MainActor func updateRemainingTimeAndIsFinished(coreDataModel: CoreDataModel,
                                                     remainingTime: Int) async {
        guard let selectedTask = coreDataModel.selectedTask else { return }
        selectedTask.remainingTime = Int16(remainingTime)
        if remainingTime == 0 {
            selectedTask.isFinished = true
        }
        coreDataModel.saveContext()
    }
}
