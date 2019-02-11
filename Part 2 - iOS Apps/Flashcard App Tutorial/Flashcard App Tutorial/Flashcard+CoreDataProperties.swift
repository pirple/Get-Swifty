//
//  Flashcard+CoreDataProperties.swift
//  Flashcard App Tutorial
//
//

import Foundation
import CoreData


extension Flashcard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Flashcard> {
        return NSFetchRequest<Flashcard>(entityName: "Flashcard")
    }

    @NSManaged public var question: String?
    @NSManaged public var answer: String?
    @NSManaged public var subject: String?

}
