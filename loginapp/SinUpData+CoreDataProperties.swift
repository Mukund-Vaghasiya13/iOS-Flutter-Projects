//
//  SinUpData+CoreDataProperties.swift
//  loginapp
//
//  Created by Mukund vaghasiya  on 19/01/23.
//
//

import Foundation
import CoreData


extension SinUpData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SinUpData> {
        return NSFetchRequest<SinUpData>(entityName: "SinUpData")
    }

    @NSManaged public var email: String?
    @NSManaged public var username: String?
    @NSManaged public var phoneno: String?
    @NSManaged public var password: String?

}

extension SinUpData : Identifiable {

}
