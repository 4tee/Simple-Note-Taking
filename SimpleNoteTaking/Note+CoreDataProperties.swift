//
//  Note+CoreDataProperties.swift
//  SimpleNoteTaking
//
//  Created by Dr.Ash on 19/3/21.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String
    @NSManaged public var body: String
    @NSManaged public var lastUpdated: Date

}

extension Note : Identifiable {

}
