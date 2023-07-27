//
//  CategoryViewController.swift
//  Todoey-UIKit-iOS16
//
//  Created by Amr Mohamad on 15/08/2023.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
