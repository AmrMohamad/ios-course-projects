//
//  Item.swift
//  Todoey-UIKit-iOS16
//
//  Created by Amr Mohamad on 16/08/2023.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title       : String = ""
    @objc dynamic var done        : Bool   = false
    @objc dynamic var dateCreated : Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
