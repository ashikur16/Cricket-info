//
//  PlayerEntity+CoreDataProperties.swift
//  Cricket_Info
//
//  Created by bjit on 19/2/23.
//
//

import Foundation
import CoreData


extension PlayerEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerEntity> {
        return NSFetchRequest<PlayerEntity>(entityName: "PlayerEntity")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var id: Int64
    @NSManaged public var imagePath: String?

}

extension PlayerEntity : Identifiable {

}
