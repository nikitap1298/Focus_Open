//
//  TaskEntity+CoreDataProperties.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var initialTime: Int16
    @NSManaged public var remainingTime: Int16
    @NSManaged public var createdAt: Date?
    @NSManaged public var isFinished: Bool
    @NSManaged public var name: String?

//    public var wrappedName: String {
//        name ?? "Unknown Wish"
//    }
}

extension TaskEntity : Identifiable {

}
