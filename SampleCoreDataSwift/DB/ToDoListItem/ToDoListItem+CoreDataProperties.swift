//
//  ToDoListItem+CoreDataProperties.swift
//  SampleCoreDataSwift
//
//  Created by MCNC on 25/2/2564 BE.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var created_at: Date?

}

extension ToDoListItem : Identifiable {

}
