//
//  Item.swift
//  Todoey-iOS16
//
//  Created by Amr Mohamad on 24/07/2023.
//

import Foundation
import RealmSwift

class Item : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done  : Bool   = false
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
