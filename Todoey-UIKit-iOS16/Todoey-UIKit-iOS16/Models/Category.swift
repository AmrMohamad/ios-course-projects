//
//  Category.swift
//  Todoey-UIKit-iOS16
//
//  Created by Amr Mohamad on 16/08/2023.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name            : String = ""
    @objc dynamic var colorOfCategory : String = ""
    
    var items = List<Item>()
}

