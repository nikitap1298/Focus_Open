//
//  Calendar-ViewModel.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import CoreData
import SwiftUI

extension Calendar_View {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var numberOfFinishedTasks = 0
        @Published private(set) var numberOfFailedTasks = 0
        @Published private(set) var meditationMinutes = 0
        
        func calculateStats(_ coreDataModel: CoreDataModel, _ date: Date) {
            let fetchRequest: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
            let fetchRequest1: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
            let fetchRequest2: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
            
            // Specify a predicate to filter tasks for a specific day
            let calendar = Calendar.current
            let startDate = calendar.startOfDay(for: date)
            let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
            
            fetchRequest.predicate = NSPredicate(format: "(createdAt >= %@) AND (createdAt < %@) AND (isFinished == true)", startDate as CVarArg, endDate as CVarArg)
            
            fetchRequest1.predicate = NSPredicate(format: "(createdAt >= %@) AND (createdAt < %@) AND (isFinished == false)", startDate as CVarArg, endDate as CVarArg)
            
            fetchRequest2.predicate = NSPredicate(format: "(createdAt >= %@) AND (createdAt < %@)", startDate as CVarArg, endDate as CVarArg)
            
            do {
                // Fetch the tasks based on the fetch request
                numberOfFinishedTasks = try coreDataModel.context.fetch(fetchRequest).count
                numberOfFailedTasks = try coreDataModel.context.fetch(fetchRequest1).count
                
                let dayTasks = try coreDataModel.context.fetch(fetchRequest)
                
                var totalTime = 0
                for task in dayTasks {
                    let minutesSpent = (task.initialTime - task.remainingTime) / 60
                    totalTime += Int(minutesSpent)
                }
                meditationMinutes = totalTime
            } catch {
                print("Error fetching tasks: \(error)")
            }
        }
    }
}
