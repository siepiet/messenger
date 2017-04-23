//
//  Message+CoreDataProperties.swift
//  messenger
//
//  Created by Mateusz Siepietowski on 23.04.2017.
//  Copyright © 2017 Mateusz Siepietowski. All rights reserved.
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message")
    }

    @NSManaged public var text: String?
    @NSManaged public var date: Date?
    @NSManaged public var user: User?

}
